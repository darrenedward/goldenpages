const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: require('path').resolve(process.cwd(), '.env.local') });

const supabase = createClient(
  process.env.VITE_SUPABASE_URL || 'https://ywvdextusnszhbqpexgb.supabase.co',
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_ANON_KEY || process.env.SUPABASE_KEY || ''
);

async function checkNZContacts() {
  console.log('\n📊 Checking NZ Department Contacts...\n');

  // Get NZ org ID
  const { data: orgData } = await supabase
    .from('organisations')
    .select('id')
    .eq('name', 'New Zealand - Government')
    .single();

  if (!orgData) {
    console.log('❌ NZ Government org not found');
    return;
  }

  console.log('✅ NZ Government org ID:', orgData.id);

  // Get all departments with contact count
  const { data: deptData } = await supabase
    .from('departments')
    .select('id, name, code, portfolio')
    .eq('organisationId', orgData.id)
    .order('code');

  console.log(`\nFound ${deptData.length} departments:\n`);

  for (const dept of deptData) {
    // Get contact count for this department
    const { count } = await supabase
      .from('contacts')
      .select('*', { count: 'exact', head: true })
      .eq('departmentId', dept.id);

    console.log(`  - ${dept.name} (${dept.code}) [${dept.portfolio}]`);
    console.log(`    Contacts: ${count || 0}`);
  }

  // Check if any contacts exist for NZ organisation
  const { data: contactsData } = await supabase
    .from('contacts')
    .select('id, fullName, departmentId, departmentId!departments(name)')
    .eq('organisationId', orgData.id)
    .limit(10);

  console.log(`\n\nTotal contacts in NZ Government: ${contactsData?.length || 0}`);
  if (contactsData && contactsData.length > 0) {
    console.log('\nSample contacts:');
    for (const contact of contactsData) {
      console.log(`  - ${contact.fullName} (${contact.departments?.name || 'No dept'})`);
    }
  }
}

checkNZContacts().catch(err => {
  console.error('Script failed:', err);
  process.exit(1);
});
