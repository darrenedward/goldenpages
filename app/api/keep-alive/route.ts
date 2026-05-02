import { NextResponse } from 'next/server';
import { getAdminClient } from '@/services/adminClient';

export async function GET() {
  const supabase = getAdminClient();
  const tables = ['users', 'organisations', 'departments', 'communications'] as const;
  const audit: Record<string, number | string> = {};

  for (const table of tables) {
    const { count, error } = await supabase
      .from(table)
      .select('id', { count: 'exact', head: true });

    audit[table] = error ? error.message : (count ?? 0);
  }

  const hasErrors = Object.values(audit).some(v => typeof v === 'string');
  console.log(`[Keep-alive] ${new Date().toISOString()}`, audit);

  return NextResponse.json({
    status: hasErrors ? 'degraded' : 'ok',
    timestamp: new Date().toISOString(),
    audit,
  });
}
