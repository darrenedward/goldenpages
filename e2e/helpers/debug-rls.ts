import { config } from 'dotenv';
import { resolve } from 'path';
import pg from 'pg';

config({ path: resolve(process.cwd(), '.env.local') });

const pool = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false },
});

async function main() {
  const client = await pool.connect();
  await client.query('RESET ROLE');

  // Clean up the test row inserted without RETURNING
  await client.query("DELETE FROM reports WHERE email = 'anon2@test.com'");
  console.log('Cleaned up test row');

  // Add anon to the SELECT policy
  console.log('Dropping Authenticated can read reports policy...');
  await client.query('DROP POLICY "Authenticated can read reports" ON reports');

  console.log('Creating new policy including anon...');
  await client.query(
    'CREATE POLICY "Anyone can read reports" ON reports FOR SELECT TO anon, authenticated USING (true)'
  );
  console.log('Created: Anyone can read reports');

  // Test as anon WITH RETURNING
  await client.query('SET ROLE anon');
  try {
    const { rows } = await client.query(
      "INSERT INTO reports (first_name, last_name, email, category, urgency, subject, description, is_anonymous, status) VALUES ('Anon', 'Test', 'anon@test.com', 'other', 'informational', 'Final Test', 'Testing RETURNING', false, 'submitted') RETURNING id"
    );
    console.log('\nAnon insert WITH RETURNING OK:', rows[0].id);
    await client.query('RESET ROLE');
    await client.query("DELETE FROM reports WHERE id = '" + rows[0].id + "'");
    console.log('Cleaned up');
  } catch (e: unknown) {
    console.log('\nAnon insert WITH RETURNING FAILED:', (e as Error).message);
  }

  client.release();
  await pool.end();
}

main();
