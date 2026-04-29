#!/usr/bin/env tsx
/**
 * Phase 0 Rollback Script
 * 
 * WARNING: This script will DELETE all Phase 0 data and schema changes.
 * Only run this if you need to completely rollback the Phase 0 implementation.
 * 
 * Usage:
 *   npm tsx scripts/rollback-phase0.ts [--dry-run] [--force]
 * 
 * Options:
 *   --dry-run  : Show what would be deleted without actually deleting
 *   --force    : Skip confirmation prompt
 */

import { execSync } from 'child_process';
import readline from 'readline';

const DATABASE_URL = process.env.DATABASE_URL;
if (!DATABASE_URL) {
  console.error('ERROR: DATABASE_URL environment variable not set');
  process.exit(1);
}

const args = process.argv.slice(2);
const dryRun = args.includes('--dry-run');
const force = args.includes('--force');

interface RollbackPlan {
  tables: string[];
  columns: { table: string; column: string }[];
  permissions: string[];
}

async function generateRollbackPlan(): Promise<RollbackPlan> {
  console.log('Generating rollback plan...\n');
  
  // These are the Phase 0 additions
  return {
    tables: [
      'sub_package_responses',
      'package_recipients',
      'package_documents',
      'documents',
      'sub_packages',
      'packages',
      'departments',
    ],
    columns: [
      { table: 'contacts', column: 'departmentId' },
    ],
    permissions: [
      'department:read',
      'department:write',
      'package:read',
      'package:write',
      'package:delete',
      'package:send',
      'package:close',
      'document:read',
      'document:write',
      'document:delete',
    ],
  };
}

async function confirmRollback(plan: RollbackPlan): Promise<boolean> {
  if (force) return true;
  
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });

  return new Promise((resolve) => {
    rl.question(
      '\n⚠️  WARNING: This will DELETE ALL Phase 0 data and schema changes!\n' +
      'Are you sure you want to proceed? (type "yes" to confirm): ',
      (answer) => {
        rl.close();
        resolve(answer.toLowerCase() === 'yes');
      }
    );
  });
}

async function executeRollback(plan: RollbackPlan): Promise<void> {
  const sqlStatements: string[] = [];

  // Start transaction
  sqlStatements.push('BEGIN;');

  // Drop tables (in correct order)
  for (const table of plan.tables) {
    sqlStatements.push(`DROP TABLE IF EXISTS ${table} CASCADE;`);
  }

  // Drop columns
  for (const { table, column } of plan.columns) {
    sqlStatements.push(`ALTER TABLE ${table} DROP COLUMN IF EXISTS "${column}";`);
  }

  // Remove permissions
  for (const permission of plan.permissions) {
    sqlStatements.push(`DELETE FROM role_permissions WHERE permission = '${permission}';`);
  }

  sqlStatements.push('COMMIT;');

  if (dryRun) {
    console.log('\n=== DRY RUN - SQL Statements to Execute ===\n');
    console.log(sqlStatements.join('\n'));
    console.log('\n=== End DRY RUN ===\n');
    console.log('Run without --dry-run to actually execute these statements.');
  } else {
    const sql = sqlStatements.join('\n');
    
    // Write to temp file and execute
    execSync(`echo '${sql}' | psql "${DATABASE_URL}"`, {
      stdio: 'inherit',
    });
    
    console.log('\n✅ Rollback complete!');
  }
}

async function main() {
  console.log('╔═══════════════════════════════════════════════════════════════╗');
  console.log('║           PHASE 0 ROLLBACK SCRIPT                              ║');
  console.log('╚═══════════════════════════════════════════════════════════════╝');
  console.log('');

  const plan = await generateRollbackPlan();

  console.log('Tables to be dropped:');
  for (const table of plan.tables) {
    console.log(`  - ${table}`);
  }

  console.log('\nColumns to be dropped:');
  for (const { table, column } of plan.columns) {
    console.log(`  - ${table}.${column}`);
  }

  console.log('\nPermissions to be removed:');
  for (const permission of plan.permissions) {
    console.log(`  - ${permission}`);
  }

  if (!dryRun) {
    const confirmed = await confirmRollback(plan);
    if (!confirmed) {
      console.log('\n❌ Rollback cancelled.');
      process.exit(0);
    }
  }

  await executeRollback(plan);
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});
