/**
 * Department Migration Script
 *
 * Migrates contact.department string values to proper Department records.
 *
 * Run: npx tsx scripts/migrate-departments.ts
 *
 * Prerequisites:
 * - Database migration must be run first
 * - Departments table must exist
 */

import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

// Load environment variables from .env.local
config({ path: '.env.local' });

// Environment variables
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY!; // Use service role for admin access

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Missing Supabase credentials');
  console.error('Required: NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

interface ContactWithDept {
  id: string;
  full_name: string;
  department: string;
  organisation_id: string;
}

interface DepartmentRecord {
  id: string;
  name: string;
  code: string;
  organisation_id: string;
  parent_id?: string;
  isActive: boolean;
}

// Check if department name is valid (skip "NULL" strings and numeric IDs)
function isValidDepartmentName(name: string): boolean {
  // Skip literal "NULL" strings
  if (name === 'NULL' || name === 'null') {
    return false;
  }
  // Skip numeric-only values (likely IDs)
  if (/^\d+$/.test(name.trim())) {
    return false;
  }
  return true;
}

// Generate unique department code from name
function generateDepartmentCode(name: string, existingCodes: Set<string>): string {
  // Clean the name - convert to uppercase and remove special chars
  const cleanName = name
    .toUpperCase()
    .replace(/[^A-Z0-9]/g, '')
    .substring(0, 10);

  // Common department prefixes
  const prefixes: Record<string, string> = {
    'FINANCE': 'FIN',
    'HUMANRESOURCES': 'HR',
    'HUMAN RESOURCES': 'HR',
    'INFORMATIONTECHNOLOGY': 'IT',
    'INFORMATION TECHNOLOGY': 'IT',
    'LEGAL': 'LEG',
    'MARKETING': 'MKT',
    'OPERATIONS': 'OPS',
    'SALES': 'SAL',
    'EXECUTIVE': 'EXEC',
    'ADMINISTRATION': 'ADMIN',
    'RESEARCH': 'RND',
    'DEVELOPMENT': 'DEV',
  };

  // Use prefix if exact match
  const prefix = Object.entries(prefixes).find(([key]) =>
    name.toUpperCase().includes(key)
  );

  const baseCode = prefix ? prefix[1] : cleanName.substring(0, 3);

  // Find next available number
  let counter = 1;
  let code = `${baseCode}-${String(counter).padStart(3, '0')}`;

  while (existingCodes.has(code)) {
    counter++;
    code = `${baseCode}-${String(counter).padStart(3, '0')}`;
  }

  return code;
}

async function migrateDepartments() {
  console.log('🚀 Starting department migration...\n');

  // Step 1: Fetch all contacts with non-null departments
  console.log('📥 Fetching contacts with department values...');
  const { data: contacts, error: contactsError } = await supabase
    .from('contacts')
    .select('id, full_name, department, organisation_id')
    .not('department', 'is', null);

  if (contactsError) {
    console.error('❌ Error fetching contacts:', contactsError);
    process.exit(1);
  }

  console.log(`✅ Found ${contacts.length} contacts with department values\n`);

  // Step 2: Get existing departments to avoid duplicates
  console.log('📥 Checking existing departments...');
  const { data: existingDepts, error: deptsError } = await supabase
    .from('departments')
    .select('id, name, code, organisation_id');

  if (deptsError) {
    console.error('❌ Error fetching departments:', deptsError);
    process.exit(1);
  }

  const existingDeptMap = new Map<string, string>();
  const existingCodes = new Set<string>();

  for (const dept of existingDepts || []) {
    const key = `${dept.organisation_id}:${dept.name}`;
    existingDeptMap.set(key, dept.id);
    if (dept.code) {
      existingCodes.add(dept.code);
    }
  }

  console.log(`✅ Found ${existingDepts?.length || 0} existing departments\n`);

  // Step 3: Group contacts by organisation and department
  console.log('📊 Grouping contacts by organisation and department...');
  const deptMap = new Map<string, { contacts: ContactWithDept[]; orgId: string }>();
  const contactDeptMap = new Map<string, string>();
  let skippedInvalidCount = 0;

  for (const contact of contacts) {
    // Skip contacts with invalid department names
    if (!isValidDepartmentName(contact.department)) {
      skippedInvalidCount++;
      continue;
    }

    const key = `${contact.organisation_id}:${contact.department}`;

    if (!deptMap.has(key)) {
      deptMap.set(key, {
        contacts: [],
        orgId: contact.organisation_id,
      });
    }

    deptMap.get(key)!.contacts.push(contact);
  }

  console.log(`✅ Found ${deptMap.size} unique departments across ${contacts.length - skippedInvalidCount} valid contacts`);
  if (skippedInvalidCount > 0) {
    console.log(`⏭️  Skipped ${skippedInvalidCount} contacts with invalid department names (NULL, numeric IDs, etc.)\n`);
  } else {
    console.log();
  }

  // Step 4: Create new departments
  console.log('🔨 Creating departments...\n');

  const departmentsToCreate: DepartmentRecord[] = [];
  let createdCount = 0;
  let skippedCount = 0;

  for (const [key, data] of deptMap) {
    const [orgId, deptName] = key.split(':');

    // Skip if department already exists
    if (existingDeptMap.has(key)) {
      const existingDeptId = existingDeptMap.get(key)!;
      console.log(`  ⏭️  Skipping existing: "${deptName}" (Org: ${orgId})`);

      // Map contacts to existing department
      for (const contact of data.contacts) {
        contactDeptMap.set(contact.id, existingDeptId);
      }
      skippedCount++;
      continue;
    }

    // Generate unique code
    const code = generateDepartmentCode(deptName, existingCodes);
    existingCodes.add(code);

    departmentsToCreate.push({
      id: crypto.randomUUID(),
      name: deptName,
      code,
      organisation_id: orgId,
      isActive: true,
    });

    // Map contacts to new department
    for (const contact of data.contacts) {
      contactDeptMap.set(contact.id, departmentsToCreate[departmentsToCreate.length - 1].id);
    }

    console.log(`  ✨ Creating: "${deptName}" (Code: ${code}, ${data.contacts.length} contacts)`);
    createdCount++;
  }

  console.log(`\n📝 Summary: ${createdCount} new, ${skippedCount} existing\n`);

  // Step 5: Insert departments in batches
  if (departmentsToCreate.length > 0) {
    console.log('💾 Inserting departments into database...');

    const batchSize = 100;
    for (let i = 0; i < departmentsToCreate.length; i += batchSize) {
      const batch = departmentsToCreate.slice(i, i + batchSize);
      const { error: insertError } = await supabase
        .from('departments')
        .insert(batch);

      if (insertError) {
        console.error('❌ Error inserting departments:', insertError);
        process.exit(1);
      }
    }

    console.log(`✅ Inserted ${departmentsToCreate.length} departments\n`);
  }

  // Step 6: Update contacts with department_id
  console.log('🔄 Updating contacts with department_id...');
  let updateCount = 0;
  const updateErrors: string[] = [];

  for (const [contactId, deptId] of contactDeptMap) {
    const { error: updateError } = await supabase
      .from('contacts')
      .update({ department_id: deptId })
      .eq('id', contactId);

    if (updateError) {
      updateErrors.push(`${contactId}: ${updateError.message}`);
    } else {
      updateCount++;
    }

    // Progress indicator
    if (updateCount % 100 === 0) {
      process.stdout.write(`\r  📝 Updated: ${updateCount}/${contactDeptMap.size}`);
    }
  }

  process.stdout.write(`\r  📝 Updated: ${updateCount}/${contactDeptMap.size}\n`);

  if (updateErrors.length > 0) {
    console.log(`\n⚠️  ${updateErrors.length} contacts failed to update:`);
    updateErrors.slice(0, 5).forEach(err => console.log(`    - ${err}`));
    if (updateErrors.length > 5) {
      console.log(`    ... and ${updateErrors.length - 5} more`);
    }
  }

  // Step 7: Verification
  console.log('\n🔍 Verifying migration...\n');

  const { data: verifyDepts } = await supabase
    .from('departments')
    .select('id');

  const { data: verifyContacts } = await supabase
    .from('contacts')
    .select('id')
    .not('department_id', 'is', null);

  console.log(`✅ Total departments: ${verifyDepts?.length || 0}`);
  console.log(`✅ Contacts with department_id: ${verifyContacts?.length || 0}`);
  console.log(`✅ Migration complete!\n`);

  // Summary
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('MIGRATION SUMMARY');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log(`Contacts processed:      ${contacts.length}`);
  console.log(`Unique departments:     ${deptMap.size}`);
  console.log(`New departments:        ${createdCount}`);
  console.log(`Existing departments:   ${skippedCount}`);
  console.log(`Contacts updated:       ${updateCount}`);
  console.log(`Update failures:        ${updateErrors.length}`);
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

  if (updateErrors.length > 0) {
    console.log('⚠️  Some contacts failed to update. Please review and fix manually.');
    process.exit(1);
  }
}

// Run migration
migrateDepartments().catch(console.error);
