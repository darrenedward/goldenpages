import { NextRequest, NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

export async function POST(request: NextRequest) {
  const { email } = await request.json();

  if (!email) {
    return NextResponse.json({ error: 'Email is required' }, { status: 400 });
  }

  const supabase = getAdminClient();
  const origin = new URL(request.url).origin;

  // 1. Find the user
  const { data: { users }, error: listError } = await supabase.auth.admin.listUsers();
  if (listError) {
    return NextResponse.json({ error: listError.message }, { status: 500 });
  }

  const user = users.find((u) => u.email === email.trim().toLowerCase());
  if (!user) {
    return NextResponse.json({ error: 'User not found' }, { status: 404 });
  }

  // 2. Set needs_password flag so they get redirected to /set-password
  const { error: updateError } = await supabase.auth.admin.updateUserById(user.id, {
    user_metadata: { needs_password: true },
  });
  if (updateError) {
    return NextResponse.json({ error: updateError.message }, { status: 500 });
  }

  // 3. Generate the magic link
  const { data: linkData, error: linkError } = await supabase.auth.admin.generateLink({
    type: 'magiclink',
    email: user.email!,
    options: {
      redirectTo: `${origin}/auth/callback`,
    },
  });

  if (linkError) {
    return NextResponse.json({ error: linkError.message }, { status: 500 });
  }

  const rawLink = linkData.properties?.action_link || '';
  // Fix redirect_to — Supabase overrides with Site URL, so we manually set it
  const redirectParam = encodeURIComponent(`${origin}/auth/callback`);
  const link = rawLink.replace(
    /redirect_to=[^&]+/,
    `redirect_to=${redirectParam}`
  );

  return NextResponse.json({ link });
}
