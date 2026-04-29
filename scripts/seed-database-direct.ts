#!/usr/bin/env node
/**
 * Database Seeder - Direct SQL execution
 *
 * Usage: npx tsx scripts/seed-database-direct.ts
 */

import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import { readFileSync, readdirSync } from 'fs';
import { join, resolve } from 'path';

// Load environment variables
config({ path: resolve(process.cwd(), '.env.local') });

const SUPABASE_URL = process.env.VITE_SUPABASE_URL || 'https://ywvdextusnszhbqpexgb.supabase.co';
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || '';

if (!SUPABASE_SERVICE_KEY) {
  console.error('❌ SUPABASE_SERVICE_ROLE_KEY not found');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

interface SeedFile {
  filename: string;
  order: number;
  fullPath: string;
}

/**
 * Get all seed SQL files in correct order
 */
function getSeedFiles(directory: string): SeedFile[] {
  const files = readdirSync(directory);
  const seedFiles = files
    .filter(f => f.endsWith('.sql'))
    .map(f => ({
      filename: f,
      order: parseInt(f.split('_')[0]),
      fullPath: join(directory, f)
    }))
    .sort((a, b) => a.order - b.order);

  return seedFiles;
}

/**
 * Execute SQL directly via Supabase SQL API
 */
async function executeSQL(sql: string): Promise<{ success: boolean; error?: string }> {
  try {
    const response = await fetch(`${SUPABASE_URL}/rest/v1/`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'apikey': SUPABASE_SERVICE_KEY,
        'Authorization': `Bearer ${SUPABASE_SERVICE_KEY}`,
        'Prefer': 'params=single-object'
      },
      body: JSON.stringify({ query: sql })
    });

    if (!response.ok) {
      const text = await response.text();
      return { success: false, error: text };
    }

    return { success: true };
  } catch (error: any) {
    return { success: false, error: error.message };
  }
}

/**
 * Execute SQL file by splitting into individual statements
 */
async function executeSQLFile(filePath: string): Promise<{ success: number; errors: string[] }> {
  const sqlContent = readFileSync(filePath, 'utf-8');

  // Split by ON CONFLICT statements (each INSERT ends with ON CONFLICT)
  const statements: string[] = [];
  const lines = sqlContent.split('\n');
  let currentStatement = '';

  for (const line of lines) {
    if (line.trim().startsWith('--') || line.trim() === '') continue;
    currentStatement += line + '\n';
    if (line.toUpperCase().includes('ON CONFLICT')) {
      statements.push(currentStatement.trim());
      currentStatement = '';
    }
  }

  // Add any remaining statement
  if (currentStatement.trim()) {
    statements.push(currentStatement.trim());
  }

  let success = 0;
  const errors: string[] = [];

  for (const stmt of statements) {
    const result = await executeSQL(stmt);
    if (result.success) {
      success++;
    } else if (result.error && !result.error.includes('duplicate key')) {
      errors.push(result.error.substring(0, 100));
    }
  }

  return { success, errors };
}

/**
 * Main seed function
 */
async function seedDatabase(): Promise<void> {
  console.log('🌱 Starting database seeding (direct SQL)...\n');

  const seedDir = join(process.cwd(), 'prisma', 'seeds');
  const seedFiles = getSeedFiles(seedDir);

  if (seedFiles.length === 0) {
    console.error('❌ No SQL seed files found in', seedDir);
    process.exit(1);
  }

  console.log(`📁 Found ${seedFiles.length} seed files\n`);

  let totalSuccess = 0;
  let totalErrors = 0;

  for (const seedFile of seedFiles) {
    console.log(`📄 Processing ${seedFile.filename}...`);

    const result = await executeSQLFile(seedFile.fullPath);

    totalSuccess += result.success;
    totalErrors += result.errors.length;

    console.log(`  ✅ ${result.success} statements executed`);

    if (result.errors.length > 0 && result.errors.length < 5) {
      result.errors.forEach(e => console.log(`  ⚠️  ${e}...`));
    } else if (result.errors.length >= 5) {
      console.log(`  ⚠️  ${result.errors.length} errors (showing first 5)`);
      result.errors.slice(0, 5).forEach(e => console.log(`  ⚠️  ${e}...`));
    }

    console.log('');
  }

  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log(`✅ Database seeding complete!`);
  console.log(`   Executed: ${totalSuccess} statements`);
  console.log(`   Errors: ${totalErrors}`);
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');
}

seedDatabase()
  .then(() => {
    console.log('✅ Done!\n');
    process.exit(0);
  })
  .catch((error) => {
    console.error('❌ Fatal error:', error);
    process.exit(1);
  });
