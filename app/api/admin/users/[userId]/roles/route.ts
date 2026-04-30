import { NextRequest, NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ userId: string }> }
) {
  const { userId } = await params;
  const { roles } = await request.json();

  if (!userId || !Array.isArray(roles)) {
    return NextResponse.json({ error: 'userId and roles[] required' }, { status: 400 });
  }

  const supabase = getAdminClient();

  // 1. Delete existing roles
  await supabase.from('user_roles').delete().eq('userId', userId);

  // 2. Get role IDs for the requested role names
  if (roles.length > 0) {
    const { data: roleData } = await supabase
      .from('roles')
      .select('id, name')
      .in('name', roles);

    if (roleData && roleData.length > 0) {
      const inserts = roleData.map((r: { id: string }) => ({
        userId,
        roleId: r.id,
      }));
      await supabase.from('user_roles').insert(inserts);
    }
  }

  return NextResponse.json({ success: true });
}
