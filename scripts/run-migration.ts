/**
 * Script to run the head office type migration
 * Uses pg client to execute SQL directly on the database
 */

import { Client } from 'pg';
import * as fs from 'fs';
import * as path from 'path';
import { config } from 'dotenv';

// Load environment variables
config();

async function runMigration() {
  console.log('🔄 Running Head Office Type migration...\n');

  // Parse connection URL
  const dbUrl = process.env.DATABASE_URL;
  if (!dbUrl) {
    throw new Error('DATABASE_URL environment variable not set');
  }

  // Parse connection URL to add SSL configuration
  const url = new URL(dbUrl);
  // Update SSL mode to handle self-signed certs
  url.searchParams.set('sslmode', 'no-verify');

  const client = new Client({
    connectionString: url.toString(),
  });

  try {
    await client.connect();
    console.log('✅ Connected to database\n');

    // Read the SQL migration file
    const sqlPath = path.join(process.cwd(), 'prisma/seeds/09_migrate_head_office_type.sql');
    let sqlContent = fs.readFileSync(sqlPath, 'utf-8');

    // Remove both full-line comments and inline comments
    sqlContent = sqlContent
      .split('\n')
      .filter(line => !line.trim().startsWith('--'))  // Remove full-line comments
      .map(line => line.replace(/--.*$/, '').trim())  // Remove inline comments
      .join('\n')
      .trim();

    // Split by semicolon and execute each statement
    const statements = sqlContent
      .split(/;\s*/)  // Split by semicolon with optional whitespace
      .map(s => s.trim())
      .filter(s => s.length > 0);

    console.log(`📝 Found ${statements.length} SQL statements to execute\n`);

    let successCount = 0;
    let errorCount = 0;

    for (let i = 0; i < statements.length; i++) {
      const statement = statements[i];

      // Skip SELECT statements (they're just for verification)
      const trimmed = statement.trim().toUpperCase();
      if (trimmed.startsWith('SELECT') || trimmed.length === 0) {
        console.log(`ℹ️  Skipping SELECT/empty statement ${i + 1}`);
        continue;
      }

      try {
        const cleanStatement = statement.trim();
        if (!cleanStatement) continue;

        console.log(`⚙️  Executing statement ${i + 1}/${statements.length}...`);
        console.log(`   ${cleanStatement.substring(0, 100)}...`);
        await client.query(cleanStatement);
        successCount++;
        console.log(`✅ Statement ${i + 1} completed\n`);
      } catch (error: any) {
        errorCount++;
        // Ignore duplicate column errors (column might already exist)
        if (error.message.includes('already exists')) {
          console.log(`⚠️  Statement ${i + 1} skipped (already exists)\n`);
        } else {
          console.error(`❌ Statement ${i + 1} failed:`, error.message);
          console.error('Statement:', statement.substring(0, 200));
          console.log('');
        }
      }
    }

    console.log('\n' + '='.repeat(50));
    console.log(`Migration complete:`);
    console.log(`  ✅ Successful: ${successCount}`);
    console.log(`  ⚠️  Skipped/Errors: ${errorCount}`);
    console.log('='.repeat(50));

    // Verify the migration
    console.log('\n🔍 Verifying migration...\n');
    const result = await client.query(`
      SELECT
        "headOfficeType",
        COUNT(*) as count
      FROM organisations
      GROUP BY "headOfficeType"
      ORDER BY count DESC
    `);

    console.log('📊 Organizations by Head Office Type:');
    for (const row of result.rows) {
      console.log(`  ${row.headOfficeType}: ${row.count}`);
    }
  } finally {
    await client.end();
    console.log('\n✅ Database connection closed');
  }
}

runMigration()
  .catch((error) => {
    console.error('Migration failed:', error);
    process.exit(1);
  });
