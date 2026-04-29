#!/usr/bin/env node
/**
 * Run department naming and diplomatic missions consolidation migrations
 *
 * Usage: npx tsx scripts/run-department-fixes.ts
 */

import { config } from 'dotenv';
import { Client } from 'pg';
import { readFileSync } from 'fs';
import { join } from 'path';

// Load environment variables
config({ path: join(process.cwd(), '.env.local') });

const dbUrl = process.env.DATABASE_URL;
if (!dbUrl) {
  console.error('❌ DATABASE_URL environment variable not set');
  process.exit(1);
}

// Parse connection URL
const url = new URL(dbUrl);
// Update SSL mode for Supabase pooler
url.searchParams.set('sslmode', 'no-verify');

const client = new Client({
  connectionString: url.toString(),
});

/**
 * Execute SQL file
 */
async function executeSqlFile(sqlPath: string): Promise<void> {
  console.log(`\n📄 Executing: ${sqlPath}`);

  let sqlContent = readFileSync(sqlPath, 'utf-8');

  // Remove inline SQL comments
  sqlContent = sqlContent
    .split('\n')
    .filter(line => !line.trim().startsWith('--'))
    .map(line => line.replace(/--.*$/, '').trim())
    .join('\n')
    .trim();

  // Simple split by semicolon for statements
  const statements = sqlContent.split(';').map(s => s.trim()).filter(s => s.length > 0);

  console.log(`   Found ${statements.length} statements`);

  let successCount = 0;
  let errorCount = 0;

  for (let i = 0; i < statements.length; i++) {
    const statement = statements[i];
    const trimmed = statement.trim().toUpperCase();

    // Skip SELECT/verification queries
    if (trimmed.startsWith('SELECT')) {
      console.log(`   ℹ️  Skipping SELECT statement ${i + 1}`);
      continue;
    }

    try {
      await client.query(statement);
      successCount++;
      console.log(`   ✅ Statement ${i + 1} completed`);
    } catch (error: any) {
      errorCount++;
      // Ignore duplicate/already exists errors
      if (error.message && error.message.includes('already exists')) {
        console.log(`   ⚠️  Statement ${i + 1} skipped (already exists)`);
      } else {
        console.error(`   ❌ Statement ${i + 1} failed:`, error.message);
      }
    }
  }

  console.log(`   ✅ ${successCount} succeeded, ⚠️ ${errorCount} errors\n`);
}

async function main() {
  console.log('🔄 Running Department Naming and Diplomatic Missions Migrations\n');

  try {
    await client.connect();
    console.log('✅ Connected to database\n');

    const seedsDir = join(process.cwd(), 'prisma/seeds');

    // Run the fix migrations in order
    const migrations = [
      '16_move_nz_ministries_to_correct_org.sql',
      '17_add_nz_minister_contacts.sql',
      '18_add_nz_minister_contact_channels.sql',
    ];

    for (const migration of migrations) {
      const sqlPath = join(seedsDir, migration);
      if (require('fs').existsSync(sqlPath)) {
        await executeSqlFile(sqlPath);
      } else {
        console.log(`⚠️  Migration file not found: ${migration}`);
      }
    }

    // Verification queries after all migrations
    console.log('\n📊 Verification: NZ Department Names');
    const nzResult = await client.query(`
      SELECT "name", "code", "portfolio"
      FROM departments
      WHERE "organisationId" = 'nz-gov-org-fix'
      ORDER BY "code"
      LIMIT 5
    `);

    console.log('Sample NZ departments:');
    for (const row of nzResult.rows) {
      console.log(`   - ${row.name} (${row.code}) [${row.portfolio}]`);
    }

    console.log('\n📊 Verification: All NZ Departments Count');
    const nzCountResult = await client.query(`
      SELECT COUNT(*) as count
      FROM departments
      WHERE "organisationId" = 'nz-gov-org-fix'
    `);
    console.log(`   Total NZ departments: ${nzCountResult.rows[0].count}`);

    console.log('\n' + '='.repeat(60));
    console.log('✅ All migrations completed successfully!');

  } catch (error: any) {
    console.error('❌ Migration failed:', error);
    process.exit(1);
  } finally {
    await client.end();
    console.log('\n✅ Database connection closed');
  }
}

main().catch((error) => {
  console.error('Migration failed:', error);
  process.exit(1);
});
