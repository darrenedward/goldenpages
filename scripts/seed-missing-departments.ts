/**
 * Script to seed missing departments for Argentina, Italy, and New Zealand
 * Run with: npx ts-node scripts/seed-missing-departments.ts
 */

import pg from 'pg';
import * as dotenv from 'dotenv';
import * as fs from 'fs';
import * as path from 'path';
import { URL } from 'url';

dotenv.config();

const { Pool } = pg;

function getConnectionString(): string {
  const dbUrl = process.env.DATABASE_URL || '';
  
  // Parse the URL and add SSL settings
  const url = new URL(dbUrl);
  url.searchParams.set('sslmode', 'require');
  url.searchParams.set('uselibpqcompat', 'true');
  
  return url.toString();
}

async function main() {
  console.log('🌱 Seeding missing departments...\n');

  // Create connection pool with SSL settings
  const pool = new Pool({
    connectionString: getConnectionString(),
    ssl: {
      rejectUnauthorized: false
    }
  });

  try {
    // Read the SQL seed file
    const sqlFilePath = path.join(__dirname, '../prisma/seeds/06_missing_departments.sql');
    const sqlContent = fs.readFileSync(sqlFilePath, 'utf-8');

    console.log('📄 Executing SQL seed file...');
    
    // Execute the SQL
    const result = await pool.query(sqlContent);
    
    console.log('✅ Seed completed successfully!');
    console.log('\n📊 Summary:');
    console.log('  - Argentina Government: 16 departments added');
    console.log('  - Italy Government: 16 departments added');
    console.log('  - New Zealand Government: 16 departments added');
    console.log('  - Total: 48 new departments');
    
  } catch (error) {
    console.error('❌ Seed failed:', error);
    throw error;
  } finally {
    await pool.end();
  }
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  });
