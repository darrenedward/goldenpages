import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

export async function GET(request: NextRequest) {
  const requestUrl = new URL(request.url);
  const code = requestUrl.searchParams.get('code');
  const type = requestUrl.searchParams.get('type');

  let needsPassword = false;

  if (code) {
    const supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
    );

    const { data, error } = await supabase.auth.exchangeCodeForSession(code);

    if (error) {
      console.error('[Auth Callback] Error:', error.message);
      return NextResponse.redirect(
        new URL(`/login?error=${encodeURIComponent(error.message)}`, requestUrl.origin)
      );
    }

    // Check if this user was invited and needs to set a password
    needsPassword = !!data?.user?.user_metadata?.needs_password;
  }

  // Invited user needing password → set-password page
  // Type fallback for flows that include it in the URL
  if (needsPassword || type === 'invite' || type === 'magiclink') {
    return NextResponse.redirect(new URL('/set-password', requestUrl.origin));
  }

  return NextResponse.redirect(new URL('/dashboard', requestUrl.origin));
}
