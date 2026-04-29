#!/usr/bin/env node

/**
 * Diplomatic Missions to New Zealand - Migration Runner
 *
 * This script executes the SQL migration files to restructure
 * diplomatic missions from being separate organizations to being
 * departments under their sending countries.
 *
 * Usage:
 *   node scripts/run-diplomatic-migration.ts
 *   npm run migrate-diplomatic
 */

import { readFileSync, existsSync } from 'fs';
import { join } from 'path';

const SQL_FILES = [
  {
    name: 'Missing Country Organizations',
    file: 'prisma/seeds/02b_missing_diplomatic_orgs.sql',
    description: 'Creates 30+ country organizations for diplomatic missions',
  },
  {
    name: 'Diplomatic Mission Departments',
    file: 'prisma/seeds/03b_diplomatic_missions_departments.sql',
    description: 'Creates High Commissions and Embassies under sending countries',
  },
  {
    name: 'Diplomatic Contacts Update',
    file: 'prisma/seeds/08_update_diplomatic_contacts.sql',
    description: 'Updates 80+ diplomatic contacts to link to new departments',
  },
];

interface ExecutionResult {
  success: boolean;
  file: string;
  duration: number;
  error?: string;
}

// ANSI color codes for terminal output
const colors = {
  reset: '\x1b[0m',
  bright: '\x1b[32m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  cyan: '\x1b[36m',
  magenta: '\x1b[35m',
  red: '\x1b[31m',
  bold: '\x1b[1m',
};

function log(message: string, color: keyof typeof colors = 'reset') {
  const colorCode = colors[color] || colors.reset;
  process.stdout.write(colorCode + message + '\x1b[0m');
}

function logStep(step: number, total: number, message: string) {
  log(`[${step}/${total}] ${message}`, 'cyan');
}

function logSuccess(message: string) {
  log('✓ ' + message, 'green');
}

function logError(message: string) {
  log('✗ ' + message, 'red');
}

function logInfo(message: string) {
  log('ℹ ' + message, 'blue');
}

function logFile(message: string, filePath: string) {
  log(`📄 ${message}`, 'blue');
  console.log(`   ${filePath}`);
}

function getDatabaseUrl(): string {
  const url = process.env.DATABASE_URL;
  if (!url) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  if (!url.includes('postgresql://')) {
    throw new Error('DATABASE_URL must be a PostgreSQL connection string');
  }
  return url;
}

async function executeSqlViaSupabase(sql: string, fileName: string): Promise<ExecutionResult> {
  const startTime = Date.now();

  try {
    logInfo(`Executing ${fileName}...`);

    // For Supabase, we need to use fetch to run SQL
    const response = await fetch(process.env.SUPABASE_URL + '/rest/v1/rpc/execute_sql', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'apikey': process.env.SUPABASE_ANON_KEY || '',
        'Authorization': `Bearer ${process.env.SUPABASE_ACCESS_TOKEN || ''}`,
      },
      body: JSON.stringify({
        sql: sql.trim(),
        // Don't auto-transaction - we want explicit control
        _transaction: false,
      }),
    });

    const data = await response.json();

    if (data.error) {
      throw new Error(`Supabase API error: ${JSON.stringify(data.error)}`);
    }

    const duration = Date.now() - startTime;
    logSuccess(`Completed ${fileName} (${duration}ms)`);

    return {
      success: true,
      file: fileName,
      duration,
    };
  } catch (error: any) {
    const duration = Date.now() - startTime;
    logError(`Failed ${fileName}: ${(error as Error).message}`);

    return {
      success: false,
      file: fileName,
      duration,
      error: (error as Error).message,
    };
  }
}

function getSqlFileContent(fileName: string): string {
  const filePath = join(process.cwd(), fileName);

  if (!existsSync(filePath)) {
    throw new Error(`SQL file not found: ${filePath}`);
  }

  return readFileSync(filePath, 'utf-8');
}

async function main() {
  try {
    log('\n=== Diplomatic Missions Migration ===', 'bold');
    log('\nThis will restructure diplomatic missions to New Zealand', 'reset');
    log('\nFROM: Separate "Diplomatic Missions To NZ" organization', 'yellow');
    log('TO:   Departments under each sending country', 'green');
    log('\nCommonwealth countries use "High Commission"', 'cyan');
    log('Other countries use "Embassy"', 'cyan');
    log('\n===========================================\n', 'bold');

    const dbUrl = getDatabaseUrl();
    logInfo(`Database: ${dbUrl.replace(/:[^:/]+@.*/, '***@***')}`);

    if (!process.env.SUPABASE_URL && !process.env.SUPABASE_ANON_KEY) {
      throw new Error('\nSUPABASE_URL or SUPABASE_ANON_KEY environment variables are required.');
    }

    const results: ExecutionResult[] = [];

    for (let i = 0; i < SQL_FILES.length; i++) {
      const sqlFile = SQL_FILES[i];
      const stepNumber = i + 1;

      logStep(stepNumber, SQL_FILES.length, sqlFile.name);

      try {
        const sqlContent = getSqlFileContent(sqlFile.file);
        const result = await executeSqlViaSupabase(sqlContent, sqlFile.file);
        results.push(result);

        if (result.success) {
          logSuccess(`Created/Updated ${sqlFile.description}`);
        } else {
          logError(`Failed: ${sqlFile.description}`);
        }

        // Small delay between executions to avoid rate limiting
        if (i < SQL_FILES.length - 1) {
          await new Promise(resolve => setTimeout(resolve, 500));
        }
      } catch (error: any) {
        logError(`Skipping ${sqlFile.file}: ${(error as Error).message}`);
        results.push({
          success: false,
          file: sqlFile.file,
          duration: 0,
          error: (error as Error).message,
        });
      }
    }

    // Summary
    log('\n===========================================\n', 'bold');
    log('\n📊 MIGRATION SUMMARY\n', 'bold');

    const successCount = results.filter(r => r.success).length;
    const failCount = results.filter(r => !r.success).length;
    const totalDuration = results.reduce((sum, r) => sum + (r.duration || 0), 0);

    log(`Total files: ${SQL_FILES.length}`, 'reset');
    log(`Successful: ${successCount}`, 'green');
    log(`Failed: ${failCount}`, failCount > 0 ? 'red' : 'yellow');
    log(`Total time: ${(totalDuration / 1000).toFixed(2)}s`, 'reset');

    if (successCount === SQL_FILES.length) {
      log('\n✅ Migration completed successfully!\n', 'green');
      log('\nNext steps:', 'cyan');
      log('1. Verify with verification queries in README_DIPLOMATIC_MIGRATION.md', 'blue');
      log('2. Check contacts are linked to correct departments', 'blue');
    } else {
      log('\n⚠️  Some migrations failed. Please check errors above.', 'yellow');
      log('\nYou can re-run this script to retry failed migrations.', 'cyan');
    }

    log('\n===========================================\n', 'bold');
  } catch (error: any) {
    logError(`Fatal error: ${(error as Error).message}`);
    process.exit(1);
  }
}

// Check if script is being run directly
if (import.meta.url) {
  logInfo('Running via --import or direct execution');
}

main();
