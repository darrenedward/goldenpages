/**
 * Seed test users via direct PostgreSQL connection (bypasses RLS).
 * Run with: npx tsx e2e/helpers/seed-test-users.ts
 */

import { config } from 'dotenv';
import { resolve } from 'path';
import pg from 'pg';

config({ path: resolve(process.cwd(), '.env.local') });

const TEST_USERS = [
  { id: '39789909-acac-4247-a4ad-2860c0cbd27a', email: 'admin@test.goldenpages', displayName: 'Test Admin', role: 'admin' },
  { id: '925192a4-39ef-4916-8c52-27ffd798f725', email: 'editor@test.goldenpages', displayName: 'Test Editor', role: 'editor' },
] as const;

async function main() {
  const pool = new pg.Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false },
  });
  const client = await pool.connect();

  try {
    await client.query('BEGIN');

    // 1. Upsert into public.users
    for (const user of TEST_USERS) {
      await client.query(
        `INSERT INTO users (id, email, display_name, "createdAt")
         VALUES ($1, $2, $3, NOW())
         ON CONFLICT (id) DO UPDATE SET email = EXCLUDED.email, display_name = EXCLUDED.display_name`,
        [user.id, user.email, user.displayName]
      );
      console.log(`Upserted user: ${user.email}`);
    }

    // 2. Ensure roles exist
    for (const role of ['admin', 'editor', 'user']) {
      await client.query(
        `INSERT INTO roles (id, name, description, "createdAt", "updatedAt")
         VALUES (gen_random_uuid(), $1, $2, NOW(), NOW())
         ON CONFLICT (name) DO NOTHING`,
        [role, `${role.charAt(0).toUpperCase() + role.slice(1)} role`]
      );
    }
    console.log('Ensured roles exist');

    // 3. Get role IDs
    const { rows: roles } = await client.query('SELECT id, name FROM roles');
    const roleMap = new Map(roles.map((r) => [r.name, r.id]));

    // 4. Assign roles
    for (const user of TEST_USERS) {
      const roleId = roleMap.get(user.role);
      if (!roleId) {
        console.error(`Role '${user.role}' not found`);
        continue;
      }

      await client.query(
        `INSERT INTO user_roles ("userId", "roleId", "assignedAt")
         VALUES ($1, $2, NOW())
         ON CONFLICT ("userId", "roleId") DO NOTHING`,
        [user.id, roleId]
      );
      console.log(`Assigned role '${user.role}' to ${user.email}`);
    }

    await client.query('COMMIT');
    console.log('\nDone! Test users seeded.');
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Failed:', error);
    process.exit(1);
  } finally {
    client.release();
    await pool.end();
  }
}

main();
