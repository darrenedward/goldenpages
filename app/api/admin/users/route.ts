import { NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

export async function GET() {
  const supabase = getAdminClient();

  const { data, error } = await supabase
    .from('users')
    .select(`
      id,
      email,
      display_name,
      createdAt,
      department_id,
      departments (name),
      user_roles (
        roleId,
        roles (
          name
        )
      )
    `)
    .order('createdAt', { ascending: true });

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  const users = (data || []).map((user: Record<string, unknown>) => ({
    id: user.id,
    email: user.email,
    displayName: user.display_name || null,
    departmentId: user.department_id || null,
    departmentName: (user.departments as Record<string, unknown>)?.name || null,
    roles: Array.isArray(user.user_roles)
      ? (user.user_roles as Array<Record<string, unknown>>)
        .filter((ur) => ur != null)
        .map((ur: Record<string, unknown>) => (ur.roles as Record<string, unknown>)?.name)
        .filter(Boolean) as string[]
      : [],
    createdAt: user.createdAt,
  }));

  return NextResponse.json({ users });
}
