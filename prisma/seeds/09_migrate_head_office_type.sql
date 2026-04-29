-- ============================================================================
-- HEAD OFFICE TYPE MIGRATION
-- ============================================================================
-- This script updates existing organisations with the correct headOfficeType
-- based on their organization name, type, and purpose.
-- ============================================================================

-- Add the headOfficeType column to organisations table
ALTER TABLE organisations ADD COLUMN IF NOT EXISTS "headOfficeType" TEXT DEFAULT 'CORPORATE';

-- Add check constraint for valid head office types
ALTER TABLE organisations ADD CONSTRAINT organisations_headOfficeType_check
  CHECK ("headOfficeType" IN ('CORPORATE', 'PRIME_MINISTER', 'PRESIDENT', 'MINISTERIAL', 'DIPLOMATIC_MISSION', 'LOCAL_GOVT'));

-- ============================================================================
-- UPDATE EXISTING ORGANISATIONS
-- ============================================================================

-- PRIME MINISTER offices (parliamentary systems: NZ, Australia, India, UK)
UPDATE organisations SET "headOfficeType" = 'PRIME_MINISTER'
WHERE name LIKE '%Prime Minister%'
   OR name LIKE '%Prime Minister and Cabinet%'
   OR name LIKE '%PM%';

-- PRESIDENT offices (presidential systems: US, China, France, etc.)
UPDATE organisations SET "headOfficeType" = 'PRESIDENT'
WHERE name LIKE '%President%'
   OR name LIKE '%President and Premier%'
   OR name LIKE '%Presidency%'
   AND name NOT LIKE '%Vice President%';  -- Exclude vice presidents

-- DIPLOMATIC MISSIONS
UPDATE organisations SET "headOfficeType" = 'DIPLOMATIC_MISSION'
WHERE type = 'diplomatic_mission'
   OR name LIKE '%Diplomatic Missions%'
   OR name LIKE '%High Commission%'
   OR name LIKE '%Embassy%'
   OR name LIKE '%Consulate%';

-- MINISTERIAL departments
UPDATE organisations SET "headOfficeType" = 'MINISTERIAL'
WHERE name LIKE '%Ministry%'
   OR name LIKE '%Minister%'
   OR name LIKE '%Commission%'
   OR name LIKE '%Department%'
   OR name LIKE '%Cabinet%'
   AND "headOfficeType" = 'CORPORATE';  -- Only update those still corporate

-- POLITICAL PARTIES (keep as corporate for now, can be updated later)
-- Parties remain CORPORATE as they are organizations with internal structure

-- LOCAL GOVERNMENT
UPDATE organisations SET "headOfficeType" = 'LOCAL_GOVT'
WHERE name LIKE '%Council%'
   OR name LIKE '%Municipal%'
   OR name LIKE '%City%'
   OR name LIKE '%Regional%'
   OR name LIKE '%Territory%'
   AND name NOT LIKE '%Regional Office%';  -- Exclude company regional offices

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Count organisations by head office type
SELECT
  "headOfficeType",
  COUNT(*) as count
FROM organisations
GROUP BY "headOfficeType"
ORDER BY count DESC;

-- Show sample organisations for each head office type
SELECT
  "headOfficeType",
  name,
  type
FROM organisations
ORDER BY "headOfficeType", name
LIMIT 20;

-- Check organisations that might need manual review
SELECT
  "headOfficeType",
  name,
  type
FROM organisations
WHERE "headOfficeType" = 'CORPORATE'
  AND (
    name LIKE '%Government%'
    OR name LIKE '%Ministry%'
    OR name LIKE '%Office%'
  )
ORDER BY name;
