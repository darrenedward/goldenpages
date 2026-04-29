-- ============================================================================
-- FIX NEW ZEALAND DEPARTMENT NAMES AND ORGANIZATION STRUCTURE
-- ============================================================================
-- This script fixes:
-- 1. Creates proper "New Zealand - Government" organization (if not exists)
-- 2. Updates department names to use "Ministry of" prefix
-- 3. Reassigns NZ departments to correct organization
--
-- NOTE: Using organisation_id (database column name) not organisationId (Prisma name)
-- ============================================================================

-- Step 1: Create proper New Zealand Government organization (if not exists)
INSERT INTO organisations (
  "id",
  "name",
  "type",
  "headOfficeType",
  "headOfficeCountryId",
  "headOfficeCity",
  "headOfficeAddress",
  "headOfficePhone",
  "headOfficeEmail",
  "headOfficeWebsite",
  "description",
  "ownerId",
  "createdAt",
  "updatedAt"
) VALUES (
  'nz-gov-org-fix',
  'New Zealand - Government',
  'government',
  'PRIME_MINISTER',
  (SELECT id FROM regions WHERE code = 'NZ'),
  'Wellington',
  '1 Parliament Buildings',
  '+64 4 494 8947',
  'info@parliament.nz',
  'https://www.parliament.nz',
  'Government of New Zealand with cabinet ministries and departments',
  NULL,
  NOW(),
  NOW()
)
ON CONFLICT DO NOTHING;

-- Step 2: Update NZ department names and reassign to correct organization
-- Only update departments that are still using the old org ID
UPDATE departments
SET
  "name" = CASE
    WHEN "code" = 'PM' THEN 'Prime Minister''s Office'
    WHEN "code" = 'FIN' THEN 'Ministry of Finance'
    WHEN "code" = 'FA' THEN 'Ministry of Foreign Affairs and Trade'
    WHEN "code" = 'DEF' THEN 'Ministry of Defense'
    WHEN "code" = 'HLTH' THEN 'Ministry of Health'
    WHEN "code" = 'EDU' THEN 'Ministry of Education'
    WHEN "code" = 'INT' THEN 'Ministry of Interior'
    WHEN "code" = 'JUST' THEN 'Ministry of Justice'
    WHEN "code" = 'AGRI' THEN 'Ministry of Agriculture'
    WHEN "code" = 'ENV' THEN 'Ministry for the Environment'
    WHEN "code" = 'TRANS' THEN 'Ministry of Transport'
    WHEN "code" = 'LABOR' THEN 'Ministry of Labor'
    WHEN "code" = 'COMM' THEN 'Ministry of Business, Innovation and Employment'
    WHEN "code" = 'IND' THEN 'Ministry of Business, Innovation and Employment'
    WHEN "code" = 'ENGY' THEN 'Ministry of Energy and Resources'
    WHEN "code" = 'PARL' THEN 'Parliament'
    ELSE "name"
  END,
  "description" = CASE
    WHEN "code" = 'FIN' THEN 'Responsible for financial policy, treasury, and economic management'
    WHEN "code" = 'FA' THEN 'Responsible for foreign affairs, trade, and international development'
    WHEN "code" = 'DEF' THEN 'Responsible for national defense and armed forces'
    WHEN "code" = 'HLTH' THEN 'Responsible for health policy and services'
    WHEN "code" = 'EDU' THEN 'Responsible for education policy and schools'
    WHEN "code" = 'TRANS' THEN 'Responsible for transport and infrastructure'
    ELSE "description"
  END,
  "organisation_id" = 'nz-gov-org-fix',
  "updatedAt" = NOW()
WHERE "organisation_id" = '2b313a27-42cf-41c4-9512-d50057293010'  -- Old diplomatic missions org ID
  AND "id" LIKE 'nz100%';

-- Step 3: Update portfolio for NZ departments based on their function
UPDATE departments
SET "portfolio" = CASE
  WHEN "code" IN ('FIN', 'COMM', 'IND') THEN 'FINANCE'
  WHEN "code" = 'FA' THEN 'FOREIGN_AFFAIRS'
  WHEN "code" = 'DEF' THEN 'DEFENSE'
  WHEN "code" = 'HLTH' THEN 'HEALTH'
  WHEN "code" = 'EDU' THEN 'EDUCATION'
  WHEN "code" = 'JUST' THEN 'JUSTICE'
  WHEN "code" = 'AGRI' THEN 'AGRICULTURE'
  WHEN "code" = 'ENV' THEN 'ENVIRONMENT'
  WHEN "code" = 'TRANS' THEN 'TRANSPORT'
  WHEN "code" = 'LABOR' THEN 'LABOR'
  WHEN "code" = 'ENGY' THEN 'ENERGY'
  WHEN "code" = 'PM' THEN 'PRIME_MINISTER'
  WHEN "code" = 'INT' THEN 'INTERIOR'
  WHEN "code" = 'PARL' THEN 'UNSPECIFIED'
  ELSE "portfolio"
END
WHERE "organisation_id" = 'nz-gov-org-fix';

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Check updated department names
SELECT
  "name",
  "code",
  "portfolio",
  "description"
FROM departments
WHERE "organisation_id" = 'nz-gov-org-fix'
ORDER BY "code";

-- Count departments by portfolio for NZ
SELECT
  "portfolio",
  COUNT(*) as count
FROM departments
WHERE "organisation_id" = 'nz-gov-org-fix'
GROUP BY "portfolio"
ORDER BY count DESC;
