-- ============================================================================
-- CONSOLIDATE NZ DIPLOMATIC MISSIONS INTO ONE DEPARTMENT
-- ============================================================================
-- This script:
-- 1. Creates ONE consolidated department for all diplomatic missions to NZ
-- 2. Reassigns contacts from scattered embassy departments to this one dept
-- 3. Removes old scattered departments
-- ============================================================================

-- Get the NZ Government org ID we just created
-- Note: We need to query the actual org ID after creation

-- Step 1: Create consolidated department for all diplomatic missions to NZ
INSERT INTO departments (
  "id",
  "name",
  "code",
  "description",
  "portfolio",
  "organisationId",
  "parentId",
  "isActive",
  "createdAt",
  "updatedAt"
) VALUES (
  'nz-dip-missions-consolidated',
  'Diplomatic Missions to New Zealand',
  'DIP-NZ-MISSIONS',
  'Consolidated department for all diplomatic missions, high commissions, and embassies accredited to New Zealand. Individual contacts within this department represent specific missions.',
  'FOREIGN_AFFAIRS',
  (SELECT "id" FROM organisations WHERE "name" = 'New Zealand - Government'),
  NULL,
  TRUE,
  NOW(),
  NOW()
)
ON CONFLICT ("id") DO NOTHING;

-- Step 2: Reassign contacts from scattered diplomatic mission departments
UPDATE contacts
SET "departmentId" = 'nz-dip-missions-consolidated',
    "updatedAt" = NOW()
WHERE "departmentId" IN (
  SELECT "id"
  FROM departments
  WHERE "name" LIKE '%to New Zealand%'
    AND ("name" LIKE '%High Commission%' OR "name" LIKE '%Embassy%')
    AND "id" != 'nz-dip-missions-consolidated'
);

-- Step 3: Delete old scattered diplomatic mission departments
DELETE FROM departments
WHERE "name" LIKE '%to New Zealand%'
  AND ("name" LIKE '%High Commission%' OR "name" LIKE '%Embassy%')
  AND "id" != 'nz-dip-missions-consolidated';

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Show the new consolidated department
SELECT
  d."name",
  d."code",
  d."portfolio",
  COUNT(c.id) as contact_count
FROM departments d
LEFT JOIN contacts c ON c."departmentId" = d."id"
WHERE d."code" = 'DIP-NZ-MISSIONS'
GROUP BY d."name", d."code", d."portfolio";

-- Show sample of contacts in consolidated department
SELECT
  c."fullName",
  c."roleTitle",
  c."departmentId"
FROM contacts c
WHERE c."departmentId" = (
  SELECT "id" FROM departments WHERE "code" = 'DIP-NZ-MISSIONS'
)
ORDER BY c."fullName"
LIMIT 10;
