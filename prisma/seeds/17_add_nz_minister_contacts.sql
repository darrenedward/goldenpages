-- ============================================================================
-- ADD NEW ZEALAND GOVERNMENT MINISTERS AS CONTACTS
-- ============================================================================
-- This script adds current NZ government ministers (2025) to their respective
-- departments based on the official beehive.govt.nz minister list
-- ============================================================================

-- Organisation ID for New Zealand Government: nz-gov-org-fix

-- Department IDs (reference)
-- PM:     nz100001-3333-3333-3333-333333333331  (Prime Minister's Office)
-- FIN:    nz100002-3333-3333-3333-333333333332  (Ministry of Finance)
-- FA:     nz100003-3333-3333-3333-333333333333  (Ministry of Foreign Affairs and Trade)
-- DEF:    nz100004-3333-3333-3333-333333333334  (Ministry of Defense)
-- HLTH:   nz100005-3333-3333-3333-333333333335  (Ministry of Health)
-- EDU:    nz100006-3333-3333-3333-333333333336  (Ministry of Education)
-- INT:    nz100007-3333-3333-3333-333333333337  (Ministry of Interior)
-- JUST:   nz100008-3333-3333-3333-333333333338  (Ministry of Justice)
-- AGRI:   nz100009-3333-3333-3333-333333333339  (Ministry of Agriculture)
-- ENV:    nz100010-3333-3333-3333-333333333330  (Ministry for the Environment)
-- TRANS:  nz100011-3333-3333-3333-333333333341  (Ministry of Transport)
-- LABOR:  nz100012-3333-3333-3333-333333333342  (Ministry of Labor)
-- COMM:   nz100013-3333-3333-3333-333333333343  (Ministry of Business, Innovation and Employment)
-- PARL:   nz100015-3333-3333-3333-333333333345  (Parliament)
-- ENGY:   nz100016-3333-3333-3333-333333333346  (Ministry of Energy and Resources)

-- ============================================================================
-- PRIME MINISTER'S OFFICE
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  -- Prime Minister
  ('nz-contact-pm-luxon', 'Christopher Luxon', 'Prime Minister', 'nz-gov-org-fix', 'nz100001-3333-3333-3333-333333333331', NOW(), NOW()),
  -- Deputy Prime Minister
  ('nz-contact-dpm-peters', 'Winston Peters', 'Deputy Prime Minister', 'nz-gov-org-fix', 'nz100001-3333-3333-3333-333333333331', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF FINANCE
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-fin-willis', 'Nicola Willis', 'Minister of Finance', 'nz-gov-org-fix', 'nz100002-3333-3333-3333-333333333332', NOW(), NOW()),
  ('nz-contact-fin-seymour', 'David Seymour', 'Associate Minister of Finance', 'nz-gov-org-fix', 'nz100002-3333-3333-3333-333333333332', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF FOREIGN AFFAIRS AND TRADE
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-fa-peters', 'Winston Peters', 'Minister of Foreign Affairs', 'nz-gov-org-fix', 'nz100003-3333-3333-3333-333333333333', NOW(), NOW()),
  ('nz-contact-fa-mcclay', 'Todd McClay', 'Minister of Trade', 'nz-gov-org-fix', 'nz100003-3333-3333-3333-333333333333', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF DEFENSE
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-def-collins', 'Judith Collins', 'Minister of Defense', 'nz-gov-org-fix', 'nz100004-3333-3333-3333-333333333334', NOW(), NOW()),
  ('nz-contact-def-jones', 'Shane Jones', 'Associate Minister of Defense', 'nz-gov-org-fix', 'nz100004-3333-3333-3333-333333333334', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF HEALTH
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-hlth-reti', 'Dr. Shane Reti', 'Minister of Health', 'nz-gov-org-fix', 'nz100005-3333-3333-3333-333333333335', NOW(), NOW()),
  ('nz-contact-hlth-costello', 'Matt Costello', 'Minister for Courts', 'nz-gov-org-fix', 'nz100005-3333-3333-3333-333333333335', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF EDUCATION
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-edu-stanford', 'Erica Stanford', 'Minister of Education', 'nz-gov-org-fix', 'nz100006-3333-3333-3333-333333333336', NOW(), NOW()),
  ('nz-contact-edu-seymour', 'David Seymour', 'Minister of Regulation', 'nz-gov-org-fix', 'nz100006-3333-3333-3333-333333333336', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF INTERIOR
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-int-penno', 'Brooke van Velden', 'Minister of Internal Affairs', 'nz-gov-org-fix', 'nz100007-3333-3333-3333-333333333337', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF JUSTICE
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-just-goldsmith', 'Paul Goldsmith', 'Minister of Justice', 'nz-gov-org-fix', 'nz100008-3333-3333-3333-333333333338', NOW(), NOW()),
  ('nz-contact-just-mitchell', 'Chris Penk', 'Attorney-General', 'nz-gov-org-fix', 'nz100008-3333-3333-3333-333333333338', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF AGRICULTURE
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-agri-jones', 'Shane Jones', 'Minister for Agriculture', 'nz-gov-org-fix', 'nz100009-3333-3333-3333-333333333339', NOW(), NOW()),
  ('nz-contact-agri-oconnor', 'Damien O''Connor', 'Minister of Rural Communities', 'nz-gov-org-fix', 'nz100009-3333-3333-3333-333333333339', NOW(), NOW());

-- ============================================================================
-- MINISTRY FOR THE ENVIRONMENT
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-env-simmons', 'Penny Simmonds', 'Minister for the Environment', 'nz-gov-org-fix', 'nz100010-3333-3333-3333-333333333330', NOW(), NOW()),
  ('nz-contact-env-bishop', 'Chris Bishop', 'Minister of Climate Change', 'nz-gov-org-fix', 'nz100010-3333-3333-3333-333333333330', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF TRANSPORT
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-trans-brown', 'Simeon Brown', 'Minister of Transport', 'nz-gov-org-fix', 'nz100011-3333-3333-3333-333333333341', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF LABOR
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-labor-upston', 'Brooke van Velden', 'Minister for Workplace Relations and Safety', 'nz-gov-org-fix', 'nz100012-3333-3333-3333-333333333342', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF BUSINESS, INNOVATION AND EMPLOYMENT
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-comm-bishop', 'Chris Bishop', 'Minister for Economic Development', 'nz-gov-org-fix', 'nz100013-3333-3333-3333-333333333343', NOW(), NOW()),
  ('nz-contact-comm-mcclay', 'Todd McClay', 'Minister for Tourism and Hospitality', 'nz-gov-org-fix', 'nz100013-3333-3333-3333-333333333343', NOW(), NOW());

-- ============================================================================
-- PARLIAMENT
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-parl-speaker', 'Gerry Brownlee', 'Speaker of the House', 'nz-gov-org-fix', 'nz100015-3333-3333-3333-333333333345', NOW(), NOW());

-- ============================================================================
-- MINISTRY OF ENERGY AND RESOURCES
-- ============================================================================

INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-engy-simmons', 'Shane Jones', 'Minister of Energy and Resources', 'nz-gov-org-fix', 'nz100016-3333-3333-3333-333333333346', NOW(), NOW());

-- ============================================================================
-- ADDITIONAL MINISTERS (cross-portfolio appointments)
-- ============================================================================

-- Associate Ministers of Education
INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-edu-associate-1', 'Seymour', 'Associate Minister of Education', 'nz-gov-org-fix', 'nz100006-3333-3333-3333-333333333336', NOW(), NOW());

-- Additional Economic Ministers
INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-fin-associate-1', 'Nicola Willis', 'Minister for Revenue', 'nz-gov-org-fix', 'nz100002-3333-3333-3333-333333333332', NOW(), NOW()),
  ('nz-contact-fin-associate-2', 'Andrew Bayly', 'Minister for Commerce and Consumer Affairs', 'nz-gov-org-fix', 'nz100002-3333-3333-3333-333333333332', NOW(), NOW());

-- Infrastructure Ministers
INSERT INTO contacts (
  id,
  "fullName",
  "roleTitle",
  "organisationId",
  "departmentId",
  "createdAt",
  "updatedAt"
) VALUES
  ('nz-contact-trans-associate-1', 'Chris Bishop', 'Minister of Infrastructure', 'nz-gov-org-fix', 'nz100011-3333-3333-3333-333333333341', NOW(), NOW());

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Count total contacts added to NZ Government
SELECT COUNT(*) as total_nz_contacts
FROM contacts
WHERE "organisationId" = 'nz-gov-org-fix';

-- Show contacts per department
SELECT
  d.name as department,
  COUNT(c.id) as contact_count
FROM departments d
LEFT JOIN contacts c ON c."departmentId" = d.id
WHERE d."organisationId" = 'nz-gov-org-fix'
GROUP BY d.id, d.name
ORDER BY d.code;
