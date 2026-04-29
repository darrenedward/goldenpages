const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: require('path').resolve(process.cwd(), '.env.local') });

const supabase = createClient(
  process.env.VITE_SUPABASE_URL || 'https://ywvdextusnszhbqpexgb.supabase.co',
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_ANON_KEY || process.env.SUPABASE_KEY || ''
);

async function checkNZ() {
  console.log('\n📊 Checking NZ Department Details...\n');

  // Check old org departments with full details
  const { data: oldDeptData, error: oldDeptError } = await supabase
    .from('departments')
    .select('id, name, code, portfolio, description')
    .eq('organisationId', '2b313a27-42cf-41c4-9512-d50057293010')
    .order('name');

  if (oldDeptError) {
    console.error('❌ Error checking old departments:', oldDeptError);
    return;
  }

  console.log(`Old org has ${oldDeptData.length} departments:\n`);
  for (const dept of oldDeptData) {
    console.log(`  - ${dept.name}`);
    console.log(`    Code: ${dept.code || 'NULL'}`);
    console.log(`    Portfolio: ${dept.portfolio || 'NULL'}`);
    console.log(`    Description: ${dept.description || 'NULL'}`);
    console.log('');
  }

  // Check new org departments
  const { data: newDeptData, error: newDeptError } = await supabase
    .from('departments')
    .select('id, name, code, portfolio')
    .eq('organisationId', 'nz-gov-org-fix')
    .order('code');

  if (newDeptError) {
    console.error('❌ Error checking new departments:', newDeptError);
    return;
  }

  console.log(`\nNew org has ${newDeptData.length} departments:\n`);
  for (const dept of newDeptData) {
    console.log(`  - ${dept.name} (${dept.code}) [${dept.portfolio}]`);
  }
}

checkNZ().catch(err => {
  console.error('Script failed:', err);
  process.exit(1);
});
