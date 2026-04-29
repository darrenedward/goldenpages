-- ============================================================================
-- PORTFOLIO COLUMN MIGRATION
-- ============================================================================
-- This script adds the portfolio column to departments table
-- for standardized recipient selection across organizations
-- ============================================================================

-- Add the portfolio column to departments table
ALTER TABLE departments ADD COLUMN IF NOT EXISTS "portfolio" TEXT DEFAULT 'UNSPECIFIED';

-- Add check constraint for valid portfolio values
ALTER TABLE departments ADD CONSTRAINT departments_portfolio_check
  CHECK ("portfolio" IN (
    'FINANCE',
    'TRANSPORT',
    'FOREIGN_AFFAIRS',
    'IMMIGRATION',
    'HEALTH',
    'EDUCATION',
    'DEFENSE',
    'JUSTICE',
    'TRADE',
    'INTERIOR',
    'AGRICULTURE',
    'ENVIRONMENT',
    'LABOR',
    'ENERGY',
    'COMMUNICATIONS',
    'PRIME_MINISTER',
    'DEPUTY_PM',
    'CABINET',
    'CEO',
    'CFO',
    'CTO',
    'COO',
    'CIO',
    'CMO',
    'CSO',
    'CLO',
    'CHAIR',
    'DIRECTOR',
    'VP',
    'SECRETARY',
    'OTHER',
    'UNSPECIFIED'
  ));

-- ============================================================================
-- AUTO-DEPLOYMENT OF PORTFOLIOS
-- ============================================================================

-- Government portfolios
UPDATE departments SET "portfolio" = 'FINANCE'
WHERE LOWER(name) LIKE ANY(ARRAY['%finance%', '%treasury%', '%revenue%', '%exchequer%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'TRANSPORT'
WHERE LOWER(name) LIKE ANY(ARRAY['%transport%', '%transportation%', '%aviation%', '%infrastructure%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'FOREIGN_AFFAIRS'
WHERE LOWER(name) LIKE ANY(ARRAY['%foreign affairs%', '%foreign affairs & trade%', '%external affairs%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'IMMIGRATION'
WHERE LOWER(name) LIKE ANY(ARRAY['%immigration%', '%border%', '%citizenship%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'HEALTH'
WHERE LOWER(name) LIKE ANY(ARRAY['%health%', '%medical%', '%nh%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'EDUCATION'
WHERE LOWER(name) LIKE ANY(ARRAY['%education%', '%schools%', '%tertiary%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'DEFENSE'
WHERE LOWER(name) LIKE ANY(ARRAY['%defense%', '%defence%', '%military%', '%army%', '%navy%', '%air force%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'JUSTICE'
WHERE LOWER(name) LIKE ANY(ARRAY['%justice%', '%attorney general%', '%legal affairs%', '%prosecutor%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'TRADE'
WHERE LOWER(name) LIKE ANY(ARRAY['%trade%', '%commerce%', '%commerce & industry%', '%economic development%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'INTERIOR'
WHERE LOWER(name) LIKE ANY(ARRAY['%interior%', '%home affairs%', '%internal affairs%', '%security%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'AGRICULTURE'
WHERE LOWER(name) LIKE ANY(ARRAY['%agriculture%', '%farming%', '%fisheries%', '%forestry%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'ENVIRONMENT'
WHERE LOWER(name) LIKE ANY(ARRAY['%environment%', '%climate%', '%conservation%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'LABOR'
WHERE LOWER(name) LIKE ANY(ARRAY['%labor%', '%labour%', '%employment%', '%work%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'ENERGY'
WHERE LOWER(name) LIKE ANY(ARRAY['%energy%', '%power%', '%resources%', '%mining%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'COMMUNICATIONS'
WHERE LOWER(name) LIKE ANY(ARRAY['%communications%', '%media%', '%digital%', '%broadcasting%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'PRIME_MINISTER'
WHERE LOWER(name) LIKE ANY(ARRAY['%prime minister%', '%pm%', '%premier%', '%presidency%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'DEPUTY_PM'
WHERE LOWER(name) LIKE ANY(ARRAY['%deputy prime minister%', '%deputy premier%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'CABINET'
WHERE LOWER(name) LIKE ANY(ARRAY['%cabinet%', '%government executive%'])
  AND "portfolio" = 'UNSPECIFIED';

-- Corporate executive roles
UPDATE departments SET "portfolio" = 'CEO'
WHERE LOWER(name) LIKE ANY(ARRAY['%chief executive%', '%ceo%', '%managing director%', '%md%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'CFO'
WHERE LOWER(name) LIKE ANY(ARRAY['%chief financial%', '%cfo%', '%finance director%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'CTO'
WHERE LOWER(name) LIKE ANY(ARRAY['%chief technology%', '%cto%', '%technology director%', '%it director%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'COO'
WHERE LOWER(name) LIKE ANY(ARRAY['%chief operating%', '%coo%', '%operations director%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'CIO'
WHERE LOWER(name) LIKE ANY(ARRAY['%chief information%', '%cio%', '%information director%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'CMO'
WHERE LOWER(name) LIKE ANY(ARRAY['%chief marketing%', '%cmo%', '%marketing director%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'CSO'
WHERE LOWER(name) LIKE ANY(ARRAY['%chief security%', '%cso%', '%security director%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'CLO'
WHERE LOWER(name) LIKE ANY(ARRAY['%chief legal%', '%clo%', '%general counsel%', '%legal director%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'CHAIR'
WHERE LOWER(name) LIKE ANY(ARRAY['%chair%', '%chairman%', '%chairwoman%', '%board chair%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'DIRECTOR'
WHERE LOWER(name) LIKE ANY(ARRAY['%director%', '%board of directors%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'VP'
WHERE LOWER(name) LIKE ANY(ARRAY['%vice president%', '%vp%', '%executive vice president%'])
  AND "portfolio" = 'UNSPECIFIED';

UPDATE departments SET "portfolio" = 'SECRETARY'
WHERE LOWER(name) LIKE ANY(ARRAY['%secretary%', '%company secretary%', '%corporate secretary%'])
  AND "portfolio" = 'UNSPECIFIED';

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Count departments by portfolio
SELECT
  "portfolio",
  COUNT(*) as count
FROM departments
GROUP BY "portfolio"
ORDER BY count DESC;

-- Show sample departments with assigned portfolios
SELECT
  d.name,
  d."portfolio",
  o.name as organisation,
  o.type as org_type
FROM departments d
JOIN organisations o ON d."organisationId" = o.id
WHERE d."portfolio" IS NOT NULL OR d."portfolio" != 'UNSPECIFIED'
ORDER BY d.name
LIMIT 50;
