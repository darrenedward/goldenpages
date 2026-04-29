-- ============================================================================
-- DIPLOMATIC MISSIONS TO NEW ZEALAND - MIGRATION SCRIPT
-- ============================================================================
-- This script restructures diplomatic missions (High Commissions, Embassies) to be
-- departments under their sending country's organization, NOT separate organizations
-- with New Zealand as head office.
--
-- BEFORE (Incorrect):
-- - Organization: "Diplomatic Missions To NZ" (head_office: NZ)
--   - Contacts: All ambassadors/high commissioners from various countries
--
-- AFTER (Correct):
-- - Organization: India (head_office: India)
--   - Department: High Commission to New Zealand
--     - Contacts: HE Ms Neeta Bhushan (High Commissioner)
-- ============================================================================

-- ============================================================================
-- STEP 1: CREATE DIPLOMATIC MISSION DEPARTMENTS
-- ============================================================================

-- China - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt") VALUES
  ('dept_cn_embassy_nz_uuid', 'Embassy to New Zealand', 'EMB-NZ', 'China Embassy to New Zealand', 'org_001_35b9396a', NULL, TRUE, NOW(), NOW())
ON CONFLICT DO NOTHING;

-- India - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt") VALUES
  ('dept_in_hc_nz_uuid', 'High Commission to New Zealand', 'HC-NZ', 'India High Commission to New Zealand', 'org_027_fd25e846', NULL, TRUE, NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Russia - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt") VALUES
  ('dept_ru_embassy_nz_uuid', 'Embassy to New Zealand', 'EMB-NZ', 'Russia Embassy to New Zealand', 'org_ru_placeholder', NULL, TRUE, NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Turkey - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt") VALUES
  ('dept_tr_embassy_nz_uuid', 'Embassy to New Zealand', 'EMB-NZ', 'Turkey Embassy to New Zealand', 'org_035_8aecd207', NULL, TRUE, NOW(), NOW())
ON CONFLICT DO NOTHING;

-- New Zealand - Foreign Ministry (NZ represents itself diplomatically)
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt") VALUES
  ('dept_nz_mfat_uuid', 'Ministry of Foreign Affairs and Trade', 'MFAT', 'New Zealand MFAT - Diplomatic Relations', 'org_nz_placeholder', NULL, TRUE, NOW(), NOW())
ON CONFLICT DO NOTHING;

-- ============================================================================
-- STEP 2: CREATE WELLINGTON LOCATIONS FOR EACH DIPLOMATIC MISSION
-- ============================================================================

-- China Embassy Wellington Location
INSERT INTO organisation_locations ("id", "organisationId", "locationName", "countryId", "city", "address", "locationType", "createdAt", "updatedAt") VALUES
  ('loc_cn_embassy_nz', 'org_001_35b9396a', 'Embassy of China', (SELECT id FROM regions WHERE code = 'NZ' AND region_type = 'country'), 'Wellington', '2-6 Glenmore Street, Wellington 6012', 'embassy', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- India High Commission Wellington Location
INSERT INTO organisation_locations ("id", "organisationId", "locationName", "countryId", "city", "address", "locationType", "createdAt", "updatedAt") VALUES
  ('loc_in_hc_nz', 'org_027_fd25e846', 'High Commission of India', (SELECT id FROM regions WHERE code = 'NZ' AND region_type = 'country'), 'Wellington', '32-38 Hawkestone Street, Pipitea, Wellington 6011', 'embassy', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Russia Embassy Wellington Location
INSERT INTO organisation_locations ("id", "organisationId", "locationName", "countryId", "city", "address", "locationType", "createdAt", "updatedAt") VALUES
  ('loc_ru_embassy_nz', 'org_ru_placeholder', 'Embassy of Russia', (SELECT id FROM regions WHERE code = 'NZ' AND region_type = 'country'), 'Wellington', '61 Hobson Street, Wellington 6011', 'embassy', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Turkey Embassy Wellington Location
INSERT INTO organisation_locations ("id", "organisationId", "locationName", "countryId", "city", "address", "locationType", "createdAt", "updatedAt") VALUES
  ('loc_tr_embassy_nz', 'org_035_8aecd207', 'Embassy of Turkey', (SELECT id FROM regions WHERE code = 'NZ' AND region_type = 'country'), 'Wellington', '136 The Terrace, Wellington 6011', 'embassy', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Generic Wellington Diplomatic Mission Address (for countries without specific orgs yet)
INSERT INTO organisation_locations ("id", "organisationId", "locationName", "countryId", "city", "address", "locationType", "createdAt", "updatedAt") VALUES
  ('loc_diplomatic_generic_nz', 'org_034_53094b90', 'Diplomatic Missions', (SELECT id FROM regions WHERE code = 'NZ' AND region_type = 'country'), 'Wellington', '125 The Terrace, Wellington', 'embassy', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- ============================================================================
-- STEP 3: UPDATE CONTACTS TO LINK TO NEW DEPARTMENTS
-- ============================================================================

-- China - HE Mr Wang Xiaolong (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_cn_embassy_nz_uuid',
  "organisation_id" = 'org_001_35b9396a'
WHERE "full_name" = 'HE Mr Wang Xiaolong'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- India - HE Ms Neeta Bhushan (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_in_hc_nz_uuid',
  "organisation_id" = 'org_027_fd25e846'
WHERE "full_name" = 'HE Ms Neeta Bhushan'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Russia - HE Mr Georgii Zuev (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_ru_embassy_nz_uuid',
  "organisation_id" = 'org_ru_placeholder'
WHERE "full_name" = 'HE Mr Georgii Zuev'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Turkey - HE Dr Ruslan Esin (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_tr_embassy_nz_uuid',
  "organisation_id" = 'org_035_8aecd207'
WHERE "full_name" = 'HE Dr Ruslan Esin'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- New Zealand - HE Mr Chris Seed (Ambassador - NZ's diplomatic representative)
UPDATE contacts SET
  "departmentId" = 'dept_nz_mfat_uuid',
  "organisation_id" = 'org_nz_placeholder'
WHERE "full_name" = 'HE Mr Chris Seed'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Fiji - HE Hon Fisa Pihigia (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_fj_hc_nz_uuid',
  "organisation_id" = 'org_fj_placeholder'
WHERE "full_name" = 'HE Hon Fisa Pihigia'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Papua New Guinea - HE Mr Jose Maria De Morais (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_pg_hc_nz_uuid',
  "organisation_id" = 'org_pg_placeholder'
WHERE "full_name" = 'HE Mr Jose Maria De Morais'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Lesotho - HE Major General Lineo Bernard Poopa (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_ls_hc_nz_uuid',
  "organisation_id" = 'org_ls_placeholder'
WHERE "full_name" = 'HE Major General Lineo Bernard Poopa'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Rwanda - HE Mr Jean de Dieu Uwihanganye (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_rw_hc_nz_uuid',
  "organisation_id" = 'org_rw_placeholder'
WHERE "full_name" = 'HE Mr Jean de Dieu Uwihanganye'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Botswana - HE Ms Dorcas Makgato (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_bw_hc_nz_uuid',
  "organisation_id" = 'org_bw_placeholder'
WHERE "full_name" = 'HE Ms Dorcas Makgato'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Zimbabwe - HE Mr Joe Tapera Mhishi (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_zw_hc_nz_uuid',
  "organisation_id" = 'org_zw_placeholder'
WHERE "full_name" = 'HE Mr Joe Tapera Mhishi'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Malta - HE Mr Mario Farrugia Borg (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_mt_hc_nz_uuid',
  "organisation_id" = 'org_mt_placeholder'
WHERE "full_name" = 'HE Mr Mario Farrugia Borg'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Solomon Islands - HE Mr Jimmy Nipo (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_sb_hc_nz_uuid',
  "organisation_id" = 'org_sb_placeholder'
WHERE "full_name" = 'HE Mr Jimmy Nipo'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Lithuania - HE Mr Darius Degutis (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_lt_embassy_nz_uuid',
  "organisation_id" = 'org_lt_placeholder'
WHERE "full_name" = 'HE Mr Darius Degutis'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Kyrgyzstan - HE Mr Mirlan Arstanbaev (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_kg_embassy_nz_uuid',
  "organisation_id" = 'org_kg_placeholder'
WHERE "full_name" = 'HE Mr Mirlan Arstanbaev'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Belgium - HE Mr Michel Goffin (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_be_embassy_nz_uuid',
  "organisation_id" = 'org_be_placeholder'
WHERE "full_name" = 'HE Mr Michel Goffin'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Latvia - HE Mr Margers Krams (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_lv_embassy_nz_uuid',
  "organisation_id" = 'org_lv_placeholder'
WHERE "full_name" = 'HE Mr Margers Krams'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Romania - HE Mr Radu Gabriel Safta (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_ro_embassy_nz_uuid',
  "organisation_id" = 'org_ro_placeholder'
WHERE "full_name" = 'HE Mr Radu Gabriel Safta'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Oman - HE Dr Mohamed Said Al Busaidi (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_om_embassy_nz_uuid',
  "organisation_id" = 'org_om_placeholder'
WHERE "full_name" = 'HE Dr Mohamed Said Al Busaidi'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- UAE - HE Mr Rashed Matar Alqemzi (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_ae_embassy_nz_uuid',
  "organisation_id" = 'org_ae_placeholder'
WHERE "full_name" = 'HE Mr Rashed Matar Alqemzi'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Guatemala - HE Mr Marcos Arbizu de Souza Campos (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_gt_embassy_nz_uuid',
  "organisation_id" = 'org_gt_placeholder'
WHERE "full_name" = 'HE Mr Marcos Arbizu de Souza Campos'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Peru - HE Mr Jose Emilio Bustinza Soto (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_pe_embassy_nz_uuid',
  "organisation_id" = 'org_pe_placeholder'
WHERE "full_name" = 'HE Mr Jose Emilio Bustinza Soto'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Indonesia - HE Mrs Fientje Maritje Suebu (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_id_embassy_nz_uuid',
  "organisation_id" = 'org_id_placeholder'
WHERE "full_name" = 'HE Mrs Fientje Maritje Suebu'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Afghanistan - HE Mr Wahidullah Waissi (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_af_embassy_nz_uuid',
  "organisation_id" = 'org_af_placeholder'
WHERE "full_name" = 'HE Mr Wahidullah Waissi'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Bangladesh - HE Mr Ahmed Araita Ali (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_bd_embassy_nz_uuid',
  "organisation_id" = 'org_bd_placeholder'
WHERE "full_name" = 'HE Mr Ahmed Araita Ali'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Benin - HE Mr Makarimi Abissola Adechoubou (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_bj_embassy_nz_uuid',
  "organisation_id" = 'org_bj_placeholder'
WHERE "full_name" = 'HE Mr Makarimi Abissola Adechoubou'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Lebanon - HE Mr Milad Raad (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_lb_embassy_nz_uuid',
  "organisation_id" = 'org_lb_placeholder'
WHERE "full_name" = 'HE Mr Milad Raad'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Iceland - HE Mrs Kristin Arnadottir (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_is_embassy_nz_uuid',
  "organisation_id" = 'org_is_placeholder'
WHERE "full_name" = 'HE Mrs Kristin Arnadottir'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Canada - HE Ms Betty Pavelich Sirois (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_ca_embassy_nz_uuid',
  "organisation_id" = 'org_ca_placeholder'
WHERE "full_name" = 'HE Ms Betty Pavelich Sirois'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Slovakia - HE Mr Tomas Ferko (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_sk_embassy_nz_uuid',
  "organisation_id" = 'org_sk_placeholder'
WHERE "full_name" = 'HE Mr Tomas Ferko'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Myanmar - HE Mr Tha Aung Nyun (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_mm_embassy_nz_uuid',
  "organisation_id" = 'org_mm_placeholder'
WHERE "full_name" = 'HE Mr Tha Aung Nyun'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Guinea - HE Mr Senkoun Sylla (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_gn_embassy_nz_uuid',
  "organisation_id" = 'org_gn_placeholder'
WHERE "full_name" = 'HE Mr Senkoun Sylla'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Central African Republic - HE Mr Andre Nzapayeke (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_cf_embassy_nz_uuid',
  "organisation_id" = 'org_cf_placeholder'
WHERE "full_name" = 'HE Mr Andre Nzapayeke'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Iraq - HE Dr Hussain Al-Ameri (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_iq_embassy_nz_uuid',
  "organisation_id" = 'org_iq_placeholder'
WHERE "full_name" = 'HE Dr Hussain Al-Ameri'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Suriname - HE Dr Lloyd Pinas (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_sr_embassy_nz_uuid',
  "organisation_id" = 'org_sr_placeholder'
WHERE "full_name" = 'HE Dr Lloyd Pinas'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Senegal - HE Mr Cheikh Niang (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_sn_embassy_nz_uuid',
  "organisation_id" = 'org_sn_placeholder'
WHERE "full_name" = 'HE Mr Cheikh Niang'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Dominican Republic - HE Mr Alfredo Alberto Spiegel Aponte (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_do_embassy_nz_uuid',
  "organisation_id" = 'org_do_placeholder'
WHERE "full_name" = 'HE Mr Alfredo Alberto Spiegel Aponte'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Paraguay - HE Mrs Dianela Pi Cedres (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_py_embassy_nz_uuid',
  "organisation_id" = 'org_py_placeholder'
WHERE "full_name" = 'HE Mrs Dianela Pi Cedres'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Ecuador - HE Mr Ronald Estuardo Recinos Gomez (Ambassador)
UPDATE contacts SET
  "departmentId" = 'dept_ec_embassy_nz_uuid',
  "organisation_id" = 'org_ec_placeholder'
WHERE "full_name" = 'HE Mr Ronald Estuardo Recinos Gomez'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Sierra Leone - HE Mr Anderson Nkemakonam Madubike (High Commissioner)
UPDATE contacts SET
  "departmentId" = 'dept_sl_hc_nz_uuid',
  "organisation_id" = 'org_sl_placeholder'
WHERE "full_name" = 'HE Mr Anderson Nkemakonam Madubike'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- ============================================================================
-- STEP 4: MARK OLD DIPLOMATIC MISSION ORGANIZATIONS AS OBSOLETE
-- ============================================================================

-- Rename the old organizations to indicate they are obsolete
UPDATE organisations SET name = name || ' (OBSOLETE - migrated to departments)' WHERE name LIKE '%Diplomatic Missions To New Zealand%';

-- ============================================================================
-- VERIFICATION QUERIES (run these to verify the migration)
-- ============================================================================

-- Check that contacts now link to departments
-- SELECT c.full_name, c.role_title, d.name as department, o.name as organisation
-- FROM contacts c
-- LEFT JOIN departments d ON c."departmentId" = d.id
-- LEFT JOIN organisations o ON c."organisation_id" = o.id
-- WHERE c."departmentId" IS NOT NULL
-- ORDER BY o.name, d.name;

-- Count contacts per diplomatic mission
-- SELECT o.name as country, d.name as department, COUNT(*) as contact_count
-- FROM contacts c
-- JOIN departments d ON c."departmentId" = d.id
-- JOIN organisations o ON d."organisationId" = o.id
-- WHERE d.name LIKE '%New Zealand%'
-- GROUP BY o.name, d.name
-- ORDER BY contact_count DESC;
