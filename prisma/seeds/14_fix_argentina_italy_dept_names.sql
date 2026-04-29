-- ============================================================================
-- FIX ARGENTINA AND ITALY DEPARTMENT NAMES
-- ============================================================================
-- Updates department names to use "Ministry of" prefix for Argentina and Italy
-- ============================================================================

-- Argentina Government departments - fix names
UPDATE departments
SET
  "name" = CASE
    WHEN "code" = 'EXEC' THEN 'Presidential Office'
    WHEN "code" = 'FIN' THEN 'Ministry of Economy'
    WHEN "code" = 'FA' THEN 'Ministry of Foreign Affairs, International Trade and Worship'
    WHEN "code" = 'DEF' THEN 'Ministry of Defense'
    WHEN "code" = 'HLTH' THEN 'Ministry of Health'
    WHEN "code" = 'EDU' THEN 'Ministry of Education'
    WHEN "code" = 'INT' THEN 'Ministry of the Interior'
    WHEN "code" = 'JUST' THEN 'Ministry of Justice and Human Rights'
    WHEN "code" = 'AGRI' THEN 'Ministry of Agriculture, Livestock and Fisheries'
    WHEN "code" = 'ENV' THEN 'Ministry of Environment and Sustainable Development'
    WHEN "code" = 'TRANS' THEN 'Ministry of Transport'
    WHEN "code" = 'LABOR' THEN 'Ministry of Labor, Employment and Social Security'
    WHEN "code" = 'COMM' THEN 'Ministry of Productive Development'
    WHEN "code" = 'IND' THEN 'Ministry of Productive Development'
    WHEN "code" = 'ENGY' THEN 'Ministry of Energy and Mining'
    WHEN "code" = 'SCI' THEN 'Ministry of Science, Technology and Innovation'
    WHEN "code" = 'CULT' THEN 'Ministry of Culture'
    WHEN "code" = 'WOM' THEN 'Ministry of Women, Genders and Diversity'
    WHEN "code" = 'SPOR' THEN 'Ministry of Tourism and Sports'
    ELSE "name"
  END
WHERE "organisationId" = '6a330f5c-7861-42c1-a1d0-2424eed7b396';

-- Italy Government departments - fix names
UPDATE departments
SET
  "name" = CASE
    WHEN "code" = 'EXEC' THEN 'Presidency of the Council of Ministers'
    WHEN "code" = 'FIN' THEN 'Ministry of Economy and Finance'
    WHEN "code" = 'FA' THEN 'Ministry of Foreign Affairs and International Cooperation'
    WHEN "code" = 'DEF' THEN 'Ministry of Defense'
    WHEN "code" = 'HLTH' THEN 'Ministry of Health'
    WHEN "code" = 'EDU' THEN 'Ministry of Education and Merit'
    WHEN "code" = 'INT' THEN 'Ministry of the Interior'
    WHEN "code" = 'JUST' THEN 'Ministry of Justice'
    WHEN "code" = 'AGRI' THEN 'Ministry of Agriculture, Food Sovereignty and Forestry'
    WHEN "code" = 'ENV' THEN 'Ministry of the Environment and Energy Security'
    WHEN "code" = 'TRANS' THEN 'Ministry of Infrastructure and Transport'
    WHEN "code" = 'LABOR' THEN 'Ministry of Labor and Social Policies'
    WHEN "code" = 'COMM' THEN 'Ministry of Enterprise and Made in Italy'
    WHEN "code" = 'IND' THEN 'Ministry of Business and Made in Italy'
    WHEN "code" = 'ENGY' THEN 'Ministry of Environment and Energy Security'
    WHEN "code" = 'SCI' THEN 'Ministry of University and Research'
    WHEN "code" = 'CULT' THEN 'Ministry of Culture'
    WHEN "code" = 'TOUR' THEN 'Ministry of Tourism'
    WHEN "code" = 'SOUTH' THEN 'Ministry for the South and Regional Cohesion'
    WHEN "code" = 'EQUAL' THEN 'Ministry of Equal Opportunity'
    WHEN "code" = 'DISAB' THEN 'Ministry for Disability Inclusion'
    WHEN "code" = 'SPORT' THEN 'Ministry of Sport'
    WHEN "code" = 'YOUTH' THEN 'Ministry of Youth Policies'
    ELSE "name"
  END
WHERE "organisationId" = '249d587b-0457-4732-a1d5-b86e-77d6f14e';

-- ============================================================================
-- VERIFICATION
-- ============================================================================

-- Check Argentina department names after update
SELECT "name", "code", "description"
FROM departments
WHERE "organisationId" = '6a330f5c-7861-42c1-a1d0-2424eed7b396'
ORDER BY "code"
LIMIT 5;

-- Check Italy department names after update
SELECT "name", "code", "description"
FROM departments
WHERE "organisationId" = '249d587b-0457-4732-a1d5-b86e-77d6f14e'
ORDER BY "code"
LIMIT 5;
