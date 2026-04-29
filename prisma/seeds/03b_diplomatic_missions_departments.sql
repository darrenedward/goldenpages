-- ============================================================================
-- DIPLOMATIC MISSION DEPARTMENTS (TO NEW ZEALAND)
-- ============================================================================
-- This file contains departments for diplomatic missions (High Commissions, Embassies)
-- to New Zealand. Each department belongs to the sending country's organization.
--
-- Commonwealth countries use "High Commission"
-- Non-Commonwealth countries use "Embassy"
-- ============================================================================

-- ========================================================================
-- HIGH COMMISSIONS (Commonwealth Countries)
-- ========================================================================

-- Botswana - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_bw_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'Botswana High Commission to New Zealand', 'org_bw_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Fiji - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_fj_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'Fiji High Commission to New Zealand', 'org_fj_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- India - High Commission to New Zealand (using existing India org)
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_in_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'India High Commission to New Zealand', 'org_027_fd25e846', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Lesotho - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_ls_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'Lesotho High Commission to New Zealand', 'org_ls_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Malta - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_mt_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'Malta High Commission to New Zealand', 'org_mt_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Papua New Guinea - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_pg_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'Papua New Guinea High Commission to New Zealand', 'org_pg_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Rwanda - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_rw_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'Rwanda High Commission to New Zealand', 'org_rw_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Sierra Leone - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_sl_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'Sierra Leone High Commission to New Zealand', 'org_sl_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Solomon Islands - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_sb_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'Solomon Islands High Commission to New Zealand', 'org_sb_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Zimbabwe - High Commission to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_zw_hc_nz', 'High Commission to New Zealand', 'HC-NZ', 'Zimbabwe High Commission to New Zealand', 'org_zw_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- ========================================================================
-- EMBASSIES (Non-Commonwealth Countries)
-- ========================================================================

-- Afghanistan - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_af_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Afghanistan Embassy to New Zealand', 'org_af_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Bangladesh - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_bd_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Bangladesh Embassy to New Zealand', 'org_bd_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Belgium - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_be_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Belgium Embassy to New Zealand', 'org_be_placeholder', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Central African Republic - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_cf_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Central African Republic Embassy to New Zealand', 'org_cf_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- China - Embassy to New Zealand (using existing China org)
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_cn_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'China Embassy to New Zealand', 'org_001_35b9396a', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Dominican Republic - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_do_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Dominican Republic Embassy to New Zealand', 'org_do_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Ecuador - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_ec_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Ecuador Embassy to New Zealand', 'org_ec_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Guatemala - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_gt_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Guatemala Embassy to New Zealand', 'org_gt_placeholder', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Guinea - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_gn_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Guinea Embassy to New Zealand', 'org_gn_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Iceland - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_is_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Iceland Embassy to New Zealand', 'org_is_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Indonesia - Embassy to New Zealand (using existing Indonesia org if exists, otherwise placeholder)
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_id_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Indonesia Embassy to New Zealand', 'org_id_placeholder', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Iraq - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_iq_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Iraq Embassy to New Zealand', 'org_iq_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Kyrgyzstan - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_kg_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Kyrgyzstan Embassy to New Zealand', 'org_kg_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Latvia - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_lv_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Latvia Embassy to New Zealand', 'org_lv_placeholder', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Lebanon - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_lb_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Lebanon Embassy to New Zealand', 'org_lb_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Myanmar - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_mm_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Myanmar Embassy to New Zealand', 'org_mm_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- New Zealand - MFAT (NZ's diplomatic representation)
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_nz_mfat', 'Ministry of Foreign Affairs and Trade', 'MFAT', 'New Zealand Ministry of Foreign Affairs and Trade', 'org_nz_placeholder', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Oman - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_om_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Oman Embassy to New Zealand', 'org_om_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Paraguay - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_py_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Paraguay Embassy to New Zealand', 'org_py_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Peru - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_pe_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Peru Embassy to New Zealand', 'org_pe_placeholder', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Romania - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_ro_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Romania Embassy to New Zealand', 'org_ro_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Russia - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_ru_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Russia Embassy to New Zealand', 'org_ru_placeholder', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Senegal - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_sn_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Senegal Embassy to New Zealand', 'org_sn_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Slovakia - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_sk_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Slovakia Embassy to New Zealand', 'org_sk_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Suriname - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_sr_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Suriname Embassy to New Zealand', 'org_sr_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- Turkey - Embassy to New Zealand (using existing Turkey org)
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_tr_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'Turkey Embassy to New Zealand', 'org_035_8aecd207', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;

-- United Arab Emirates - Embassy to New Zealand
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  ('dept_ae_embassy_nz', 'Embassy to New Zealand', 'EMB-NZ', 'United Arab Emirates Embassy to New Zealand', 'org_ae_001', NULL, TRUE, NOW(), NOW(), NULL, NULL)
ON CONFLICT DO NOTHING;
