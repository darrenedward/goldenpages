/**
 * Fix remaining countries with incorrect headOfficeType
 */
import { Client } from 'pg';
import { config } from 'dotenv';

config();

async function fixRemainingCountries() {
  const dbUrl = process.env.DATABASE_URL!;
  const url = new URL(dbUrl);
  url.searchParams.set('sslmode', 'no-verify');

  const client = new Client({ connectionString: url.toString() });

  try {
    await client.connect();
    console.log('🔄 Fixing remaining countries...\n');

    // Presidential systems (currently CORPORATE)
    const presidentialFixes = [
      'South Africa',
    ];

    // Parliamentary/Chancellor systems (currently CORPORATE)
    const parliamentaryFixes = [
      'Germany',   // Chancellor system
      'Italy',     // Prime Minister
      'Japan',     // Prime Minister
    ];

    let updateCount = 0;

    // Fix presidential systems
    for (const country of presidentialFixes) {
      const result = await client.query(
        `UPDATE organisations SET "headOfficeType" = 'PRESIDENT' WHERE name LIKE $1`,
        [`${country}%`]
      );
      if (result.rowCount > 0) {
        console.log(`✅ Updated ${country} → PRESIDENT`);
        updateCount++;
      }
    }

    // Fix parliamentary systems
    for (const country of parliamentaryFixes) {
      const result = await client.query(
        `UPDATE organisations SET "headOfficeType" = 'PRIME_MINISTER' WHERE name LIKE $1`,
        [`${country}%`]
      );
      if (result.rowCount > 0) {
        console.log(`✅ Updated ${country} → PRIME_MINISTER`);
        updateCount++;
      }
    }

    console.log(`\n📊 Updated ${updateCount} organizations\n`);

    // Verify
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

    console.log('\n📋 Final organization list:');
    const orgResult = await client.query(`
      SELECT name, "headOfficeType"
      FROM organisations
      ORDER BY name
    `);

    for (const row of orgResult.rows) {
      console.log(`  ${row.name}: ${row.headOfficeType}`);
    }
  } finally {
    await client.end();
    console.log('\n✅ Database connection closed');
  }
}

fixRemainingCountries().catch(console.error);
