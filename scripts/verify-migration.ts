/**
 * Script to verify and show organizations that should be migrated
 */
import { Client } from 'pg';
import { config } from 'dotenv';

config();

async function verify() {
  const dbUrl = process.env.DATABASE_URL!;
  const url = new URL(dbUrl);
  url.searchParams.set('sslmode', 'no-verify');

  const client = new Client({ connectionString: url.toString() });

  try {
    await client.connect();
    console.log('Current organizations:\n');

    const result = await client.query(`
      SELECT id, name, type, "headOfficeType"
      FROM organisations
      ORDER BY name
    `);

    console.log('ID                                   | Name                                              | Type                    | Head Office Type');
    console.log('-'.repeat(140));

    for (const row of result.rows) {
      console.log(`${row.id.substring(0, 35)} | ${row.name.padEnd(48)} | ${row.type.padEnd(22)} | ${row.headOfficeType}`);
    }
  } finally {
    await client.end();
  }
}

verify().catch(console.error);
