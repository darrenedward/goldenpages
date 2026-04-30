/**
 * Script to create test users in dev Supabase for E2E tests.
 * Run with: npx tsx e2e/helpers/create-test-users.ts
 *
 * Creates users in auth.users + public.users + user_roles tables.
 */

import { config } from 'dotenv';
import { resolve } from 'path';
import { createClient } from '@supabase/supabase-js';

config({ path: resolve(process.cwd(), '.env.local') });

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;

const TEST_USERS = [
  { email: 'admin@test.goldenpages', password: 'Test1234!', role: 'admin' },
  { email: 'editor@test.goldenpages', password: 'Test1234!', role: 'editor' },
] as const;

async function main() {
  const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  for (const user of TEST_USERS) {
    console.log(`Creating user: ${user.email}`);

    // Check if user already exists
    const { data: existingUsers, error: listError } = await supabase.auth.admin.listUsers();
    if (listError) {
      console.error(`  Error listing users: ${listError.message}`);
      continue;
    }

    const existing = existingUsers.users.find((u) => u.email === user.email);
    let userId: string;

    if (existing) {
      console.log(`  User already exists (id: ${existing.id})`);
      userId = existing.id;
    } else {
      // Create auth user
      const { data, error } = await supabase.auth.admin.createUser({
        email: user.email,
        password: user.password,
        email_confirm: true,
      });

      if (error) {
        console.error(`  Error creating user: ${error.message}`);
        continue;
      }

      userId = data.user.id;
      console.log(`  Created auth user (id: ${userId})`);
    }

    // Upsert into public.users table
    const { error: userError } = await supabase
      .from('users')
      .upsert(
        { id: userId, email: user.email, display_name: `Test ${user.role}` },
        { onConflict: 'id' }
      );

    if (userError) {
      console.error(`  Error upserting users table: ${userError.message}`);
    } else {
      console.log(`  Upserted into users table`);
    }

    // Look up the role in the roles table
    const { data: roleData, error: roleLookupError } = await supabase
      .from('roles')
      .select('id')
      .eq('name', user.role)
      .single();

    if (roleLookupError || !roleData) {
      console.error(`  Error finding role '${user.role}': ${roleLookupError?.message || 'not found'}`);
      continue;
    }

    // Upsert role assignment in user_roles table
    const { error: roleError } = await supabase
      .from('user_roles')
      .upsert(
        { userId: userId, roleId: roleData.id },
        { onConflict: 'userId,roleId' }
      );

    if (roleError) {
      console.error(`  Error upserting user_roles: ${roleError.message}`);
    } else {
      console.log(`  Assigned role: ${user.role}`);
    }
  }

  console.log('\nDone! Test users are ready for E2E tests.');
}

main().catch(console.error);
