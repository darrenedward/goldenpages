import { NextRequest, NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

export async function GET() {
  const supabase = getAdminClient();

  const { data, error } = await supabase
    .from('departments')
    .select('id, name, code')
    .eq('organisationId', 'nwa-foundation-001')
    .eq('isActive', true)
    .order('name');

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ departments: data });
}

export async function POST(request: NextRequest) {
  const supabase = getAdminClient();
  const body = await request.json();
  const { name, code } = body;

  if (!name?.trim()) {
    return NextResponse.json({ error: 'Name is required' }, { status: 400 });
  }

  const { data, error } = await supabase
    .from('departments')
    .insert({
      name: name.trim(),
      code: code?.trim() || null,
      organisationId: 'nwa-foundation-001',
      isActive: true,
      portfolio: 'OTHER',
    })
    .select('id, name, code')
    .single();

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ department: data });
}

export async function DELETE(request: NextRequest) {
  const supabase = getAdminClient();
  const { searchParams } = new URL(request.url);
  const id = searchParams.get('id');

  if (!id) {
    return NextResponse.json({ error: 'id required' }, { status: 400 });
  }

  const { error } = await supabase
    .from('departments')
    .update({ isActive: false })
    .eq('id', id);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}
