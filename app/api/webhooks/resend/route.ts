/**
 * Resend Webhook Handler — Inbound Email
 *
 * Receives `email.received` events from Resend webhooks.
 * - Verifies Svix signature
 * - Fetches full email content via Resend Receiving API
 * - Links replies to communications or creates contact submissions
 * - Notifies relevant users
 */

import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';
import crypto from 'crypto';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const WEBHOOK_SECRET = process.env.RESEND_WEBHOOK_SECRET || '';
const RESEND_API_KEY = process.env.RESEND_API_KEY || '';

const EMAIL_DOMAIN = 'mail.goldenpages.newworldalliances.nz';

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
// Types — Resend Webhook Payload
// ============================================================================

interface ResendWebhookEvent {
  type: string;
  created_at: string;
  data: {
    email_id: string;
    created_at: string;
    from: string;
    to: string[];
    bcc: string[];
    cc: string[];
    subject: string;
    message_id?: string;
    attachments?: Array<{
      id: string;
      filename: string;
      content_type: string;
      content_disposition?: string;
      content_id?: string;
    }>;
  };
}

interface FullEmailContent {
  html?: string;
  text?: string;
  headers?: Record<string, string>;
  reply_to?: string[];
}

// ============================================================================
// Fetch Full Email Content via Resend Receiving API
// ============================================================================

async function fetchFullEmail(emailId: string): Promise<FullEmailContent | null> {
  if (!RESEND_API_KEY) {
    console.warn('[Webhook] RESEND_API_KEY not set — skipping content fetch');
    return null;
  }

  try {
    const res = await fetch(`https://api.resend.com/emails/${emailId}/received`, {
      headers: { Authorization: `Bearer ${RESEND_API_KEY}` },
    });

    if (!res.ok) {
      console.error(`[Webhook] Failed to fetch email ${emailId}: ${res.status}`);
      return null;
    }

    const data = await res.json();
    return {
      html: data.html || undefined,
      text: data.text || undefined,
      headers: data.headers || undefined,
      reply_to: data.reply_to || undefined,
    };
  } catch (err) {
    console.error('[Webhook] Error fetching full email:', err);
    return null;
  }
}

// ============================================================================
// Helpers
// ============================================================================

function extractName(fromHeader: string): string | null {
  const match = fromHeader.match(/^(.+?)\s*<[^>]+>$/);
  return match ? match[1].trim().replace(/^["']|["']$/g, '') : null;
}

function extractEmail(fromHeader: string): string {
  const match = fromHeader.match(/<([^>]+)>/);
  return match ? match[1].toLowerCase() : fromHeader.toLowerCase();
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

// ============================================================================
// POST Handler
// ============================================================================

export async function POST(request: NextRequest) {
  const body = await request.text();

  // Verify Svix signature
  const svixId = request.headers.get('svix-id') || '';
  const svixTimestamp = request.headers.get('svix-timestamp') || '';
  const svixSignature = request.headers.get('svix-signature') || '';

  if (WEBHOOK_SECRET && !verifySvixSignature(body, svixId, svixTimestamp, svixSignature)) {
    return NextResponse.json({ error: 'Invalid signature' }, { status: 401 });
  }

  let event: ResendWebhookEvent;
  try {
    event = JSON.parse(body);
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }

  // Only handle email.received events
  if (event.type !== 'email.received') {
    return NextResponse.json({ ignored: true, type: event.type });
  }

  const { data } = event;
  const toEmail = data.to?.[0]?.toLowerCase() || '';
  const fromEmail = extractEmail(data.from);

  if (!toEmail || !fromEmail) {
    return NextResponse.json({ error: 'Missing from/to' }, { status: 400 });
  }

  console.log(`[Webhook] Inbound email from ${data.from} to ${toEmail}: "${data.subject}"`);

  const supabase = getAdminClient();

  try {
    // Fetch full email content (html/text/headers) via Resend API
    const fullContent = await fetchFullEmail(data.email_id);

    // Parse reply+{commId}@ pattern from to address
    const replyMatch = toEmail.match(/^reply\+([a-f0-9-]+)@/);
    const communicationId = replyMatch ? replyMatch[1] : null;

    // Determine email routing
    const isInboundEnquiry = toEmail.startsWith('enquiries@');
    const isInboundContact = toEmail.startsWith('contact@');

    // Insert inbound email record
    const { data: inboundEmail, error: insertError } = await supabase
      .from('inbound_emails')
      .insert({
        from_email: fromEmail,
        from_name: extractName(data.from),
        to_email: toEmail,
        subject: data.subject || '(No Subject)',
        body_text: fullContent?.text || null,
        body_html: fullContent?.html || null,
        headers: fullContent?.headers || null,
        message_id: data.message_id || null,
        in_reply_to: fullContent?.headers?.['in-reply-to'] || null,
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
      const bodyContent = fullContent?.text || fullContent?.html || '(No content)';
      await handleEnquiryEmail(
        supabase, fromEmail, data.subject || '(No Subject)',
        bodyContent, inboundEmail.id,
        isInboundEnquiry ? 'inbound_enquiry' : 'inbound_contact'
      );
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
// Communication Reply Handler
// ============================================================================

async function handleCommunicationReply(
  supabase: ReturnType<typeof getAdminClient>,
  communicationId: string,
  fromEmail: string,
  inboundEmailId: string
) {
  const { data: members } = await supabase
    .from('communication_members')
    .select('user_id')
    .eq('communication_id', communicationId);

  if (!members?.length) return;

  // Log activity
  await supabase.from('activity_logs').insert({
    user_id: members[0].user_id,
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

// ============================================================================
// Enquiry Email Handler
// ============================================================================

async function handleEnquiryEmail(
  supabase: ReturnType<typeof getAdminClient>,
  fromEmail: string,
  subject: string,
  body: string,
  inboundEmailId: string,
  emailType: 'inbound_enquiry' | 'inbound_contact'
) {
  const { data: submission } = await supabase
    .from('contact_submissions')
    .insert({
      name: fromEmail,
      email: fromEmail,
      subject,
      message: body,
      email_type: emailType,
    })
    .select()
    .single();

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
    const adminRoleId = await getAdminRoleId(supabase);
    if (!adminRoleId) return;

    const { data: admins } = await supabase
      .from('user_roles')
      .select('user_id')
      .eq('"roleId"', adminRoleId);

    if (admins?.length) {
      for (const admin of admins) {
        await supabase.from('notifications').insert({
          user_id: admin.user_id,
          type: 'contact_submission_received',
          title: emailType === 'inbound_enquiry' ? 'New Email Enquiry' : 'New Contact Email',
          message: `${fromEmail}: ${subject}`,
          resource_id: submission.id,
          metadata: { inbound_email_id: inboundEmailId },
        });
      }
    }
  }
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
