#!/usr/bin/env node
/**
 * Check NZ departments and organization state using direct PostgreSQL connection
 */

import { config } from 'dotenv';
import { Client } from 'pg';
import { readFileSync } from 'fs';
import { join } from 'path';

// Load environment variables from correct path
config({ path: join(process.cwd(), '.env.local') });

const dbUrl = process.env.DATABASE_URL;
if (!dbUrl) {
  console.error('❌ DATABASE_URL environment variable not set');
  process.exit(1);
}

// Parse connection URL
const url = new URL(dbUrl);
url.searchParams.set('sslmode', 'no-verify');

const client = new Client({
  connectionString: url.toString(),
});

async function checkNZ() {
  console.log('\n📊 Checking NZ Departments...\n');

  // Check new NZ gov org
  const orgResult = await client.query(`
    SELECT id, "name", "type"
    FROM organisations
    WHERE "name" = 'New Zealand - Government'
  `);

  if (orgResult.rows.length > 0) {
    console.log('✅ NZ Government org found:', orgResult.rows[0]);
  } else {
    console.log('⚠️ NZ Government org NOT found');
  }

  // Check old diplomatic missions org
  const oldOrgResult = await client.query(`
    SELECT id, "name", "type"
    FROM organisations
    WHERE "name" = 'Diplomatic Missions To New Zealand'
  `);

  if (oldOrgResult.rows.length > 0) {
    console.log('✅ Old diplomatic missions org still exists:', oldOrgResult.rows[0].id);
  }

  // Check departments for old org (diplomatic missions)
  const oldDeptResult = await client.query(`
    SELECT id, "name", code
    FROM departments
    WHERE "organisation_id" = '2b313a27-42cf-41c4-9512-d50057293010'
    ORDER BY code
  `);

  console.log(`\nOld org has ${oldDeptResult.rows.length} departments:`);
  for (const row of oldDeptResult.rows) {
    console.log(`  - ${row.name} (${row.code})`);
  }

  // Check departments for new NZ gov org
  const newDeptResult = await client.query(`
    SELECT id, "name", code
    FROM departments
    WHERE "organisation_id" = 'nz-gov-org-fix'
    ORDER BY code
  `);

  console.log(`\nNew org has ${newDeptResult.rows.length} departments:`);
  for (const row of newDeptResult.rows) {
    console.log(`  - ${row.name} (${row.code})`);
  }

  // Check old diplomatic missions org has departments
  const oldDipDeptResult = await client.query(`
    SELECT id, "name", code
    FROM departments
    WHERE "organisation_id" = '2b313a27-42cf-41c4-9512-d50057293010'
      AND "code" = 'DIP-NZ-MISSIONS'
    `);

  console.log(`\nOld diplomatic missions dept has ${oldDipDeptResult.rows.length} departments:`);
  for (const row of oldDipDeptResult.rows) {
    console.log(`  - ${row.name}`);
  }

  // Check consolidated diplomatic missions dept
  const consDeptResult = await client.query(`
    SELECT id, "name", code
    FROM departments
    WHERE "organisation_id" = 'nz-gov-org-fix'
      AND "code" = 'DIP-NZ-MISSIONS'
    `);

  if (consDeptResult.rows.length > 0) {
    console.log(`\nConsolidated diplomatic missions dept found:`, consDeptResult.rows[0]);
  } else {
    console.log('⚠️ Consolidated diplomatic missions dept NOT found');
  }

  await client.end();
  console.log('\n✅ Database connection closed');
}

checkNZ().catch(err => {
  console.error('Script failed:', err);
  process.exit(1);
});
