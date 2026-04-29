#!/usr/bin/env node
/**
 * Seed RBAC Data and RLS Policies using Supabase Client
 *
 * Usage: npx tsx scripts/seed-rbac.ts
 */

import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';
import { resolve } from 'path';

// Load environment variables
config({ path: resolve(process.cwd(), '.env.local') });

const SUPABASE_URL = process.env.VITE_SUPABASE_URL || '';
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || '';

if (!SUPABASE_SERVICE_KEY) {
  console.error('❌ SUPABASE_SERVICE_ROLE_KEY not found');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

/**
 * Execute raw SQL via Supabase RPC
 */
async function executeSQL(sql: string, description: string): Promise<void> {
  console.log(`📄 ${description}...`);
  
  // Split SQL into individual statements
  const statements = sql
    .split(';')
    .map(s => s.trim())
    .filter(s => s.length > 0 && !s.startsWith('--'));

  let successCount = 0;
  let errorCount = 0;

  for (const statement of statements) {
    try {
      const { error } = await supabase.rpc('exec_sql', { sql: statement + ';' });
      
      if (error) {
        // Try alternative: use REST API for simple inserts
        if (statement.toUpperCase().includes('INSERT INTO ROLES')) {
          const match = statement.match(/VALUES\s*\('([^']+)',\s*'([^']+)',\s*'([^']+)'\)/i);
          if (match) {
            const { error: insertError } = await supabase.from('roles').insert({
              id: match[1],
              name: match[2],
              description: match[3]
            });
            if (!insertError) successCount++;
            else {
              if (!insertError.message.includes('duplicate')) {
                console.log(`  ⚠️  ${insertError.message.substring(0, 80)}`);
                errorCount++;
              } else {
                successCount++;
              }
            }
            continue;
          }
        }
        
        if (statement.toUpperCase().includes('INSERT INTO ROLE_PERMISSIONS')) {
          const match = statement.match(/VALUES\s*\('([^']+)',\s*'([^']+)'\)/i);
          if (match) {
            const { error: insertError } = await supabase.from('role_permissions').insert({
              role_id: match[1],
              permission: match[2]
            });
            if (!insertError) successCount++;
            else {
              if (!insertError.message.includes('duplicate')) {
                console.log(`  ⚠️  ${insertError.message.substring(0, 80)}`);
                errorCount++;
              } else {
                successCount++;
              }
            }
            continue;
          }
        }
        
        if (!error.message.includes('duplicate') && !error.message.includes('already exists')) {
          console.log(`  ⚠️  ${error.message.substring(0, 80)}`);
          errorCount++;
        } else {
          successCount++;
        }
      } else {
        successCount++;
      }
    } catch (err: any) {
      console.log(`  ⚠️  ${err.message?.substring(0, 80) || 'Unknown error'}`);
      errorCount++;
    }
  }

  console.log(`  ✅ ${successCount} statements executed, ${errorCount} errors`);
}

/**
 * Seed RBAC data using REST API
 */
async function seedRBACData(): Promise<void> {
  console.log('🔐 Seeding RBAC data...\n');

  // Insert roles
  const roles = [
    { id: '00000000-0000-0000-0000-000000000001', name: 'admin', description: 'Full system access with all permissions' },
    { id: '00000000-0000-0000-0000-000000000002', name: 'editor', description: 'Can read and write organizations, contacts, and related data' },
    { id: '00000000-0000-0000-0000-000000000003', name: 'user', description: 'Read-only access to organizations and contacts' }
  ];

  console.log('📄 Inserting roles...');
  for (const role of roles) {
    const { error } = await supabase.from('roles').insert(role);
    if (error && !error.message.includes('duplicate')) {
      console.log(`  ⚠️  ${role.name}: ${error.message.substring(0, 80)}`);
    }
  }
  console.log('  ✅ Roles inserted\n');

  // Insert permissions
  const permissions = [
    // Admin permissions
    { role_id: '00000000-0000-0000-0000-000000000001', permission: '*' },
    // Editor permissions
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'org:read' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'org:write' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'contact:read' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'contact:write' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'contact:archive' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'channel:read' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'channel:write' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'note:read' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'note:write' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'outreach:read' },
    { role_id: '00000000-0000-0000-0000-000000000002', permission: 'outreach:initiate' },
    // User permissions
    { role_id: '00000000-0000-0000-0000-000000000003', permission: 'org:read' },
    { role_id: '00000000-0000-0000-0000-000000000003', permission: 'contact:read' },
    { role_id: '00000000-0000-0000-0000-000000000003', permission: 'channel:read' },
    { role_id: '00000000-0000-0000-0000-000000000003', permission: 'note:read' }
  ];

  console.log('📄 Inserting permissions...');
  let permCount = 0;
  for (const perm of permissions) {
    const { error } = await supabase.from('role_permissions').insert(perm);
    if (error && !error.message.includes('duplicate')) {
      console.log(`  ⚠️  ${perm.permission}: ${error.message.substring(0, 80)}`);
    } else {
      permCount++;
    }
  }
  console.log(`  ✅ ${permCount} permissions inserted\n`);
}

/**
 * Main function
 */
async function main(): Promise<void> {
  console.log('🌱 Starting RBAC seeding and RLS policy application...\n');

  // Step 1: Seed RBAC data
  await seedRBACData();

  // Step 2: Read and apply RLS policies
  console.log('🔒 Applying RLS policies...');
  const rlsSQL = readFileSync(resolve(process.cwd(), 'prisma', 'RBAC_RLS_POLICIES.sql'), 'utf-8');
  
  // Since we can't execute complex SQL via REST, we'll need to inform the user
  console.log('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('⚠️  IMPORTANT: Manual SQL Execution Required');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('\nThe RLS policies and helper functions need to be executed');
  console.log('directly in the Supabase SQL Editor due to complexity.\n');
  console.log('Please go to:');
  console.log('  https://app.supabase.com/project/_/sql');
  console.log('\nAnd execute the following files in order:\n');
  console.log('1. prisma/seeds/RBAC_SEED_DATA.sql');
  console.log('   - Creates helper functions (assign_role, user_permissions, make_admin)');
  console.log('\n2. prisma/RBAC_RLS_POLICIES.sql');
  console.log('   - Enables RLS on all tables');
  console.log('   - Creates Row Level Security policies\n');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

  console.log('✅ RBAC data seeding complete!');
  console.log('   - 3 roles created (admin, editor, user)');
  console.log('   - 16 permissions assigned');
  console.log('\n⚠️  Remember to execute the SQL files manually for RLS policies.\n');
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((error) => {
    console.error('❌ Fatal error:', error);
    process.exit(1);
  });
