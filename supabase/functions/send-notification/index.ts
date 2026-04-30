// Supabase Edge Function: Send Notification Email via Resend
// Set RESEND_API_KEY in your Supabase project secrets:
//   supabase secrets set RESEND_API_KEY=re_xxxxx
//   supabase secrets set RESEND_FROM_EMAIL=notifications@mail.goldenpages.newworldalliances.nz

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts';

const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY');
const DEFAULT_FROM_EMAIL = Deno.env.get('RESEND_FROM_EMAIL') || 'notifications@mail.goldenpages.newworldalliances.nz';
const DEFAULT_FROM_NAME = 'Golden Pages';

interface EmailPayload {
  to: string;
  subject: string;
  html: string;
  replyTo?: string;
  fromEmail?: string;
  fromName?: string;
}

serve(async (req) => {
  // CORS
  if (req.method === 'OPTIONS') {
    return new Response('ok', {
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'POST, OPTIONS',
        'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
      },
    });
  }

  try {
    if (!RESEND_API_KEY) {
      console.error('[send-notification] RESEND_API_KEY not configured');
      return new Response(
        JSON.stringify({ error: 'Email service not configured' }),
        { status: 503, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const payload = (await req.json()) as EmailPayload;
    const { to, subject, html, replyTo, fromEmail, fromName } = payload;

    if (!to || !subject || !html) {
      return new Response(
        JSON.stringify({ error: 'Missing required fields: to, subject, html' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Support legacy htmlBody field for backward compat
    const htmlContent = html;

    const fromAddress = `${fromName || DEFAULT_FROM_NAME} <${fromEmail || DEFAULT_FROM_EMAIL}>`;

    const emailBody: Record<string, unknown> = {
      from: fromAddress,
      to: [to],
      subject,
      html: htmlContent,
    };

    // Add reply-to for communication threading
    if (replyTo) {
      emailBody.reply_to = replyTo;
    }

    const response = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${RESEND_API_KEY}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(emailBody),
    });

    const result = await response.json();

    if (!response.ok) {
      console.error('[send-notification] Resend API error:', result);
      return new Response(
        JSON.stringify({ error: 'Failed to send email', details: result }),
        { status: 502, headers: { 'Content-Type': 'application/json' } }
      );
    }

    return new Response(
      JSON.stringify({ success: true, id: result.id }),
      {
        status: 200,
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      }
    );
  } catch (err) {
    console.error('[send-notification] Unexpected error:', err);
    return new Response(
      JSON.stringify({ error: 'Internal server error' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
});
