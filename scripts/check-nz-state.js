const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: require('path').resolve(process.cwd(), '.env.local') });

const supabase = createClient(
  process.env.VITE_SUPABASE_URL || 'https://ywvdextusnszhbqpexgb.supabase.co',
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_ANON_KEY || process.env.SUPABASE_KEY || ''
);

async function checkNZ() {
  console.log('\n📊 Checking NZ Departments...\n');

  // Check the new NZ gov org
  const { data: orgData, error: orgError } = await supabase
    .from('organisations')
    .select('id, name')
    .eq('name', 'New Zealand - Government')
    .single();

  if (orgError) {
    console.error('❌ Error checking org:', orgError);
    return;
  }

  if (orgData) {
    console.log('✅ NZ Government org found:', orgData.id, orgData.name);
  } else {
    console.log('⚠️ NZ Government org NOT found');
  }

  // Check all departments for the NZ gov org
  const { data: deptData, error: deptError } = await supabase
    .from('departments')
    .select('id, name, code')
    .eq('organisationId', orgData?.id || '')
    .order('code');

  if (deptError) {
    console.error('❌ Error checking departments:', deptError);
    return;
  }

  console.log(`\nFound ${deptData.length} departments:\n`);

  for (const dept of deptData) {
    console.log(`  - ${dept.name} (${dept.code})`);
  }

  // Check old diplomatic missions org
  const { data: oldOrgData, error: oldOrgError } = await supabase
    .from('organisations')
    .select('id, name')
    .eq('name', 'Diplomatic Missions To New Zealand')
    .single();

  if (oldOrgError) {
    console.error('❌ Error checking old org:', oldOrgError);
  }

  if (oldOrgData) {
    console.log('✅ Old diplomatic missions org still exists:', oldOrgData.id, oldOrgData.name);
  }

  // Check what departments exist for old org
  const { data: oldDeptData, error: oldDeptError } = await supabase
    .from('departments')
    .select('id, name, code')
    .eq('organisationId', '2b313a27-42cf-41c4-9512-d50057293010')
    .order('name');

  if (oldDeptError) {
    console.error('❌ Error checking old departments:', oldDeptError);
    return;
  }

  console.log(`\nOld org has ${oldDeptData.length} departments:`);
  for (const dept of oldDeptData) {
    console.log(`  - ${dept.name}`);
  }
}

checkNZ().catch(err => {
  console.error('Script failed:', err);
  process.exit(1);
});
