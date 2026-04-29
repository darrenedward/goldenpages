-- ============================================================================
-- MOVE NZ MINISTRIES TO NEW NZ GOVERNMENT ORGANIZATION
-- ============================================================================
-- This script fixes the NZ department structure by:
-- 1. Reassigning NZ government ministries from old org to new NZ Government org
-- 2. Updating department names to use "Ministry of" prefix
-- 3. Assigning proper portfolio values
-- 4. Cleaning up duplicate diplomatic mission departments
-- ============================================================================

-- Step 1: Delete duplicate Industry department (Commerce will be renamed instead)
DELETE FROM departments
WHERE "organisationId" = '2b313a27-42cf-41c4-9512-d50057293010'
  AND "name" = 'Industry';

-- Step 2: Update NZ government ministry names and move to new org
-- Only update departments that are actual NZ ministries (not diplomatic missions)
UPDATE departments
SET
  "name" = CASE
    WHEN "name" = 'Prime Minister' THEN 'Prime Minister''s Office'
    WHEN "name" = 'Finance' THEN 'Ministry of Finance'
    WHEN "name" = 'Foreign Affairs' THEN 'Ministry of Foreign Affairs and Trade'
    WHEN "name" = 'Defense' THEN 'Ministry of Defense'
    WHEN "name" = 'Health' THEN 'Ministry of Health'
    WHEN "name" = 'Education' THEN 'Ministry of Education'
    WHEN "name" = 'Interior' THEN 'Ministry of Interior'
    WHEN "name" = 'Justice' THEN 'Ministry of Justice'
    WHEN "name" = 'Agriculture' THEN 'Ministry of Agriculture'
    WHEN "name" = 'Environment' THEN 'Ministry for the Environment'
    WHEN "name" = 'Transportation' THEN 'Ministry of Transport'
    WHEN "name" = 'Labor' THEN 'Ministry of Labor'
    WHEN "name" = 'Commerce' THEN 'Ministry of Business, Innovation and Employment'
    WHEN "name" = 'Energy' THEN 'Ministry of Energy and Resources'
    WHEN "name" = 'Parliament' THEN 'Parliament'
    ELSE "name"
  END,
  "description" = CASE
    WHEN "name" = 'Finance' THEN 'Responsible for financial policy, treasury, and economic management'
    WHEN "name" = 'Foreign Affairs' THEN 'Responsible for foreign affairs, trade, and international development'
    WHEN "name" = 'Defense' THEN 'Responsible for national defense and armed forces'
    WHEN "name" = 'Health' THEN 'Responsible for health policy and services'
    WHEN "name" = 'Education' THEN 'Responsible for education policy and schools'
    WHEN "name" = 'Transportation' THEN 'Responsible for transport and infrastructure'
    WHEN "name" = 'Commerce' THEN 'Responsible for business, innovation, and employment'
    ELSE "description"
  END,
  "portfolio" = CASE
    WHEN "name" = 'Finance' THEN 'FINANCE'
    WHEN "name" = 'Foreign Affairs' THEN 'FOREIGN_AFFAIRS'
    WHEN "name" = 'Defense' THEN 'DEFENSE'
    WHEN "name" = 'Health' THEN 'HEALTH'
    WHEN "name" = 'Education' THEN 'EDUCATION'
    WHEN "name" = 'Justice' THEN 'JUSTICE'
    WHEN "name" = 'Agriculture' THEN 'AGRICULTURE'
    WHEN "name" = 'Environment' THEN 'ENVIRONMENT'
    WHEN "name" = 'Transportation' THEN 'TRANSPORT'
    WHEN "name" = 'Labor' THEN 'LABOR'
    WHEN "name" = 'Energy' THEN 'ENERGY'
    WHEN "name" = 'Prime Minister' THEN 'PRIME_MINISTER'
    WHEN "name" = 'Interior' THEN 'INTERIOR'
    WHEN "name" = 'Commerce' THEN 'TRADE'
    WHEN "name" = 'Parliament' THEN 'UNSPECIFIED'
    ELSE "portfolio"
  END,
  "organisationId" = 'nz-gov-org-fix',
  "updatedAt" = NOW()
WHERE "organisationId" = '2b313a27-42cf-41c4-9512-d50057293010'  -- Old org ID
  AND "name" IN (
    'Prime Minister', 'Finance', 'Foreign Affairs', 'Defense', 'Health',
    'Education', 'Interior', 'Justice', 'Agriculture', 'Environment',
    'Transportation', 'Labor', 'Commerce', 'Energy', 'Parliament'
  );

-- Step 2: Delete duplicate diplomatic mission departments from old org
-- These have been consolidated into the single "Diplomatic Missions to New Zealand" dept
DELETE FROM departments
WHERE "organisationId" = '2b313a27-42cf-41c4-9512-d50057293010'
  AND (
    "name" LIKE 'Diplomatic Missions To New Zealand%'
    OR "name" = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'
    OR "name" = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner - Commission'
    OR "name" = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner - Diplomatic Service'
    OR "name" = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'
  );

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Check updated departments in new NZ Government org
SELECT
  "name",
  "code",
  "portfolio"
FROM departments
WHERE "organisationId" = 'nz-gov-org-fix'
ORDER BY "code";

-- Count departments in new NZ Government org
SELECT COUNT(*) as dept_count
FROM departments
WHERE "organisationId" = 'nz-gov-org-fix';
