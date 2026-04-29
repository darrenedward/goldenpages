#!/usr/bin/env node
/**
 * Database Seeder using Supabase Client
 *
 * Usage: npx tsx scripts/supabase-seed.ts
 */

import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';
import { resolve } from 'path';

// Load environment variables
config({ path: resolve(process.cwd(), '.env.local') });

const SUPABASE_URL = process.env.VITE_SUPABASE_URL || 'https://ywvdextusnszhbqpexgb.supabase.co';
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || '';

if (!SUPABASE_SERVICE_KEY) {
  console.error('❌ SUPABASE_SERVICE_ROLE_KEY not found');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

/**
 * Clean type casting (::Type) and remove SQL string quotes
 */
function cleanValue(value: string): string {
  if (typeof value !== 'string') return value;
  let cleaned = value.replace(/::\w+/g, '').replace(/::"[^"]+"/g, '').trim();
  // Remove SQL string quotes if present
  if (cleaned.startsWith("'") && cleaned.endsWith("'")) {
    cleaned = cleaned.slice(1, -1);
  }
  return cleaned;
}

/**
 * Parse multi-row VALUES clause
 * Handles: VALUES (row1), (row2), (row3)
 * Also handles subqueries like (SELECT id FROM regions WHERE code = 'US')
 */
function parseMultiRowValues(sql: string): any[] | null {
  const trimmed = sql.trim();

  // Find VALUES clause
  const valuesIndex = trimmed.toUpperCase().indexOf('VALUES');
  if (valuesIndex === -1) return null;

  const conflictIndex = trimmed.toUpperCase().indexOf('ON CONFLICT');
  const endIndex = conflictIndex === -1 ? trimmed.length : conflictIndex;

  let valuesSection = trimmed.substring(valuesIndex + 6, endIndex).trim();

  // Remove trailing semicolon
  valuesSection = valuesSection.replace(/;\s*$/, '');

  const rows: any[] = [];
  let currentRow: string[] = [];
  let inString = false;
  let currentValue = '';
  let parenDepth = 0;  // Track nesting depth of parentheses
  let i = 0;

  while (i < valuesSection.length) {
    const char = valuesSection[i];

    // Handle string literals first (highest priority)
    if (char === "'" && (i === 0 || valuesSection[i - 1] !== '\\')) {
      if (!inString) {
        inString = true;
        currentValue += char;
        i++;
        continue;
      } else {
        // Check for escaped quote ('')
        if (i + 1 < valuesSection.length && valuesSection[i + 1] === "'") {
          currentValue += "''";
          i += 2;
          continue;
        }
        inString = false;
        currentValue += char;
        i++;
        continue;
      }
    }

    // Inside string, keep everything
    if (inString) {
      currentValue += char;
      i++;
      continue;
    }

    // Track parentheses for subqueries
    if (char === '(') {
      parenDepth++;
      // If this is the first paren (depth 1), it's the start of a row
      // Don't add it to currentValue
      i++;
      continue;
    }

    if (char === ')') {
      parenDepth--;
      // If we're back to depth 0, this is the end of a row
      if (parenDepth === 0) {
        // Add the last value
        if (currentValue.trim() !== '') {
          currentRow.push(currentValue.trim());
        }
        // Save the row
        if (currentRow.length > 0) {
          rows.push(currentRow);
          currentRow = [];
        }
        currentValue = '';
        i++;
        // Skip comma and whitespace after row
        while (i < valuesSection.length && (valuesSection[i] === ',' || /\s/.test(valuesSection[i]))) i++;
        continue;
      }
      // Still inside nested parens (subquery), keep the paren
      currentValue += char;
      i++;
      continue;
    }

    // Handle comma - only separates values when we're inside a row (depth >= 1)
    // and NOT inside a subquery (we'd be at depth > 1 for subquery)
    if (char === ',' && parenDepth === 1) {
      // This is a value separator
      currentRow.push(currentValue.trim());
      currentValue = '';
      i++;
      // Skip whitespace after comma
      while (i < valuesSection.length && /\s/.test(valuesSection[i])) i++;
      continue;
    }

    // For everything else, accumulate the value
    // Keep whitespace when inside subqueries (parenDepth > 1)
    if (parenDepth > 1 || !/\s/.test(char)) {
      currentValue += char;
    }

    i++;
  }

  return rows.length > 0 ? rows : null;
}

/**
 * Seed regions
 */
async function seedRegions(): Promise<{ success: number; errors: string[] }> {
  const sql = readFileSync(resolve(process.cwd(), 'prisma', 'seeds', '001_regions.sql'), 'utf-8');
  const rows = parseMultiRowValues(sql);

  if (!rows) return { success: 0, errors: ['Failed to parse regions'] };

  const data = rows.map(row => ({
    name: cleanValue(row[0]),
    code: cleanValue(row[1]),
    region_type: cleanValue(row[2])
  }));

  const { error } = await supabase.from('regions').insert(data);

  if (error) {
    return { success: 0, errors: [error.message] };
  }

  return { success: data.length, errors: [] };
}

/**
 * Split SQL into individual INSERT statements
 */
function splitInsertStatements(sql: string): string[] {
  const lines = sql.split('\n');
  const statements: string[] = [];
  let currentStatement = '';

  for (const line of lines) {
    if (line.trim().startsWith('--') || line.trim() === '') continue;
    currentStatement += line + '\n';
    if (line.toUpperCase().includes('ON CONFLICT')) {
      statements.push(currentStatement.trim());
      currentStatement = '';
    }
  }

  return statements;
}

/**
 * Extract value from SQL subquery or literal
 */
function extractValue(sql: string, pattern: RegExp): string | null {
  const match = sql.match(pattern);
  return match ? match[1] : null;
}

/**
 * Seed organisations
 */
async function seedOrganisations(): Promise<{ success: number; errors: string[] }> {
  // Get regions for mapping
  const { data: regions } = await supabase.from('regions').select('id, code');
  const regionMap = new Map(regions?.map(r => [r.code, r.id]) || []);

  const sql = readFileSync(resolve(process.cwd(), 'prisma', 'seeds', '002_organisations.sql'), 'utf-8');
  const statements = splitInsertStatements(sql);

  let success = 0;
  const errors: string[] = [];

  for (const stmt of statements) {
    const rows = parseMultiRowValues(stmt);
    if (!rows || rows.length === 0) continue;

    const row = rows[0]; // Single row per INSERT
    if (row.length < 10) continue;

    // Extract country code from subquery
    const countryCode = extractValue(stmt, /code\s*=\s*'(\w+)'/i);
    const regionId = countryCode ? regionMap.get(countryCode) : null;

    if (!regionId) {
      errors.push(`Country code ${countryCode} not found`);
      continue;
    }

    const data = {
      name: cleanValue(row[1]),
      type: cleanValue(row[2]),
      head_office_country_id: regionId,
      head_office_city: row[4] ? cleanValue(row[4]) : null,
      head_office_address: row[5] ? cleanValue(row[5]) : null,
      head_office_phone: row[6] ? cleanValue(row[6]) : null,
      head_office_email: row[7] ? cleanValue(row[7]) : null,
      head_office_website: row[8] ? cleanValue(row[8]) : null,
      description: row[9] ? cleanValue(row[9]) : null
    };

    const { error } = await supabase.from('organisations').insert(data);

    if (error && !error.message.includes('duplicate')) {
      errors.push(`${data.name}: ${error.message}`);
    } else {
      success++;
    }
  }

  return { success, errors };
}

/**
 * Seed contacts
 */
async function seedContacts(): Promise<{ success: number; errors: string[] }> {
  // Get organisations for mapping
  const { data: organisations } = await supabase.from('organisations').select('id, name');
  const orgMap = new Map(organisations?.map(o => [o.name, o.id]) || []);

  const sql = readFileSync(resolve(process.cwd(), 'prisma', 'seeds', '004_contacts.sql'), 'utf-8');
  const statements = splitInsertStatements(sql);

  let success = 0;
  const errors: string[] = [];

  for (const stmt of statements) {
    const rows = parseMultiRowValues(stmt);
    if (!rows || rows.length === 0) continue;

    const row = rows[0];
    if (row.length < 6) continue;

    // Extract org name from subquery
    const orgName = extractValue(stmt, /name\s*=\s*'([^']+)'/i);
    const orgId = orgName ? orgMap.get(orgName) : null;

    if (!orgId && orgName) {
      errors.push(`Org ${orgName} not found`);
      continue;
    }

    const data = {
      full_name: cleanValue(row[1]),
      role_title: row[2] ? cleanValue(row[2]) : null,
      department: row[3] ? cleanValue(row[3]) : null,
      organisation_id: orgId,
      is_head_office_based: row[4] === 'true' || row[4] === true || row[4] === "'true'"
    };

    const { error } = await supabase.from('contacts').insert(data);

    if (error && !error.message.includes('duplicate')) {
      errors.push(`${data.full_name}: ${error.message}`);
    } else {
      success++;
    }
  }

  return { success, errors };
}

/**
 * Seed contact channels
 */
async function seedContactChannels(): Promise<{ success: number; errors: string[] }> {
  // Get contacts for mapping
  const { data: contacts } = await supabase.from('contacts').select('id, full_name');
  const contactMap = new Map(contacts?.map(c => [c.full_name, c.id]) || []);

  const sql = readFileSync(resolve(process.cwd(), 'prisma', 'seeds', '005_contact_channels.sql'), 'utf-8');
  const statements = splitInsertStatements(sql);

  let success = 0;
  const errors: string[] = [];

  // Process in batches for efficiency
  const batchSize = 100;
  const batchData: any[] = [];

  for (let i = 0; i < statements.length; i++) {
    const stmt = statements[i];
    const rows = parseMultiRowValues(stmt);
    if (!rows || rows.length === 0) continue;

    const row = rows[0];
    if (row.length < 5) continue;

    // Extract contact name from subquery
    const contactName = extractValue(stmt, /full_name\s*=\s*'([^']+)'/i);
    const contactId = contactName ? contactMap.get(contactName) : null;

    if (!contactId) continue;

    const data: any = {
      contact_id: contactId,
      channel_type: cleanValue(row[1]),
      value: cleanValue(row[2])
    };

    // Optional fields
    if (row[3]) data.display_value = cleanValue(row[3]);
    if (row[4]) data.phone_normalized = cleanValue(row[4]);

    // Check for address fields (6+ columns)
    if (row.length >= 7) {
      data.address_line_1 = row[5] ? cleanValue(row[5]) : null;
      data.city = row[6] ? cleanValue(row[6]) : null;
    }

    batchData.push(data);

    // Insert batch when full
    if (batchData.length >= batchSize || i === statements.length - 1) {
      const { error } = await supabase.from('contact_channels').insert(batchData);

      if (error && !error.message.includes('duplicate')) {
        errors.push(`Batch: ${error.message}`);
      } else {
        success += batchData.length;
      }

      batchData.length = 0;
    }
  }

  return { success, errors };
}

/**
 * Main seed function
 */
async function seedDatabase(): Promise<void> {
  console.log('🌱 Starting database seeding via Supabase client...\n');

  // Clear existing data first (most specific to least specific to handle foreign keys)
  console.log('🗑️  Clearing existing data...');
  const { error: err1 } = await supabase.from('contact_channels').delete().neq('id', '00000000-0000-0000-0000-000000000000');
  const { error: err2 } = await supabase.from('contacts').delete().neq('id', '00000000-0000-0000-0000-000000000000');
  const { error: err3 } = await supabase.from('organisations').delete().neq('id', '00000000-0000-0000-0000-000000000000');
  const { error: err4 } = await supabase.from('regions').delete().neq('id', '00000000-0000-0000-0000-000000000000');

  // Check if there were any actual errors (not "no rows matched" type errors)
  if (err1 && !err1.message.includes('0 rows')) console.log('  Warning:', err1.message);
  console.log('  ✅ Cleared\n');

  let totalSuccess = 0;
  let totalErrors = 0;

  // Regions
  console.log('📄 Seeding regions...');
  const result1 = await seedRegions();
  totalSuccess += result1.success;
  totalErrors += result1.errors.length;
  console.log(`  ✅ ${result1.success} inserted`);
  if (result1.errors.length > 0) {
    result1.errors.slice(0, 3).forEach(e => console.log(`  ⚠️  ${e.substring(0, 80)}`));
  }
  console.log('');

  // Organisations
  console.log('📄 Seeding organisations...');
  const result2 = await seedOrganisations();
  totalSuccess += result2.success;
  totalErrors += result2.errors.length;
  console.log(`  ✅ ${result2.success} inserted`);
  if (result2.errors.length > 0 && result2.errors.length < 5) {
    result2.errors.forEach(e => console.log(`  ⚠️  ${e}`));
  }
  console.log('');

  // Contacts
  console.log('📄 Seeding contacts...');
  const result3 = await seedContacts();
  totalSuccess += result3.success;
  totalErrors += result3.errors.length;
  console.log(`  ✅ ${result3.success} inserted`);
  if (result3.errors.length > 0 && result3.errors.length < 5) {
    result3.errors.slice(0, 3).forEach(e => console.log(`  ⚠️  ${e.substring(0, 80)}`));
  }
  console.log('');

  // Contact channels
  console.log('📄 Seeding contact channels...');
  const result4 = await seedContactChannels();
  totalSuccess += result4.success;
  totalErrors += result4.errors.length;
  console.log(`  ✅ ${result4.success} inserted`);
  if (result4.errors.length > 0 && result4.errors.length < 3) {
    result4.errors.forEach(e => console.log(`  ⚠️  ${e.substring(0, 80)}`));
  }
  console.log('');

  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log(`✅ Database seeding complete!`);
  console.log(`   Total records: ${totalSuccess}`);
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
