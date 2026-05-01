import { NextRequest, NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

// Supabase project configured for 2 emails per hour
const INVITE_LIMIT_WINDOW_HOURS = 1;
const INVITE_LIMIT_MAX = 2;

export async function POST(request: NextRequest) {
  const { email, roleName } = await request.json();

  if (!email || !roleName) {
    return NextResponse.json({ error: 'Email and role are required' }, { status: 400 });
  }

  const supabase = getAdminClient();

  // 1. Check how many invites were sent recently
  const windowStart = new Date(Date.now() - INVITE_LIMIT_WINDOW_HOURS * 60 * 60 * 1000).toISOString();
  const { count: recentInvites } = await supabase
    .from('invite_log')
    .select('*', { count: 'exact', head: true })
    .gte('created_at', windowStart)
    .eq('status', 'sent');

  if (recentInvites !== null && recentInvites >= INVITE_LIMIT_MAX) {
    return NextResponse.json({
      error: `Invite limit reached (${recentInvites}/${INVITE_LIMIT_MAX} per hour). Please try again later or contact the user directly with their login details.`,
      code: 'rate_limited',
      remaining: 0,
    }, { status: 429 });
  }

  // 2. Send invite via Supabase Auth
  const redirectTo = `${new URL(request.url).origin}/auth/callback`;
  const { data: inviteData, error: inviteError } =
    await supabase.auth.admin.inviteUserByEmail(email.trim().toLowerCase(), {
      redirectTo,
    });

  if (inviteError) {
    // Detect Supabase rate limit errors
    const isRateLimit =
      inviteError.message.toLowerCase().includes('rate limit') ||
      inviteError.message.toLowerCase().includes('too many') ||
      inviteError.status === 429;

    if (isRateLimit) {
      // Log the failed attempt too
      await supabase.from('invite_log').insert({
        email: email.trim().toLowerCase(),
        role_name: roleName,
        status: 'rate_limited',
      });

      return NextResponse.json({
        error: 'Email invite rate limit reached. Supabase allows ~3-4 invites per hour. Please try again in an hour or create the user manually.',
        code: 'rate_limited',
        remaining: 0,
      }, { status: 429 });
    }

    return NextResponse.json({ error: inviteError.message }, { status: 400 });
  }

  const userId = inviteData.user?.id;
  if (!userId) {
    return NextResponse.json({ error: 'No user ID returned' }, { status: 500 });
  }

  // Mark user as needing to set a password
  await supabase.auth.admin.updateUserById(userId, {
    user_metadata: { needs_password: true },
  });

  // 3. Get role ID and assign
  const { data: roleData } = await supabase
    .from('roles')
    .select('id')
    .eq('name', roleName)
    .single();

  if (roleData) {
    await supabase.from('user_roles').upsert({
      userId,
      roleId: roleData.id,
    }, { onConflict: 'userId,roleId' });
  }

  // 4. Log the successful invite
  await supabase.from('invite_log').insert({
    email: email.trim().toLowerCase(),
    role_name: roleName,
    user_id: userId,
    status: 'sent',
  });

  const remaining = Math.max(0, INVITE_LIMIT_MAX - (recentInvites || 0) - 1);

  return NextResponse.json({ success: true, userId, remaining });
}

// GET — check remaining invites for the current window
export async function GET() {
  const supabase = getAdminClient();
  const windowStart = new Date(Date.now() - INVITE_LIMIT_WINDOW_HOURS * 60 * 60 * 1000).toISOString();

  const { count: recentInvites } = await supabase
    .from('invite_log')
    .select('*', { count: 'exact', head: true })
    .gte('created_at', windowStart)
    .eq('status', 'sent');

  const used = recentInvites || 0;
  return NextResponse.json({
    used,
    limit: INVITE_LIMIT_MAX,
    remaining: Math.max(0, INVITE_LIMIT_MAX - used),
    windowHours: INVITE_LIMIT_WINDOW_HOURS,
  });
}
