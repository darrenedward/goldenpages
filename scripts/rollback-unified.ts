/**
 * Rollback Script for Unified Schema
 *
 * Reverts all changes made by the unified schema migration.
 *
 * Run: npm tsx scripts/rollback-unified.ts
 *
 * WARNING: This will DELETE all package data and department relations!
 * Make sure to backup before running.
 *
 * Prerequisites:
 * - Service role key for admin access
 */

import { createClient } from '@supabase/supabase-js';

// Environment variables
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Missing Supabase credentials');
  console.error('Required: NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

interface ConfirmResult {
  total: number;
  deleted: number;
  errors: string[];
}

async function deleteTable(tableName: string, cascade = false): Promise<ConfirmResult> {
  console.log(`\n🗑️  Deleting from ${tableName}...`);

  // First, get count
  const { count, error: countError } = await supabase
    .from(tableName as any)
    .select('*', { count: 'exact', head: true });

  if (countError) {
    return { total: 0, deleted: 0, errors: [countError.message] };
  }

  if (!count || count === 0) {
    console.log(`  ✅ No records to delete`);
    return { total: 0, deleted: 0, errors: [] };
  }

  console.log(`  📊 Found ${count} records`);

  // Delete in batches
  const batchSize = 1000;
  let deleted = 0;
  const errors: string[] = [];

  // For cascade delete, we can just delete all at once
  if (cascade) {
    const { error: deleteError } = await supabase
      .from(tableName as any)
      .delete()
      .neq('id', '00000000-0000-0000-0000-000000000000'); // Delete all

    if (deleteError) {
      errors.push(deleteError.message);
    } else {
      deleted = count;
    }
  } else {
    // Delete in batches
    while (deleted < count) {
      const { error: deleteError } = await supabase
        .from(tableName as any)
        .delete()
        .limit(batchSize);

      if (deleteError) {
        errors.push(deleteError.message);
        break;
      }

      deleted += batchSize;
      process.stdout.write(`\r    Deleted: ${Math.min(deleted, count)}/${count}`);
    }

    process.stdout.write(`\r    Deleted: ${deleted}/${count}\n`);
  }

  if (errors.length > 0) {
    console.log(`  ⚠️  Errors: ${errors.join(', ')}`);
  } else {
    console.log(`  ✅ Deleted ${deleted} records`);
  }

  return { total: count, deleted, errors };
}

async function rollbackDepartments() {
  console.log('⚠️  ROLLBACK WARNING ⚠️');
  console.log('This will DELETE ALL package data and reset department relations!');
  console.log('');

  // Step 1: Delete package tables (in order of dependencies)
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('STEP 1: Delete Package Management Tables');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  await deleteTable('sub_package_responses');
  await deleteTable('package_documents');
  await deleteTable('package_recipients');
  await deleteTable('sub_packages');
  await deleteTable('documents');
  await deleteTable('packages');

  // Step 2: Drop enums
  console.log('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('STEP 2: Drop Package Management Enums');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  const enums = [
    'PackageStatus',
    'SubPackageStatus',
    'DeliveryStatus',
    'ResponseStatus',
    'DocumentCategory',
  ];

  for (const enumName of enums) {
    try {
      // Run raw SQL to drop enum
      const { error } = await supabase.rpc('exec_sql', {
        sql: `DROP TYPE IF EXISTS "${enumName}" CASCADE;`,
      });

      if (error) {
        console.log(`  ⚠️  Could not drop enum ${enumName}: ${error.message}`);
      } else {
        console.log(`  ✅ Dropped enum: ${enumName}`);
      }
    } catch (e: any) {
      console.log(`  ⚠️  Could not drop enum ${enumName}: ${e.message}`);
    }
  }

  // Step 3: Reset department relations
  console.log('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('STEP 3: Reset Department Relations');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  // Backup department values to department_legacy
  console.log('\n📦 Backing up department_id to department_legacy...');

  const { data: contactsWithDept, error: fetchError } = await supabase
    .from('contacts')
    .select('id, department, department_id')
    .not('department_id', 'is', null);

  if (fetchError) {
    console.log(`  ⚠️  Error fetching contacts: ${fetchError.message}`);
  } else if (contactsWithDept && contactsWithDept.length > 0) {
    console.log(`  📊 Found ${contactsWithDept.length} contacts with department_id`);

    // Get department names for backup
    const deptIds = contactsWithDept.map((c: any) => c.department_id);
    const { data: departments } = await supabase
      .from('departments')
      .select('id, name')
      .in('id', deptIds);

    const deptMap = new Map(departments?.map((d: any) => [d.id, d.name]) || []);

    let backupCount = 0;
    const backupErrors: string[] = [];

    for (const contact of contactsWithDept) {
      const deptName = deptMap.get(contact.department_id);

      const { error: updateError } = await supabase
        .from('contacts')
        .update({ department_legacy: deptName || contact.department })
        .eq('id', contact.id);

      if (updateError) {
        backupErrors.push(`${contact.id}: ${updateError.message}`);
      } else {
        backupCount++;
      }
    }

    console.log(`  ✅ Backed up ${backupCount} contacts`);
    if (backupErrors.length > 0) {
      console.log(`  ⚠️  ${backupErrors.length} backup errors`);
    }
  }

  // Clear department_id
  console.log('\n🔄 Clearing department_id from contacts...');

  const { error: clearError } = await supabase
    .from('contacts')
    .update({ department_id: null })
    .not('department_id', 'is', null);

  if (clearError) {
    console.log(`  ⚠️  Error clearing department_id: ${clearError.message}`);
  } else {
    console.log(`  ✅ Cleared department_id from all contacts`);
  }

  // Step 4: Delete departments
  console.log('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('STEP 4: Delete Departments');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  await deleteTable('departments', true);

  // Step 5: Drop columns if they exist
  console.log('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('STEP 5: Drop Migration Columns');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  try {
    await supabase.rpc('exec_sql', {
      sql: `
        ALTER TABLE "contacts" DROP COLUMN IF EXISTS "department_id";
        ALTER TABLE "contacts" DROP COLUMN IF EXISTS "department_legacy";
      `,
    });
    console.log('  ✅ Dropped migration columns');
  } catch (e: any) {
    console.log(`  ⚠️  Could not drop columns: ${e.message}`);
  }

  // Step 6: Drop tables
  console.log('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('STEP 6: Drop Package Tables');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  const tables = [
    'sub_package_responses',
    'package_documents',
    'package_recipients',
    'sub_packages',
    'documents',
    'packages',
    'departments',
  ];

  for (const table of tables) {
    try {
      await supabase.rpc('exec_sql', {
        sql: `DROP TABLE IF EXISTS "${table}" CASCADE;`,
      });
      console.log(`  ✅ Dropped table: ${table}`);
    } catch (e: any) {
      console.log(`  ⚠️  Could not drop table ${table}: ${e.message}`);
    }
  }

  // Summary
  console.log('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('ROLLBACK COMPLETE');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('');
  console.log('✅ All package data has been deleted');
  console.log('✅ Department relations have been reset');
  console.log('✅ Original department strings preserved in department_legacy (temporary)');
  console.log('');
  console.log('⚠️  The department_legacy column still contains your data.');
  console.log('⚠️  You can manually restore the department column if needed.');
  console.log('');
}

async function verifyRollback() {
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('VERIFICATION');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('');

  // Check if package tables exist
  const { count: pkgCount } = await supabase
    .from('packages' as any)
    .select('*', { count: 'exact', head: true });

  console.log(`Packages table: ${pkgCount === null ? 'DOES NOT EXIST ✅' : `STILL HAS ${pkgCount} RECORDS ⚠️`}`);

  // Check if departments exist
  const { count: deptCount } = await supabase
    .from('departments' as any)
    .select('*', { count: 'exact', head: true });

  console.log(`Departments table: ${deptCount === null ? 'DOES NOT EXIST ✅' : `STILL HAS ${deptCount} RECORDS ⚠️`}`);

  // Check if contacts have department_id
  const { data: contactWithDept } = await supabase
    .from('contacts')
    .select('id')
    .not('department_id', 'is', null)
    .limit(1);

  console.log(`Contacts with department_id: ${contactWithDept && contactWithDept.length > 0 ? 'STILL HAVE department_id ⚠️' : 'ALL CLEARED ✅'}`);

  console.log('');
}

// Run rollback
rollbackDepartments()
  .then(() => verifyRollback())
  .catch(console.error);
