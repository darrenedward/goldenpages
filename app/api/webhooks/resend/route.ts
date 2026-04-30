/**
 * Resend Webhook Handler
 *
 * Receives inbound email events from Resend.
 * - Verifies Svix signature
 * - Processes inbound emails: links to communications or creates contact submissions
 * - Notifies relevant users
 */

import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';
import crypto from 'crypto';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const WEBHOOK_SECRET = process.env.RESEND_WEBHOOK_SECRET || '';

const EMAIL_DOMAIN = 'mail.goldenpages.newworldalliances.nz';

// Supabase admin client (bypasses RLS for webhook operations)
function getAdminClient() {
  return createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);
}

// ============================================================================
// Svix Signature Verification
// ============================================================================

function verifySvixSignature(
  body: string,
  svixId: string,
  svixTimestamp: string,
  svixSignature: string
): boolean {
  if (!WEBHOOK_SECRET) {
    console.warn('[Webhook] RESEND_WEBHOOK_SECRET not set — skipping verification');
    return true;
  }

  const signedContent = `${svixId}.${svixTimestamp}.${body}`;
  const secret = Buffer.from(WEBHOOK_SECRET.replace(/^whsec_/, ''), 'base64');

  const computedSig = crypto
    .createHmac('sha256', secret)
    .update(signedContent)
    .digest('base64');

  const signatures = svixSignature.split(' ');
  return signatures.some((sig) => {
    const sigParts = sig.split(',');
    return sigParts.some((s) => {
      const versioned = `v1=${computedSig}`;
      return crypto.timingSafeEqual(
        Buffer.from(s),
        Buffer.from(versioned)
      );
    });
  });
}

// ============================================================================
// Types
// ============================================================================

interface InboundEmailPayload {
  id: string;
  from: string;
  to: string[];
  subject: string;
  text?: string;
  html?: string;
  headers?: Record<string, string>;
  attachments?: Array<{
    filename: string;
    content_type: string;
    size: number;
  }>;
}

// ============================================================================
// POST Handler
// ============================================================================

export async function POST(request: NextRequest) {
  const body = await request.text();

  // Verify signature
  const svixId = request.headers.get('svix-id') || '';
  const svixTimestamp = request.headers.get('svix-timestamp') || '';
  const svixSignature = request.headers.get('svix-signature') || '';

  if (WEBHOOK_SECRET && !verifySvixSignature(body, svixId, svixTimestamp, svixSignature)) {
    return NextResponse.json({ error: 'Invalid signature' }, { status: 401 });
  }

  let payload: InboundEmailPayload;
  try {
    payload = JSON.parse(body);
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  const toEmail = payload.to?.[0]?.toLowerCase() || '';
  const fromEmail = payload.from?.toLowerCase() || '';

  if (!toEmail || !fromEmail) {
    return NextResponse.json({ error: 'Missing from/to' }, { status: 400 });
  }

  const supabase = getAdminClient();

  try {
    // Parse reply+{commId}@ pattern from to address
    const replyMatch = toEmail.match(/^reply\+([a-f0-9-]+)@/);
    const communicationId = replyMatch ? replyMatch[1] : null;

    // Determine email type
    const isInboundEnquiry = toEmail.startsWith('enquiries@');
    const isInboundContact = toEmail.startsWith('contact@');

    // Insert inbound email record
    const { data: inboundEmail, error: insertError } = await supabase
      .from('inbound_emails')
      .insert({
        from_email: fromEmail,
        from_name: extractName(payload.from),
        to_email: toEmail,
        subject: payload.subject || '(No Subject)',
        body_text: payload.text || null,
        body_html: payload.html || null,
        headers: payload.headers || null,
        message_id: payload.headers?.['message-id'] || null,
        in_reply_to: payload.headers?.['in-reply-to'] || null,
        communication_id: communicationId,
        status: communicationId ? 'linked' : 'received',
        processed_at: communicationId ? new Date().toISOString() : null,
      })
      .select()
      .single();

    if (insertError) {
      console.error('[Webhook] Failed to insert inbound email:', insertError);
      return NextResponse.json({ error: 'Database error' }, { status: 500 });
    }

    // If linked to a communication → notify members + log activity
    if (communicationId) {
      await handleCommunicationReply(supabase, communicationId, fromEmail, inboundEmail.id);
    }

    // If sent to enquiries@ or contact@ → create contact submission
    if (isInboundEnquiry || isInboundContact) {
      await handleEnquiryEmail(supabase, fromEmail, payload, inboundEmail.id, isInboundEnquiry ? 'inbound_enquiry' : 'inbound_contact');
    }

    // If not linked and not an enquiry → mark as unlinked
    if (!communicationId && !isInboundEnquiry && !isInboundContact) {
      await supabase
        .from('inbound_emails')
        .update({ status: 'unlinked' })
        .eq('id', inboundEmail.id);
    }

    return NextResponse.json({ success: true, id: inboundEmail.id });
  } catch (error) {
    console.error('[Webhook] Error processing inbound email:', error);
    return NextResponse.json({ error: 'Processing error' }, { status: 500 });
  }
}

// ============================================================================
// Helpers
// ============================================================================

function extractName(fromHeader: string): string | null {
  // Parse "Name <email@example.com>" format
  const match = fromHeader.match(/^(.+?)\s*<[^>]+>$/);
  return match ? match[1].trim().replace(/^["']|["']$/g, '') : null;
}

async function handleCommunicationReply(
  supabase: ReturnType<typeof getAdminClient>,
  communicationId: string,
  fromEmail: string,
  inboundEmailId: string
) {
  // Get communication members
  const { data: members } = await supabase
    .from('communication_members')
    .select('user_id')
    .eq('communication_id', communicationId);

  if (!members?.length) return;

  // Log activity
  await supabase.from('activity_logs').insert({
    user_id: members[0].user_id, // Use first member as proxy
    action: 'communication:inbound_email',
    resource_type: 'communication',
    resource_id: communicationId,
    changes: { inbound_email_id: inboundEmailId, from: fromEmail },
  });

  // Notify all members
  for (const member of members) {
    await supabase.from('notifications').insert({
      user_id: member.user_id,
      type: 'inbound_email_received',
      title: 'Email Reply Received',
      message: `A reply was received from ${fromEmail}`,
      resource_id: communicationId,
      metadata: { inbound_email_id: inboundEmailId },
    });
  }
}

async function handleEnquiryEmail(
  supabase: ReturnType<typeof getAdminClient>,
  fromEmail: string,
  payload: InboundEmailPayload,
  inboundEmailId: string,
  emailType: 'inbound_enquiry' | 'inbound_contact'
) {
  // Create contact submission from email
  const { data: submission } = await supabase
    .from('contact_submissions')
    .insert({
      name: extractName(payload.from) || fromEmail,
      email: fromEmail,
      subject: payload.subject || '(No Subject)',
      message: payload.text || payload.html || '(No content)',
      email_type: emailType,
    })
    .select()
    .single();

  // Link inbound email to contact submission
  if (submission) {
    await supabase
      .from('inbound_emails')
      .update({
        contact_submission_id: submission.id,
        status: 'linked',
        processed_at: new Date().toISOString(),
      })
      .eq('id', inboundEmailId);

    // Notify admin users
    const { data: admins } = await supabase
      .from('user_roles')
      .select('user_id')
      .eq('"roleId"', (await getAdminRoleId(supabase)));

    if (admins?.length) {
      for (const admin of admins) {
        await supabase.from('notifications').insert({
          user_id: admin.user_id,
          type: 'contact_submission_received',
          title: emailType === 'inbound_enquiry' ? 'New Email Enquiry' : 'New Contact Email',
          message: `${fromEmail}: ${payload.subject}`,
          resource_id: submission.id,
          metadata: { inbound_email_id: inboundEmailId },
        });
      }
    }
  }
}

async function getAdminRoleId(
  supabase: ReturnType<typeof getAdminClient>
): Promise<string> {
  const { data } = await supabase
    .from('roles')
    .select('id')
    .eq('name', 'admin')
    .single();
  return data?.id || '';
}

// Handle OPTIONS for CORS preflight
export async function OPTIONS() {
  return new NextResponse('ok', {
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, OPTIONS',
      'Access-Control-Allow-Headers': 'content-type, svix-id, svix-timestamp, svix-signature',
    },
  });
}
