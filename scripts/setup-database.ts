#!/usr/bin/env node
/**
 * Database Setup - Creates tables from Prisma schema
 *
 * Usage: npx tsx scripts/setup-database.ts
 */

import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';
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
 * Create all tables using SQL execution via RPC
 * We'll use Supabase's SQL HTTP endpoint
 */
async function setupDatabase(): Promise<void> {
  console.log('🔧 Setting up database tables...\n');

  // SQL to create all tables
  const setupSQL = `
-- Enable UUID extension if not exists
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create RegionType enum
CREATE TYPE RegionType AS ENUM ('country', 'state', 'province', 'territory');

-- Create OrganisationType enum
CREATE TYPE OrganisationType AS ENUM ('government', 'corporate', 'diplomatic_mission', 'international_organization');

-- Create LocationType enum
CREATE TYPE LocationType AS ENUM ('head_office', 'branch_office', 'regional_office', 'department_office', 'embassy', 'consulate', 'mission');

-- Create ContactChannelType enum
CREATE TYPE ContactChannelType AS ENUM ('phone', 'email', 'website', 'office_address', 'mobile', 'fax');

-- Drop tables if they exist (in correct order due to foreign keys)
DROP TABLE IF EXISTS contact_channels CASCADE;
DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS organisation_locations CASCADE;
DROP TABLE IF EXISTS organisations CASCADE;
DROP TABLE IF EXISTS regions CASCADE;

-- Create Region table
CREATE TABLE regions (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    code TEXT NOT NULL,
    regionType RegionType NOT NULL DEFAULT 'country',
    parentRegionId TEXT,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updatedAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT regions_code_regionType_key UNIQUE (code, regionType),
    CONSTRAINT regions_parentRegion_fkey FOREIGN KEY (parentRegionId) REFERENCES regions(id) ON DELETE SET NULL
);

-- Create Organisation table
CREATE TABLE organisations (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    type OrganisationType NOT NULL,
    headOfficeCountryId TEXT NOT NULL,
    headOfficeCity TEXT,
    headOfficeAddress TEXT,
    headOfficePhone TEXT,
    headOfficeEmail TEXT,
    headOfficeWebsite TEXT,
    description TEXT,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updatedAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT organisations_headOfficeCountryId_fkey FOREIGN KEY (headOfficeCountryId) REFERENCES regions(id) ON DELETE RESTRICT
);

-- Create OrganisationLocation table
CREATE TABLE organisation_locations (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    organisationId TEXT NOT NULL,
    locationName TEXT,
    countryId TEXT NOT NULL,
    city TEXT,
    address TEXT,
    phone TEXT,
    email TEXT,
    locationType LocationType NOT NULL DEFAULT 'branch_office',
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updatedAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT organisation_locations_organisationId_fkey FOREIGN KEY (organisationId) REFERENCES organisations(id) ON DELETE CASCADE,
    CONSTRAINT organisation_locations_countryId_fkey FOREIGN KEY (countryId) REFERENCES regions(id) ON DELETE RESTRICT
);

-- Create Contact table
CREATE TABLE contacts (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    fullName TEXT NOT NULL,
    roleTitle TEXT,
    department TEXT,
    organisationId TEXT NOT NULL,
    primaryLocationId TEXT,
    isHeadOfficeBased BOOLEAN DEFAULT false,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updatedAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT contacts_organisationId_fkey FOREIGN KEY (organisationId) REFERENCES organisations(id) ON DELETE CASCADE,
    CONSTRAINT contacts_primaryLocationId_fkey FOREIGN KEY (primaryLocationId) REFERENCES organisation_locations(id) ON DELETE SET NULL
);

-- Create ContactChannel table
CREATE TABLE contact_channels (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    contactId TEXT NOT NULL,
    channelType ContactChannelType NOT NULL,
    value TEXT NOT NULL,
    displayValue TEXT,
    phoneNormalized TEXT,
    addressLine1 TEXT,
    addressLine2 TEXT,
    city TEXT,
    state TEXT,
    postalCode TEXT,
    country TEXT,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updatedAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT contact_channels_contactId_fkey FOREIGN KEY (contactId) REFERENCES contacts(id) ON DELETE CASCADE,
    CONSTRAINT contact_channels_contactId_channelType_value_key UNIQUE (contactId, channelType, value)
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS regions_regionType_idx ON regions(regionType);
CREATE INDEX IF NOT EXISTS regions_parentRegionId_idx ON regions(parentRegionId);
CREATE INDEX IF NOT EXISTS organisations_type_idx ON organisations(type);
CREATE INDEX IF NOT EXISTS organisations_headOfficeCountryId_idx ON organisations(headOfficeCountryId);
CREATE INDEX IF NOT EXISTS organisation_locations_organisationId_idx ON organisation_locations(organisationId);
CREATE INDEX IF NOT EXISTS organisation_locations_countryId_idx ON organisation_locations(countryId);
CREATE INDEX IF NOT EXISTS contacts_organisationId_idx ON contacts(organisationId);
CREATE INDEX IF NOT EXISTS contacts_primaryLocationId_idx ON contacts(primaryLocationId);
CREATE INDEX IF NOT EXISTS contact_channels_contactId_idx ON contact_channels(contactId);
CREATE INDEX IF NOT EXISTS contact_channels_channelType_idx ON contact_channels(channelType);
`;

  console.log('📝 Executing setup SQL...');

  try {
    // Use Supabase's SQL endpoint directly
    const response = await fetch(`${SUPABASE_URL}/rest/v1/rpc/exec_sql`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'apikey': SUPABASE_SERVICE_KEY,
        'Authorization': `Bearer ${SUPABASE_SERVICE_KEY}`
      },
      body: JSON.stringify({ sql_query: setupSQL })
    });

    if (!response.ok) {
      const errorText = await response.text();
      // Try a different approach - execute statements one by one
      console.log('⚠️  RPC method not available, trying individual table creation...');

      // We'll create tables via direct SQL through the Supabase SQL API
      const sqlResponse = await fetch(`${SUPABASE_URL}/rest/v1/`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/sql',
          'apikey': SUPABASE_SERVICE_KEY,
          'Authorization': `Bearer ${SUPABASE_SERVICE_KEY}`
        },
        body: setupSQL
      });

      if (!sqlResponse.ok) {
        throw new Error(`Failed to execute SQL: ${await sqlResponse.text()}`);
      }
    }

    console.log('✅ Database tables created successfully!\n');
    console.log('You can now run: npx tsx scripts/seed-database.ts\n');

  } catch (error: any) {
    console.error('❌ Setup failed:', error.message);
    console.log('\n📋 Alternative: Run this SQL in Supabase SQL Editor:');
    console.log('───');
    console.log(setupSQL);
    console.log('───\n');
    process.exit(1);
  }
}

setupDatabase()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error('Fatal error:', error);
    process.exit(1);
  });
