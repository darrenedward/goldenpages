#!/usr/bin/env node
/**
 * Database Reset and Seed - Direct PostgreSQL connection
 *
 * Usage: npx tsx scripts/reset-and-seed.ts
 */

import { config } from 'dotenv';
import { Client } from 'pg';
import { readFileSync, readdirSync } from 'fs';
import { join, resolve } from 'path';

// Load environment variables
config({ path: resolve(process.cwd(), '.env.local') });

const DATABASE_URL = process.env.DATABASE_URL || '';

if (!DATABASE_URL) {
  console.error('❌ DATABASE_URL not found in .env.local');
  process.exit(1);
}

/**
 * Execute SQL file
 */
async function executeSQLFile(client: Client, filePath: string): Promise<void> {
  const sql = readFileSync(filePath, 'utf-8');
  await client.query(sql);
}

/**
 * Get all seed SQL files in correct order
 */
function getSeedFiles(directory: string): string[] {
  const files = readdirSync(directory);
  return files
    .filter(f => f.endsWith('.sql'))
    .map(f => ({
      filename: f,
      order: parseInt(f.split('_')[0]),
      fullPath: join(directory, f)
    }))
    .sort((a, b) => a.order - b.order)
    .map(f => f.fullPath);
}

/**
 * Main reset and seed function
 */
async function resetAndSeed(): Promise<void> {
  console.log('🔄 Resetting and seeding database...\n');

  // Parse DATABASE_URL and force IPv4
  const dbUrl = new URL(DATABASE_URL);
  const client = new Client({
    host: dbUrl.hostname,
    port: parseInt(dbUrl.port || '5432'),
    database: dbUrl.pathname.slice(1),
    user: dbUrl.username,
    password: dbUrl.password,
    ssl: { rejectUnauthorized: false },
    // Force IPv4
    family: 4
  });

  try {
    await client.connect();
    console.log('✅ Connected to database\n');

    // Step 1: Reset database schema
    console.log('📄 Running RESET_DATABASE.sql...');
    const resetSQLPath = join(process.cwd(), 'prisma', 'RESET_DATABASE.sql');
    await executeSQLFile(client, resetSQLPath);
    console.log('✅ Database schema reset\n');

    // Step 2: Run seed files
    const seedDir = join(process.cwd(), 'prisma', 'seeds');
    const seedFiles = getSeedFiles(seedDir);

    console.log(`📁 Found ${seedFiles.length} seed files\n`);

    let totalRows = 0;

    for (const seedFile of seedFiles) {
      const filename = seedFile.split('/').pop() || seedFile;
      console.log(`📄 Processing ${filename}...`);

      const sql = readFileSync(seedFile, 'utf-8');

      // Execute the entire seed file
      await client.query(sql);

      console.log(`  ✅ Executed\n`);
      totalRows++;
    }

    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    console.log(`✅ Database reset and seeding complete!`);
    console.log(`   Processed: ${totalRows} seed files`);
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

  } catch (error: any) {
    console.error('❌ Error:', error.message);
    throw error;
  } finally {
    await client.end();
  }
}

resetAndSeed()
  .then(() => {
    console.log('✅ Done!\n');
    process.exit(0);
  })
  .catch((error) => {
    console.error('❌ Fatal error:', error);
    process.exit(1);
  });
