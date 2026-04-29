-- Seed data for missing departments
-- Adds standard cabinet departments for Argentina Government, Italy Government, and New Zealand Government
-- Generated: 2026-02-12

-- ============================================================================
-- ARGENTINA GOVERNMENT DEPARTMENTS
-- Organisation ID: 6a330f5c-7861-42c1-a1d0-2424eed7b396
-- ============================================================================
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('a1000001-1111-1111-1111-111111111111', 'Executive Office', 'EXEC', 'Executive Office department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000002-1111-1111-1111-111111111112', 'Finance', 'FIN', 'Finance department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000003-1111-1111-1111-111111111113', 'Foreign Affairs', 'FA', 'Foreign Affairs department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000004-1111-1111-1111-111111111114', 'Defense', 'DEF', 'Defense department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000005-1111-1111-1111-111111111115', 'Health', 'HLTH', 'Health department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000006-1111-1111-1111-111111111116', 'Education', 'EDU', 'Education department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000007-1111-1111-1111-111111111117', 'Interior', 'INT', 'Interior department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000008-1111-1111-1111-111111111118', 'Justice', 'JUST', 'Justice department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000009-1111-1111-1111-111111111119', 'Agriculture', 'AGRI', 'Agriculture department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000010-1111-1111-1111-111111111110', 'Environment', 'ENV', 'Environment department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000011-1111-1111-1111-111111111121', 'Transportation', 'TRANS', 'Transportation department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000012-1111-1111-1111-111111111122', 'Labor', 'LABOR', 'Labor department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000013-1111-1111-1111-111111111123', 'Commerce', 'COMM', 'Commerce department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000014-1111-1111-1111-111111111124', 'Industry', 'IND', 'Industry department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000015-1111-1111-1111-111111111125', 'Parliament', 'PARL', 'Parliament department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('a1000016-1111-1111-1111-111111111126', 'Energy', 'ENGY', 'Energy department', '6a330f5c-7861-42c1-a1d0-2424eed7b396', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- ============================================================================
-- ITALY GOVERNMENT DEPARTMENTS
-- Organisation ID: 0bc40e8f-067c-4d96-be96-f8d22b5cf036
-- ============================================================================
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('i1000001-2222-2222-2222-222222222221', 'Executive Office', 'EXEC', 'Executive Office department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000002-2222-2222-2222-222222222222', 'Finance', 'FIN', 'Finance department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000003-2222-2222-2222-222222222223', 'Foreign Affairs', 'FA', 'Foreign Affairs department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000004-2222-2222-2222-222222222224', 'Defense', 'DEF', 'Defense department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000005-2222-2222-2222-222222222225', 'Health', 'HLTH', 'Health department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000006-2222-2222-2222-222222222226', 'Education', 'EDU', 'Education department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000007-2222-2222-2222-222222222227', 'Interior', 'INT', 'Interior department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000008-2222-2222-2222-222222222228', 'Justice', 'JUST', 'Justice department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000009-2222-2222-2222-222222222229', 'Agriculture', 'AGRI', 'Agriculture department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000010-2222-2222-2222-222222222220', 'Environment', 'ENV', 'Environment department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000011-2222-2222-2222-222222222231', 'Transportation', 'TRANS', 'Transportation department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000012-2222-2222-2222-222222222232', 'Labor', 'LABOR', 'Labor department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000013-2222-2222-2222-222222222233', 'Commerce', 'COMM', 'Commerce department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000014-2222-2222-2222-222222222234', 'Industry', 'IND', 'Industry department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000015-2222-2222-2222-222222222235', 'Parliament', 'PARL', 'Parliament department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('i1000016-2222-2222-2222-222222222236', 'Energy', 'ENGY', 'Energy department', '0bc40e8f-067c-4d96-be96-f8d22b5cf036', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- ============================================================================
-- NEW ZEALAND GOVERNMENT DEPARTMENTS
-- Organisation ID: 2b313a27-42cf-41c4-9512-d50057293010
-- Note: Using the organisation ID from the reports (Diplomatic Missions To New Zealand)
-- If this is incorrect, please update with the correct New Zealand Government organisation ID
-- ============================================================================
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('nz100001-3333-3333-3333-333333333331', 'Prime Minister', 'PM', 'Prime Minister department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100002-3333-3333-3333-333333333332', 'Finance', 'FIN', 'Finance department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100003-3333-3333-3333-333333333333', 'Foreign Affairs', 'FA', 'Foreign Affairs department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100004-3333-3333-3333-333333333334', 'Defense', 'DEF', 'Defense department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100005-3333-3333-3333-333333333335', 'Health', 'HLTH', 'Health department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100006-3333-3333-3333-333333333336', 'Education', 'EDU', 'Education department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100007-3333-3333-3333-333333333337', 'Interior', 'INT', 'Interior department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100008-3333-3333-3333-333333333338', 'Justice', 'JUST', 'Justice department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100009-3333-3333-3333-333333333339', 'Agriculture', 'AGRI', 'Agriculture department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100010-3333-3333-3333-333333333330', 'Environment', 'ENV', 'Environment department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100011-3333-3333-3333-333333333341', 'Transportation', 'TRANS', 'Transportation department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100012-3333-3333-3333-333333333342', 'Labor', 'LABOR', 'Labor department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100013-3333-3333-3333-333333333343', 'Commerce', 'COMM', 'Commerce department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100014-3333-3333-3333-333333333344', 'Industry', 'IND', 'Industry department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100015-3333-3333-3333-333333333345', 'Parliament', 'PARL', 'Parliament department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL),
  ('nz100016-3333-3333-3333-333333333346', 'Energy', 'ENGY', 'Energy department', '2b313a27-42cf-41c4-9512-d50057293010', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- ============================================================================
-- SUMMARY
-- ============================================================================
-- Argentina Government: 16 departments added
-- Italy Government: 16 departments added
-- New Zealand Government: 16 departments added
-- Total: 48 new departments
-- ============================================================================
