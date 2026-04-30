import { NextRequest, NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

export async function POST(request: NextRequest) {
  const { email, roleName } = await request.json();

  if (!email || !roleName) {
    return NextResponse.json({ error: 'Email and role are required' }, { status: 400 });
  }

  const supabase = getAdminClient();

  // 1. Send invite via Supabase Auth
  const { data: inviteData, error: inviteError } =
    await supabase.auth.admin.inviteUserByEmail(email.trim().toLowerCase());

  if (inviteError) {
    return NextResponse.json({ error: inviteError.message }, { status: 400 });
  }

  const userId = inviteData.user?.id;
  if (!userId) {
    return NextResponse.json({ error: 'No user ID returned' }, { status: 500 });
  }

  // 2. Get role ID
  const { data: roleData } = await supabase
    .from('roles')
    .select('id')
    .eq('name', roleName)
    .single();

  if (roleData) {
    // 3. Assign role
    await supabase.from('user_roles').upsert({
      userId,
      roleId: roleData.id,
    }, { onConflict: 'userId,roleId' });
  }

  return NextResponse.json({ success: true, userId });
}
