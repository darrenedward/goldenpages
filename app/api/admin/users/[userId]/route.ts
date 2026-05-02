import { NextRequest, NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

export async function PATCH(
  request: NextRequest,
  { params }: { params: Promise<{ userId: string }> }
) {
  const { userId } = await params;

  if (!userId) {
    return NextResponse.json({ error: 'userId required' }, { status: 400 });
  }

  const body = await request.json();
  const { displayName, departmentId, title } = body;

  if (displayName === undefined && departmentId === undefined && title === undefined) {
    return NextResponse.json({ error: 'displayName, departmentId, or title required' }, { status: 400 });
  }

  const supabase = getAdminClient();

  const updates: Record<string, unknown> = {};
  if (displayName !== undefined) updates.display_name = displayName;
  if (departmentId !== undefined) updates.department_id = departmentId || null;
  if (title !== undefined) updates.title = title || null;

  const { error } = await supabase
    .from('users')
    .update(updates)
    .eq('id', userId);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ userId: string }> }
) {
  const { userId } = await params;

  if (!userId) {
    return NextResponse.json({ error: 'userId required' }, { status: 400 });
  }

  const supabase = getAdminClient();

  // 1. Delete from public.users (cascades to user_roles)
  const { error: dbError } = await supabase
    .from('users')
    .delete()
    .eq('id', userId);

  if (dbError) {
    return NextResponse.json({ error: dbError.message }, { status: 500 });
  }

  // 2. Delete from auth.users
  const { error: authError } = await supabase.auth.admin.deleteUser(userId);

  if (authError) {
    return NextResponse.json({ error: authError.message }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}
