/**
 * Script to update headOfficeType based on country's political system
 */
import { Client } from 'pg';
import { config } from 'dotenv';

config();

async function updateHeadOfficeTypes() {
  const dbUrl = process.env.DATABASE_URL!;
  const url = new URL(dbUrl);
  url.searchParams.set('sslmode', 'no-verify');

  const client = new Client({ connectionString: url.toString() });

  try {
    await client.connect();
    console.log('🔄 Updating head office types based on political systems...\n');

    // Parliamentary systems (Prime Minister): Australia, Canada, India, NZ, UK
    const parliamentaryCountries = [
      'Australia',
      'Canada',
      'India',
      'New Zealand',
      'United Kingdom',
    ];

    // Presidential systems (President): Argentina, Brazil, France, Indonesia, Mexico, South Korea, Turkey, USA
    const presidentialCountries = [
      'Argentina',
      'Brazil',
      'France',
      'Indonesia',
      'Mexico',
      'South Korea',
      'Turkey',
      'United States',
    ];

    // Special cases (China, Russia, Saudi Arabia - various systems)
    const specialCases = [
      'China',    // President (PRC)
      'Russia',   // President
      'Saudi Arabia',  // King/Prime Minister structure
    ];

    let updateCount = 0;

    // Update parliamentary systems
    for (const country of parliamentaryCountries) {
      const result = await client.query(
        `UPDATE organisations SET "headOfficeType" = 'PRIME_MINISTER' WHERE name LIKE $1`,
        [`${country}%`]
      );
      if (result.rowCount > 0) {
        console.log(`✅ Updated ${country} → PRIME_MINISTER`);
        updateCount++;
      }
    }

    // Update presidential systems
    for (const country of presidentialCountries) {
      const result = await client.query(
        `UPDATE organisations SET "headOfficeType" = 'PRESIDENT' WHERE name LIKE $1`,
        [`${country}%`]
      );
      if (result.rowCount > 0) {
        console.log(`✅ Updated ${country} → PRESIDENT`);
        updateCount++;
      }
    }

    // Update special cases
    for (const country of specialCases) {
      const type = ['China', 'Russia'].includes(country) ? 'PRESIDENT' : 'PRIME_MINISTER';
      const result = await client.query(
        `UPDATE organisations SET "headOfficeType" = $1 WHERE name LIKE $2`,
        [type, `${country}%`]
      );
      if (result.rowCount > 0) {
        console.log(`✅ Updated ${country} → ${type}`);
        updateCount++;
      }
    }

    // International organizations remain CORPORATE
    console.log('\nℹ️  International organizations remain CORPORATE');

    // Verify
    console.log('\n🔍 Verification:\n');
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

    console.log('\n📋 Updated organizations:');
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

updateHeadOfficeTypes().catch(console.error);
