-- ============================================================================
-- GOLDEN PAGES DATABASE SETUP
-- ============================================================================
-- This script creates the complete database schema with RBAC support
-- Run this in Supabase SQL Editor to set up the database
-- ============================================================================

-- Enable UUID extension if not exists
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================================
-- STEP 1: DROP EXISTING OBJECTS (for clean setup)
-- ============================================================================

-- Drop tables if they exist (in correct order due to foreign keys)
DROP TABLE IF EXISTS contact_channels CASCADE;
DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS organisation_locations CASCADE;
DROP TABLE IF EXISTS organisations CASCADE;
DROP TABLE IF EXISTS regions CASCADE;
DROP TABLE IF EXISTS activity_logs CASCADE;
DROP TABLE IF EXISTS outreach_logs CASCADE;
DROP TABLE IF EXISTS contact_notes CASCADE;
DROP TABLE IF EXISTS organisation_notes CASCADE;
DROP TABLE IF EXISTS role_permissions CASCADE;
DROP TABLE IF EXISTS user_roles CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- Drop enum types
DROP TYPE IF EXISTS ContactChannelType CASCADE;
DROP TYPE IF EXISTS LocationType CASCADE;
DROP TYPE IF EXISTS OrganisationType CASCADE;
DROP TYPE IF EXISTS RegionType CASCADE;
DROP TYPE IF EXISTS UserRole CASCADE;
DROP TYPE IF EXISTS NoteVisibility CASCADE;

-- ============================================================================
-- STEP 2: CREATE ENUMS
-- ============================================================================

CREATE TYPE RegionType AS ENUM ('country', 'state', 'province', 'territory');
CREATE TYPE OrganisationType AS ENUM ('government', 'corporate', 'diplomatic_mission', 'international_organization');
CREATE TYPE LocationType AS ENUM ('head_office', 'branch_office', 'regional_office', 'department_office', 'embassy', 'consulate', 'mission');
CREATE TYPE ContactChannelType AS ENUM ('phone', 'email', 'website', 'office_address', 'mobile', 'fax');
CREATE TYPE UserRole AS ENUM ('admin', 'editor', 'user');
CREATE TYPE NoteVisibility AS ENUM ('private', 'team', 'public');

-- ============================================================================
-- STEP 3: CREATE CORE TABLES
-- ============================================================================

-- Users table (syncs with Supabase Auth)
CREATE TABLE users (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    email TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Regions table
CREATE TABLE regions (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    code TEXT NOT NULL,
    region_type RegionType NOT NULL DEFAULT 'country',
    parent_region_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT regions_code_region_type_key UNIQUE (code, region_type),
    CONSTRAINT regions_parent_region_fkey FOREIGN KEY (parent_region_id) REFERENCES regions(id) ON DELETE SET NULL
);

-- Organisations table
CREATE TABLE organisations (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    type OrganisationType NOT NULL,
    head_office_country_id TEXT NOT NULL,
    head_office_city TEXT,
    head_office_address TEXT,
    head_office_phone TEXT,
    head_office_email TEXT,
    head_office_website TEXT,
    description TEXT,
    owner_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT organisations_head_office_country_id_fkey FOREIGN KEY (head_office_country_id) REFERENCES regions(id) ON DELETE RESTRICT,
    CONSTRAINT organisations_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Organisation Locations table
CREATE TABLE organisation_locations (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    organisation_id TEXT NOT NULL,
    location_name TEXT,
    country_id TEXT NOT NULL,
    city TEXT,
    address TEXT,
    phone TEXT,
    email TEXT,
    location_type LocationType NOT NULL DEFAULT 'branch_office',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT organisation_locations_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES organisations(id) ON DELETE CASCADE,
    CONSTRAINT organisation_locations_country_id_fkey FOREIGN KEY (country_id) REFERENCES regions(id) ON DELETE RESTRICT
);

-- Contacts table
CREATE TABLE contacts (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    full_name TEXT NOT NULL,
    role_title TEXT,
    department TEXT,
    organisation_id TEXT NOT NULL,
    primary_location_id TEXT,
    owner_id TEXT,
    is_head_office_based BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT contacts_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES organisations(id) ON DELETE CASCADE,
    CONSTRAINT contacts_primary_location_id_fkey FOREIGN KEY (primary_location_id) REFERENCES organisation_locations(id) ON DELETE SET NULL,
    CONSTRAINT contacts_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Contact Channels table
CREATE TABLE contact_channels (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    contact_id TEXT NOT NULL,
    channel_type ContactChannelType NOT NULL,
    value TEXT NOT NULL,
    display_value TEXT,
    phone_normalized TEXT,
    address_line_1 TEXT,
    address_line_2 TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    country TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT contact_channels_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
    CONSTRAINT contact_channels_contact_id_channel_type_value_key UNIQUE (contact_id, channel_type, value)
);

-- ============================================================================
-- STEP 4: CREATE RBAC TABLES
-- ============================================================================

-- Roles table
CREATE TABLE roles (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    name UserRole NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- User Roles junction table
CREATE TABLE user_roles (
    user_id TEXT NOT NULL,
    role_id TEXT NOT NULL,
    assigned_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    assigned_by TEXT,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    CONSTRAINT user_roles_assigned_by_fkey FOREIGN KEY (assigned_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Role Permissions table
CREATE TABLE role_permissions (
    role_id TEXT NOT NULL,
    permission TEXT NOT NULL,
    PRIMARY KEY (role_id, permission),
    CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- ============================================================================
-- STEP 5: CREATE AUDIT AND NOTES TABLES
-- ============================================================================

-- Activity Logs table
CREATE TABLE activity_logs (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id TEXT NOT NULL,
    action TEXT NOT NULL,
    resource_type TEXT NOT NULL,
    resource_id TEXT,
    changes JSONB,
    ip_address TEXT,
    user_agent TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT activity_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Organisation Notes table
CREATE TABLE organisation_notes (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    organisation_id TEXT NOT NULL,
    content TEXT NOT NULL,
    visibility NoteVisibility NOT NULL DEFAULT 'private',
    created_by_id TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT organisation_notes_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES organisations(id) ON DELETE CASCADE,
    CONSTRAINT organisation_notes_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Contact Notes table
CREATE TABLE contact_notes (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    contact_id TEXT NOT NULL,
    content TEXT NOT NULL,
    visibility NoteVisibility NOT NULL DEFAULT 'private',
    created_by_id TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT contact_notes_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
    CONSTRAINT contact_notes_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Outreach Logs table
CREATE TABLE outreach_logs (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    contact_id TEXT NOT NULL,
    type TEXT NOT NULL,
    subject TEXT,
    status TEXT NOT NULL,
    notes TEXT,
    sent_at TIMESTAMP WITH TIME ZONE,
    created_by_id TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT outreach_logs_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
    CONSTRAINT outreach_logs_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============================================================================
-- STEP 6: CREATE INDEXES
-- ============================================================================

-- Region indexes
CREATE INDEX regions_region_type_idx ON regions(region_type);
CREATE INDEX regions_parent_region_id_idx ON regions(parent_region_id);

-- Organisation indexes
CREATE INDEX organisations_type_idx ON organisations(type);
CREATE INDEX organisations_head_office_country_id_idx ON organisations(head_office_country_id);
CREATE INDEX organisations_owner_id_idx ON organisations(owner_id);

-- Location indexes
CREATE INDEX organisation_locations_organisation_id_idx ON organisation_locations(organisation_id);
CREATE INDEX organisation_locations_country_id_idx ON organisation_locations(country_id);

-- Contact indexes
CREATE INDEX contacts_organisation_id_idx ON contacts(organisation_id);
CREATE INDEX contacts_primary_location_id_idx ON contacts(primary_location_id);
CREATE INDEX contacts_owner_id_idx ON contacts(owner_id);

-- Contact channel indexes
CREATE INDEX contact_channels_contact_id_idx ON contact_channels(contact_id);
CREATE INDEX contact_channels_channel_type_idx ON contact_channels(channel_type);

-- Activity log indexes
CREATE INDEX activity_logs_user_id_idx ON activity_logs(user_id);
CREATE INDEX activity_logs_resource_type_resource_id_idx ON activity_logs(resource_type, resource_id);
CREATE INDEX activity_logs_created_at_idx ON activity_logs(created_at);

-- Notes indexes
CREATE INDEX organisation_notes_organisation_id_idx ON organisation_notes(organisation_id);
CREATE INDEX organisation_notes_created_by_id_idx ON organisation_notes(created_by_id);
CREATE INDEX contact_notes_contact_id_idx ON contact_notes(contact_id);
CREATE INDEX contact_notes_created_by_id_idx ON contact_notes(created_by_id);

-- Outreach indexes
CREATE INDEX outreach_logs_contact_id_idx ON outreach_logs(contact_id);
CREATE INDEX outreach_logs_created_by_id_idx ON outreach_logs(created_by_id);

-- ============================================================================
-- STEP 7: SEED DATA
-- ============================================================================

-- Run seed files in order:
-- 1. \i 'prisma/seeds/001_regions.sql'
-- 2. \i 'prisma/seeds/002_organisations.sql'
-- 3. \i 'prisma/seeds/004_contacts.sql'
-- 4. \i 'prisma/seeds/005_contact_channels.sql'
-- 5. \i 'prisma/seeds/RBAC_SEED_DATA.sql'
-- 6. \i 'prisma/RBAC_RLS_POLICIES.sql'

-- ============================================================================
-- SUCCESS!
-- ============================================================================
-- Database schema created successfully!
-- Next steps:
-- 1. Run the seed files in order listed above
-- 2. Apply RLS policies for production security
-- ============================================================================
