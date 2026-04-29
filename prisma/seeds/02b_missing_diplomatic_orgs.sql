-- ============================================================================
-- MISSING COUNTRY ORGANIZATIONS FOR DIPLOMATIC MISSIONS TO NEW ZEALAND
-- ============================================================================
-- This file contains organizations for countries that have diplomatic missions
-- (High Commissions, Embassies) to New Zealand but didn't have
-- organization entries in the original seed data.
-- ============================================================================

-- Afghanistan
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_af_001', 'Afghanistan - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AF' AND region_type = 'country'), 'Kabul', 'Presidential Palace, Arg', '+93-20-210020', 'info@mfa.gov.af', 'https://mfa.gov.af', 'Islamic Republic of Afghanistan Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Bangladesh
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_bd_001', 'Bangladesh - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'BD' AND region_type = 'country'), 'Dhaka', 'Ministry of Foreign Affairs', '+880-2-9530271', 'info@mofa.gov.bd', 'https://mofa.gov.bd', 'People''s Republic of Bangladesh Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Benin
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_bj_001', 'Benin - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'BJ' AND region_type = 'country'), 'Cotonou', 'Ministry of Foreign Affairs', '+229-21-30-10-54', 'diplomatie@diplomatie.gouv.bj', 'https://diplomatie.gouv.bj', 'Republic of Benin Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Botswana
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_bw_001', 'Botswana - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'BW' AND region_type = 'country'), 'Gaborone', 'Ministry of International Affairs and Cooperation', '+267-361-3200', 'info@gov.bw', 'https://www.gov.bw', 'Republic of Botswana Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Canada (should exist, adding placeholder reference)
-- Note: Canada should already exist in seed data

-- Central African Republic
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_cf_001', 'Central African Republic - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CF' AND region_type = 'country'), 'Bangui', 'Ministry of Foreign Affairs', '+236-21-61-20-32', 'diplomatie@gov.cf', NULL, 'Central African Republic Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Dominican Republic
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_do_001', 'Dominican Republic - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'DO' AND region_type = 'country'), 'Santo Domingo', 'Ministry of Foreign Affairs', '+1-809-532-0142', 'info@mirex.gob.do', 'https://mirex.gob.do', 'Dominican Republic Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Ecuador
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_ec_001', 'Ecuador - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'EC' AND region_type = 'country'), 'Quito', 'Ministry of Foreign Affairs and Human Mobility', '+593-2-250-1822', 'cancilleria@cancilleria.gob.ec', 'https://www.cancilleria.gob.ec', 'Republic of Ecuador Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Fiji
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_fj_001', 'Fiji - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'FJ' AND region_type = 'country'), 'Suva', 'Ministry of Foreign Affairs and International Cooperation', '+679-330-2611', 'info@mfaic.gov.fj', 'https://www.mfaic.gov.fj', 'Republic of Fiji Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Guinea
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_gn_001', 'Guinea - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'GN' AND region_type = 'country'), 'Conakry', 'Ministry of Foreign Affairs', '+224-622-00-83', 'diplomatie@diplomatie.gn', NULL, 'Republic of Guinea Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Iceland
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_is_001', 'Iceland - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'IS' AND region_type = 'country'), 'Reykjavik', 'Ministry for Foreign Affairs', '+354-545-4800', 'ut@utn.stjr.is', 'https://www.utn.stjr.is', 'Iceland Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Iraq
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_iq_001', 'Iraq - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'IQ' AND region_type = 'country'), 'Baghdad', 'Ministry of Foreign Affairs', '+964-1-447-0905', 'info@mofa.gov.iq', 'https://mofa.gov.iq', 'Republic of Iraq Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Kyrgyzstan
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_kg_001', 'Kyrgyzstan - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'KG' AND region_type = 'country'), 'Bishkek', 'Ministry of Foreign Affairs', '+996-312-66-48-77', 'mfa@mfa.gov.kg', 'https://mfa.gov.kg', 'Kyrgyz Republic Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Lebanon
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_lb_001', 'Lebanon - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'LB' AND region_type = 'country'), 'Beirut', 'Ministry of Foreign Affairs and Emigrants', '+961-1-961-100', 'info@foreignaffairs.gov.lb', 'https://www.foreignaffairs.gov.lb', 'Lebanese Republic Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Lesotho
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_ls_001', 'Lesotho - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'LS' AND region_type = 'country'), 'Maseru', 'Ministry of Foreign Affairs and International Relations', '+266-22-320-418', 'info@gov.ls', 'https://www.gov.ls', 'Kingdom of Lesotho Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Malta
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_mt_001', 'Malta - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'MT' AND region_type = 'country'), 'Valletta', 'Ministry for Foreign and European Affairs and Trade', '+356-2200-2200', 'info.mfea@gov.mt', 'https://foreignaffairs.gov.mt', 'Republic of Malta Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Myanmar
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_mm_001', 'Myanmar - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'MM' AND region_type = 'country'), 'Naypyidaw', 'Ministry of Foreign Affairs', '+95-67-408-085', 'mofa@mfa.gov.mm', 'https://www.mfa.gov.mm', 'Republic of the Union of Myanmar Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- New Zealand (diplomatic representation)
-- Note: NZ already exists in seed data

-- Oman
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_om_001', 'Oman - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'OM' AND region_type = 'country'), 'Muscat', 'Ministry of Foreign Affairs', '+968-2460-0888', 'info@mofa.gov.om', 'https://www.mofa.gov.om', 'Sultanate of Oman Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Papua New Guinea
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_pg_001', 'Papua New Guinea - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'PG' AND region_type = 'country'), 'Port Moresby', 'Department of Foreign Affairs and Trade', '+675-301-2200', 'info@dfat.gov.pg', 'https://www.dfat.gov.pg', 'Independent State of Papua New Guinea Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Paraguay
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_py_001', 'Paraguay - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'PY' AND region_type = 'country'), 'Asuncion', 'Ministry of Foreign Affairs', '+595-21-446-266', 'cancilleria@cancilleria.gov.py', 'https://www.cancilleria.gov.py', 'Republic of Paraguay Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Romania
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_ro_001', 'Romania - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'RO' AND region_type = 'country'), 'Bucharest', 'Ministry of Foreign Affairs', '+40-21-319-01-46', 'mae@mae.ro', 'https://www.mae.ro', 'Romanian Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Rwanda
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_rw_001', 'Rwanda - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'RW' AND region_type = 'country'), 'Kigali', 'Ministry of Foreign Affairs and International Cooperation', '+250-252-570-710', 'info@mfa.gov.rw', 'https://www.mfa.gov.rw', 'Republic of Rwanda Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Senegal
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_sn_001', 'Senegal - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'SN' AND region_type = 'country'), 'Dakar', 'Ministry of Foreign Affairs and Senegalese Abroad', '+221-33-821-56-56', 'ambassade@gouv.sn', 'https://www.diplomatie.gouv.sn', 'Republic of Senegal Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Sierra Leone
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_sl_001', 'Sierra Leone - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'SL' AND region_type = 'country'), 'Freetown', 'Ministry of Foreign Affairs and International Cooperation', '+232-76-68-332', 'info@mfic.gov.sl', 'https://mfic.gov.sl', 'Republic of Sierra Leone Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Slovakia
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_sk_001', 'Slovakia - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'SK' AND region_type = 'country'), 'Bratislava', 'Ministry of Foreign and European Affairs', '+421-2-5974-2111', 'info@mzv.sk', 'https://www.mzv.sk', 'Slovak Republic Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Solomon Islands
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_sb_001', 'Solomon Islands - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'SB' AND region_type = 'country'), 'Honiara', 'Ministry of Foreign Affairs and External Trade', '+677-23985', 'mfa@mfa.gov.sb', 'https://www.mfa.gov.sb', 'Solomon Islands Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Suriname
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_sr_001', 'Suriname - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'SR' AND region_type = 'country'), 'Paramaribo', 'Ministry of Foreign Affairs, International Business and International Cooperation', '+597-423-807', 'info@minibis.nl', 'https://www.minibis.nl', 'Republic of Suriname Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- United Arab Emirates
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_ae_001', 'United Arab Emirates - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AE' AND region_type = 'country'), 'Abu Dhabi', 'Ministry of Foreign Affairs and International Cooperation', '+971-600-555-555', 'info@mofaic.gov.ae', 'https://www.mofaic.gov.ae', 'United Arab Emirates Government', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Zimbabwe
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_zw_001', 'Zimbabwe - Government', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'ZW' AND region_type = 'country'), 'Harare', 'Ministry of Foreign Affairs and International Trade', '+263-24-706-895', 'info@mofaz.gov.zw', 'https://www.mofaz.gov.zw', 'Republic of Zimbabwe Government', NOW(), NOW())
ON CONFLICT DO NOTHING;
