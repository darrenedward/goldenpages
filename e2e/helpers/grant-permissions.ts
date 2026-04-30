/**
 * Grant necessary permissions for dev database to support E2E tests.
 * Run with: NODE_TLS_REJECT_UNAUTHORIZED=0 npx tsx e2e/helpers/grant-permissions.ts
 */

import { config } from 'dotenv';
import { resolve } from 'path';
import pg from 'pg';

config({ path: resolve(process.cwd(), '.env.local') });

const GRANTS = [
  // Reports table — public can submit and read (needed for .insert().select())
  'GRANT ALL ON reports TO anon',
  'GRANT ALL ON reports TO authenticated',

  // Communications — public can read approved ones
  'GRANT SELECT ON communications TO anon',
  'GRANT SELECT ON communications TO authenticated',

  // Communication recipients — needed for join queries
  'GRANT SELECT ON communication_recipients TO anon',
  'GRANT SELECT ON communication_recipients TO authenticated',

  // Contact submissions — public can submit
  'GRANT ALL ON contact_submissions TO anon',
  'GRANT ALL ON contact_submissions TO authenticated',

  // Newsletter subscribers — public can subscribe
  'GRANT ALL ON newsletter_subscribers TO anon',
  'GRANT ALL ON newsletter_subscribers TO authenticated',

  // Organizations — public can read
  'GRANT SELECT ON organisations TO anon',
  'GRANT SELECT ON organisations TO authenticated',

  // Departments — public can read
  'GRANT SELECT ON departments TO anon',
  'GRANT SELECT ON departments TO authenticated',

  // Contacts — public can read
  'GRANT SELECT ON contacts TO anon',
  'GRANT SELECT ON contacts TO authenticated',

  // Contact channels — public can read
  'GRANT SELECT ON contact_channels TO anon',
  'GRANT SELECT ON contact_channels TO authenticated',

  // Issue categories — public can read
  'GRANT SELECT ON issue_categories TO anon',
  'GRANT SELECT ON issue_categories TO authenticated',

  // Users — authenticated can read own profile
  'GRANT SELECT ON users TO authenticated',

  // User roles — authenticated can read own roles
  'GRANT SELECT ON user_roles TO authenticated',
  'GRANT SELECT ON roles TO authenticated',
  'GRANT SELECT ON role_permissions TO authenticated',
];

const RLS_FIXES = [
  // Reports: anon needs SELECT policy for .insert().select() to work
  // (Supabase client always uses RETURNING which requires SELECT)
  `DO $$
  BEGIN
    -- Drop old policy if exists
    DROP POLICY IF EXISTS "Authenticated can read reports" ON reports;
    -- Create inclusive policy
    CREATE POLICY "Anyone can read reports" ON reports FOR SELECT TO anon, authenticated USING (true);
  EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'RLS fix skipped: %', SQLERRM;
  END$$;`,
];

async function main() {
  const pool = new pg.Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false },
  });

  console.log('--- Granting table privileges ---');
  for (const sql of GRANTS) {
    try {
      await pool.query(sql);
      console.log(`OK: ${sql}`);
    } catch (error: unknown) {
      const msg = error instanceof Error ? error.message : String(error);
      console.error(`FAIL: ${sql} — ${msg}`);
    }
  }

  console.log('\n--- Applying RLS policy fixes ---');
  for (const sql of RLS_FIXES) {
    try {
      await pool.query(sql);
      console.log(`OK: RLS fix applied`);
    } catch (error: unknown) {
      const msg = error instanceof Error ? error.message : String(error);
      console.error(`FAIL: RLS fix — ${msg}`);
    }
  }

  await pool.end();
  console.log('\nDone!');
}

main();
