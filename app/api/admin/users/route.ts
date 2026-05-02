import { NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

export async function GET() {
  const supabase = getAdminClient();

  // Fetch users
  const { data: usersData, error: usersError } = await supabase
    .from('users')
    .select('id, email, display_name, title, department_id, createdAt')
    .order('createdAt', { ascending: true });

  if (usersError) {
    console.error('Failed to fetch users:', usersError);
    return NextResponse.json({ error: usersError.message }, { status: 500 });
  }

  if (!usersData || usersData.length === 0) {
    return NextResponse.json({ users: [] });
  }

  // Fetch user roles
  const userIds = usersData.map((u: { id: string }) => u.id);
  const { data: rolesData, error: rolesError } = await supabase
    .from('user_roles')
    .select('userId, roles(name)')
    .in('userId', userIds);

  if (rolesError) {
    console.error('Failed to fetch roles:', rolesError);
    // Continue without roles rather than failing entirely
  }

  // Build roles map
  const rolesMap = new Map<string, string[]>();
  if (rolesData) {
    for (const ur of rolesData as Array<Record<string, unknown>>) {
      const uid = ur.userId as string;
      const roleName = (ur.roles as Record<string, unknown>)?.name as string;
      if (!rolesMap.has(uid)) rolesMap.set(uid, []);
      rolesMap.get(uid)!.push(roleName);
    }
  }

  // Fetch department names for users with department_id
  const deptIds = usersData
    .map((u: { department_id: string | null }) => u.department_id)
    .filter(Boolean) as string[];

  const deptMap = new Map<string, string>();
  if (deptIds.length > 0) {
    const { data: deptsData } = await supabase
      .from('departments')
      .select('id, name')
      .in('id', deptIds);

    if (deptsData) {
      for (const d of deptsData as Array<{ id: string; name: string }>) {
        deptMap.set(d.id, d.name);
      }
    }
  }

  const users = usersData.map((user: Record<string, unknown>) => ({
    id: user.id,
    email: user.email,
    displayName: user.display_name || null,
    title: user.title || null,
    departmentId: user.department_id || null,
    departmentName: user.department_id ? (deptMap.get(user.department_id as string) || null) : null,
    roles: rolesMap.get(user.id as string) || [],
    createdAt: user.createdAt,
  }));

  return NextResponse.json({ users });
}
