const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: require('path').resolve(process.cwd(), '.env.local') });

const supabase = createClient(
  process.env.VITE_SUPABASE_URL || 'https://ywvdextusnszhbqpexgb.supabase.co',
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_ANON_KEY || process.env.SUPABASE_KEY || ''
);

async function findUnassignedContacts() {
  console.log('\n📊 Searching for NZ-related contacts...\n');

  // Get NZ org IDs (both old and new)
  const { data: orgsData } = await supabase
    .from('organisations')
    .select('id, name')
    .or('name.ilike.%New Zealand%,name.ilike.%Diplomatic Missions%');

  console.log('Found NZ-related organisations:');
  for (const org of orgsData) {
    console.log(`  - ${org.name} (${org.id})`);
  }

  const orgIds = orgsData.map(o => o.id);

  // Get all contacts for these orgs
  const { data: contactsData } = await supabase
    .from('contacts')
    .select('id, fullName, roleTitle, organisationId, departmentId, departmentId!departments(name, code)')
    .in('organisationId', orgIds)
    .limit(100);

  console.log(`\n\nFound ${contactsData?.length || 0} contacts for NZ-related orgs:\n`);

  if (!contactsData || contactsData.length === 0) {
    console.log('❌ No NZ contacts found in database');
    return;
  }

  // Group by department status
  const withDept = [];
  const withoutDept = [];

  for (const contact of contactsData) {
    if (contact.departmentId) {
      withDept.push(contact);
    } else {
      withoutDept.push(contact);
    }
  }

  console.log(`✅ With department assigned: ${withDept.length}`);
  for (const c of withDept.slice(0, 5)) {
    console.log(`  - ${c.fullName} - ${c.departments?.name} (${c.departments?.code})`);
  }
  if (withDept.length > 5) console.log(`  ... and ${withDept.length - 5} more`);

  console.log(`\n⚠️  Without department assigned: ${withoutDept.length}`);
  for (const c of withoutDept.slice(0, 10)) {
    console.log(`  - ${c.fullName} (${c.roleTitle || 'No role'})`);
  }
  if (withoutDept.length > 10) console.log(`  ... and ${withoutDept.length - 10} more`);

  // Check for contacts still using old org ID
  const oldOrgId = '2b313a27-42cf-41c4-9512-d50057293010';
  const oldOrgContacts = contactsData.filter(c => c.organisationId === oldOrgId);

  if (oldOrgContacts.length > 0) {
    console.log(`\n⚠️  Found ${oldOrgContacts.length} contacts still using old org ID (${oldOrgId})`);
    for (const c of oldOrgContacts.slice(0, 5)) {
      console.log(`  - ${c.fullName}`);
    }
    if (oldOrgContacts.length > 5) console.log(`  ... and ${oldOrgContacts.length - 5} more`);
  }
}

findUnassignedContacts().catch(err => {
  console.error('Script failed:', err);
  process.exit(1);
});
