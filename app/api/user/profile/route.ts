import { NextRequest, NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';
import { authService } from '@/services/authService';

export async function PATCH(request: NextRequest) {
  const session = await authService.getSession();
  if (!session?.user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const body = await request.json();
  const { departmentId } = body;

  if (departmentId === undefined) {
    return NextResponse.json({ error: 'departmentId required' }, { status: 400 });
  }

  const supabase = getAdminClient();

  const { error } = await supabase
    .from('users')
    .update({ department_id: departmentId || null })
    .eq('id', session.user.id);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}
