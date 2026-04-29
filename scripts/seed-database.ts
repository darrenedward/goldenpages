#!/usr/bin/env node
/**
 * Database Seeder - Executes SQL seed files
 *
 * Usage: npx tsx scripts/seed-database.ts
 */

import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import { readFileSync, readdirSync } from 'fs';
import { join, resolve } from 'path';

// Load environment variables from .env.local
config({ path: resolve(process.cwd(), '.env.local') });

// Configuration
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
 * Parse a single INSERT statement
 * Format: INSERT INTO table (cols) VALUES (values) ON CONFLICT ...
 */
function parseSingleInsert(sql: string): { tableName: string; columns: string[]; values: any[] } | null {
  const trimmed = sql.trim();

  // Match: INSERT INTO table_name (col1, col2, ...) VALUES
  const insertMatch = trimmed.match(/INSERT INTO (\w+)\s*\(([^)]+)\)\s*VALUES/i);
  if (!insertMatch) return null;

  const [, tableName, columnsStr] = insertMatch;
  const columns = columnsStr.split(',').map(c => c.trim());

  // Find VALUES clause
  const valuesIndex = trimmed.toUpperCase().indexOf('VALUES');
  if (valuesIndex === -1) return null;

  const valuesEnd = trimmed.indexOf('ON CONFLICT');
  const actualEnd = valuesEnd === -1 ? trimmed.length : valuesEnd;

  let valuesSection = trimmed.substring(valuesIndex + 6, actualEnd).trim();

  // Remove leading/trailing parens
  valuesSection = valuesSection.replace(/^\(/, '').replace(/\)$/, '');

  const values: any[] = [];
  let inString = false;
  let currentValue = '';
  let i = 0;

  while (i < valuesSection.length) {
    const char = valuesSection[i];

    // Handle string literals
    if (char === "'" && (i === 0 || valuesSection[i - 1] !== '\\')) {
      if (!inString) {
        inString = true;
        currentValue = '';
        i++;
        continue;
      } else {
        // Check for escaped quote ('')
        if (i + 1 < valuesSection.length && valuesSection[i + 1] === "'") {
          currentValue += "'";
          i += 2;
          continue;
        }
        inString = false;
        values.push(currentValue);
        currentValue = '';
        i++;
        continue;
      }
    }

    if (inString) {
      currentValue += char;
      i++;
      continue;
    }

    // Handle NULL
    if (char.toUpperCase() === 'N' && i + 3 < valuesSection.length &&
        valuesSection.substring(i, i + 4).toUpperCase() === 'NULL') {
      values.push(null);
      currentValue = '';
      i += 4;
      continue;
    }

    // Handle boolean true
    if (char.toUpperCase() === 'T' && i + 3 < valuesSection.length &&
        valuesSection.substring(i, i + 4).toLowerCase() === 'true') {
      values.push(true);
      currentValue = '';
      i += 4;
      continue;
    }

    // Handle boolean false
    if (char.toUpperCase() === 'F' && i + 4 < valuesSection.length &&
        valuesSection.substring(i, i + 5).toLowerCase() === 'false') {
      values.push(false);
      currentValue = '';
      i += 5;
      continue;
    }

    // Handle comma separator
    if (char === ',') {
      if (currentValue.trim() !== '') {
        values.push(currentValue.trim());
      }
      currentValue = '';
      i++;
      // Skip whitespace after comma
      while (i < valuesSection.length && /\s/.test(valuesSection[i])) i++;
      continue;
    }

    // Build current value (skip whitespace outside of strings)
    if (!/\s/.test(char)) {
      currentValue += char;
    }
    i++;
  }

  // Add last value if present
  if (currentValue.trim() !== '') {
    values.push(currentValue.trim());
  }

  return { tableName, columns, values };
}

/**
 * Parse a value
 */
function parseValue(value: any): any {
  if (value === null || value === 'null') return null;
  if (typeof value !== 'string') return value;
  const trimmed = value.trim();
  if (trimmed === 'NULL') return null;
  if (trimmed === 'true') return true;
  if (trimmed === 'false') return false;
  if (/^\d+$/.test(trimmed)) return parseInt(trimmed, 10);
  return trimmed;
}

/**
 * Split SQL file into individual INSERT statements
 */
function splitInsertStatements(sql: string): string[] {
  const lines = sql.split('\n');
  const statements: string[] = [];
  let currentStatement = '';

  for (const line of lines) {
    // Skip comments and empty lines
    if (line.trim().startsWith('--') || line.trim() === '') {
      continue;
    }

    currentStatement += line + '\n';

    // Check if this ends an INSERT statement
    if (line.toUpperCase().includes('ON CONFLICT')) {
      statements.push(currentStatement.trim());
      currentStatement = '';
    }
  }

  return statements;
}

/**
 * Extract country code from subquery
 */
function extractCountryCode(subquery: string): string | null {
  const match = subquery.match(/code\s*=\s*'(\w+)'/i);
  return match ? match[1] : null;
}

/**
 * Extract org name from subquery
 */
function extractOrgName(subquery: string): string | null {
  const match = subquery.match(/name\s*=\s*'([^']+)'/i);
  return match ? match[1] : null;
}

/**
 * Extract contact full name from subquery
 */
function extractContactName(subquery: string): string | null {
  const match = subquery.match(/fullName\s*=\s*'([^']+)'/i);
  return match ? match[1] : null;
}

/**
 * Seed regions
 */
async function seedRegions(inserts: any[]): Promise<{ success: number; skipped: number; errors: string[] }> {
  let success = 0;
  let skipped = 0;
  const errors: string[] = [];

  for (const insert of inserts) {
    const { values } = insert;
    const [name, code, regionType] = values.map(parseValue);

    const { error } = await supabase.from('regions').insert({
      name,
      code,
      regionType: regionType
    });

    if (error) {
      if (error.code === '23505' || error.message.includes('unique')) {
        skipped++;
      } else {
        errors.push(`${name}: ${error.message}`);
      }
    } else {
      success++;
    }
  }

  return { success, skipped, errors };
}

/**
 * Seed organisations
 */
async function seedOrganisations(inserts: any[]): Promise<{ success: number; skipped: number; errors: string[] }> {
  // Get all regions
  const { data: regions } = await supabase.from('regions').select('id, code');
  const regionMap = new Map(regions?.map(r => [r.code, r.id]) || []);

  let success = 0;
  let skipped = 0;
  const errors: string[] = [];

  for (const insert of inserts) {
    const { values } = insert;

    let idx = 0;
    const id = parseValue(values[idx++]);
    const name = parseValue(values[idx++]);
    const type = parseValue(values[idx++]); // May have ::organisation_type
    const cleanType = typeof type === 'string' ? type.replace(/::\w+/, '') : type;
    const countryCode = parseValue(values[idx++]); // Subquery
    const city = parseValue(values[idx++]);
    const address = parseValue(values[idx++]);
    const phone = parseValue(values[idx++]);
    const email = parseValue(values[idx++]);
    const website = parseValue(values[idx++]);
    const description = values.length > idx ? parseValue(values[idx++]) : null;

    // Extract country code from subquery
    const actualCountryCode = typeof countryCode === 'string' ? extractCountryCode(countryCode) : null;
    const regionId = actualCountryCode ? regionMap.get(actualCountryCode) : null;

    const orgData: any = {
      name,
      type: cleanType,
      headOfficeCountryId: regionId,
      headOfficeCity: city,
      headOfficeAddress: address,
      headOfficePhone: phone,
      headOfficeEmail: email,
      headOfficeWebsite: website
    };

    const { error } = await supabase.from('organisations').insert(orgData);

    if (error) {
      if (error.code === '23505' || error.message.includes('unique')) {
        skipped++;
      } else {
        errors.push(`${name}: ${error.message}`);
      }
    } else {
      success++;
    }
  }

  return { success, skipped, errors };
}

/**
 * Seed contacts
 */
async function seedContacts(inserts: any[]): Promise<{ success: number; skipped: number; errors: string[] }> {
  // Get all organisations
  const { data: organisations } = await supabase.from('organisations').select('id, name');
  const orgMap = new Map(organisations?.map(o => [o.name, o.id]) || []);

  let success = 0;
  let skipped = 0;
  const errors: string[] = [];

  for (const insert of inserts) {
    const { values } = insert;

    let idx = 0;
    const id = parseValue(values[idx++]);
    const fullName = parseValue(values[idx++]);
    const roleTitle = parseValue(values[idx++]);
    const department = parseValue(values[idx++]);
    const orgName = parseValue(values[idx++]); // Subquery
    const isHeadOfficeBased = parseValue(values[idx++]);

    // Extract org name from subquery
    const actualOrgName = typeof orgName === 'string' ? extractOrgName(orgName) : null;
    const organisationId = actualOrgName ? orgMap.get(actualOrgName) : null;

    if (!organisationId && actualOrgName) {
      errors.push(`Organisation not found: ${actualOrgName}`);
      skipped++;
      continue;
    }

    const { error } = await supabase.from('contacts').insert({
      fullName,
      roleTitle,
      department,
      organisationId,
      isHeadOfficeBased: isHeadOfficeBased === true || isHeadOfficeBased === 'true'
    });

    if (error) {
      if (error.code === '23505' || error.message.includes('unique')) {
        skipped++;
      } else {
        errors.push(`${fullName}: ${error.message}`);
      }
    } else {
      success++;
    }
  }

  return { success, skipped, errors };
}

/**
 * Seed contact channels
 */
async function seedContactChannels(inserts: any[]): Promise<{ success: number; skipped: number; errors: string[] }> {
  // Get all contacts
  const { data: contacts } = await supabase.from('contacts').select('id, fullName');
  const contactMap = new Map(contacts?.map(c => [c.fullName, c.id]) || []);

  let success = 0;
  let skipped = 0;
  const errors: string[] = [];

  for (const insert of inserts) {
    const { values } = insert;

    let idx = 0;
    const id = parseValue(values[idx++]);
    const contactName = parseValue(values[idx++]); // Subquery
    const channelType = parseValue(values[idx++]);
    const value = parseValue(values[idx++]);
    const displayValue = parseValue(values[idx++]);
    const phoneNormalized = parseValue(values[idx++]);
    const addressLine1 = parseValue(values[idx++]);
    const city = parseValue(values[idx++]);

    // Extract contact name from subquery
    const actualContactName = typeof contactName === 'string' ? extractContactName(contactName) : null;
    const contactId = actualContactName ? contactMap.get(actualContactName) : null;

    if (!contactId && actualContactName) {
      skipped++;
      continue;
    }

    const channelData: any = {
      contactId,
      channelType: typeof channelType === 'string' ? channelType.replace(/::\w+/, '') : channelType,
      value
    };

    if (displayValue) channelData.displayValue = displayValue;
    if (phoneNormalized) channelData.phoneNormalized = phoneNormalized;
    if (addressLine1) channelData.addressLine1 = addressLine1;
    if (city) channelData.city = city;

    const { error } = await supabase.from('contact_channels').insert(channelData);

    if (error) {
      if (error.code === '23505' || error.message.includes('unique')) {
        skipped++;
      } else {
        errors.push(`${actualContactName}: ${error.message}`);
      }
    } else {
      success++;
    }
  }

  return { success, skipped, errors };
}

/**
 * Main seed function
 */
async function seedDatabase(): Promise<void> {
  console.log('🌱 Starting database seeding...\n');

  const seedDir = join(process.cwd(), 'prisma', 'seeds');
  const seedFiles = getSeedFiles(seedDir);

  if (seedFiles.length === 0) {
    console.error('❌ No SQL seed files found in', seedDir);
    process.exit(1);
  }

  console.log(`📁 Found ${seedFiles.length} seed files\n`);

  let totalSuccess = 0;
  let totalSkipped = 0;
  let totalErrors = 0;

  for (const seedFile of seedFiles) {
    console.log(`📄 Processing ${seedFile.filename}...`);

    try {
      const sqlContent = readFileSync(seedFile.fullPath, 'utf-8');

      // Split into individual INSERT statements
      const insertStatements = splitInsertStatements(sqlContent);

      if (insertStatements.length === 0) {
        console.log('  ⚠️  No INSERT statements found\n');
        continue;
      }

      console.log(`  📊 Found ${insertStatements.length} INSERT statements`);

      // Parse all INSERTs
      const inserts: any[] = [];
      for (const stmt of insertStatements) {
        const parsed = parseSingleInsert(stmt);
        if (parsed) {
          inserts.push(parsed);
        }
      }

      let result: { success: number; skipped: number; errors: string[] };

      // Route to appropriate seeder
      if (inserts.length > 0 && inserts[0].tableName === 'regions') {
        result = await seedRegions(inserts);
      } else if (inserts.length > 0 && inserts[0].tableName === 'organisations') {
        result = await seedOrganisations(inserts);
      } else if (inserts.length > 0 && inserts[0].tableName === 'contacts') {
        result = await seedContacts(inserts);
      } else if (inserts.length > 0 && inserts[0].tableName === 'contact_channels') {
        result = await seedContactChannels(inserts);
      } else {
        result = { success: 0, skipped: 0, errors: ['Unknown table'] };
      }

      totalSuccess += result.success;
      totalSkipped += result.skipped;
      totalErrors += result.errors.length;

      console.log(`  ✅ ${result.success} inserted, ${result.skipped} skipped`);

      if (result.errors.length > 0 && result.errors.length < 5) {
        result.errors.forEach(e => console.log(`  ⚠️  ${e.substring(0, 80)}...`));
      }

      console.log('');

    } catch (fileError: any) {
      console.error(`  ❌ Failed: ${fileError.message}\n`);
      totalErrors++;
    }
  }

  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log(`✅ Database seeding complete!`);
  console.log(`   Inserted: ${totalSuccess} records`);
  console.log(`   Skipped: ${totalSkipped} duplicates`);
  console.log(`   Errors: ${totalErrors}`);
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');
}

// Run the seed function
seedDatabase()
  .then(() => {
    console.log('✅ Done!\n');
    process.exit(0);
  })
  .catch((error) => {
    console.error('❌ Fatal error:', error);
    process.exit(1);
  });
