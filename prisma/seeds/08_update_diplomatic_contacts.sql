-- ============================================================================
-- UPDATE DIPLOMATIC CONTACTS TO LINK TO NEW DEPARTMENTS
-- ============================================================================
-- This script updates all diplomatic contacts to link them to their
-- respective country's diplomatic mission department instead of the incorrect
-- "Diplomatic Missions To New Zealand" organization.
-- ============================================================================

-- ========================================================================
-- HIGH COMMISSIONERS (Commonwealth Countries)
-- ========================================================================

-- Botswana - HE Ms Dorcas Makgato
UPDATE contacts SET
  "departmentId" = 'dept_bw_hc_nz',
  "organisation_id" = 'org_bw_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Ms Dorcas Makgato'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Fiji - HE Hon Fisa Pihigia
UPDATE contacts SET
  "departmentId" = 'dept_fj_hc_nz',
  "organisation_id" = 'org_fj_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Hon Fisa Pihigia'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- India - HE Ms Neeta Bhushan
UPDATE contacts SET
  "departmentId" = 'dept_in_hc_nz',
  "organisation_id" = 'org_027_fd25e846',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Ms Neeta Bhushan'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Lesotho - HE Major General Lineo Bernard Poopa
UPDATE contacts SET
  "departmentId" = 'dept_ls_hc_nz',
  "organisation_id" = 'org_ls_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Major General Lineo Bernard Poopa'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Malta - HE Mr Mario Farrugia Borg
UPDATE contacts SET
  "departmentId" = 'dept_mt_hc_nz',
  "organisation_id" = 'org_mt_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Mario Farrugia Borg'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Papua New Guinea - HE Mr Jose Maria De Morais
UPDATE contacts SET
  "departmentId" = 'dept_pg_hc_nz',
  "organisation_id" = 'org_pg_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Jose Maria De Morais'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Rwanda - HE Mr Jean de Dieu Uwihanganye
UPDATE contacts SET
  "departmentId" = 'dept_rw_hc_nz',
  "organisation_id" = 'org_rw_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Jean de Dieu Uwihanganye'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Sierra Leone - HE Mr Anderson Nkemakonam Madubike
UPDATE contacts SET
  "departmentId" = 'dept_sl_hc_nz',
  "organisation_id" = 'org_sl_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Anderson Nkemakonam Madubike'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Solomon Islands - HE Mr Jimmy Nipo
UPDATE contacts SET
  "departmentId" = 'dept_sb_hc_nz',
  "organisation_id" = 'org_sb_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Jimmy Nipo'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Zimbabwe - HE Mr Joe Tapera Mhishi
UPDATE contacts SET
  "departmentId" = 'dept_zw_hc_nz',
  "organisation_id" = 'org_zw_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Joe Tapera Mhishi'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- ========================================================================
-- AMBASSADORS (Non-Commonwealth Countries)
-- ========================================================================

-- Afghanistan - HE Mr Wahidullah Waissi
UPDATE contacts SET
  "departmentId" = 'dept_af_embassy_nz',
  "organisation_id" = 'org_af_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Wahidullah Waissi'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Bangladesh - HE Mr Ahmed Araita Ali
UPDATE contacts SET
  "departmentId" = 'dept_bd_embassy_nz',
  "organisation_id" = 'org_bd_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Ahmed Araita Ali'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Belgium - HE Mr Michel Goffin
UPDATE contacts SET
  "departmentId" = 'dept_be_embassy_nz',
  "organisation_id" = 'org_be_placeholder',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Michel Goffin'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Central African Republic - HE Mr Andre Nzapayeke
UPDATE contacts SET
  "departmentId" = 'dept_cf_embassy_nz',
  "organisation_id" = 'org_cf_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Andre Nzapayeke'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- China - HE Mr Wang Xiaolong
UPDATE contacts SET
  "departmentId" = 'dept_cn_embassy_nz',
  "organisation_id" = 'org_001_35b9396a',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Wang Xiaolong'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Dominican Republic - HE Mr Alfredo Alberto Spiegel Aponte
UPDATE contacts SET
  "departmentId" = 'dept_do_embassy_nz',
  "organisation_id" = 'org_do_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Alfredo Alberto Spiegel Aponte'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Ecuador - HE Mr Ronald Estuardo Recinos Gomez
UPDATE contacts SET
  "departmentId" = 'dept_ec_embassy_nz',
  "organisation_id" = 'org_ec_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Ronald Estuardo Recinos Gomez'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Guatemala - HE Mr Marcos Arbizu de Souza Campos
UPDATE contacts SET
  "departmentId" = 'dept_gt_embassy_nz',
  "organisation_id" = 'org_gt_placeholder',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Marcos Arbizu de Souza Campos'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Guinea - HE Mr Senkoun Sylla
UPDATE contacts SET
  "departmentId" = 'dept_gn_embassy_nz',
  "organisation_id" = 'org_gn_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Senkoun Sylla'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Iceland - HE Mrs Kristin Arnadottir
UPDATE contacts SET
  "departmentId" = 'dept_is_embassy_nz',
  "organisation_id" = 'org_is_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mrs Kristin Arnadottir'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Indonesia - HE Mrs Fientje Maritje Suebu
UPDATE contacts SET
  "departmentId" = 'dept_id_embassy_nz',
  "organisation_id" = 'org_id_placeholder',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mrs Fientje Maritje Suebu'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Iraq - HE Dr Hussain Al-Ameri
UPDATE contacts SET
  "departmentId" = 'dept_iq_embassy_nz',
  "organisation_id" = 'org_iq_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Dr Hussain Al-Ameri'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Kyrgyzstan - HE Mr Mirlan Arstanbaev
UPDATE contacts SET
  "departmentId" = 'dept_kg_embassy_nz',
  "organisation_id" = 'org_kg_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Mirlan Arstanbaev'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Latvia - HE Mr Margers Krams
UPDATE contacts SET
  "departmentId" = 'dept_lv_embassy_nz',
  "organisation_id" = 'org_lv_placeholder',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Margers Krams'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Lebanon - HE Mr Milad Raad
UPDATE contacts SET
  "departmentId" = 'dept_lb_embassy_nz',
  "organisation_id" = 'org_lb_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Milad Raad'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Myanmar - HE Mr Tha Aung Nyun
UPDATE contacts SET
  "departmentId" = 'dept_mm_embassy_nz',
  "organisation_id" = 'org_mm_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Tha Aung Nyun'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- New Zealand - HE Mr Chris Seed (Note: NZ uses Ambassadors for its diplomatic representatives)
UPDATE contacts SET
  "departmentId" = 'dept_nz_mfat',
  "organisation_id" = 'org_nz_placeholder',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Chris Seed'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Oman - HE Dr Mohamed Said Al Busaidi
UPDATE contacts SET
  "departmentId" = 'dept_om_embassy_nz',
  "organisation_id" = 'org_om_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Dr Mohamed Said Al Busaidi'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Paraguay - HE Mrs Dianela Pi Cedres
UPDATE contacts SET
  "departmentId" = 'dept_py_embassy_nz',
  "organisation_id" = 'org_py_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mrs Dianela Pi Cedres'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Peru - HE Mr Jose Emilio Bustinza Soto
UPDATE contacts SET
  "departmentId" = 'dept_pe_embassy_nz',
  "organisation_id" = 'org_pe_placeholder',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Jose Emilio Bustinza Soto'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Romania - HE Mr Radu Gabriel Safta
UPDATE contacts SET
  "departmentId" = 'dept_ro_embassy_nz',
  "organisation_id" = 'org_ro_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Radu Gabriel Safta'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Russia - HE Mr Georgii Zuev
UPDATE contacts SET
  "departmentId" = 'dept_ru_embassy_nz',
  "organisation_id" = 'org_ru_placeholder',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Georgii Zuev'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Senegal - HE Mr Cheikh Niang
UPDATE contacts SET
  "departmentId" = 'dept_sn_embassy_nz',
  "organisation_id" = 'org_sn_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Cheikh Niang'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Slovakia - HE Mr Tomas Ferko
UPDATE contacts SET
  "departmentId" = 'dept_sk_embassy_nz',
  "organisation_id" = 'org_sk_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Tomas Ferko'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Suriname - HE Dr Lloyd Pinas
UPDATE contacts SET
  "departmentId" = 'dept_sr_embassy_nz',
  "organisation_id" = 'org_sr_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Dr Lloyd Pinas'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Turkey - HE Dr Ruslan Esin
UPDATE contacts SET
  "departmentId" = 'dept_tr_embassy_nz',
  "organisation_id" = 'org_035_8aecd207',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Dr Ruslan Esin'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- United Arab Emirates - HE Mr Rashed Matar Alqemzi
UPDATE contacts SET
  "departmentId" = 'dept_ae_embassy_nz',
  "organisation_id" = 'org_ae_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Rashed Matar Alqemzi'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Benin - HE Mr Makarimi Abissola Adechoubou
UPDATE contacts SET
  "departmentId" = 'dept_bj_embassy_nz',
  "organisation_id" = 'org_bj_001',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Makarimi Abissola Adechoubou'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Canada - HE Ms Betty Pavelich Sirois
UPDATE contacts SET
  "departmentId" = 'dept_ca_embassy_nz',
  "organisation_id" = 'org_ca_placeholder',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Ms Betty Pavelich Sirois'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- Lithuania - HE Mr Darius Degutis
UPDATE contacts SET
  "departmentId" = 'dept_lt_embassy_nz',
  "organisation_id" = 'org_lt_placeholder',
  "is_head_office_based" = false
WHERE "full_name" = 'HE Mr Darius Degutis'
  AND "organisation_id" IN (SELECT id FROM organisations WHERE name LIKE '%Diplomatic Missions To New Zealand%');

-- ========================================================================
-- CLEANUP: Mark old diplomatic mission organizations as obsolete
-- ========================================================================

UPDATE organisations SET name = name || ' (OBSOLETE - migrated to departments under sending countries)'
WHERE name LIKE '%Diplomatic Missions To New Zealand%';

-- ========================================================================
-- VERIFICATION QUERIES
-- ========================================================================

-- Verify contacts now linked to departments
-- SELECT c.full_name, c.role_title, d.name as department, o.name as organisation
-- FROM contacts c
-- LEFT JOIN departments d ON c."departmentId" = d.id
-- LEFT JOIN organisations o ON c."organisation_id" = o.id
-- WHERE c."departmentId" IS NOT NULL
--   AND d.name LIKE '%New Zealand%'
-- ORDER BY o.name, c.full_name;

-- Count contacts by country
-- SELECT o.name as country, d.name as department, COUNT(*) as contact_count
-- FROM contacts c
-- JOIN departments d ON c."departmentId" = d.id
-- JOIN organisations o ON d."organisationId" = o.id
-- WHERE d.name LIKE '%New Zealand%'
-- GROUP BY o.name, d.name
-- ORDER BY contact_count DESC;
