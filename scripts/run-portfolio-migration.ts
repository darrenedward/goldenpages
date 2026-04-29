/**
 * Script to run portfolio migration
 */
import { Client } from 'pg';
import * as fs from 'fs';
import * as path from 'path';
import { config } from 'dotenv';

// Load environment variables
config();

async function runMigration() {
  console.log('🔄 Running Portfolio migration...\n');

  // Parse connection URL
  const dbUrl = process.env.DATABASE_URL;
  if (!dbUrl) {
    throw new Error('DATABASE_URL environment variable not set');
  }

  const url = new URL(dbUrl);
  // Update SSL mode to handle self-signed certs
  url.searchParams.set('sslmode', 'no-verify');

  const client = new Client({
    connectionString: url.toString(),
  });

  try {
    await client.connect();
    console.log('✅ Connected to database\n');

    // Read SQL migration file
    const sqlPath = path.join(process.cwd(), 'prisma/seeds/10_add_portfolio_column.sql');
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
    let updateCount = 0;
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

        // Check if this is an UPDATE statement
        if (cleanStatement.toUpperCase().startsWith('UPDATE')) {
          const result = await client.query(cleanStatement);
          updateCount += result.rowCount || 0;
          console.log(`✅ Updated ${result.rowCount || 0} rows`);
          successCount++;
        } else {
          await client.query(cleanStatement);
          console.log(`✅ Statement ${i + 1} completed`);
          successCount++;
        }
        console.log('');
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
    console.log(`  📊 Total rows updated: ${updateCount}`);
    console.log('='.repeat(50));

    // Verify migration
    console.log('\n🔍 Verifying migration...\n');
    const result = await client.query(`
      SELECT
        "portfolio",
        COUNT(*) as count
      FROM departments
      GROUP BY "portfolio"
      ORDER BY count DESC
    `);

    console.log('📊 Departments by Portfolio:');
    for (const row of result.rows) {
      const portfolio = row.portfolio || 'UNSPECIFIED';
      console.log(`  ${portfolio}: ${row.count}`);
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
