-- ============================================================================
-- CONTACTS SEED DATA
-- Individual contacts within organizations
-- Generated on: 2026-01-29T22:31:08.700288
-- ============================================================================

-- Contact: Xi Jinping - China - President and Premier
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0001_f2f65cf0', 'Xi Jinping', 'President of China', NULL, (SELECT id FROM organisations WHERE name = 'China - President and Premier'), true)
ON CONFLICT DO NOTHING;

-- Contact: Li Qiang - China - President and Premier
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0002_dae250bc', 'Li Qiang', 'Premier of China', NULL, (SELECT id FROM organisations WHERE name = 'China - President and Premier'), true)
ON CONFLICT DO NOTHING;

-- Contact: Xi Jinping - China - Politburo Standing Committee
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0003_eef95a42', 'Xi Jinping', 'General Secretary & President', NULL, (SELECT id FROM organisations WHERE name = 'China - Politburo Standing Committee'), true)
ON CONFLICT DO NOTHING;

-- Contact: Li Qiang - China - Politburo Standing Committee
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0004_c0234198', 'Li Qiang', 'Premier', NULL, (SELECT id FROM organisations WHERE name = 'China - Politburo Standing Committee'), true)
ON CONFLICT DO NOTHING;

-- Contact: Zhao Leji - China - Politburo Standing Committee
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0005_8caa0ad6', 'Zhao Leji', 'NPC Standing Committee Chair', NULL, (SELECT id FROM organisations WHERE name = 'China - Politburo Standing Committee'), true)
ON CONFLICT DO NOTHING;

-- Contact: Cai Qi - China - Politburo Standing Committee
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0006_d3190732', 'Cai Qi', 'CPPCC Chair', NULL, (SELECT id FROM organisations WHERE name = 'China - Politburo Standing Committee'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ding Xuexiang - China - Politburo Standing Committee
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0007_a569313f', 'Ding Xuexiang', 'Vice Premier', NULL, (SELECT id FROM organisations WHERE name = 'China - Politburo Standing Committee'), true)
ON CONFLICT DO NOTHING;

-- Contact: Zhang Youyu - China - Politburo Standing Committee
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0008_9abd8748', 'Zhang Youyu', 'Deputy Secretary', NULL, (SELECT id FROM organisations WHERE name = 'China - Politburo Standing Committee'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chen Wenqing - China - Politburo Standing Committee
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0009_53a8b190', 'Chen Wenqing', 'Internal Security Chief', NULL, (SELECT id FROM organisations WHERE name = 'China - Politburo Standing Committee'), true)
ON CONFLICT DO NOTHING;

-- Contact: Li Qiang - China - State Council Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0010_0a650f06', 'Li Qiang', 'Premier', NULL, (SELECT id FROM organisations WHERE name = 'China - State Council Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ding Xuexiang - China - State Council Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0011_87ab1f9a', 'Ding Xuexiang', 'Vice Premier (Economic Affairs)', NULL, (SELECT id FROM organisations WHERE name = 'China - State Council Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Zhang Gaoli - China - State Council Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0012_b7288e45', 'Zhang Gaoli', 'Vice Premier (Social Affairs)', NULL, (SELECT id FROM organisations WHERE name = 'China - State Council Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: He Lifeng - China - State Council Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0013_6735e5bb', 'He Lifeng', 'National Development and Reform Commission', NULL, (SELECT id FROM organisations WHERE name = 'China - State Council Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Liu Kun - China - State Council Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0014_897f4957', 'Liu Kun', 'Minister of Finance', NULL, (SELECT id FROM organisations WHERE name = 'China - State Council Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Pan Gongsheng - China - State Council Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0015_c393a45b', 'Pan Gongsheng', 'Governor, People''s Bank of China', NULL, (SELECT id FROM organisations WHERE name = 'China - State Council Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Wang Wentao - China - State Council Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0016_bfbeb02a', 'Wang Wentao', 'Minister of Commerce', NULL, (SELECT id FROM organisations WHERE name = 'China - State Council Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Zhang Keqiang - China - State Council Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0017_719a1b3b', 'Zhang Keqiang', 'Minister of Industry and Information Technology', NULL, (SELECT id FROM organisations WHERE name = 'China - State Council Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Xi Jinping - China - Communist Party Central Committ
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0018_07e22ea3', 'Xi Jinping', 'General Secretary', 'Communist Party Central Committee', (SELECT id FROM organisations WHERE name = 'China - Communist Party Central Committ'), true)
ON CONFLICT DO NOTHING;

-- Contact: Zhao Leji - China - Communist Party Central Committ
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0019_0b287154', 'Zhao Leji', 'Chair, Standing Committee', 'Legislature', (SELECT id FROM organisations WHERE name = 'China - Communist Party Central Committ'), true)
ON CONFLICT DO NOTHING;

-- Contact: Li Shulei - China - Communist Party Central Committ
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0020_0fba323b', 'Li Shulei', 'Director, Party Central Propaganda Department', '+86-10-6596-1111', (SELECT id FROM organisations WHERE name = 'China - Communist Party Central Committ'), true)
ON CONFLICT DO NOTHING;

-- Contact: Zhang Jun - China - Communist Party Central Committ
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0021_ac3b7574', 'Zhang Jun', 'Director, Party Central Discipline Commission', '+86-10-6596-1111', (SELECT id FROM organisations WHERE name = 'China - Communist Party Central Committ'), true)
ON CONFLICT DO NOTHING;

-- Contact: Liu Jinsong - China - Communist Party Central Committ
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0022_662bd85a', 'Liu Jinsong', 'Director, Party Central Organization Department', '+86-10-6596-1111', (SELECT id FROM organisations WHERE name = 'China - Communist Party Central Committ'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chen Wenqing - China - Communist Party Central Committ
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0023_48463101', 'Chen Wenqing', 'Director, Central Commission for Discipline Inspection', '+86-10-6596-1111', (SELECT id FROM organisations WHERE name = 'China - Communist Party Central Committ'), true)
ON CONFLICT DO NOTHING;

-- Contact: gd.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0024_7596ba48', 'gd.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: shandong.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0025_a5815491', 'shandong.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: jiangsu.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0026_8740725d', 'jiangsu.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: henan.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0027_fb8a06f5', 'henan.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: sc.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0028_f747b278', 'sc.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: he.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0029_39c4f934', 'he.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: sh.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0030_0915f7ae', 'sh.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: beijing.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0031_8e9e369f', 'beijing.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: cq.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0032_48e47158', 'cq.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: tj.gov.cn - China - Provincial Governments (Sample)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0033_e362ea31', 'tj.gov.cn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'China - Provincial Governments (Sample)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lee Jae-myung -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0034_b1a871d3', 'Lee Jae-myung', 'President', 'Blue House', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Oh Duck-soo -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0035_20d41d58', 'Oh Duck-soo', 'Prime Minister', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Park Jin -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0036_f2810808', 'Park Jin', 'Deputy Prime Minister & Minister of Economy and Finance', 'Finance', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Cho Tae-yul -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0037_776515be', 'Cho Tae-yul', 'Minister of Foreign Affairs', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Shin Won-shik -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0038_e4ad8203', 'Shin Won-shik', 'Minister of Unification', 'Ministry of Unification', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Shin In-mo -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0039_a05830aa', 'Shin In-mo', 'Minister of National Defense', 'Defense', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lee Sang-min -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0040_c229426b', 'Lee Sang-min', 'Minister of the Interior and Safety', 'Interior', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Park Sang-woo -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0041_41a560a9', 'Park Sang-woo', 'Minister of Justice', 'Justice', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lee Sang-hwan -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0042_b8c3b4bd', 'Lee Sang-hwan', 'Minister of Education', 'Education', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Im Hwan-su -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0043_846aa9dd', 'Im Hwan-su', 'Minister of Culture, Sports and Tourism', 'Ministry of Culture, Sports and Tourism', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Park Jin-ho -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0044_48a5d4cc', 'Park Jin-ho', 'Minister of Agriculture, Food and Rural Affairs', 'Agriculture', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ahn Young-hak -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0045_14e54765', 'Ahn Young-hak', 'Minister of Trade, Industry and Energy', 'Trade', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lee Se-jin -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0046_9c7dda3d', 'Lee Se-jin', 'Minister of Environment', 'Environment', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yoon Young-suk -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0047_8707a377', 'Yoon Young-suk', 'Minister of Health and Welfare', 'Health', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Choi Sang-mok -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0048_8990ead8', 'Choi Sang-mok', 'Minister of Land, Infrastructure and Transport', 'Transportation', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ahn Duk-geun -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0049_e3b9e8a1', 'Ahn Duk-geun', 'Minister of SMEs and Startups', 'Ministry of SMEs and Startups', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Choi Moon-soon -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0050_f6816816', 'Choi Moon-soon', 'Minister of Employment and Labor', 'Labor', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lee In-young -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0051_fd35ca94', 'Lee In-young', 'Minister of Gender Equality and Family', 'Ministry of Gender Equality and Family', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Moon Sung-wook -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0052_6baba20c', 'Moon Sung-wook', 'Minister of Patriots and Veterans Affairs', 'Ministry of Patriots and Veterans Affairs', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lee Sang-min -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0053_04ab71b5', 'Lee Sang-min', 'Minister of Food and Drug Safety', 'Ministry of Food and Drug Safety', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Salman bin Abdulaziz Al Saud -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0054_e060d1e4', 'Salman bin Abdulaziz Al Saud', 'King and Prime Minister', 'Royal Court', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mohammed bin Salman Al Saud -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0055_65f0a2cc', 'Mohammed bin Salman Al Saud', 'Crown Prince and Deputy Prime Minister', 'Crown Prince Court', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Khalid bin Salman Al Saud -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0056_6c943267', 'Khalid bin Salman Al Saud', 'Minister of Defense', 'Defense', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Faisal bin Farhan Al Saud -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0057_9cdc7f60', 'Faisal bin Farhan Al Saud', 'Minister of Foreign Affairs', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mohammed bin Abdullah Al-Jadaan -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0058_9a704b42', 'Mohammed bin Abdullah Al-Jadaan', 'Minister of Finance', 'Finance', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mohammed bin Abdulmalik Al-Sheikh -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0059_470c65ac', 'Mohammed bin Abdulmalik Al-Sheikh', 'Minister of Interior', 'Interior', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Waleed bin Ibrahim Al-Khuraiji -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0060_ab035bbf', 'Waleed bin Ibrahim Al-Khuraiji', 'Minister of Justice', 'Justice', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yasir bin Othman Al-Rumayyan -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0061_16d51b69', 'Yasir bin Othman Al-Rumayyan', 'Minister of Energy', 'Energy', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Abdullah bin Nasser Al-Khulaifi -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0062_f176b077', 'Abdullah bin Nasser Al-Khulaifi', 'Minister of National Guard', 'Ministry of National Guard', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ahmed bin Abdulrahman Al-Khatib -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0063_7eade14b', 'Ahmed bin Abdulrahman Al-Khatib', 'Minister of Hajj and Umrah', 'Ministry of Hajj and Umrah', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tawfiq bin Faisal Al-Rabiah -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0064_7b1a905a', 'Tawfiq bin Faisal Al-Rabiah', 'Minister of Health', 'Health', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Abdulrahman bin Abdulmohsin Al-Fadli -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0065_8901efb5', 'Abdulrahman bin Abdulmohsin Al-Fadli', 'Minister of Agriculture', 'Agriculture', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yousuf bin Ahmed Al-Othaimeen -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0066_c35e6136', 'Yousuf bin Ahmed Al-Othaimeen', 'Minister of Human Resources and Social Development', 'Ministry of Human Resources', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ahmed bin Aqeel Al-Khateeb -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0067_14b6d9d5', 'Ahmed bin Aqeel Al-Khateeb', 'Minister of Education', 'Education', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Abdulaziz bin Abdulmalik Al-Sheikh -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0068_94c951d0', 'Abdulaziz bin Abdulmalik Al-Sheikh', 'Minister of Islamic Affairs, Da''wa and Guidance', 'Ministry of Islamic Affairs', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Khalid bin Abdulaziz Al-Angary -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0069_59dc23f7', 'Khalid bin Abdulaziz Al-Angary', 'Minister of Higher Education and Scientific Research', 'Education', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Majed bin Abdullah Al-Qasabi -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0070_51b3a68b', 'Majed bin Abdullah Al-Qasabi', 'Minister of Commerce', 'Commerce', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ibrahim bin Abdulaziz Al-Assaf -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0071_bab5eb54', 'Ibrahim bin Abdulaziz Al-Assaf', 'Minister of State and former Finance Minister', 'Council of Ministers', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Suliman bin Abdullah Al-Hamdan -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0072_ea47e3c8', 'Suliman bin Abdullah Al-Hamdan', 'Minister of Transport and Logistics', 'Transportation', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Abdulaziz bin Khojah -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0073_4fbcc720', 'Abdulaziz bin Khojah', 'Minister of Culture', 'Ministry of Culture', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Javier Milei -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0074_c5fbf53d', 'Javier Milei', 'President', 'Casa Rosada', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Victoria Villarruel -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0075_809cca42', 'Victoria Villarruel', 'Vice President', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Manuel Adorni -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0076_0101ed73', 'Manuel Adorni', 'Chief of the Cabinet of Ministers', 'Casa Rosada', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Luis Caputo -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0077_4e07fb0c', 'Luis Caputo', 'Minister of Economy', 'Ministry of Economy', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Pablo Quirno -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0078_6f56aae7', 'Pablo Quirno', 'Minister of Foreign Affairs, International Trade and Worship', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Luis Petri -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0079_6cb5d803', 'Luis Petri', 'Minister of Defense', 'Defense', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Patricia Bullrich -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0080_b8fbfbd3', 'Patricia Bullrich', 'Minister of Security', 'Ministry of Security', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Santiago Caputo -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0081_57ddbb46', 'Santiago Caputo', 'Minister of Interior', 'Interior', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sebastián Amerio -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0082_bbf18669', 'Sebastián Amerio', 'Minister of Justice', 'Justice', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mario Lugones -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0083_ceca4b8d', 'Mario Lugones', 'Minister of Health', 'Health', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sandra Pettovello -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0084_75cd064b', 'Sandra Pettovello', 'Minister of Human Capital', 'Ministry of Human Capital', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Federico Sturzenegger -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0085_a8b254b5', 'Federico Sturzenegger', 'Minister of Deregulation and Transformation', 'Ministry of Deregulation', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Guillermo Ferreyra -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0086_82368085', 'Guillermo Ferreyra', 'Minister of Public Works', 'Ministry of Public Works', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Demián Reidel -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0087_7bf64f1d', 'Demián Reidel', 'Minister of Infrastructure', 'Ministry of Infrastructure', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Julio Bray -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0088_ab450e84', 'Julio Bray', 'Minister of Commerce', 'Commerce', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: José Luis Gioja -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0089_6b10277e', 'José Luis Gioja', 'Minister of Science, Technology and Innovation', 'Ministry of Science', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: María Alejandra Vicandi -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0090_81ea550f', 'María Alejandra Vicandi', 'Minister of Tourism', 'Ministry of Tourism', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Diego Rivarola -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0091_54206bd7', 'Diego Rivarola', 'Minister of Environment and Sustainable Development', 'Environment', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Recep Tayyip Erdoğan -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0092_9f3ca548', 'Recep Tayyip Erdoğan', 'President', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Cevdet Yılmaz -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0093_0c7963df', 'Cevdet Yılmaz', 'Vice President', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yılmaz Tunç -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0094_09f64081', 'Yılmaz Tunç', 'Minister of Justice', 'Justice', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mahinur Özdemir Göktaş -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0095_7df2590e', 'Mahinur Özdemir Göktaş', 'Minister of Family and Social Services', 'Ministry of Family and Social Services', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Vedat Işıkhan -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0096_41283f5d', 'Vedat Işıkhan', 'Minister of Labour and Social Security', 'Labor', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Murat Kurum -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0097_cd9c78d3', 'Murat Kurum', 'Minister of Environment, Urbanisation and Climate Change', 'Environment', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Hakan Fidan -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0098_34284920', 'Hakan Fidan', 'Minister of Foreign Affairs', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alparslan Bayraktar -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0099_e9a440cd', 'Alparslan Bayraktar', 'Minister of Energy and Natural Resources', 'Energy', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Osman Aşkın Bak -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0100_93232adb', 'Osman Aşkın Bak', 'Minister of Youth and Sports', 'Ministry of Youth and Sports', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mehmet Şimşek -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0101_b2868225', 'Mehmet Şimşek', 'Minister of Treasury and Finance', 'Finance', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ali Yerlikaya -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0102_f7e570f8', 'Ali Yerlikaya', 'Minister of the Interior', 'Interior', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mehmet Nuri Ersoy -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0103_34d81ad4', 'Mehmet Nuri Ersoy', 'Minister of Culture and Tourism', 'Ministry of Culture and Tourism', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yusuf Tekin -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0104_d2d7b201', 'Yusuf Tekin', 'Minister of National Education', 'Education', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yaşar Güler -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0105_cc0d5a76', 'Yaşar Güler', 'Minister of National Defense', 'Defense', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kemal Memişoğlu -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0106_785db5ea', 'Kemal Memişoğlu', 'Minister of Health', 'Health', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mehmet Fatih Kacır -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0107_ed0b8b70', 'Mehmet Fatih Kacır', 'Minister of Industry and Technology', 'Industry', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: İbrahim Yumaklı -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0108_7f883012', 'İbrahim Yumaklı', 'Minister of Agriculture and Forestry', 'Agriculture', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ömer Bolat -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0109_1a36c4fa', 'Ömer Bolat', 'Minister of Trade', 'Trade', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Abdulkadir Uraloğlu -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0110_fe68c0bc', 'Abdulkadir Uraloğlu', 'Minister of Transport and Infrastructure', 'Transportation', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Cyril Ramaphosa -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0111_c3a11c6d', 'Cyril Ramaphosa', 'President', 'The Presidency', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Paul Mashatile -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0112_d6efb0d5', 'Paul Mashatile', 'Deputy President', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Khumbudzo Ntshavheni -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0113_eb1c6f9e', 'Khumbudzo Ntshavheni', 'Minister in the Presidency', 'The Presidency', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sindisiwe Chikunga -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0114_f32a23be', 'Sindisiwe Chikunga', 'Minister in the Presidency - Women, Youth, Persons with Disabilities', 'The Presidency', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Enoch Godongwana -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0115_66612f5f', 'Enoch Godongwana', 'Minister of Finance', 'Finance', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mmamoloko Kubayi -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0116_dd9ea599', 'Mmamoloko Kubayi', 'Minister of Justice and Constitutional Development', 'Justice', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Thembi Simelane -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0117_be811879', 'Thembi Simelane', 'Minister of Human Settlements', 'Department of Human Settlements', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ronald Lamola -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0118_af73e37c', 'Ronald Lamola', 'Minister of International Relations and Cooperation', 'Department of International Relations', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Angie Motshekga -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0119_f674dad4', 'Angie Motshekga', 'Minister of Defence and Military Veterans', 'Defense', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Senzo Mchunu -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0120_c804ac08', 'Senzo Mchunu', 'Minister of Police', 'South African Police Service', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Aaron Motsoaledi -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0121_88b73fc9', 'Aaron Motsoaledi', 'Minister of Health', 'Health', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Siviwe Gwarube -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0122_8d750431', 'Siviwe Gwarube', 'Minister of Basic Education', 'Education', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Buti Manamela -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0123_28e03e23', 'Buti Manamela', 'Minister of Higher Education and Training', 'Education', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: John Steenhuisen -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0124_403c685c', 'John Steenhuisen', 'Minister of Agriculture', 'Agriculture', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Solly Malatsi -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0125_4f574f88', 'Solly Malatsi', 'Minister of Communications and Digital Technologies', 'Department of Communications', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Leon Schreiber -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0126_2ecf8897', 'Leon Schreiber', 'Minister of Home Affairs', 'Interior', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dean Macpherson -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0127_3e2fae6c', 'Dean Macpherson', 'Minister of Public Works and Infrastructure', 'Department of Public Works', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Willie Aucamp -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0128_00c45fe3', 'Willie Aucamp', 'Minister of Forestry, Fisheries and the Environment', 'Environment', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mzwanele Nyhontso -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0129_36faba4c', 'Mzwanele Nyhontso', 'Minister of Land Reform and Rural Development', 'Department of Land Reform', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gwede Mantashe -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0130_f7e1e915', 'Gwede Mantashe', 'Minister of Mineral and Petroleum Resources', 'Department of Mineral Resources', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kgosientsho Ramokgopa -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0131_3e8d929d', 'Kgosientsho Ramokgopa', 'Minister of Electricity and Energy', 'Energy', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Nomakhosazana Meth -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0132_1b0f52ab', 'Nomakhosazana Meth', 'Minister of Employment and Labour', 'Labor', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Barbara Creecy -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0133_308a893f', 'Barbara Creecy', 'Minister of Transport', 'Transportation', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Parks Tau -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0134_d464f06a', 'Parks Tau', 'Minister of Trade, Industry and Competition', 'Trade', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Pemmy Majodina -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0135_30c383fb', 'Pemmy Majodina', 'Minister of Water and Sanitation', 'Department of Water and Sanitation', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Stella Ndabeni-Abrahams -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0136_42b47cf1', 'Stella Ndabeni-Abrahams', 'Minister of Small Business Development', 'Department of Small Business Development', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sisisi Tolashe -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0137_20063528', 'Sisisi Tolashe', 'Minister of Social Development', 'Department of Social Development', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gayton McKenzie -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0138_5d095115', 'Gayton McKenzie', 'Minister of Sports, Arts and Culture', 'Department of Sports, Arts and Culture', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Patricia de Lille -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0139_f3ceadc2', 'Patricia de Lille', 'Minister of Tourism', 'Department of Tourism', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Blade Nzimande -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0140_bca86188', 'Blade Nzimande', 'Minister of Science, Technology and Innovation', 'Department of Science and Innovation', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Velenkosini Hlabisa -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0141_9da64f6b', 'Velenkosini Hlabisa', 'Minister of Cooperative Governance and Traditional Affairs', 'Department of Cooperative Governance', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Pieter Groenewald -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0142_1a1cee0d', 'Pieter Groenewald', 'Minister of Correctional Services', 'Department of Correctional Services', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mzamo Buthelezi -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0143_15d8fdf5', 'Mzamo Buthelezi', 'Minister of Public Service and Administration', 'Department of Public Service and Administration', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Maropene Ramokgopa -  - Cabinet Ministers
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0144_79ffc663', 'Maropene Ramokgopa', 'Minister of Planning, Monitoring and Evaluation', 'Department of Planning, Monitoring and Evaluation', (SELECT id FROM organisations WHERE name = ' - Cabinet Ministers'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - National Assembly
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0145_74c4a465', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - National Assembly'), true)
ON CONFLICT DO NOTHING;

-- Contact: Speaker's Office -  - National Assembly
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0146_766a0622', 'Speaker''s Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - National Assembly'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - National Assembly
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0147_5dd2ad37', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - National Assembly'), true)
ON CONFLICT DO NOTHING;

-- Contact: Public Inquiries -  - National Assembly
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0148_b7b93352', 'Public Inquiries', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - National Assembly'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the President -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0149_b2754aad', 'Office of the President', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the Prime Minister -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0150_c67e995f', 'Office of the Prime Minister', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Press and Media Centre -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0151_845a9cc6', 'Press and Media Centre', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0152_28abdcae', 'Main Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the King -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0153_64a3c858', 'Office of the King', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Crown Prince Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0154_b80cab53', 'Crown Prince Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Press and Media Centre -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0155_c3945e1b', 'Press and Media Centre', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Vision 2030 Coordination -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0156_607ff08a', 'Vision 2030 Coordination', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bürgertelefon -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0157_0aac7ddb', 'Bürgertelefon', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Public Inquiries -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0158_97fca778', 'Public Inquiries', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the President -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0159_f083c900', 'Office of the President', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Cabinet Secretariat -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0160_7bd1d992', 'Cabinet Secretariat', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ministry of Foreign Affairs -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0161_193d6707', 'Ministry of Foreign Affairs', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: State Personnel Agency -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0162_65ef0360', 'State Personnel Agency', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the President -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0163_0fde7bb5', 'Office of the President', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0164_ce3b1025', 'Main Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Press Centre -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0165_d242268f', 'Press Centre', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: General Inquiries -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0166_13f5b4a5', 'General Inquiries', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the Prime Minister -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0167_a706d1e8', 'Office of the Prime Minister', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: General Inquiries -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0168_ab57328f', 'General Inquiries', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: General Information -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0169_9521b02f', 'General Information', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: General Inquiries -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0170_23242e21', 'General Inquiries', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the President -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0171_13e41ec3', 'Office of the President', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Vice President Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0172_cd759414', 'Vice President Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Press and Media Centre -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0173_c528ced5', 'Press and Media Centre', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0174_6fc87bff', 'Main Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Presidential Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0175_0d7fc425', 'Presidential Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Vice Presidential Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0176_522bc162', 'Vice Presidential Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Press and Media Centre -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0177_8d50f5e2', 'Press and Media Centre', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0178_be9e620d', 'Main Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the Prime Minister -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0179_f333e945', 'Office of the Prime Minister', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Citizen Services -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0180_772e5f2c', 'Citizen Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the President -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0181_3c971b49', 'Office of the President', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the President -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0182_f0eb505f', 'Office of the President', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Presidential Hotline -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0183_470f53cd', 'Presidential Hotline', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0184_787e6564', 'Main Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Government Information -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0185_f9dd1fdc', 'Government Information', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the President -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0186_8e22dc91', 'Office of the President', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chief of Staff Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0187_9ff0ebfb', 'Chief of Staff Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ministry of Foreign Affairs -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0188_aaeddbe4', 'Ministry of Foreign Affairs', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Attorney General's Office -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0189_5e236d50', 'Attorney General''s Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the President -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0190_72c1fb53', 'Office of the President', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Citizen Services Hotline -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0191_954a01c6', 'Citizen Services Hotline', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Government Information -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0192_1a13eed5', 'Government Information', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Federal Judiciary -  - Government Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0193_2b50cf1a', 'Federal Judiciary', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Government Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Shura Council
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0194_a0fcef89', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Shura Council'), true)
ON CONFLICT DO NOTHING;

-- Contact: Secretary General -  - Shura Council
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0195_33c91c9b', 'Secretary General', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Shura Council'), true)
ON CONFLICT DO NOTHING;

-- Contact: Public Services -  - Shura Council
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0196_2730fb80', 'Public Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Shura Council'), true)
ON CONFLICT DO NOTHING;

-- Contact: Friedrich Merz -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0197_c6275aca', 'Friedrich Merz', 'Chancellor', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lars Klingbeil -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0198_80292fe0', 'Lars Klingbeil', 'Vice Chancellor & Finance Minister', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alexander Dobrindt -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0199_c327aa29', 'Alexander Dobrindt', 'Federal Minister of the Interior', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Johann Wadephul -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0200_33ab6d0d', 'Johann Wadephul', 'Federal Minister for Foreign Affairs', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Johann Wadephul -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0201_88201092', 'Johann Wadephul', 'Federal Minister for Foreign Affairs', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Boris Pistorius -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0202_21c0891f', 'Boris Pistorius', 'Federal Minister of Defence', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Katherina Reiche -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0203_c984878f', 'Katherina Reiche', 'Federal Minister for Economic Affairs and Energy', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dorothee Bär -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0204_ead75ded', 'Dorothee Bär', 'Federal Minister of Research, Technology and Space', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Stefanie Hubig -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0205_aa2d31aa', 'Stefanie Hubig', 'Federal Minister of Justice and Consumer Protection', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Karin Prien -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0206_2ef747f5', 'Karin Prien', 'Federal Minister for Education, Family Affairs, Senior Citizens, Women and Youth', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bärbel Bas -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0207_5b3f76c5', 'Bärbel Bas', 'Federal Minister of Labour and Social Affairs', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Karsten Wildberger -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0208_c8048990', 'Karsten Wildberger', 'Federal Minister for Digital Transformation and Government Modernisation', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Patrick Schnieder -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0209_7618bccd', 'Patrick Schnieder', 'Federal Minister for Transport', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Carsten Schneider -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0210_7fb6c511', 'Carsten Schneider', 'Federal Minister for the Environment, Climate Action, Nature Conservation and Nuclear Safety', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Nina Warken -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0211_84cea1f3', 'Nina Warken', 'Federal Minister of Health', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alois Rainer -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0212_9cec0e0d', 'Alois Rainer', 'Federal Minister of Agriculture, Food and Regional Identity', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Reem Alabali-Radovan -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0213_2641ae63', 'Reem Alabali-Radovan', 'Federal Minister for Economic Cooperation and Development', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Verena Hubertz -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0214_363f4ca5', 'Verena Hubertz', 'Federal Minister for Housing, Urban Development and Building', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Thorsten Frei -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0215_2ab88cde', 'Thorsten Frei', 'Federal Minister for Special Affairs & Head of the Chancellery', NULL, (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Giorgia Meloni -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0216_ed480d98', 'Giorgia Meloni', 'Prime Minister', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Antonio Tajani -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0217_7e272a66', 'Antonio Tajani', 'Deputy Prime Minister & Minister of Foreign Affairs', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Matteo Salvini -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0218_a13f1e97', 'Matteo Salvini', 'Deputy Prime Minister & Minister of Infrastructure and Transport', 'Transportation', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Matteo Piantedosi -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0219_b19501b3', 'Matteo Piantedosi', 'Minister of the Interior', 'Interior', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Carlo Nordio -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0220_b95f868d', 'Carlo Nordio', 'Minister of Justice', 'Justice', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Guido Crosetto -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0221_b12d4af1', 'Guido Crosetto', 'Minister of Defence', 'Defense', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Giancarlo Giorgetti -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0222_bd6ffa9e', 'Giancarlo Giorgetti', 'Minister of Economy and Finance', 'Finance', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Adolfo Urso -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0223_c580ff75', 'Adolfo Urso', 'Minister of Business and Made in Italy', 'Ministry of Business and Made in Italy', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Francesco Lollobrigida -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0224_79ed8368', 'Francesco Lollobrigida', 'Minister of Agriculture, Food Sovereignty and Forests', 'Agriculture', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gilberto Pichetto Fratin -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0225_11103717', 'Gilberto Pichetto Fratin', 'Minister for the Environment and Energy Security', 'Environment', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marina Elvira Calderone -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0226_b7cba64a', 'Marina Elvira Calderone', 'Minister of Labour and Social Policies', 'Labor', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Giuseppe Valditara -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0227_78a67617', 'Giuseppe Valditara', 'Minister of Education and Merit', 'Education', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Anna Maria Bernini -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0228_2cea6e1e', 'Anna Maria Bernini', 'Minister of University and Research', 'Ministry of University and Research', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alessandro Giuli -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0229_594beded', 'Alessandro Giuli', 'Minister of Culture', 'Ministry of Culture', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Orazio Schillaci -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0230_d7ca5630', 'Orazio Schillaci', 'Minister of Health', 'Health', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Daniela Santanchè -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0231_ae4a5d49', 'Daniela Santanchè', 'Minister of Tourism', 'Ministry of Tourism', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Luca Ciriani -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0232_b6b13427', 'Luca Ciriani', 'Minister for Relations with Parliament', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Paolo Zangrillo -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0233_858b253d', 'Paolo Zangrillo', 'Minister for Public Administration', 'Ministry for Public Administration', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Roberto Calderoli -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0234_51f7c739', 'Roberto Calderoli', 'Minister for Regional Affairs and Autonomies', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Nello Musumeci -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0235_1e6c0014', 'Nello Musumeci', 'Minister for Civil Protection and Maritime Policies', 'Civil Protection Department', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tommaso Foti -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0236_97d62163', 'Tommaso Foti', 'Minister for European Affairs, Southern Italy & Cohesion Policy', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Andrea Abodi -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0237_4f6e5bf0', 'Andrea Abodi', 'Minister for Sport and Youth', 'Ministry of Sport', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Eugenia Roccella -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0238_f2e658a7', 'Eugenia Roccella', 'Minister for Family, Birth Rate and Equal Opportunities', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alessandra Locatelli -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0239_f73a599a', 'Alessandra Locatelli', 'Minister for Disabilities', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Elisabetta Casellati -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0240_faa6ae1f', 'Elisabetta Casellati', 'Minister for Institutional Reforms and Regulatory Simplification', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alfredo Mantovano -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0241_1cd45afc', 'Alfredo Mantovano', 'Secretary of the Council of Ministers', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Claudia Sheinbaum Pardo -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0242_842ad43d', 'Claudia Sheinbaum Pardo', 'President of Mexico', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Juan Ramón de la Fuente -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0243_9aba86b4', 'Juan Ramón de la Fuente', 'Secretary of Foreign Affairs', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marcelo Ebrard Casaubón -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0244_1b333d38', 'Marcelo Ebrard Casaubón', 'Secretary of Economy', 'Ministry of Economy (SE)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rogelio Ramírez de la O -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0245_1c85f263', 'Rogelio Ramírez de la O', 'Secretary of Finance and Public Credit', 'Finance', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rosa Icela Rodríguez Mixtega -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0246_6d4b9b70', 'Rosa Icela Rodríguez Mixtega', 'Secretary of Government', 'Ministry of Government (SEGOB)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Omar García Harfuch -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0247_027bb2dc', 'Omar García Harfuch', 'Secretary of Security and Civilian Protection', 'Ministry of Security (SSPC)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Luis Cresencio Sandoval González -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0248_af65fce3', 'Luis Cresencio Sandoval González', 'Secretary of National Defence', 'Defense', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Iván Martín Olivares Bonilla -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0249_53091899', 'Iván Martín Olivares Bonilla', 'Secretary of the Navy', 'Ministry of the Navy (SEMAR)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mario Delgado -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0250_ee4a1849', 'Mario Delgado', 'Secretary of Public Education', 'Education', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Luz Elena González Escobar -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0251_249c5e46', 'Luz Elena González Escobar', 'Secretary of Energy', 'Energy', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ariadna Montiel Reyes -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0252_d2766863', 'Ariadna Montiel Reyes', 'Secretary of Welfare', 'Ministry of Welfare (BIENESTAR)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Salomón Jara Cruz -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0253_5db8a51b', 'Salomón Jara Cruz', 'Secretary of Health', 'Health', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marath Baruch Bolaños López -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0254_f2097365', 'Marath Baruch Bolaños López', 'Secretary of Labour and Social Welfare', 'Labor', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Adenauer Hernández García -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0255_aa03b38b', 'Adenauer Hernández García', 'Secretary of Agricultural Development', 'Ministry of Agricultural Development (SADER)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rosaura Ruiz Gutiérrez -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0256_68418d22', 'Rosaura Ruiz Gutiérrez', 'Secretary of Environment and Natural Resources', 'Environment', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Julio Berdegué Sacristán -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0257_a8ffbdc5', 'Julio Berdegué Sacristán', 'Secretary of Agrarian, Territorial and Urban Development', 'Ministry of Agrarian Development (SEDATU)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jesús Antonio Esteva Medina -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0258_40a18609', 'Jesús Antonio Esteva Medina', 'Secretary of Communications', 'Ministry of Communications (SCT)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gisela Gutiérrez de la Torre -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0259_149e06af', 'Gisela Gutiérrez de la Torre', 'Secretary of Culture', 'Ministry of Culture (SC)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kathia Barrera Peña -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0260_6fecd603', 'Kathia Barrera Peña', 'Secretary of Tourism', 'Ministry of Tourism (SECTUR)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sergio González López -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0261_9610e3c8', 'Sergio González López', 'Secretary of Sport', 'Ministry of Sport (CONADE)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Scheherazade Sahagún -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0262_218995ed', 'Scheherazade Sahagún', 'Head of the Civil Service', 'Ministry of Public Administration (SFP)', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jaime Cárdenas Gracia -  - Federal Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0263_7f53b713', 'Jaime Cárdenas Gracia', 'Coordinator of Legal Advisors', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Federal Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Bundestag Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0264_21845511', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Bundestag Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: General Inquiries -  - Bundestag Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0265_590aaf07', 'General Inquiries', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Bundestag Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Donald J. Trump - US - President
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0266_ebb99e7c', 'Donald J. Trump', 'President', NULL, (SELECT id FROM organisations WHERE name = 'US - President'), true)
ON CONFLICT DO NOTHING;

-- Contact: JD Vance - US - President
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0267_1ec7b602', 'JD Vance', 'Vice President', NULL, (SELECT id FROM organisations WHERE name = 'US - President'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tommy Tuberville - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0268_eb845001', 'Tommy Tuberville', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Katie Britt - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0269_3b624f8c', 'Katie Britt', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dan Sullivan - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0270_1bb8d8dc', 'Dan Sullivan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lisa Murkowski - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0271_04bc8441', 'Lisa Murkowski', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kyrsten Sinema - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0272_e803f0cc', 'Kyrsten Sinema', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mark Kelly - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0273_9b559dd6', 'Mark Kelly', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tom Cotton - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0274_0d28a880', 'Tom Cotton', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: J.D. Vance - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0275_d0f80e2a', 'J.D. Vance', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dianne Feinstein - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0276_a8370c97', 'Dianne Feinstein', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alex Padilla - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0277_bbf20fe6', 'Alex Padilla', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Michael Bennet - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0278_29ca92d9', 'Michael Bennet', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: John Hickenlooper - US - Senators - AL to CO
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0279_009ba127', 'John Hickenlooper', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - AL to CO'), true)
ON CONFLICT DO NOTHING;

-- Contact: Richard Blumenthal - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0280_d59e318c', 'Richard Blumenthal', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chris Murphy - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0281_8fa366a5', 'Chris Murphy', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tom Carper - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0282_4767c789', 'Tom Carper', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chris Coons - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0283_f1db9d2f', 'Chris Coons', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marco Rubio - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0284_8393287e', 'Marco Rubio', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rick Scott - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0285_d2310ee9', 'Rick Scott', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jon Ossoff - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0286_8f1d406c', 'Jon Ossoff', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Raphael Warnock - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0287_9143b385', 'Raphael Warnock', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mazie Hirono - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0288_86ec7639', 'Mazie Hirono', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Brian Schatz - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0289_8cdf7ee7', 'Brian Schatz', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mike Crapo - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0290_72792d1e', 'Mike Crapo', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jim Risch - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0291_1fb9ec36', 'Jim Risch', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dick Durbin - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0292_91f2c4df', 'Dick Durbin', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tammy Duckworth - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0293_fc4c03de', 'Tammy Duckworth', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Todd Young - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0294_4517141f', 'Todd Young', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mike Braun - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0295_06dcedb4', 'Mike Braun', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chuck Grassley - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0296_f2625ddf', 'Chuck Grassley', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Joni Ernst - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0297_b21a10a3', 'Joni Ernst', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jerry Moran - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0298_9471f2c9', 'Jerry Moran', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Roger Marshall - US - Senators - CT to KS
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0299_96c21fa2', 'Roger Marshall', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - CT to KS'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rand Paul - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0300_499919fe', 'Rand Paul', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mitch McConnell - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0301_16f2213a', 'Mitch McConnell', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: John Kennedy - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0302_5e3085d1', 'John Kennedy', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bill Cassidy - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0303_d2c80378', 'Bill Cassidy', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Angus King - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0304_be527465', 'Angus King', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Susan Collins - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0305_13465938', 'Susan Collins', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ben Cardin - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0306_b1a82efe', 'Ben Cardin', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chris Van Hollen - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0307_3d9f553b', 'Chris Van Hollen', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Elizabeth Warren - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0308_260d4f54', 'Elizabeth Warren', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ed Markey - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0309_379efe82', 'Ed Markey', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Debbie Stabenow - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0310_9f6595c9', 'Debbie Stabenow', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gary Peters - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0311_9914c671', 'Gary Peters', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Amy Klobuchar - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0312_1a38c04e', 'Amy Klobuchar', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tina Smith - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0313_03aa19b7', 'Tina Smith', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Cindy Hyde-Smith - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0314_4c271139', 'Cindy Hyde-Smith', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Roger Wicker - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0315_110476ed', 'Roger Wicker', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Josh Hawley - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0316_9d1fa54a', 'Josh Hawley', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Eric Schmitt - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0317_70c6f276', 'Eric Schmitt', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jon Tester - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0318_40b4545b', 'Jon Tester', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Steve Daines - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0319_4c0bb5e9', 'Steve Daines', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Deb Fischer - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0320_c7cb4e77', 'Deb Fischer', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Pete Ricketts - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0321_c48caa9a', 'Pete Ricketts', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jacky Rosen - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0322_760debe4', 'Jacky Rosen', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Catherine Cortez Masto - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0323_9d52d776', 'Catherine Cortez Masto', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Maggie Hassan - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0324_866ad903', 'Maggie Hassan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jeanne Shaheen - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0325_650efb48', 'Jeanne Shaheen', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bob Menendez - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0326_b875edc8', 'Bob Menendez', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Cory Booker - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0327_77240e8f', 'Cory Booker', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Martin Heinrich - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0328_30b1199e', 'Martin Heinrich', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ben Ray Lujan - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0329_85257c0d', 'Ben Ray Lujan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kirsten Gillibrand - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0330_cbb86859', 'Kirsten Gillibrand', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chuck Schumer - US - Senators - KY to NY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0331_14d30be2', 'Chuck Schumer', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - KY to NY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Thom Tillis - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0332_76d126f8', 'Thom Tillis', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ted Budd - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0333_5efdeb4c', 'Ted Budd', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kevin Cramer - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0334_46796a32', 'Kevin Cramer', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: John Hoeven - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0335_c587feb4', 'John Hoeven', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sherrod Brown - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0336_7206a087', 'Sherrod Brown', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: JD Vance - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0337_8efd00ad', 'JD Vance', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: James Lankford - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0338_6fca1b48', 'James Lankford', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Markwayne Mullin - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0339_af975979', 'Markwayne Mullin', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ron Wyden - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0340_fc8cab85', 'Ron Wyden', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jeff Merkley - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0341_49c124c5', 'Jeff Merkley', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bob Casey - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0342_b1de7af9', 'Bob Casey', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Pat Toomey - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0343_43a76018', 'Pat Toomey', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sheldon Whitehouse - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0344_e9c97e31', 'Sheldon Whitehouse', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jack Reed - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0345_159f612c', 'Jack Reed', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lindsey Graham - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0346_f19d67b6', 'Lindsey Graham', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tim Scott - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0347_85bf646a', 'Tim Scott', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: John Thune - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0348_6f80888b', 'John Thune', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mike Rounds - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0349_a6695318', 'Mike Rounds', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lamar Alexander - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0350_309e1ad6', 'Lamar Alexander', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marsha Blackburn - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0351_c944ab9d', 'Marsha Blackburn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: John Cornyn - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0352_cb0cf406', 'John Cornyn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ted Cruz - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0353_5b2d3ef1', 'Ted Cruz', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mitt Romney - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0354_6e442131', 'Mitt Romney', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mike Lee - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0355_1a657150', 'Mike Lee', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bernie Sanders - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0356_d2accfe5', 'Bernie Sanders', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Peter Welch - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0357_c7f27b49', 'Peter Welch', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mark Warner - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0358_38b98a99', 'Mark Warner', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tim Kaine - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0359_7ba69357', 'Tim Kaine', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Patty Murray - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0360_50e3f497', 'Patty Murray', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Maria Cantwell - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0361_7a594db2', 'Maria Cantwell', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Joe Manchin - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0362_aedd8787', 'Joe Manchin', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Shelley Moore Capito - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0363_a56e755a', 'Shelley Moore Capito', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ron Johnson - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0364_dd3fd633', 'Ron Johnson', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tammy Baldwin - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0365_ab03918a', 'Tammy Baldwin', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: John Barrasso - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0366_95b005f9', 'John Barrasso', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Cynthia Lummis - US - Senators - NC to WY
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0367_26f75d1d', 'Cynthia Lummis', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Senators - NC to WY'), true)
ON CONFLICT DO NOTHING;

-- Contact: Senate General Address - US - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0368_7a9460da', 'Senate General Address', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Capitol Switchboard - US - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0369_eb6b6cc2', 'Capitol Switchboard', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: President Email - US - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0370_14cf78dd', 'President Email', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: President Contact Form - US - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0371_3f5e2603', 'President Contact Form', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Senate Directory - US - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0372_e06fc466', 'Senate Directory', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Find Your Senators - US - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0373_bede7197', 'Find Your Senators', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Individual Senator Sites - US - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0374_4a89d2a4', 'Individual Senator Sites', NULL, NULL, (SELECT id FROM organisations WHERE name = 'US - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mahmoud Ali Youssouf - African Union - AU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0375_8a09278a', 'Mahmoud Ali Youssouf', 'Chairperson', 'Executive Leadership', (SELECT id FROM organisations WHERE name = 'African Union - AU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Selma Malika Haddadi - African Union - AU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0376_4d91cbe2', 'Selma Malika Haddadi', 'Deputy Chairperson', 'Executive Leadership', (SELECT id FROM organisations WHERE name = 'African Union - AU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bankole Adeoye - African Union - AU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0377_e95714c2', 'Bankole Adeoye', 'Commissioner', 'Political Affairs, Peace and Security', (SELECT id FROM organisations WHERE name = 'African Union - AU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kwesi Quartey - African Union - AU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0378_b7beb747', 'Kwesi Quartey', 'Commissioner', 'Social Affairs, Human Rights and Humanitarian Affairs', (SELECT id FROM organisations WHERE name = 'African Union - AU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Amira El Fadil Mohammed - African Union - AU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0379_3a134659', 'Amira El Fadil Mohammed', 'Commissioner', 'Trade', (SELECT id FROM organisations WHERE name = 'African Union - AU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Francisca Tatchouop Belobe - African Union - AU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0380_c3bdc292', 'Francisca Tatchouop Belobe', 'Commissioner', 'Trade', (SELECT id FROM organisations WHERE name = 'African Union - AU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Stella Oduah - African Union - AU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0381_f3ad0eb6', 'Stella Oduah', 'Commissioner', 'Energy', (SELECT id FROM organisations WHERE name = 'African Union - AU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gaspard Banyankimbona - African Union - AU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0382_2244e8c1', 'Gaspard Banyankimbona', 'Commissioner', 'Education', (SELECT id FROM organisations WHERE name = 'African Union - AU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception - African Union - Pan-African Parliament
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0383_974aa839', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = 'African Union - Pan-African Parliament'), true)
ON CONFLICT DO NOTHING;

-- Contact: President's Office - African Union - Pan-African Parliament
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0384_fc2a89d1', 'President''s Office', NULL, NULL, (SELECT id FROM organisations WHERE name = 'African Union - Pan-African Parliament'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services - African Union - Pan-African Parliament
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0385_b67125d8', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = 'African Union - Pan-African Parliament'), true)
ON CONFLICT DO NOTHING;

-- Contact: Public Information - African Union - Pan-African Parliament
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0386_b7a346d4', 'Public Information', NULL, NULL, (SELECT id FROM organisations WHERE name = 'African Union - Pan-African Parliament'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception - African Union - AU Headquarters Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0387_78ee42ce', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = 'African Union - AU Headquarters Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Office of the Chairperson - African Union - AU Headquarters Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0388_e70fa291', 'Office of the Chairperson', NULL, NULL, (SELECT id FROM organisations WHERE name = 'African Union - AU Headquarters Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Information and Communication - African Union - AU Headquarters Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0389_ef4a807c', 'Information and Communication', NULL, NULL, (SELECT id FROM organisations WHERE name = 'African Union - AU Headquarters Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Office - African Union - AU Headquarters Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0390_686f4b0d', 'Main Office', NULL, NULL, (SELECT id FROM organisations WHERE name = 'African Union - AU Headquarters Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Prabowo Subianto -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0391_defc3f0f', 'Prabowo Subianto', 'President', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gibran Rakabuming Raka -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0392_ae7192e0', 'Gibran Rakabuming Raka', 'Vice President', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Budi Gunawan -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0393_3df37378', 'Budi Gunawan', 'Coordinating Minister for Political and Security Affairs', 'Coordinating Ministry', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yusril Ihza Mahendra -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0394_84b9fe4d', 'Yusril Ihza Mahendra', 'Coordinating Minister for Legal, Human Rights, Immigration, and Corrections Affairs', 'Coordinating Ministry', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Airlangga Hartarto -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0395_201028d5', 'Airlangga Hartarto', 'Coordinating Minister for Economic Affairs', 'Coordinating Ministry', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Pratikno -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0396_f26e551f', 'Pratikno', 'Coordinating Minister for Human Development and Cultural Affairs', 'Coordinating Ministry', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Luhut Binsar Pandjaitan -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0397_caf71b51', 'Luhut Binsar Pandjaitan', 'Coordinating Minister for Maritime and Investment Affairs', 'Coordinating Ministry', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sri Mulyani Indrawati -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0398_f99e7ea1', 'Sri Mulyani Indrawati', 'Minister of Finance', 'Finance', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Prabowo Subianto -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0399_a73f9e8b', 'Prabowo Subianto', 'Minister of Defence', 'Defense', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sugiyanto -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0400_8eb026c6', 'Sugiyanto', 'Minister of Home Affairs', 'Interior', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Retno Marsudi -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0401_541b62b8', 'Retno Marsudi', 'Minister of Foreign Affairs', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Budi Gunadi Sadikin -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0402_cd473ef7', 'Budi Gunadi Sadikin', 'Minister of Health', 'Health', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Abdul Mu'ti -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0403_8c82a722', 'Abdul Mu''ti', 'Minister of Primary and Secondary Education', 'Education', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Satryo Soemantri Brodjonegoro -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0404_c3227d85', 'Satryo Soemantri Brodjonegoro', 'Minister of Higher Education, Science, and Technology', 'Education', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Andi Amran Sulaiman -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0405_0af65da6', 'Andi Amran Sulaiman', 'Minister of Agriculture', 'Agriculture', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sakti Wahyu Trenggono -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0406_35a07e9a', 'Sakti Wahyu Trenggono', 'Minister of Maritime Affairs and Fisheries', 'Ministry of Maritime Affairs', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bahlil Lahadalia -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0407_b7b8adbb', 'Bahlil Lahadalia', 'Minister of Energy and Mineral Resources', 'Energy', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Zulkifli Hasan -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0408_546eb667', 'Zulkifli Hasan', 'Minister of Trade', 'Trade', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Agus Gumiwang Kartasasmita -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0409_ec0d622d', 'Agus Gumiwang Kartasasmita', 'Minister of Industry', 'Industry', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Natalius Pigai -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0410_8409750a', 'Natalius Pigai', 'Minister of Human Rights', 'Ministry of Human Rights', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Raden Dodi Hanggodo -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0411_c7068b43', 'Raden Dodi Hanggodo', 'Minister of Public Works and Housing', 'Ministry of Public Works', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yandri Susanto -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0412_ec637af5', 'Yandri Susanto', 'Minister of Villages, Disadvantaged Regions, and Regional Development', 'Ministry of Villages', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Fadli Zon -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0413_b64dc90b', 'Fadli Zon', 'Minister of Culture', 'Ministry of Culture', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bidadi Awt Saw -  - Red and White Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0414_a73a8b4a', 'Bidadi Awt Saw', 'Cabinet Secretary', 'Cabinet Secretariat', (SELECT id FROM organisations WHERE name = ' - Red and White Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0415_1bf5d986', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0416_a74019f3', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0417_432716b3', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0418_99da1635', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0419_71e37d7e', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0420_c86cfff6', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Citizen Services Hotline -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0421_d9cd6b4c', 'Citizen Services Hotline', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Public Information -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0422_82ca68ab', 'Public Information', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0423_56d94c83', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0424_f48decd5', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0425_04256267', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0426_c9164307', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0427_7f42cfab', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0428_3990247e', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Legislative Services -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0429_e4ca05a3', 'Legislative Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Legislative Services -  - Parliament Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0430_576ed446', 'Legislative Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Parliament Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Vladimir Putin -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0431_a58792c4', 'Vladimir Putin', 'President', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mikhail Mishustin -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0432_cba00649', 'Mikhail Mishustin', 'Prime Minister', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Denis Manturov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0433_d381d609', 'Denis Manturov', 'First Deputy Prime Minister', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dmitry Grigorenko -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0434_53314b6f', 'Dmitry Grigorenko', 'Deputy Prime Minister & Chief of Staff', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yury Trutnev -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0435_804cbb1c', 'Yury Trutnev', 'Deputy Prime Minister & Presidential Envoy Far East', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dmitry Patrushev -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0436_f96348ce', 'Dmitry Patrushev', 'Deputy PM for Agro-Industrial & Ecology', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alexey Overchuk -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0437_0c9e4cf4', 'Alexey Overchuk', 'Deputy PM for Eurasian Integration', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alexander Novak -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0438_e7d3e536', 'Alexander Novak', 'Deputy PM for Energy & Economy', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marat Khusnullin -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0439_07fbe0d4', 'Marat Khusnullin', 'Deputy PM for Construction & Regional Policy', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tatyana Golikova -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0440_3ce0626c', 'Tatyana Golikova', 'Deputy PM for Social Policy', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dmitry Chernyshenko -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0441_4e00d803', 'Dmitry Chernyshenko', 'Deputy PM for Tourism, Sport & Culture', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Vitaly Savelyev -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0442_14b6dd30', 'Vitaly Savelyev', 'Deputy PM for Transport', 'Government of Russia', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sergey Lavrov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0443_919b141e', 'Sergey Lavrov', 'Minister of Foreign Affairs', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Anton Siluanov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0444_27deac4d', 'Anton Siluanov', 'Minister of Finance', 'Finance', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Andrey Belousov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0445_f171473f', 'Andrey Belousov', 'Minister of Defence', 'Defense', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Vladimir Kolokoltsev -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0446_382ff37e', 'Vladimir Kolokoltsev', 'Minister of Internal Affairs', 'Ministry of Internal Affairs', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Konstantin Chuychenko -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0447_7febbce7', 'Konstantin Chuychenko', 'Minister of Justice', 'Justice', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mikhail Murashko -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0448_1cc42945', 'Mikhail Murashko', 'Minister of Health', 'Health', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sergey Kravtsov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0449_f59d930a', 'Sergey Kravtsov', 'Minister of Education', 'Education', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Valery Falkov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0450_c16b1514', 'Valery Falkov', 'Minister of Science & Higher Education', 'Education', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Maxim Reshetnikov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0451_fa4646a5', 'Maxim Reshetnikov', 'Minister of Economic Development', 'Ministry of Economic Development', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Anton Alikhanov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0452_470d98ba', 'Anton Alikhanov', 'Minister of Industry and Trade', 'Trade', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sergey Tsivilyov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0453_1f532275', 'Sergey Tsivilyov', 'Minister of Energy', 'Energy', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alexander Kozlov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0454_bf9d3d37', 'Alexander Kozlov', 'Minister of Natural Resources & Ecology', 'Ministry of Natural Resources', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Oksana Lut -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0455_a1014a6d', 'Oksana Lut', 'Minister of Agriculture', 'Agriculture', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Irek Faizullin -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0456_7dd8357c', 'Irek Faizullin', 'Minister of Construction & Housing', 'Ministry of Construction', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Olga Lyubimova -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0457_b2cfd6ad', 'Olga Lyubimova', 'Minister of Culture', 'Ministry of Culture', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mikhail Degtyarev -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0458_f5fecf34', 'Mikhail Degtyarev', 'Minister of Sport', 'Ministry of Sport', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Maksut Shadayev -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0459_732a480d', 'Maksut Shadayev', 'Minister of Digital Development & Media', 'Ministry of Digital Development', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Anton Kotyakov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0460_804ca6b3', 'Anton Kotyakov', 'Minister of Labour & Social Protection', 'Labor', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Aleksandr Kurenkov -  - Mishustin Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0461_dec42367', 'Aleksandr Kurenkov', 'Minister of Emergency Situations', 'Ministry of Emergency Situations', (SELECT id FROM organisations WHERE name = ' - Mishustin Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Federal Assembly Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0462_b474eba0', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Federal Assembly Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Federal Assembly Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0463_7911b05d', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Federal Assembly Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Citizen Inquiries -  - Federal Assembly Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0464_8cbed08f', 'Citizen Inquiries', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Federal Assembly Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - Federal Assembly Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0465_cc227af5', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Federal Assembly Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sanae Takaichi -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0466_0535f0ca', 'Sanae Takaichi', 'Prime Minister', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Minoru Kihara -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0467_7f865f0e', 'Minoru Kihara', 'Chief Cabinet Secretary', 'Cabinet Secretariat', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yoshimasa Hayashi -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0468_53770468', 'Yoshimasa Hayashi', 'Minister for Internal Affairs and Communications', 'Ministry of Internal Affairs and Communications', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Hiroshi Hiraguchi -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0469_f9f23077', 'Hiroshi Hiraguchi', 'Minister of Justice', 'Justice', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Toshimitsu Motegi -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0470_d3f09771', 'Toshimitsu Motegi', 'Minister for Foreign Affairs', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Satsuki Katayama -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0471_37b3ea5f', 'Satsuki Katayama', 'Minister of Finance', 'Finance', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yohei Matsumoto -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0472_068b5394', 'Yohei Matsumoto', 'Minister of Education, Culture, Sports, Science and Technology', 'Education', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kenichiro Ueno -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0473_ea54ba17', 'Kenichiro Ueno', 'Minister of Health, Labour and Welfare', 'Health', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Norikazu Suzuki -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0474_8f4c4bff', 'Norikazu Suzuki', 'Minister of Agriculture, Forestry and Fisheries', 'Agriculture', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ryosei Akazawa -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0475_27874eba', 'Ryosei Akazawa', 'Minister of Economy, Trade and Industry', 'Trade', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yasushi Kaneko -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0476_99cd6c0f', 'Yasushi Kaneko', 'Minister of Land, Infrastructure, Transport and Tourism', 'Transportation', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Hirotaka Ishihara -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0477_db1ba6ff', 'Hirotaka Ishihara', 'Minister of the Environment', 'Environment', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Shinjirō Koizumi -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0478_327240a4', 'Shinjirō Koizumi', 'Minister of Defense', 'Defense', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Hisashi Matsumoto -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0479_22e65f87', 'Hisashi Matsumoto', 'Minister for Digital Transformation', 'Digital Agency', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Takao Makino -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0480_18d4059e', 'Takao Makino', 'Minister of Reconstruction', 'Reconstruction Agency', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jiro Akama -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0481_0bb2a61c', 'Jiro Akama', 'Chairman of the National Public Safety Commission', 'National Public Safety Commission', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Hitoshi Kikawada -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0482_c93e875d', 'Hitoshi Kikawada', 'Minister of State for Okinawa and Northern Territories Affairs', 'Cabinet Office', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Minoru Kiuchi -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0483_a870e14a', 'Minoru Kiuchi', 'Minister of State for Economic and Fiscal Policy', 'Cabinet Office', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kimi Onoda -  - Takaichi Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0484_d49370d7', 'Kimi Onoda', 'Minister in charge of Economic Security', 'Cabinet Office', (SELECT id FROM organisations WHERE name = ' - Takaichi Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - National Diet Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0485_344f979e', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - National Diet Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - National Diet Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0486_5a19e064', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - National Diet Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - National Diet Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0487_d290de52', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - National Diet Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - National Diet Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0488_46d1db8e', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - National Diet Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Narendra Modi - India - Prime Minister
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0489_de18fd8d', 'Narendra Modi', 'Prime Minister of India', NULL, (SELECT id FROM organisations WHERE name = 'India - Prime Minister'), true)
ON CONFLICT DO NOTHING;

-- Contact: Narendra Modi - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0490_abd59d2e', 'Narendra Modi', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Amit Shah - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0491_2babb1cc', 'Amit Shah', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Nirmala Sitharaman - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0492_1fd2eef1', 'Nirmala Sitharaman', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Suresh Goplakrishnan - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0493_b2bfedb1', 'Suresh Goplakrishnan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Piyush Goyal - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0494_95940992', 'Piyush Goyal', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rajnath Singh - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0495_7b048333', 'Rajnath Singh', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dharmendra Pradhan - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0496_751e9725', 'Dharmendra Pradhan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: S. Jaishankar - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0497_1f0fff3e', 'S. Jaishankar', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gajendra Singh Shekhawat - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0498_355aacf7', 'Gajendra Singh Shekhawat', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Anurag Singh Thakur - India - BJP Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0499_e6ab3d3a', 'Anurag Singh Thakur', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - BJP Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mallikarjun Kharge - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0500_89558b48', 'Mallikarjun Kharge', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rahul Gandhi - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0501_1002c3d2', 'Rahul Gandhi', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sonia Gandhi - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0502_445729b6', 'Sonia Gandhi', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Priyanka Gandhi Vadra - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0503_97e1999a', 'Priyanka Gandhi Vadra', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Shashi Tharoor - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0504_e4933d23', 'Shashi Tharoor', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Manish Tewari - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0505_9cc1e5ba', 'Manish Tewari', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Adhir Ranjan Chowdhury - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0506_dde2ef66', 'Adhir Ranjan Chowdhury', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jairam Ramesh - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0507_26c10262', 'Jairam Ramesh', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Neeraj Shekhar - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0508_00a896d3', 'Neeraj Shekhar', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: N.V. Subhash - India - Indian National Congress (INC)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0509_414fe9b5', 'N.V. Subhash', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Indian National Congress (INC)'), true)
ON CONFLICT DO NOTHING;

-- Contact: M.K. Stalin - India - Dravida Munnetra Kazhagam (DMK)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0510_0e9e94d1', 'M.K. Stalin', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Dravida Munnetra Kazhagam (DMK)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kanimozhi Karunanithy - India - Dravida Munnetra Kazhagam (DMK)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0511_b45de23e', 'Kanimozhi Karunanithy', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Dravida Munnetra Kazhagam (DMK)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tirumaan Govind - India - Dravida Munnetra Kazhagam (DMK)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0512_f2c06883', 'Tirumaan Govind', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Dravida Munnetra Kazhagam (DMK)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Thol. Thirumavalavan - India - Dravida Munnetra Kazhagam (DMK)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0513_357f5f90', 'Thol. Thirumavalavan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Dravida Munnetra Kazhagam (DMK)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dayanidhi Maran - India - Dravida Munnetra Kazhagam (DMK)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0514_f4a4b9f9', 'Dayanidhi Maran', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Dravida Munnetra Kazhagam (DMK)'), true)
ON CONFLICT DO NOTHING;

-- Contact: A. Raja - India - Dravida Munnetra Kazhagam (DMK)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0515_05b215ee', 'A. Raja', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Dravida Munnetra Kazhagam (DMK)'), true)
ON CONFLICT DO NOTHING;

-- Contact: R.S. Bharathi - India - Dravida Munnetra Kazhagam (DMK)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0516_e4d25325', 'R.S. Bharathi', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Dravida Munnetra Kazhagam (DMK)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Su. Venkatesan - India - Dravida Munnetra Kazhagam (DMK)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0517_2d3bde5a', 'Su. Venkatesan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Dravida Munnetra Kazhagam (DMK)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mamata Banerjee - India - Other Regional Parties
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0518_b8db8923', 'Mamata Banerjee', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Other Regional Parties'), true)
ON CONFLICT DO NOTHING;

-- Contact: Derek O'Brien - India - Other Regional Parties
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0519_c51332d0', 'Derek O''Brien', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Other Regional Parties'), true)
ON CONFLICT DO NOTHING;

-- Contact: Asaduddin Owaisi - India - Other Regional Parties
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0520_ebce87ad', 'Asaduddin Owaisi', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Other Regional Parties'), true)
ON CONFLICT DO NOTHING;

-- Contact: Uddhav Balasaheb Thackeray - India - Other Regional Parties
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0521_4694b700', 'Uddhav Balasaheb Thackeray', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Other Regional Parties'), true)
ON CONFLICT DO NOTHING;

-- Contact: Navjot Singh Sidhu - India - Other Regional Parties
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0522_275faaa0', 'Navjot Singh Sidhu', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Other Regional Parties'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dimple Yadav - India - Other Regional Parties
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0523_fd5f843d', 'Dimple Yadav', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Other Regional Parties'), true)
ON CONFLICT DO NOTHING;

-- Contact: Saugata Roy - India - Other Regional Parties
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0524_4f7e0e99', 'Saugata Roy', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Other Regional Parties'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mahua Moitra - India - Other Regional Parties
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0525_87a9b224', 'Mahua Moitra', NULL, NULL, (SELECT id FROM organisations WHERE name = 'India - Other Regional Parties'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Congress Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0526_80efc457', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Congress Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Congress Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0527_ae709959', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Congress Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - Congress Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0528_5ba9f202', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Congress Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - Congress Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0529_bd62d5af', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Congress Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Congress Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0530_f96d711b', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Congress Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Congress Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0531_b8e25410', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Congress Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Public Services -  - Congress Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0532_12ab3d0e', 'Public Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Congress Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Public Services -  - Congress Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0533_4b176dec', 'Public Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Congress Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Senkoun Sylla - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0534_edfe23f4', 'HE Mr Senkoun Sylla', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Andre Nzapayeke - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0535_bd8df2d4', 'HE Mr Andre Nzapayeke', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Hussain Al-Ameri - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0536_6d572c87', 'HE Dr Hussain Al-Ameri', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Hon Fisa Pihigia - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0537_9200da33', 'HE Hon Fisa Pihigia', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Lloyd Pinas - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0538_b0590776', 'HE Dr Lloyd Pinas', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Cheikh Niang - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0539_5b6af6d1', 'HE Mr Cheikh Niang', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Alfredo Alberto Spiegel Aponte - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0540_651341eb', 'HE Mr Alfredo Alberto Spiegel Aponte', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Tha Aung Nyun - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0541_622041c3', 'HE Mr Tha Aung Nyun', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Wahidullah Waissi - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0542_78b645ec', 'HE Mr Wahidullah Waissi', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Ahmed Araita Ali - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0543_ed6e8940', 'HE Mr Ahmed Araita Ali', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Georgii Zuev - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0544_fac4a697', 'HE Mr Georgii Zuev', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Jose Maria De Morais - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0545_77cb00ff', 'HE Mr Jose Maria De Morais', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Makarimi Abissola Adechoubou - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0546_03a32093', 'HE Mr Makarimi Abissola Adechoubou', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Milad Raad - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0547_55107372', 'HE Mr Milad Raad', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Kristin Arnadottir - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0548_ae9d027e', 'HE Mrs Kristin Arnadottir', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Major General Lineo Bernard Poopa - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0549_692e4e7c', 'HE Major General Lineo Bernard Poopa', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Betty Pavelich Sirois - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0550_db4bf466', 'HE Ms Betty Pavelich Sirois', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Tomas Ferko - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0551_bb37a722', 'HE Mr Tomas Ferko', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Ruslan Esin - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0552_a69bf0cd', 'HE Dr Ruslan Esin', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Jean de Dieu Uwihanganye - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0553_3c8aabbd', 'HE Mr Jean de Dieu Uwihanganye', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Maria Belen Bogado - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0554_daee1ade', 'HE Ms Maria Belen Bogado', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Dorcas Makgato - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0555_c2c855a8', 'HE Ms Dorcas Makgato', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Anderson Nkemakonam Madubike - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0556_463e20a4', 'HE Mr Anderson Nkemakonam Madubike', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Joe Tapera Mhishi - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0557_fc63edb4', 'HE Mr Joe Tapera Mhishi', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Mario Farrugia Borg - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0558_bb91de31', 'HE Mr Mario Farrugia Borg', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Ronald Estuardo Recinos Gomez - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0559_78224da9', 'HE Mr Ronald Estuardo Recinos Gomez', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Jimmy Nipo - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0560_1214e08f', 'HE Mr Jimmy Nipo', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Rashed Matar Alqemzi - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0561_fd51d53a', 'HE Mr Rashed Matar Alqemzi', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Marcos Arbizu de Souza Campos - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0562_5733c545', 'HE Mr Marcos Arbizu de Souza Campos', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Chris Seed - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0563_9a977a8b', 'HE Mr Chris Seed', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Wang Xiaolong - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0564_f6bb945b', 'HE Mr Wang Xiaolong', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Fientje Maritje Suebu - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0565_eec43914', 'HE Mrs Fientje Maritje Suebu', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Darius Degutis - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0566_d7bd5a8d', 'HE Mr Darius Degutis', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Mirlan Arstanbaev - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0567_f33c41ca', 'HE Mr Mirlan Arstanbaev', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Jose Emilio Bustinza Soto - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0568_39fddb23', 'HE Mr Jose Emilio Bustinza Soto', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Mohamed Said Al Busaidi - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0569_b1c01ce6', 'HE Dr Mohamed Said Al Busaidi', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Radu Gabriel Safta - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0570_ca1eae06', 'HE Mr Radu Gabriel Safta', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Michel Goffin - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0571_84e35933', 'HE Mr Michel Goffin', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Margers Krams - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0572_2b1b0045', 'HE Mr Margers Krams', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Dianela Pi Cedres - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0573_b565788a', 'HE Mrs Dianela Pi Cedres', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Feue Tipu - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0574_07c94c1f', 'HE Mr Feue Tipu', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Daniel Antonio Rosa - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0575_a549a447', 'HE Mr Daniel Antonio Rosa', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Robert Takata Pimentel - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0576_33e53241', 'HE Mr Robert Takata Pimentel', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Wassane Zailachi - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0577_51df9b28', 'HE Mrs Wassane Zailachi', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Marie Claire Monty - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0578_9f1d0018', 'HE Ms Marie Claire Monty', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Biljana Stefanovska-Sekovska - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0579_d316036c', 'HE Ms Biljana Stefanovska-Sekovska', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Davaasuren Damdinsuren - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0580_e93bfccd', 'HE Mr Davaasuren Damdinsuren', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Rade Stefanovic - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0581_2306a0a6', 'HE Mr Rade Stefanovic', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Iona Thomas - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0582_ddc72b01', 'HE Ms Iona Thomas', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ratu Inoke Kubuabola - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0583_e423cf18', 'HE Ratu Inoke Kubuabola', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Ard van der Vorst - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0584_8623e7c1', 'HE Mr Ard van der Vorst', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Vasyl Myroshnychenko - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0585_ca97fcdf', 'HE Mr Vasyl Myroshnychenko', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Jane Connolly - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0586_67b28a57', 'HE Ms Jane Connolly', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Laurence Beau - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0587_4d29d1b8', 'HE Mrs Laurence Beau', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Nicole Menzenbach - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0588_1c27e99e', 'HE Ms Nicole Menzenbach', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Neeta Bhushan - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0589_2dc92418', 'HE Ms Neeta Bhushan', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Viktor Vavricka - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0590_b50077db', 'HE Mr Viktor Vavricka', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Chang-sik Kim - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0591_b3c5dacd', 'HE Mr Chang-sik Kim', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Areg Hovhannisian - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0592_8f7b725e', 'HE Mr Areg Hovhannisian', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Kwacha Chisiza - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0593_457b416d', 'HE Mr Kwacha Chisiza', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Victor Arturo Cabrera Hidalgo - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0594_7be0d42c', 'HE Mr Victor Arturo Cabrera Hidalgo', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Waravuth Pouapinya - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0595_1e19c932', 'HE Mr Waravuth Pouapinya', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Ahmed Alharmasi Alhajeri - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0596_76e7fff1', 'HE Mr Ahmed Alharmasi Alhajeri', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Kailash Raj Pokharel - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0597_6eea9e52', 'HE Mr Kailash Raj Pokharel', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Marko Ham - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0598_abff23e0', 'HE Mr Marko Ham', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Baraka Haran Luvanda - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0599_5ea05828', 'HE Mr Baraka Haran Luvanda', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Mazita binti Marzuki - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0600_56d8bf32', 'HE Ms Mazita binti Marzuki', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Anne Grete Riise - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0601_5e227253', 'HE Ms Anne Grete Riise', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Jetmira Berdynaj-Shala - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0602_0aee2445', 'HE Mrs Jetmira Berdynaj-Shala', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Antonis Sammoutis - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0603_91a44ab8', 'HE Mr Antonis Sammoutis', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Dorothy Hyuha - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0604_0d07f3ff', 'HE Mrs Dorothy Hyuha', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Beka Dvali - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0605_de987006', 'HE Mr Beka Dvali', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Kemal Muftic - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0606_d9d341d3', 'HE Mr Kemal Muftic', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Elias Munshya - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0607_88c97ef3', 'HE Dr Elias Munshya', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Kairangi Samuela - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0608_2ec8b1da', 'HE Ms Kairangi Samuela', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Shorna-Kay Richards - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0609_c48018c5', 'HE Ms Shorna-Kay Richards', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Anthony Ferguson - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0610_098703ff', 'HE Mr Anthony Ferguson', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Reza Nazar Ahari - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0611_e6dec8af', 'HE Mr Reza Nazar Ahari', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Kira Azucena - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0612_0f0e2a8c', 'HE Mrs Kira Azucena', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Nor Eddine Benfreha - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0613_59f9fdfd', 'HE Dr Nor Eddine Benfreha', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Afamasaga Faamatalaupu Toleafoa - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0614_94e27197', 'HE Mr Afamasaga Faamatalaupu Toleafoa', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Blamoh Nelson - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0615_6f24f483', 'HE Mr Blamoh Nelson', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Antonio Albuquerque de Vilhena Moniz - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0616_89350a73', 'HE Mr Antonio Albuquerque de Vilhena Moniz', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Askar Kuttykadam - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0617_b6f4d3d6', 'HE Mr Askar Kuttykadam', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr M Allama Siddiki - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0618_1262ce65', 'HE Mr M Allama Siddiki', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Muhanna Aba Alkhail - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0619_79491dac', 'HE Mr Muhanna Aba Alkhail', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr William Tan Wei Yuan - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0620_761f3856', 'HE Mr William Tan Wei Yuan', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Jana Tyrer - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0621_a2d9a882', 'HE Ms Jana Tyrer', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Chanborey Cheunboran - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0622_d32b94a0', 'HE Mr Chanborey Cheunboran', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Garry Ramlee Ibrahim - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0623_9b4fc7e0', 'HE Mr Garry Ramlee Ibrahim', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Sakias Tameo - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0624_55c8ece5', 'HE Mr Sakias Tameo', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr George Tadros - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0625_59290a34', 'HE Mr George Tadros', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Lawrence Meredith - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0626_d4e7ca63', 'HE Mr Lawrence Meredith', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Luis Morejon Rodriguez - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0627_2c86cf85', 'HE Mr Luis Morejon Rodriguez', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Samuel Kumah - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0628_1558a634', 'HE Mr Samuel Kumah', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Makoto Osawa - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0629_3d1d69b0', 'HE Mr Makoto Osawa', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Arto Haapea - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0630_2abe15b7', 'HE Mr Arto Haapea', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Manahi Pakarati Novoa - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0631_98d6c869', 'HE Mrs Manahi Pakarati Novoa', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Faisal Aziz Ahmed - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0632_97262060', 'HE Dr Faisal Aziz Ahmed', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Elisabeth Koegler - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0633_cddf3744', 'HE Mrs Elisabeth Koegler', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Stavros Venizelos - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0634_cc748558', 'HE Mr Stavros Venizelos', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Col Johnny Sexwale - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0635_36799b1c', 'HE Col Johnny Sexwale', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Hadera Abera Admassu - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0636_7d9bad7c', 'HE Mr Hadera Abera Admassu', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Sidya El Hadj - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0637_1a88cda1', 'HE Mr Sidya El Hadj', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Abu Bakarr Karim - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0638_d42de504', 'HE Dr Abu Bakarr Karim', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Ali Saad M H Al-Hajri - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0639_1075044e', 'HE Mr Ali Saad M H Al-Hajri', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Idelta Rodrigues - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0640_4982ccc3', 'HE Mrs Idelta Rodrigues', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Archbishop Gabor Pinter - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0641_a0018297', 'HE Archbishop Gabor Pinter', 'Apostolic Nuncio', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Jaan Reinhold - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0642_f9bcb7e8', 'HE Mr Jaan Reinhold', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Ernesto Duenas Azucena - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0643_b4abd104', 'HE Mr Ernesto Duenas Azucena', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Keith Smith - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0644_83423169', 'HE Mr Keith Smith', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Ingrid Dahl-Madsen - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0645_d2e2e4c9', 'HE Ms Ingrid Dahl-Madsen', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Wilson Kogo - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0646_0a20ccbc', 'HE Dr Wilson Kogo', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Janti Kalajoqa - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0647_300078e5', 'HE Mr Janti Kalajoqa', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Alon Roth-Snir - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0648_08a420f1', 'HE Mr Alon Roth-Snir', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Sabah Alsabah - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0649_3a6f90c0', 'HE Mr Sabah Alsabah', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Sampath Walpita Gamage - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0650_2982cfb1', 'HE Mr Sampath Walpita Gamage', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Gabor Nagy - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0651_08309727', 'HE Dr Gabor Nagy', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Encho Dimitrov - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0652_852b24aa', 'HE Mr Encho Dimitrov', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Camilla Solomon - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0653_36adfe08', 'HE Ms Camilla Solomon', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Daniel Sloper - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0654_7d54e1fb', 'HE Mr Daniel Sloper', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Cristiano Maggipinto - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0655_04484fad', 'HE Mr Cristiano Maggipinto', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Isaura Duarte - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0656_f6bee3f1', 'HE Ms Isaura Duarte', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Phan Minh Giang - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0657_cca18e89', 'HE Mr Phan Minh Giang', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Carolina Molina Barrantes - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0658_9e975ad1', 'HE Ms Carolina Molina Barrantes', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Junior Aini - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0659_6ca6d11b', 'HE Mr Junior Aini', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Ishmael Avui - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0660_ac7c9268', 'HE Mr Ishmael Avui', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Patryk Blaszczak - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0661_722222ea', 'HE Mr Patryk Blaszczak', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Melih Karalar - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0662_847db8d7', 'HE Mr Melih Karalar', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Jane Chigiyal - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0663_7d55cd38', 'HE Ms Jane Chigiyal', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Mohamed Luveiz - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0664_9fa7a73f', 'HE Mr Mohamed Luveiz', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Atadurdy Bayramov - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0665_2a7a32e7', 'HE Mr Atadurdy Bayramov', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Luis Sánchez-Vellisco Sánchez - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0666_86bef081', 'HE Mr Luis Sánchez-Vellisco Sánchez', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Mohamed Trabelsi - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0667_a6e0939a', 'HE Mr Mohamed Trabelsi', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Klas Molin - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0668_9e3aef5e', 'HE Mr Klas Molin', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Chatoulong Bouasisavath - Diplomatic Missions To New Zealand - Ambassadors & High Commissioner
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0669_9b396d21', 'HE Mr Chatoulong Bouasisavath', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Ambassadors & High Commissioner'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Daniel Sloper - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0670_009edc81', 'HE Mr Daniel Sloper', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Chris Seed - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0671_0d8be25c', 'HE Mr Chris Seed', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Iona Thomas - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0672_7e145164', 'HE Ms Iona Thomas', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Laurence Beau - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0673_32c9ca6a', 'HE Mrs Laurence Beau', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Nicole Menzenbach - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0674_3b61ce46', 'HE Ms Nicole Menzenbach', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Ard van der Vorst - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0675_5adccb2e', 'HE Mr Ard van der Vorst', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Jane Connolly - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0676_c3c52995', 'HE Ms Jane Connolly', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Keith Smith - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0677_bfea3c77', 'HE Mr Keith Smith', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Neeta Bhushan - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0678_5ad62ce2', 'HE Ms Neeta Bhushan', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Wang Xiaolong - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0679_283faeea', 'HE Mr Wang Xiaolong', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Makoto Osawa - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0680_f27f62b6', 'HE Mr Makoto Osawa', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Chang-sik Kim - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0681_fc660c59', 'HE Mr Chang-sik Kim', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Waravuth Pouapinya - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0682_44d7deb6', 'HE Mr Waravuth Pouapinya', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Kira Azucena - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0683_3821a46b', 'HE Mrs Kira Azucena', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Fientje Maritje Suebu - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0684_be05adc5', 'HE Mrs Fientje Maritje Suebu', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Mazita binti Marzuki - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0685_84745261', 'HE Ms Mazita binti Marzuki', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr William Tan Wei Yuan - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0686_0e26875b', 'HE Mr William Tan Wei Yuan', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Marcos Arbizu de Souza Campos - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0687_d7878544', 'HE Mr Marcos Arbizu de Souza Campos', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Maria Belen Bogado - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0688_1ce8c6b6', 'HE Ms Maria Belen Bogado', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Manahi Pakarati Novoa - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0689_377eac6f', 'HE Mrs Manahi Pakarati Novoa', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Jose Emilio Bustinza Soto - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0690_785fbb8c', 'HE Mr Jose Emilio Bustinza Soto', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ratu Inoke Kubuabola - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0691_6d103851', 'HE Ratu Inoke Kubuabola', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Afamasaga Faamatalaupu Toleafoa - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0692_9fd7171f', 'HE Mr Afamasaga Faamatalaupu Toleafoa', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Jimmy Nipo - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0693_ee578ee6', 'HE Mr Jimmy Nipo', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Sakias Tameo - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0694_f405e365', 'HE Mr Sakias Tameo', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Kairangi Samuela - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0695_6eb80081', 'HE Ms Kairangi Samuela', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Feue Tipu - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0696_9e43af5a', 'HE Mr Feue Tipu', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Rashed Matar Alqemzi - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0697_1009f91d', 'HE Mr Rashed Matar Alqemzi', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Muhanna Aba Alkhail - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0698_71025790', 'HE Mr Muhanna Aba Alkhail', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Reza Nazar Ahari - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0699_e9a6799e', 'HE Mr Reza Nazar Ahari', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr George Tadros - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0700_6d7b4b0a', 'HE Mr George Tadros', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Luis Morejon Rodriguez - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0701_4e241e1c', 'HE Mr Luis Morejon Rodriguez', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Georgii Zuev - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0702_cae61d1d', 'HE Mr Georgii Zuev', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Lawrence Meredith - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0703_4c89a3d6', 'HE Mr Lawrence Meredith', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mrs Idelta Rodrigues - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0704_2a42dc04', 'HE Mrs Idelta Rodrigues', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Viktor Vavricka - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0705_fa70f50f', 'HE Mr Viktor Vavricka', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Faisal Aziz Ahmed - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0706_ba5ba1b0', 'HE Dr Faisal Aziz Ahmed', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Sampath Walpita Gamage - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0707_e51a94f7', 'HE Mr Sampath Walpita Gamage', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Alon Roth-Snir - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0708_47ca937f', 'HE Mr Alon Roth-Snir', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Sabah Alsabah - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0709_82d2a9aa', 'HE Mr Sabah Alsabah', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Dr Gabor Nagy - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0710_1fc9da66', 'HE Dr Gabor Nagy', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Luis Sánchez-Vellisco Sánchez - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0711_4045b299', 'HE Mr Luis Sánchez-Vellisco Sánchez', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Melih Karalar - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0712_3f2d019e', 'HE Mr Melih Karalar', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Ms Isaura Duarte - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0713_d20cb6ed', 'HE Ms Isaura Duarte', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Phan Minh Giang - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0714_85310f2e', 'HE Mr Phan Minh Giang', 'Ambassador', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: HE Mr Ishmael Avui - Diplomatic Missions To New Zealand - Wellington Missions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0715_683d0cfe', 'HE Mr Ishmael Avui', 'High Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'Diplomatic Missions To New Zealand - Wellington Missions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception -  - Grand National Assembly
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0716_7e55a08b', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Grand National Assembly'), true)
ON CONFLICT DO NOTHING;

-- Contact: Speaker's Office -  - Grand National Assembly
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0717_715b25b8', 'Speaker''s Office', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Grand National Assembly'), true)
ON CONFLICT DO NOTHING;

-- Contact: Member Services -  - Grand National Assembly
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0718_dfcf07c0', 'Member Services', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Grand National Assembly'), true)
ON CONFLICT DO NOTHING;

-- Contact: Public Inquiries -  - Grand National Assembly
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0719_a4df801a', 'Public Inquiries', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Grand National Assembly'), true)
ON CONFLICT DO NOTHING;

-- Contact: Anthony Albanese -  - Prime Minister
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0720_4d42c3f5', 'Anthony Albanese', 'Prime Minister', NULL, (SELECT id FROM organisations WHERE name = ' - Prime Minister'), true)
ON CONFLICT DO NOTHING;

-- Contact: Katy Gallagher -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0721_db851198', 'Katy Gallagher', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: David Pocock -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0722_1951b99a', 'David Pocock', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tim Ayres -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0723_948c711e', 'Tim Ayres', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Andrew Bragg -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0724_4c2139d1', 'Andrew Bragg', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ross Cadell -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0725_fc998e13', 'Ross Cadell', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jessica Collins -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0726_684fee00', 'Jessica Collins', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mehreen Faruqi -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0727_a87ea251', 'Mehreen Faruqi', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jenny McAllister -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0728_4d67845d', 'Jenny McAllister', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Deborah O'Neill -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0729_214fbf89', 'Deborah O''Neill', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: David Shoebridge -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0730_f36eac88', 'David Shoebridge', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sean Bell -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0731_eafe3329', 'Sean Bell', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Maria Kovacic -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0732_cb43758b', 'Maria Kovacic', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Devanand Sharma -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0733_52d3a91a', 'Devanand Sharma', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tony Sheldon -  - Senators - ACT to NSW
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0734_5cc4f397', 'Tony Sheldon', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - ACT to NSW'), true)
ON CONFLICT DO NOTHING;

-- Contact: Malarndirri McCarthy -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0735_d2b3d2c6', 'Malarndirri McCarthy', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jacinta Nampijinpa Price -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0736_70bcedf7', 'Jacinta Nampijinpa Price', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Penny Allman-Payne -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0737_1ecfae99', 'Penny Allman-Payne', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Matthew Canavan -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0738_ce69fd85', 'Matthew Canavan', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Anthony Chisholm -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0739_1cc089b9', 'Anthony Chisholm', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Nita Green -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0740_bcc11d41', 'Nita Green', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Pauline Hanson -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0741_a8b40710', 'Pauline Hanson', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: James McGrath -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0742_5777adfd', 'James McGrath', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Susan McDonald -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0743_e45669d0', 'Susan McDonald', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Malcolm Roberts -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0744_ae61b2fe', 'Malcolm Roberts', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Paul Scarr -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0745_dbf73eef', 'Paul Scarr', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Corinne Mulholland -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0746_86cabd90', 'Corinne Mulholland', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Larissa Waters -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0747_5e4d4739', 'Larissa Waters', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Murray Watt -  - Senators - NT to QLD
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0748_d239d61d', 'Murray Watt', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - NT to QLD'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alexander Antic -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0749_504df07f', 'Alexander Antic', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Leah Blyth -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0750_0b17e546', 'Leah Blyth', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Don Farrell -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0751_e7454ad7', 'Don Farrell', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Karen Grogan -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0752_2f19a4c3', 'Karen Grogan', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sarah Hanson-Young -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0753_7a0414f3', 'Sarah Hanson-Young', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kerrynne Liddle -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0754_a911a324', 'Kerrynne Liddle', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Andrew McLachlan -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0755_556fe749', 'Andrew McLachlan', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Barbara Pocock -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0756_4a30bd58', 'Barbara Pocock', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Anne Ruston -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0757_ef4cc491', 'Anne Ruston', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marielle Smith -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0758_bda5f68e', 'Marielle Smith', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Charlotte Walker -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0759_032143fd', 'Charlotte Walker', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Penny Wong -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0760_bd17e9db', 'Penny Wong', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Wendy Askew -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0761_5468cc02', 'Wendy Askew', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Carol Brown -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0762_2a08b09d', 'Carol Brown', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Claire Chandler -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0763_412da1db', 'Claire Chandler', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Richard Colbeck -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0764_3f332470', 'Richard Colbeck', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Josh Dolega -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0765_82909b70', 'Josh Dolega', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Richard Dowling -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0766_7d533b62', 'Richard Dowling', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jonathon Duniam -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0767_93a42be2', 'Jonathon Duniam', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jacqui Lambie -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0768_17d647b8', 'Jacqui Lambie', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Nick McKim -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0769_da0980de', 'Nick McKim', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Helen Polley -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0770_f9a03de6', 'Helen Polley', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tammy Tyrrell -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0771_95619cf2', 'Tammy Tyrrell', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Peter Whish-Wilson -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0772_9e5b3d34', 'Peter Whish-Wilson', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Michelle Ananda-Rajah -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0773_673498cc', 'Michelle Ananda-Rajah', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ralph Babet -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0774_2c73231d', 'Ralph Babet', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Raffaele Ciccone -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0775_a4bcf1ed', 'Raffaele Ciccone', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lisa Darmanin -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0776_28ab2955', 'Lisa Darmanin', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Steph Hodgins-May -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0777_5e31e3a3', 'Steph Hodgins-May', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jane Hume -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0778_7573e539', 'Jane Hume', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sarah Henderson -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0779_fa9f7450', 'Sarah Henderson', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: James Paterson -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0780_dcb6a5fb', 'James Paterson', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bridget McKenzie -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0781_9910a85b', 'Bridget McKenzie', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jess Walsh -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0782_7340c98b', 'Jess Walsh', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jana Stewart -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0783_5d943fd4', 'Jana Stewart', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lidia Thorpe -  - Senators - SA to VIC
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0784_9a5889f7', 'Lidia Thorpe', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - SA to VIC'), true)
ON CONFLICT DO NOTHING;

-- Contact: Slade Brockman -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0785_846f5442', 'Slade Brockman', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Michaelia Cash -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0786_e5226c20', 'Michaelia Cash', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dorinda Cox -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0787_cfffe1af', 'Dorinda Cox', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Varun Ghosh -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0788_178ed7c9', 'Varun Ghosh', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sue Lines -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0789_62e4cb37', 'Sue Lines', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Matt O'Sullivan -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0790_dcebbf03', 'Matt O''Sullivan', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Fatima Payman -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0791_c02e243f', 'Fatima Payman', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dean Smith -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0792_acdd999e', 'Dean Smith', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Glenn Sterle -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0793_842c4180', 'Glenn Sterle', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jordon Steele-John -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0794_662aa7a8', 'Jordon Steele-John', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ellie Whiteaker -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0795_3d45d9e7', 'Ellie Whiteaker', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tyron Whitten -  - Senators - WA
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0796_1f6d9a10', 'Tyron Whitten', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Senators - WA'), true)
ON CONFLICT DO NOTHING;

-- Contact: Senate General Address -  - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0797_69bc35e9', 'Senate General Address', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Parliament Switchboard -  - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0798_86663adb', 'Parliament Switchboard', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Parliament House General -  - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0799_4f1a1a1b', 'Parliament House General', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Prime Minister Contact Form -  - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0800_3eea6484', 'Prime Minister Contact Form', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Senate Website -  - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0801_6e2ec8a6', 'Senate Website', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Find Your Senators -  - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0802_60dbf645', 'Find Your Senators', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Party Codes -  - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0803_9a66162f', 'Party Codes', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Note on Email -  - Contact Methods
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0804_5c74762b', 'Note on Email', NULL, NULL, (SELECT id FROM organisations WHERE name = ' - Contact Methods'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mark Carney - Canada - Prime Minister
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0805_dfe6f304', 'Mark Carney', 'Prime Minister of Canada', NULL, (SELECT id FROM organisations WHERE name = 'Canada - Prime Minister'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mark Carney - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0806_6d7a771f', 'Mark Carney', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chrystia Freeland - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0807_970af2d8', 'Chrystia Freeland', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dominic LeBlanc - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0808_fb1ecb5f', 'Dominic LeBlanc', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Arif Virani - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0809_32ab2ece', 'Arif Virani', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Karina Gould - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0810_914553a7', 'Karina Gould', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sean Fraser - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0811_6c8d5069', 'Sean Fraser', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Harjit Sajjan - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0812_9fa2c255', 'Harjit Sajjan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Andy Fillmore - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0813_9b2118d0', 'Andy Fillmore', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Randeep Sarai - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0814_cae02867', 'Randeep Sarai', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Salma Zahid - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0815_608c2330', 'Salma Zahid', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marie-France Lalonde - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0816_d9285662', 'Marie-France Lalonde', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Filomena Tassi - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0817_14d162fc', 'Filomena Tassi', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Adam van Koeverden - Canada - Liberal Government MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0818_e50c3b5a', 'Adam van Koeverden', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Liberal Government MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Pierre Poilievre - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0819_d541193d', 'Pierre Poilievre', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Michelle Rempel Garner - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0820_cf0ee900', 'Michelle Rempel Garner', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Luc Berthold - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0821_22fba920', 'Luc Berthold', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Leslyn Lewis - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0822_8e28a7ee', 'Leslyn Lewis', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: John Brassard - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0823_582c5325', 'John Brassard', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Melissa Lantsman - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0824_0a9fa80d', 'Melissa Lantsman', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jasraj Singh Hallan - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0825_858fb291', 'Jasraj Singh Hallan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Raquel Dancho - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0826_3bd81d13', 'Raquel Dancho', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dan Albas - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0827_62029e6c', 'Dan Albas', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alex Ruff - Canada - Conservative Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0828_2b5700fe', 'Alex Ruff', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Conservative Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jagmeet Singh - Canada - NDP Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0829_667a68fd', 'Jagmeet Singh', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - NDP Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alexandre Boulerice - Canada - NDP Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0830_08382d7b', 'Alexandre Boulerice', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - NDP Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Laurel Collins - Canada - NDP Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0831_dce6671c', 'Laurel Collins', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - NDP Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Niki Ashton - Canada - NDP Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0832_f4ac7463', 'Niki Ashton', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - NDP Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Daniel Blaikie - Canada - NDP Opposition MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0833_603c44c3', 'Daniel Blaikie', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - NDP Opposition MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yves-François Blanchet - Canada - Bloc Québécois and Green
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0834_8feda371', 'Yves-François Blanchet', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Bloc Québécois and Green'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alain Therrien - Canada - Bloc Québécois and Green
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0835_5e5ba024', 'Alain Therrien', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Bloc Québécois and Green'), true)
ON CONFLICT DO NOTHING;

-- Contact: Elizabeth May - Canada - Bloc Québécois and Green
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0836_43e4e737', 'Elizabeth May', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Bloc Québécois and Green'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mike Morrice - Canada - Bloc Québécois and Green
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0837_ef435d44', 'Mike Morrice', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Canada - Bloc Québécois and Green'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ursula von der Leyen - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0838_23455622', 'Ursula von der Leyen', 'President', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Teresa Ribiera Rodríguez - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0839_c0d60173', 'Teresa Ribiera Rodríguez', 'Executive Vice President', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Henna Virkkunen - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0840_c0e3d3b9', 'Henna Virkkunen', 'Executive Vice President', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Stéphane Séjourné - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0841_d6aecb5a', 'Stéphane Séjourné', 'Executive Vice President', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kaja Kallas - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0842_e26d18d1', 'Kaja Kallas', 'High Representative/Vice President', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Roxana Mînzatu - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0843_6d087dee', 'Roxana Mînzatu', 'Executive Vice President', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Raffaele Fitto - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0844_ed447cf1', 'Raffaele Fitto', 'Executive Vice President', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Maroš Šefčovič - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0845_08ea6e19', 'Maroš Šefčovič', 'Vice President', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Valdis Dombrovskis - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0846_4f9ac455', 'Valdis Dombrovskis', 'Vice President', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Wopke Hoekstra - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0847_68ba71fc', 'Wopke Hoekstra', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Andrius Kubilius - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0848_e56bc305', 'Andrius Kubilius', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marta Kos - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0849_5ba05738', 'Marta Kos', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jozef Síkela - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0850_d96b3ce1', 'Jozef Síkela', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Costas Kadis - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0851_fcc56988', 'Costas Kadis', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Maria Luís Albuquerque - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0852_8ab77d07', 'Maria Luís Albuquerque', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Hadja Lahbib - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0853_380bac6c', 'Hadja Lahbib', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Magnus Brunner - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0854_3c3b056a', 'Magnus Brunner', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jessika Roswall - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0855_17e148bc', 'Jessika Roswall', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Piotr Serafin - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0856_6b71806e', 'Piotr Serafin', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dan Jørgensen - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0857_2a1627c2', 'Dan Jørgensen', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ekaterina Zaharieva - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0858_41660235', 'Ekaterina Zaharieva', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Michael McGrath - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0859_e458d252', 'Michael McGrath', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Apostolos Tzitzikostas - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0860_1f6aa9fd', 'Apostolos Tzitzikostas', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Christophe Hansen - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0861_9110405e', 'Christophe Hansen', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Glenn Micallef - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0862_5a127589', 'Glenn Micallef', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dubravka Šuica - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0863_e2b4cf15', 'Dubravka Šuica', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Olivér Várhelyi - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0864_d7ef7ffd', 'Olivér Várhelyi', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mehmet Şimşek - European Union - EU Commission Leadership
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0865_239d921e', 'Mehmet Şimşek', 'Commissioner', NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Commission Leadership'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception - European Union - EU Parliament & Council
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0866_02a04799', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Parliament & Council'), true)
ON CONFLICT DO NOTHING;

-- Contact: President's Office - European Union - EU Parliament & Council
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0867_c05da306', 'President''s Office', NULL, NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Parliament & Council'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception - European Union - EU Parliament & Council
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0868_65cfcfd9', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Parliament & Council'), true)
ON CONFLICT DO NOTHING;

-- Contact: President's Office - European Union - EU Parliament & Council
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0869_8fc24fea', 'President''s Office', NULL, NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Parliament & Council'), true)
ON CONFLICT DO NOTHING;

-- Contact: General Inquiries - European Union - EU Institutions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0870_f23ede29', 'General Inquiries', NULL, NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Institutions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: President's Office - European Union - EU Institutions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0871_e8db2790', 'President''s Office', NULL, NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Institutions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception - European Union - EU Institutions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0872_edc6a580', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Institutions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Main Reception - European Union - EU Institutions Contact
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0873_97f8f406', 'Main Reception', NULL, NULL, (SELECT id FROM organisations WHERE name = 'European Union - EU Institutions Contact'), true)
ON CONFLICT DO NOTHING;

-- Contact: Keir Starmer - UK - Prime Minister and Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0874_70cbecd9', 'Keir Starmer', 'Prime Minister', NULL, (SELECT id FROM organisations WHERE name = 'UK - Prime Minister and Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Angela Rayner - UK - Prime Minister and Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0875_1d099bf8', 'Angela Rayner', 'Deputy Prime Minister', NULL, (SELECT id FROM organisations WHERE name = 'UK - Prime Minister and Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: David Lammy - UK - Prime Minister and Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0876_58a84122', 'David Lammy', 'Secretary of State for Foreign Affairs', NULL, (SELECT id FROM organisations WHERE name = 'UK - Prime Minister and Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rachel Reeves - UK - Prime Minister and Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0877_c0589964', 'Rachel Reeves', 'Chancellor of the Exchequer', NULL, (SELECT id FROM organisations WHERE name = 'UK - Prime Minister and Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yvette Cooper - UK - Prime Minister and Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0878_d4fa18d6', 'Yvette Cooper', 'Home Secretary', NULL, (SELECT id FROM organisations WHERE name = 'UK - Prime Minister and Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Wes Streeting - UK - Prime Minister and Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0879_0375db15', 'Wes Streeting', 'Secretary of State for Health and Social Care', NULL, (SELECT id FROM organisations WHERE name = 'UK - Prime Minister and Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bridget Phillipson - UK - Prime Minister and Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0880_06c8db21', 'Bridget Phillipson', 'Secretary of State for Education', NULL, (SELECT id FROM organisations WHERE name = 'UK - Prime Minister and Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jack Abbott - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0881_51954c13', 'Jack Abbott', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Diane Abbott - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0882_e5eedf4f', 'Diane Abbott', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Debbie Abrahams - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0883_1ff78d4d', 'Debbie Abrahams', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sadik Al-Hassan - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0884_6cd385ce', 'Sadik Al-Hassan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Bayo Alaba - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0885_9f6fac99', 'Bayo Alaba', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Heidi Alexander - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0886_b4352146', 'Heidi Alexander', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rushanara Ali - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0887_47dd6f86', 'Rushanara Ali', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tahir Ali - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0888_86e0f25a', 'Tahir Ali', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rosena Allin-Khan - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0889_aa600a15', 'Rosena Allin-Khan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Callum Anderson - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0890_2c28f786', 'Callum Anderson', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Fleur Anderson - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0891_7052d201', 'Fleur Anderson', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Tonia Antoniazzi - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0892_c64bdaf4', 'Tonia Antoniazzi', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Catherine Atkinson - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0893_537ad87f', 'Catherine Atkinson', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lewis Atkinson - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0894_cb59d2b4', 'Lewis Atkinson', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: David Baines - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0895_bb0a382a', 'David Baines', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alex Baker - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0896_bc9b01d5', 'Alex Baker', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Richard Baker - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0897_81d71d58', 'Richard Baker', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alex Ballinger - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0898_0b977c61', 'Alex Ballinger', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Antonia Bance - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0899_a996d216', 'Antonia Bance', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Paula Barker - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0900_6acdb045', 'Paula Barker', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lee Barron - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0901_784393e6', 'Lee Barron', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alex Barros-Curtis - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0902_c28c6134', 'Alex Barros-Curtis', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Johanna Baxter - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0903_6356c723', 'Johanna Baxter', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Danny Beales - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0904_ebb25e4f', 'Danny Beales', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lorraine Beavers - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0905_b4465546', 'Lorraine Beavers', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Torsten Bell - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0906_d87e1cc0', 'Torsten Bell', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Hilary Benn - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0907_996d30a2', 'Hilary Benn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Clive Betts - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0908_a80e113c', 'Clive Betts', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Polly Billington - UK - Labour MPs - A to D
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0909_90dab4d8', 'Polly Billington', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Labour MPs - A to D'), true)
ON CONFLICT DO NOTHING;

-- Contact: Stuart Anderson - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0910_57e3ba13', 'Stuart Anderson', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Stuart Andrew - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0911_ae67a06c', 'Stuart Andrew', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Victoria Atkins - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0912_ed91ea1c', 'Victoria Atkins', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kemi Badenoch - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0913_25af5183', 'Kemi Badenoch', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gareth Bacon - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0914_63d591fb', 'Gareth Bacon', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Steve Barclay - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0915_5303f6e3', 'Steve Barclay', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: James Cleverly - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0916_d7505a3d', 'James Cleverly', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Geoffrey Clifton-Brown - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0917_0e841d18', 'Geoffrey Clifton-Brown', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Geoffrey Cox - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0918_f8e29ba3', 'Geoffrey Cox', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jeremy Hunt - UK - Conservative MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0919_c98cfebb', 'Jeremy Hunt', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Conservative MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gideon Amos - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0920_7256bf58', 'Gideon Amos', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Steff Aquarone - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0921_40cf490e', 'Steff Aquarone', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Josh Babarinde - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0922_17ef6770', 'Josh Babarinde', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alison Bennett - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0923_08da15ba', 'Alison Bennett', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alex Brewer - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0924_d97135d5', 'Alex Brewer', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jess Brown-Fuller - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0925_84b4de05', 'Jess Brown-Fuller', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: David Chadwick - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0926_87be07ca', 'David Chadwick', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Wendy Chamberlain - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0927_4b4a276b', 'Wendy Chamberlain', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Danny Chambers - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0928_49aeec95', 'Danny Chambers', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ed Davey - UK - Liberal Democrat MPs
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0929_99257e92', 'Ed Davey', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Liberal Democrat MPs'), true)
ON CONFLICT DO NOTHING;

-- Contact: Kirsty Blackman - UK - Scottish National Party (SNP)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0930_54629385', 'Kirsty Blackman', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Scottish National Party (SNP)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Dave Doogan - UK - Scottish National Party (SNP)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0931_55570728', 'Dave Doogan', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Scottish National Party (SNP)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Stephen Flynn - UK - Scottish National Party (SNP)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0932_90c9ec13', 'Stephen Flynn', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Scottish National Party (SNP)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Stephen Gethins - UK - Scottish National Party (SNP)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0933_f507ce66', 'Stephen Gethins', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Scottish National Party (SNP)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Chris Law - UK - Scottish National Party (SNP)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0934_5f3f82f3', 'Chris Law', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Scottish National Party (SNP)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sian Berry - UK - Green Party and Others
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0935_79ce5aee', 'Sian Berry', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Green Party and Others'), true)
ON CONFLICT DO NOTHING;

-- Contact: Carla Denyer - UK - Green Party and Others
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0936_a4a86fe2', 'Carla Denyer', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Green Party and Others'), true)
ON CONFLICT DO NOTHING;

-- Contact: Ellie Chowns - UK - Green Party and Others
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0937_d91dc18e', 'Ellie Chowns', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Green Party and Others'), true)
ON CONFLICT DO NOTHING;

-- Contact: Adrian Ramsay - UK - Green Party and Others
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0938_9315d48a', 'Adrian Ramsay', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Green Party and Others'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jim Allister - UK - Green Party and Others
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0939_6c78ec67', 'Jim Allister', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Green Party and Others'), true)
ON CONFLICT DO NOTHING;

-- Contact: Lee Anderson - UK - Green Party and Others
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0940_2e879a21', 'Lee Anderson', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Green Party and Others'), true)
ON CONFLICT DO NOTHING;

-- Contact: Nigel Farage - UK - Green Party and Others
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0941_3c8e8db7', 'Nigel Farage', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Green Party and Others'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rupert Lowe - UK - Green Party and Others
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0942_0cc19ac5', 'Rupert Lowe', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Green Party and Others'), true)
ON CONFLICT DO NOTHING;

-- Contact: Parliament Switchboard - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0943_684adc66', 'Parliament Switchboard', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Westminster Main Line - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0944_5302c96d', 'Westminster Main Line', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Speaker's Office - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0945_8730b17c', 'Speaker''s Office', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: House of Commons Address - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0946_1c711bad', 'House of Commons Address', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Prime Minister's Office - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0947_a0bad9cd', 'Prime Minister''s Office', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: PM Contact Form - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0948_42a4a680', 'PM Contact Form', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Parliament Website - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0949_72ca15c2', 'Parliament Website', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Find Your MP (Official) - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0950_f50cabcb', 'Find Your MP (Official)', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: TheyWorkForYou - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0951_17ff3710', 'TheyWorkForYou', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: WriteToThem Service - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0952_45836210', 'WriteToThem Service', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Standard Email Format - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0953_e53f7030', 'Standard Email Format', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Westminster Phone Prefix - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0954_7d439a92', 'Westminster Phone Prefix', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Total House of Commons Seats - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0955_ea5a3fed', 'Total House of Commons Seats', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Labour MPs (January 2026) - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0956_97448e7d', 'Labour MPs (January 2026)', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Conservative MPs - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0957_e0131f02', 'Conservative MPs', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Liberal Democrat MPs - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0958_4f1ea23e', 'Liberal Democrat MPs', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: SNP MPs - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0959_c38e31cc', 'SNP MPs', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Green Party MPs - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0960_31b42321', 'Green Party MPs', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Reform UK MPs - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0961_2360fe08', 'Reform UK MPs', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Other/Independent MPs - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0962_91f8f600', 'Other/Independent MPs', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Next General Election - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0963_c1fb5f11', 'Next General Election', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: Notes - UK - Contact Guide and Reference
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0964_080b77d7', 'Notes', NULL, NULL, (SELECT id FROM organisations WHERE name = 'UK - Contact Guide and Reference'), true)
ON CONFLICT DO NOTHING;

-- Contact: contact@asean.org - Leaders  Database - Regional Groups & Contacts
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0965_7d8f7643', 'contact@asean.org', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Regional Groups & Contacts'), true)
ON CONFLICT DO NOTHING;

-- Contact: au-info@au.int - Leaders  Database - Regional Groups & Contacts
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0966_7a1a1487', 'au-info@au.int', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Regional Groups & Contacts'), true)
ON CONFLICT DO NOTHING;

-- Contact: europa@ec.europa.eu - Leaders  Database - Regional Groups & Contacts
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0967_22fcaeec', 'europa@ec.europa.eu', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Regional Groups & Contacts'), true)
ON CONFLICT DO NOTHING;

-- Contact: inquiries@un.org - Leaders  Database - Regional Groups & Contacts
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0968_3648af32', 'inquiries@un.org', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Regional Groups & Contacts'), true)
ON CONFLICT DO NOTHING;

-- Contact: info@thecommonwealth.org - Leaders  Database - Regional Groups & Contacts
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0969_bd9c1e91', 'info@thecommonwealth.org', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Regional Groups & Contacts'), true)
ON CONFLICT DO NOTHING;

-- Contact: apecsecretary@apec.org - Leaders  Database - Regional Groups & Contacts
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0970_ef8f29cc', 'apecsecretary@apec.org', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Regional Groups & Contacts'), true)
ON CONFLICT DO NOTHING;

-- Contact: Government websites, official diplomatic directories, UN mission listings, DFAT Australian website - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0971_2043043a', 'Government websites, official diplomatic directories, UN mission listings, DFAT Australian website', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: All contact info should be verified on official government websites before use - staff/offices change regularly - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0972_45cb906e', 'All contact info should be verified on official government websites before use - staff/offices change regularly', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: For direct contact with heads of government/state, use official PMO/Presidential office channels, not personal emails - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0973_960a58af', 'For direct contact with heads of government/state, use official PMO/Presidential office channels, not personal emails', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: Many countries do not publish direct executive contact details for security reasons - use main ministry switchboards or webforms - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0974_9d257e2f', 'Many countries do not publish direct executive contact details for security reasons - use main ministry switchboards or webforms', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: Add sheets for specific regions (EU Ministers, ASEAN Leaders, African Union) as needed - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0975_2252e77b', 'Add sheets for specific regions (EU Ministers, ASEAN Leaders, African Union) as needed', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: Update quarterly - government changes, elections, and staff reshuffles occur frequently - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0976_0600d16f', 'Update quarterly - government changes, elections, and staff reshuffles occur frequently', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: Handle government contact data responsibly - not all addresses/numbers are public for operational security - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0977_fe44f33b', 'Handle government contact data responsibly - not all addresses/numbers are public for operational security', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: For most countries, foreign ministry webforms or embassy contacts in your country are preferred for official communication - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0978_7db61a5b', 'For most countries, foreign ministry webforms or embassy contacts in your country are preferred for official communication', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: 1. Select specific regions of interest - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0979_14652747', '1. Select specific regions of interest', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: 2. Verify contacts on official gov websites for each country - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0980_57762be5', '2. Verify contacts on official gov websites for each country', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: 3. Add relevant ministers (Foreign Affairs, Trade, Defense, etc.) - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0981_e3377302', '3. Add relevant ministers (Foreign Affairs, Trade, Defense, etc.)', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: 4. Use diplomatic protocol for initial outreach - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0982_f79395a5', '4. Use diplomatic protocol for initial outreach', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: 5. Maintain a 'Last Updated' column to track data freshness - Leaders  Database - Instructions & Notes
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0983_425a976b', '5. Maintain a ''Last Updated'' column to track data freshness', NULL, NULL, (SELECT id FROM organisations WHERE name = 'Leaders  Database - Instructions & Notes'), true)
ON CONFLICT DO NOTHING;

-- Contact: Emmanuel Macron - France - President and Prime Minister
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0984_69769ae6', 'Emmanuel Macron', 'President of France', NULL, (SELECT id FROM organisations WHERE name = 'France - President and Prime Minister'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sébastien Lecornu - France - President and Prime Minister
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0985_5fa7bb2a', 'Sébastien Lecornu', 'Prime Minister', NULL, (SELECT id FROM organisations WHERE name = 'France - President and Prime Minister'), true)
ON CONFLICT DO NOTHING;

-- Contact: Yaël Braun-Pivet - France - Majority Coalition (LREM-led)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0986_84687677', 'Yaël Braun-Pivet', NULL, '78', (SELECT id FROM organisations WHERE name = 'France - Majority Coalition (LREM-led)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Aurore Bergé - France - Majority Coalition (LREM-led)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0987_915e8c64', 'Aurore Bergé', NULL, '91', (SELECT id FROM organisations WHERE name = 'France - Majority Coalition (LREM-led)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sébastien Lecornu - France - Majority Coalition (LREM-led)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0988_593d6185', 'Sébastien Lecornu', NULL, '50', (SELECT id FROM organisations WHERE name = 'France - Majority Coalition (LREM-led)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Gabriel Attal - France - Majority Coalition (LREM-led)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0989_9c2e6543', 'Gabriel Attal', NULL, '92', (SELECT id FROM organisations WHERE name = 'France - Majority Coalition (LREM-led)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Éric Woerth - France - Majority Coalition (LREM-led)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0990_e5216dcd', 'Éric Woerth', NULL, '60', (SELECT id FROM organisations WHERE name = 'France - Majority Coalition (LREM-led)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Éva Saulignac - France - Majority Coalition (LREM-led)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0991_50d722fc', 'Éva Saulignac', NULL, '87', (SELECT id FROM organisations WHERE name = 'France - Majority Coalition (LREM-led)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Belkhir Belhaddad - France - Majority Coalition (LREM-led)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0992_10a66c92', 'Belkhir Belhaddad', NULL, '76', (SELECT id FROM organisations WHERE name = 'France - Majority Coalition (LREM-led)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Hervé Saulignac - France - Majority Coalition (LREM-led)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0993_2d8f42a5', 'Hervé Saulignac', NULL, '23', (SELECT id FROM organisations WHERE name = 'France - Majority Coalition (LREM-led)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Frédéric Valletoux - France - Majority Coalition (LREM-led)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0994_273a791f', 'Frédéric Valletoux', NULL, '91', (SELECT id FROM organisations WHERE name = 'France - Majority Coalition (LREM-led)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jean-Luc Mélenchon - France - Left-wing Opposition (NUPES)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0995_4923786c', 'Jean-Luc Mélenchon', NULL, '13', (SELECT id FROM organisations WHERE name = 'France - Left-wing Opposition (NUPES)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mathilde Panot - France - Left-wing Opposition (NUPES)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0996_38a43440', 'Mathilde Panot', NULL, '94', (SELECT id FROM organisations WHERE name = 'France - Left-wing Opposition (NUPES)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Clémence Guetté - France - Left-wing Opposition (NUPES)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0997_3cd2bf91', 'Clémence Guetté', NULL, '93', (SELECT id FROM organisations WHERE name = 'France - Left-wing Opposition (NUPES)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Danielle Simonnet - France - Left-wing Opposition (NUPES)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0998_20ce2109', 'Danielle Simonnet', NULL, '75', (SELECT id FROM organisations WHERE name = 'France - Left-wing Opposition (NUPES)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Olivier Faure - France - Left-wing Opposition (NUPES)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_0999_ecd35c87', 'Olivier Faure', NULL, '77', (SELECT id FROM organisations WHERE name = 'France - Left-wing Opposition (NUPES)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Boris Vallaud - France - Left-wing Opposition (NUPES)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1000_71ad84da', 'Boris Vallaud', NULL, '40', (SELECT id FROM organisations WHERE name = 'France - Left-wing Opposition (NUPES)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Sandrine Rousseau - France - Left-wing Opposition (NUPES)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1001_3e8995e0', 'Sandrine Rousseau', NULL, '59', (SELECT id FROM organisations WHERE name = 'France - Left-wing Opposition (NUPES)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Julien Bayou - France - Left-wing Opposition (NUPES)
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1002_93deeeee', 'Julien Bayou', NULL, '75', (SELECT id FROM organisations WHERE name = 'France - Left-wing Opposition (NUPES)'), true)
ON CONFLICT DO NOTHING;

-- Contact: Laurent Wauquiez - France - Right-wing Opposition (Republic
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1003_e2c16ddc', 'Laurent Wauquiez', NULL, '43', (SELECT id FROM organisations WHERE name = 'France - Right-wing Opposition (Republic'), true)
ON CONFLICT DO NOTHING;

-- Contact: Luc Castellani - France - Right-wing Opposition (Republic
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1004_c79b4756', 'Luc Castellani', NULL, '57', (SELECT id FROM organisations WHERE name = 'France - Right-wing Opposition (Republic'), true)
ON CONFLICT DO NOTHING;

-- Contact: Raphaël Glucksmann - France - Right-wing Opposition (Republic
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1005_e5d3b28b', 'Raphaël Glucksmann', NULL, '75', (SELECT id FROM organisations WHERE name = 'France - Right-wing Opposition (Republic'), true)
ON CONFLICT DO NOTHING;

-- Contact: Annie Genevard - France - Right-wing Opposition (Republic
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1006_88941983', 'Annie Genevard', NULL, '25', (SELECT id FROM organisations WHERE name = 'France - Right-wing Opposition (Republic'), true)
ON CONFLICT DO NOTHING;

-- Contact: Jordan Bardella - France - Far-right Opposition (National 
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1007_0355f266', 'Jordan Bardella', NULL, '62', (SELECT id FROM organisations WHERE name = 'France - Far-right Opposition (National '), true)
ON CONFLICT DO NOTHING;

-- Contact: Marine Le Pen - France - Far-right Opposition (National 
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1008_426cb0d7', 'Marine Le Pen', NULL, '62', (SELECT id FROM organisations WHERE name = 'France - Far-right Opposition (National '), true)
ON CONFLICT DO NOTHING;

-- Contact: Fabrice Amlaoui - France - Far-right Opposition (National 
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1009_d6137d52', 'Fabrice Amlaoui', NULL, '83', (SELECT id FROM organisations WHERE name = 'France - Far-right Opposition (National '), true)
ON CONFLICT DO NOTHING;

-- Contact: Stéphane Rambaud - France - Far-right Opposition (National 
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1010_06dd8faa', 'Stéphane Rambaud', NULL, '34', (SELECT id FROM organisations WHERE name = 'France - Far-right Opposition (National '), true)
ON CONFLICT DO NOTHING;

-- Contact: Luiz Inácio Lula da Silva -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1011_ac7ee224', 'Luiz Inácio Lula da Silva', 'President', 'Executive Office', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Geraldo Alckmin -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1012_56d0d3f4', 'Geraldo Alckmin', 'Vice President & Minister of Development, Industry and Commerce', 'Ministry of Development', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Rui Costa -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1013_520de9f7', 'Rui Costa', 'Chief of Staff', 'Office of the Chief of Staff', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Fernando Haddad -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1014_8938f8c3', 'Fernando Haddad', 'Minister of Finance', 'Finance', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Mauro Vieira -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1015_50cdfa41', 'Mauro Vieira', 'Minister of Foreign Affairs', 'Foreign Affairs', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: José Múcio Monteiro -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1016_1bd482b9', 'José Múcio Monteiro', 'Minister of Defense', 'Defense', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Camilo Santana -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1017_5f00844d', 'Camilo Santana', 'Minister of Education', 'Education', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Nísia Trindade Lima -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1018_17df95ad', 'Nísia Trindade Lima', 'Minister of Health', 'Health', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Carlos Favaro -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1019_3025da05', 'Carlos Favaro', 'Minister of Agriculture and Livestock', 'Agriculture', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Marina Silva -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1020_6af9e43c', 'Marina Silva', 'Minister of Environment', 'Environment', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Alexandre Silveira -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1021_c00db783', 'Alexandre Silveira', 'Minister of Mines and Energy', 'Energy', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Andréa Siqueira Franco -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1022_e0026139', 'Andréa Siqueira Franco', 'Minister of Women', 'Ministry of Women', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Guilherme Boulos -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1023_6c26477e', 'Guilherme Boulos', 'Minister of Social Secretariat', 'Social Secretariat', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Flávio Dino -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1024_c6bb5fa3', 'Flávio Dino', 'Minister of Justice and Public Security', 'Justice', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Renan Filho -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1025_8c838c30', 'Renan Filho', 'Minister of Transportation', 'Transportation', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Margherita Sansone -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1026_ab5a8321', 'Margherita Sansone', 'Minister of Culture', 'Ministry of Culture', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Paulo Pimenta -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1027_64575f52', 'Paulo Pimenta', 'Minister of Social Communication', 'Secretariat of Social Communication', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

-- Contact: Luciana Santos -  - Lula Cabinet
INSERT INTO contacts (id, full_name, role_title, department, organisation_id, is_head_office_based) VALUES
    ('contact_1028_302d0c3a', 'Luciana Santos', 'Minister of Science, Technology and Innovation', 'Ministry of Science and Technology', (SELECT id FROM organisations WHERE name = ' - Lula Cabinet'), true)
ON CONFLICT DO NOTHING;

