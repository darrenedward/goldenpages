import { NextRequest, NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

const NWA_ORG_ID = 'nwa-foundation-001';

export async function GET() {
  const supabase = getAdminClient();

  const { data, error } = await supabase
    .from('organisations')
    .select('id, name, headOfficeEmail, headOfficePhone, headOfficeAddress, headOfficeCity')
    .eq('id', NWA_ORG_ID)
    .single();

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json(data);
}

export async function PATCH(request: NextRequest) {
  const supabase = getAdminClient();
  const body = await request.json();

  const updates: Record<string, unknown> = {};
  if (body.name !== undefined) updates.name = body.name;
  if (body.headOfficeEmail !== undefined) updates.headOfficeEmail = body.headOfficeEmail;
  if (body.headOfficePhone !== undefined) updates.headOfficePhone = body.headOfficePhone;
  if (body.headOfficeAddress !== undefined) updates.headOfficeAddress = body.headOfficeAddress;
  if (body.headOfficeCity !== undefined) updates.headOfficeCity = body.headOfficeCity;

  if (Object.keys(updates).length === 0) {
    return NextResponse.json({ error: 'No fields to update' }, { status: 400 });
  }

  const { error } = await supabase
    .from('organisations')
    .update({ ...updates, updatedAt: new Date().toISOString() })
    .eq('id', NWA_ORG_ID);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}
