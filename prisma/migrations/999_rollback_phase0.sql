-- ==============================================================================
-- PHASE 0 ROLLBACK SCRIPT
-- ==============================================================================
-- WARNING: This script will DELETE all data and schema changes from Phase 0
-- Only run this if you need to completely rollback the Phase 0 implementation
-- ==============================================================================

-- Start transaction for safe rollback
BEGIN;

-- Display warning
DO $$
BEGIN
  RAISE NOTICE '================================================================================================';
  RAISE NOTICE 'PHASE 0 ROLLBACK - This will DELETE ALL Phase 0 data and schema changes';
  RAISE NOTICE '================================================================================================';
  RAISE NOTICE 'Tables to be dropped:';
  RAISE NOTICE '  - sub_package_responses';
  RAISE NOTICE '  - package_recipients';
  RAISE NOTICE '  - package_documents';
  RAISE NOTICE '  - documents';
  RAISE NOTICE '  - sub_packages';
  RAISE NOTICE '  - packages';
  RAISE NOTICE '  - departments';
  RAISE NOTICE ' ';
  RAISE NOTICE 'Columns to be dropped:';
  RAISE NOTICE '  - contacts.departmentId (departmentLegacy will be preserved)';
  RAISE NOTICE '  - contacts.department_legacy (departmentLegacy will be preserved)';
  RAISE NOTICE ' ';
  RAISE NOTICE 'Permissions to be removed:';
  RAISE NOTICE '  - department:read, department:write';
  RAISE NOTICE '  - package:* (all package permissions)';
  RAISE NOTICE '  - document:* (all document permissions)';
  RAISE NOTICE '================================================================================================';
  RAISE NOTICE 'Commit the transaction to proceed, or ROLLBACK to cancel';
END $$;

-- ==============================================================================
-- STEP 1: Drop new tables (in correct order due to foreign keys)
-- ==============================================================================

-- Drop junction tables first
DROP TABLE IF EXISTS sub_package_responses CASCADE;
DROP TABLE IF EXISTS package_recipients CASCADE;
DROP TABLE IF EXISTS package_documents CASCADE;

-- Drop main tables
DROP TABLE IF EXISTS documents CASCADE;
DROP TABLE IF EXISTS sub_packages CASCADE;
DROP TABLE IF EXISTS packages CASCADE;

-- Drop departments table
DROP TABLE IF EXISTS departments CASCADE;

-- ==============================================================================
-- STEP 2: Remove department foreign key from contacts table
-- ==============================================================================
-- Note: We keep department_legacy (departmentLegacy) for reference

ALTER TABLE contacts DROP CONSTRAINT IF EXISTS contacts_departmentId_fkey;
ALTER TABLE contacts DROP COLUMN IF EXISTS "departmentId";

-- ==============================================================================
-- STEP 3: Remove Phase 0 permissions from role_permissions
-- ==============================================================================

-- Department permissions
DELETE FROM role_permissions 
WHERE permission IN ('department:read', 'department:write');

-- Package permissions
DELETE FROM role_permissions 
WHERE permission LIKE 'package:%';

-- Document permissions
DELETE FROM role_permissions 
WHERE permission LIKE 'document:%';

-- ==============================================================================
-- STEP 4: Remove department relation from Organisation model
-- ==============================================================================
-- (No action needed - this was just a relation, not a column)

-- ==============================================================================
-- STEP 5: Remove Department enum (if exists)
-- ==============================================================================
-- (No Department enum was created)

-- ==============================================================================
-- VERIFICATION
-- ==============================================================================

DO $$
BEGIN
  RAISE NOTICE '================================================================================================';
  RAISE NOTICE 'ROLLBACK COMPLETE';
  RAISE NOTICE '================================================================================================';
  RAISE NOTICE 'Remaining tables:';
  RAISE NOTICE '  - regions, organisations, contacts, contact_channels';
  RAISE NOTICE '  - users, roles, role_permissions, user_roles';
  RAISE NOTICE '  - organisation_locations, organisation_notes, contact_notes, outreach_logs';
  RAISE NOTICE '  - activity_logs';
  RAISE NOTICE ' ';
  RAISE NOTICE 'The contacts table still has department_legacy for reference';
  RAISE NOTICE '================================================================================================';
END $$;

-- IMPORTANT: Run COMMIT to finalize the rollback, or ROLLBACK to cancel
-- COMMIT;
-- ROLLBACK;
