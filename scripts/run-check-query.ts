#!/usr/bin/env node
import { config } from 'dotenv';
import { Client } from 'pg';
import { readFileSync } from 'fs';
import { join } from 'path';

config({ path: join(process.cwd(), '.env.local') });

const dbUrl = process.env.DATABASE_URL;
if (!dbUrl) {
  console.error('❌ DATABASE_URL environment variable not set');
  process.exit(1);
}

const url = new URL(dbUrl);
url.searchParams.set('sslmode', 'no-verify');

const client = new Client({
  connectionString: url.toString(),
});

async function main() {
  try {
    await client.connect();
    console.log('✅ Connected to database\n');

    const sql = readFileSync(join(process.cwd(), 'prisma/seeds/99_check_nz_depts.sql'), 'utf-8');

    const result = await client.query(sql);

    console.log('\n📊 NZ Departments:');
    console.table(result.rows);

    if (result.rows.length === 0) {
      console.log('\n✅ No NZ departments found - can proceed with migration');
    } else {
      console.log('\n⚠️ Departments already exist - need to handle duplicates');
    }

  } catch (error: any) {
    console.error('❌ Query failed:', error);
    process.exit(1);
  } finally {
    await client.end();
    console.log('\n✅ Database connection closed');
  }
}

main().catch((error) => {
  console.error('Script failed:', error);
  process.exit(1);
});
