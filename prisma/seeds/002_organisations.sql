-- ============================================================================
-- ORGANISATIONS SEED DATA
-- Organizations with head office information
-- Generated on: 2026-01-29T22:31:08.699690
-- ============================================================================

-- Organization: China - President and Premier
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_001_35b9396a', 'China - President and Premier', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CN' AND region_type = 'country'), NULL, 'Great Hall of the People, Beijing 100010', '+86-10-6596-1111', NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: China - Politburo Standing Committee
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_002_b7a2d865', 'China - Politburo Standing Committee', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CN' AND region_type = 'country'), NULL, 'Great Hall of the People, Beijing', '+86-10-6596-1111', NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: China - State Council Ministers
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_003_24378b5e', 'China - State Council Ministers', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CN' AND region_type = 'country'), NULL, 'State Council, Zhongnanhai, Beijing', '+86-10-6596-1111', NULL, 'english.www.gov.cn', NULL)
ON CONFLICT DO NOTHING;

-- Organization: China - Communist Party Central Committ
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_004_54577fb7', 'China - Communist Party Central Committ', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CN' AND region_type = 'country'), NULL, NULL, '+86-10-6596-1111', NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: China - Provincial Governments (Sample)
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_005_34ec2980', 'China - Provincial Governments (Sample)', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CN' AND region_type = 'country'), NULL, NULL, NULL, NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Cabinet Ministers
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_006_9714bc71', ' - Cabinet Ministers', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'KR' AND region_type = 'country'), NULL, 'Blue House', '+82-2-770-3131', 'info@president.go.kr', 'https://www.president.go.kr', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - National Assembly
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_007_a0165bbf', ' - National Assembly', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'KR' AND region_type = 'country'), NULL, '65 Yeouido-dong', '+82-2-788-2114', 'info@assembly.go.kr', 'https://www.nanet.go.kr', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Government Contact
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_008_046df161', ' - Government Contact', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'KR' AND region_type = 'country'), NULL, '1 Sejongno', '+82-2-770-3131', 'info@president.go.kr', 'https://www.president.go.kr', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Shura Council
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_009_b2ff6155', ' - Shura Council', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'SA' AND region_type = 'country'), NULL, 'Al-Yamamh Palace', '+966-11-4821666', 'info@shura.gov.sa', 'https://www.shura.gov.sa', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Federal Cabinet
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_010_e6c47d20', ' - Federal Cabinet', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'DE' AND region_type = 'country'), NULL, 'Federal Chancellery', '+49 (0)30 18400', NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Bundestag Contact
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_011_31bed2b6', ' - Bundestag Contact', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'DE' AND region_type = 'country'), NULL, 'Platz der Republik 1', '+49 (0)30 227-0', 'mail@bundestag.de', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: US - President
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_012_bd619017', 'US - President', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'US' AND region_type = 'country'), NULL, '1600 Pennsylvania Avenue NW, Washington, DC 20500', '(202) 456-1111', NULL, 'https://www.whitehouse.gov/contact/', NULL)
ON CONFLICT DO NOTHING;

-- Organization: US - Senators - AL to CO
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_013_9940ba9a', 'US - Senators - AL to CO', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'US' AND region_type = 'country'), NULL, 'Russell Senate Office Building', '(202) 224-4124', NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: US - Senators - CT to KS
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_014_f2acfef0', 'US - Senators - CT to KS', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'US' AND region_type = 'country'), NULL, 'Hart Senate Office Building', '(202) 224-2823', NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: US - Senators - KY to NY
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_015_925af66b', 'US - Senators - KY to NY', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'US' AND region_type = 'country'), NULL, 'Hart Senate Office Building', '(202) 224-4343', NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: US - Senators - NC to WY
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_016_b6ada766', 'US - Senators - NC to WY', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'US' AND region_type = 'country'), NULL, 'Hart Senate Office Building', '(202) 224-6362', NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: US - Contact Methods
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_017_8dfb37a3', 'US - Contact Methods', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'US' AND region_type = 'country'), NULL, NULL, NULL, NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: African Union - AU Commission Leadership
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_018_e512b036', 'African Union - AU Commission Leadership', 'diplomatic_mission'::OrganisationType, (SELECT id FROM regions WHERE code = 'AU' AND region_type = 'country'), NULL, 'Roosvelt Street, Old Airport Area', '+251-11-551-7700', 'info@africa-union.org', 'https://au.int', NULL)
ON CONFLICT DO NOTHING;

-- Organization: African Union - Pan-African Parliament
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_019_05a1f26a', 'African Union - Pan-African Parliament', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AU' AND region_type = 'country'), NULL, '19 Richards Drive, Gallagher Estate', '+27-11-545-5000', 'info@panafricanparliament.org', 'https://pap.au.int', NULL)
ON CONFLICT DO NOTHING;

-- Organization: African Union - AU Headquarters Contact
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_020_2878c957', 'African Union - AU Headquarters Contact', 'international_organization'::OrganisationType, (SELECT id FROM regions WHERE code = 'AU' AND region_type = 'country'), NULL, 'Roosvelt Street, Old Airport Area', '+251-11-551-7700', 'info@africa-union.org', 'https://au.int', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Red and White Cabinet
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_021_06d9ca00', ' - Red and White Cabinet', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'ID' AND region_type = 'country'), NULL, 'Office of the President', '+62-21-3844-7222', 'hubungan.masyarakat@president.go.id', 'https://www.president.go.id', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Parliament Contact
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_022_a80bd025', ' - Parliament Contact', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'ID' AND region_type = 'country'), NULL, 'Jl. Jenderal Gatot Subroto, Senayan', '+62-21-5715841', 'info@dpr.go.id', 'https://www.dpr.go.id', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Mishustin Cabinet
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_023_a4caf3a9', ' - Mishustin Cabinet', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'RU' AND region_type = 'country'), NULL, 'Office of the President', '+7-495-697-58-00', 'info@kremlin.ru', 'http://www.kremlin.ru', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Federal Assembly Contact
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_024_9ad5988c', ' - Federal Assembly Contact', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'RU' AND region_type = 'country'), NULL, 'Okhotny Ryad 1', '+7-495-692-30-57', 'stateduma@duma.gov.ru', 'http://www.duma.gov.ru', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Takaichi Cabinet
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_025_67dd83bf', ' - Takaichi Cabinet', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'JP' AND region_type = 'country'), NULL, 'Office of the Prime Minister', '+81-3-3581-0101', 'kantei@kantei.go.jp', 'https://www.kantei.go.jp', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - National Diet Contact
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_026_9cc8c6f5', ' - National Diet Contact', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'JP' AND region_type = 'country'), NULL, '7-1 Nagatacho 1-chome, Chiyoda-ku', '+81-3-3581-5111', 'info@shugiin.go.jp', 'https://www.shugiin.go.jp', NULL)
ON CONFLICT DO NOTHING;

-- Organization: India - Prime Minister
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_027_fd25e846', 'India - Prime Minister', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'IN' AND region_type = 'country'), NULL, 'South Block, Raisina Hill, New Delhi - 110011', '+91-11-23012312, 23015321, 23017290', 'connect@mygov.nic.in', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: India - BJP Government MPs
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_028_5eeea6da', 'India - BJP Government MPs', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'IN' AND region_type = 'country'), NULL, NULL, '011-23015603', 'narendramodi@sansad.nic.in', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: India - Indian National Congress (INC)
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_029_fe6c2524', 'India - Indian National Congress (INC)', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'IN' AND region_type = 'country'), NULL, NULL, '040-24654849', 'mallikarjun.kharge@sansad.nic.in', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: India - Dravida Munnetra Kazhagam (DMK)
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_030_eeb3a93a', 'India - Dravida Munnetra Kazhagam (DMK)', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'IN' AND region_type = 'country'), NULL, NULL, '044-24642367', 'm.k.stalin@sansad.nic.in', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: India - Other Regional Parties
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_031_6d8c8a18', 'India - Other Regional Parties', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'IN' AND region_type = 'country'), NULL, NULL, '033-25579999', 'mamata.banerjee@sansad.nic.in', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Congress Contact
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_032_cd9290cf', ' - Congress Contact', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AR' AND region_type = 'country'), NULL, 'Rivadavia 1864', '+54-11-6075-7100', 'info@diputados.gov.ar', 'https://www.diputados.gov.ar', NULL, NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Organization: Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_033_dda816c9', 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner', 'diplomatic_mission'::OrganisationType, (SELECT id FROM regions WHERE code = 'NZ' AND region_type = 'country'), NULL, NULL, NULL, NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_034_53094b90', 'Diplomatic Missions To New Zealand - Wellington Missions Contact', 'diplomatic_mission'::OrganisationType, (SELECT id FROM regions WHERE code = 'NZ' AND region_type = 'country'), NULL, '125 The Terrace, Wellington', '+64 4 473 6411', 'ahc.wellington@dfat.gov.au', 'newzealand.embassy.gov.au', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Grand National Assembly
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_035_8aecd207', ' - Grand National Assembly', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'TR' AND region_type = 'country'), NULL, 'TBMM, Bakanlıklar', '+90-312-420-5151', 'info@tbmm.gov.tr', 'https://www.tbmm.gov.tr', NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Prime Minister
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_036_ec75f373', ' - Prime Minister', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AU' AND region_type = 'country'), NULL, 'Parliament House, Canberra ACT 2600', '(02) 6277 7700', 'A.Albanese.MP@aph.gov.au', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Senators - ACT to NSW
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_037_4fad7100', ' - Senators - ACT to NSW', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AU' AND region_type = 'country'), NULL, 'Unit 3, 40 Corinna Street, Phillip ACT 2601', '(02) 6230 0411', 'senator.katy.gallagher@aph.gov.au', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Senators - NT to QLD
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_038_ea11830e', ' - Senators - NT to QLD', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AU' AND region_type = 'country'), NULL, '38 Mitchell Street, Darwin NT 0800', '(08) 8941 0003', 'Senator.McCarthy@aph.gov.au', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Senators - SA to VIC
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_039_75977193', ' - Senators - SA to VIC', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AU' AND region_type = 'country'), NULL, '398 Main North Road, Blair Athol SA 5084', '(08) 8359 0303', 'senator.antic@aph.gov.au', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Senators - WA
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_040_5ef4ea1f', ' - Senators - WA', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AU' AND region_type = 'country'), NULL, 'Unit 4, 1 Harper Terrace, South Perth WA 6151', '(08) 6245 3305', 'senator.brockman@aph.gov.au', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Contact Methods
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_041_df2bc567', ' - Contact Methods', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'AU' AND region_type = 'country'), NULL, NULL, NULL, NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: Canada - Prime Minister
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_042_95b333fb', 'Canada - Prime Minister', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CA' AND region_type = 'country'), NULL, 'Langevin Block, 80 Wellington Street, Ottawa, ON K1A 0A2', '613-996-0047', 'mark.carney@parl.gc.ca', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: Canada - Liberal Government MPs
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_043_e31a71ee', 'Canada - Liberal Government MPs', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CA' AND region_type = 'country'), NULL, NULL, '613-996-0047', 'mark.carney@parl.gc.ca', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: Canada - Conservative Opposition MPs
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_044_087cde71', 'Canada - Conservative Opposition MPs', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CA' AND region_type = 'country'), NULL, NULL, '613-996-2345', 'pierre.poilievre@parl.gc.ca', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: Canada - NDP Opposition MPs
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_045_e1397036', 'Canada - NDP Opposition MPs', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CA' AND region_type = 'country'), NULL, NULL, '613-996-1200', 'jagmeet.singh@parl.gc.ca', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: Canada - Bloc Québécois and Green
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_046_1e23d591', 'Canada - Bloc Québécois and Green', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'CA' AND region_type = 'country'), NULL, NULL, '613-996-6600', 'yves-francois.blanchet@parl.gc.ca', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: European Union - EU Commission Leadership
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_047_9ef13c01', 'European Union - EU Commission Leadership', 'diplomatic_mission'::OrganisationType, (SELECT id FROM regions WHERE code = 'EU' AND region_type = 'country'), NULL, 'Rue de la Loi 200', '+32-2-229-91111', 'president@ec.europa.eu', 'https://commission.europa.eu', NULL)
ON CONFLICT DO NOTHING;

-- Organization: European Union - EU Parliament & Council
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_048_977ddf77', 'European Union - EU Parliament & Council', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'EU' AND region_type = 'country'), NULL, 'Rue Wiertz 60', '+32-2-284-21111', 'info@europarl.europa.eu', 'https://www.europarl.europa.eu', NULL)
ON CONFLICT DO NOTHING;

-- Organization: European Union - EU Institutions Contact
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_049_b54e2283', 'European Union - EU Institutions Contact', 'international_organization'::OrganisationType, (SELECT id FROM regions WHERE code = 'EU' AND region_type = 'country'), NULL, 'Rue de la Loi 200', '+32-2-299-11111', 'info@ec.europa.eu', 'https://commission.europa.eu', NULL)
ON CONFLICT DO NOTHING;

-- Organization: UK - Prime Minister and Cabinet
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_050_aa450043', 'UK - Prime Minister and Cabinet', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'GB' AND region_type = 'country'), NULL, '10 Downing Street, London SW1A 2AA', '020 7219 6234', 'keir.starmer.mp@parliament.uk', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: UK - Labour MPs - A to D
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_051_4b44c30f', 'UK - Labour MPs - A to D', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'GB' AND region_type = 'country'), NULL, NULL, '020 7219 3000', 'jack.abbott.mp@parliament.uk', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: UK - Conservative MPs
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_052_2ec16c86', 'UK - Conservative MPs', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'GB' AND region_type = 'country'), NULL, NULL, '01746 555025', 'stuart.anderson.mp@parliament.uk', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: UK - Liberal Democrat MPs
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_053_f97e3e95', 'UK - Liberal Democrat MPs', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'GB' AND region_type = 'country'), NULL, NULL, '020 7219 3000', 'gideon.amos.mp@parliament.uk', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: UK - Scottish National Party (SNP)
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_054_9ed20760', 'UK - Scottish National Party (SNP)', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'GB' AND region_type = 'country'), NULL, NULL, '020 7219 8791', 'kirsty.blackman.mp@parliament.uk', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: UK - Green Party and Others
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_055_b98a5b2a', 'UK - Green Party and Others', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'GB' AND region_type = 'country'), NULL, NULL, '020 7219 3000', 'sian.berry.mp@parliament.uk', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: UK - Contact Guide and Reference
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_056_0e6d4084', 'UK - Contact Guide and Reference', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'GB' AND region_type = 'country'), NULL, NULL, NULL, NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: Leaders  Database - Regional Groups & Contacts
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_057_9da19bd3', 'Leaders  Database - Regional Groups & Contacts', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'XX' AND region_type = 'country'), NULL, 'Jakarta, Indonesia', '+62 21 726 2991', 'contact@asean.org', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: Leaders  Database - Instructions & Notes
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_058_8045e60b', 'Leaders  Database - Instructions & Notes', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'XX' AND region_type = 'country'), NULL, NULL, NULL, NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: France - President and Prime Minister
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_059_ddca7ab0', 'France - President and Prime Minister', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'FR' AND region_type = 'country'), NULL, '55 rue du Faubourg-Saint-Honoré, 75008 Paris', 'Postal only - see contact guide', NULL, NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: France - Majority Coalition (LREM-led)
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_060_258aadc4', 'France - Majority Coalition (LREM-led)', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'FR' AND region_type = 'country'), NULL, NULL, NULL, 'yael.braunpivet@assemblee-nationale.fr', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: France - Left-wing Opposition (NUPES)
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_061_e84b6a9e', 'France - Left-wing Opposition (NUPES)', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'FR' AND region_type = 'country'), NULL, NULL, NULL, 'jean-luc.melenchon@assemblee-nationale.fr', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: France - Right-wing Opposition (Republic
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_062_327ecc44', 'France - Right-wing Opposition (Republic', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'FR' AND region_type = 'country'), NULL, NULL, NULL, 'laurent.wauquiez@assemblee-nationale.fr', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization: France - Far-right Opposition (National 
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_063_e2947576', 'France - Far-right Opposition (National ', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'FR' AND region_type = 'country'), NULL, NULL, NULL, 'jordan.bardella@assemblee-nationale.fr', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Organization:  - Lula Cabinet
INSERT INTO organisations (id, name, type, head_office_country_id, head_office_city, head_office_address, head_office_phone, head_office_email, head_office_website, description, created_at, updated_at) VALUES
    ('org_064_539d643e', ' - Lula Cabinet', 'government'::OrganisationType, (SELECT id FROM regions WHERE code = 'BR' AND region_type = 'country'), NULL, 'Office of the President', '+55-61-3411-1000', 'contato@presidencia.gov.br', 'https://www.presidencia.gov.br', NULL)
ON CONFLICT DO NOTHING;

