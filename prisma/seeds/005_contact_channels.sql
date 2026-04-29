-- ============================================================================
-- CONTACT CHANNELS SEED DATA
-- Phone, email, website, and address information
-- Generated on: 2026-01-29T22:31:08.706257
-- ============================================================================

-- Phone for: Xi Jinping
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Xi Jinping'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Xi Jinping
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Xi Jinping'), 'office_address'::ContactChannelType, 'Great Hall of the People, Beijing 100010', 'Great Hall of the People, Beijing 100010', 'Great Hall of the People, Beijing 100010', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Li Qiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Li Qiang'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Li Qiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Li Qiang'), 'office_address'::ContactChannelType, 'State Council, Zhongnanhai, Beijing 100032', 'State Council, Zhongnanhai, Beijing 100032', 'State Council, Zhongnanhai, Beijing 100032', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Xi Jinping
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Xi Jinping'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Xi Jinping
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Xi Jinping'), 'office_address'::ContactChannelType, 'Great Hall of the People, Beijing', 'Great Hall of the People, Beijing', 'Great Hall of the People, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Li Qiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Li Qiang'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Li Qiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Li Qiang'), 'office_address'::ContactChannelType, 'State Council, Beijing', 'State Council, Beijing', 'State Council, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Zhao Leji
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhao Leji'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Zhao Leji
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhao Leji'), 'office_address'::ContactChannelType, 'National People''s Congress, Beijing', 'National People''s Congress, Beijing', 'National People''s Congress, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Cai Qi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cai Qi'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Cai Qi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cai Qi'), 'office_address'::ContactChannelType, 'Chinese People''s Political Consultative Conference, Beijing', 'Chinese People''s Political Consultative Conference, Beijing', 'Chinese People''s Political Consultative Conference, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ding Xuexiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ding Xuexiang'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Ding Xuexiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ding Xuexiang'), 'office_address'::ContactChannelType, 'State Council, Beijing', 'State Council, Beijing', 'State Council, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Zhang Youyu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhang Youyu'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Zhang Youyu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhang Youyu'), 'office_address'::ContactChannelType, 'Communist Party Central Committee, Beijing', 'Communist Party Central Committee, Beijing', 'Communist Party Central Committee, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Chen Wenqing
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chen Wenqing'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Chen Wenqing
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chen Wenqing'), 'office_address'::ContactChannelType, 'Central Commission for Discipline Inspection, Beijing', 'Central Commission for Discipline Inspection, Beijing', 'Central Commission for Discipline Inspection, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Li Qiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Li Qiang'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Li Qiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Li Qiang'), 'office_address'::ContactChannelType, 'State Council, Zhongnanhai, Beijing', 'State Council, Zhongnanhai, Beijing', 'State Council, Zhongnanhai, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ding Xuexiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ding Xuexiang'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Ding Xuexiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ding Xuexiang'), 'office_address'::ContactChannelType, 'State Council, Beijing', 'State Council, Beijing', 'State Council, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Zhang Gaoli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhang Gaoli'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Address for: Zhang Gaoli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhang Gaoli'), 'office_address'::ContactChannelType, 'State Council, Beijing', 'State Council, Beijing', 'State Council, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: He Lifeng
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'He Lifeng'), 'phone'::ContactChannelType, '+86-10-6853-8888', '+86 10 6853 8888', '+861068538888')
ON CONFLICT DO NOTHING;

-- Address for: He Lifeng
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'He Lifeng'), 'office_address'::ContactChannelType, 'NDRC, Beijing', 'NDRC, Beijing', 'NDRC, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Liu Kun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Liu Kun'), 'phone'::ContactChannelType, '+86-10-6855-1114', '+86 10 6855 1114', '+861068551114')
ON CONFLICT DO NOTHING;

-- Address for: Liu Kun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Liu Kun'), 'office_address'::ContactChannelType, 'Ministry of Finance, Beijing', 'Ministry of Finance, Beijing', 'Ministry of Finance, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Pan Gongsheng
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pan Gongsheng'), 'phone'::ContactChannelType, '+86-10-6619-4114', '+86 10 6619 4114', '+861066194114')
ON CONFLICT DO NOTHING;

-- Address for: Pan Gongsheng
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pan Gongsheng'), 'office_address'::ContactChannelType, 'PBOC, Beijing', 'PBOC, Beijing', 'PBOC, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Wang Wentao
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wang Wentao'), 'phone'::ContactChannelType, '+86-10-6519-8888', '+86 10 6519 8888', '+861065198888')
ON CONFLICT DO NOTHING;

-- Address for: Wang Wentao
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wang Wentao'), 'office_address'::ContactChannelType, 'Ministry of Commerce, Beijing', 'Ministry of Commerce, Beijing', 'Ministry of Commerce, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Zhang Keqiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhang Keqiang'), 'phone'::ContactChannelType, '+86-10-6820-1114', '+86 10 6820 1114', '+861068201114')
ON CONFLICT DO NOTHING;

-- Address for: Zhang Keqiang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhang Keqiang'), 'office_address'::ContactChannelType, 'MIIT, Beijing', 'MIIT, Beijing', 'MIIT, Beijing', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Xi Jinping
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Xi Jinping'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Phone for: Zhao Leji
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhao Leji'), 'phone'::ContactChannelType, '+86-10-6596-1111', '+86 10 6596 1111', '+861065961111')
ON CONFLICT DO NOTHING;

-- Phone for: Li Shulei
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Li Shulei'), 'phone'::ContactChannelType, 'Information/Media Control', 'Information/Media Control', '')
ON CONFLICT DO NOTHING;

-- Phone for: Zhang Jun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zhang Jun'), 'phone'::ContactChannelType, 'Anti-Corruption', 'Anti-Corruption', '')
ON CONFLICT DO NOTHING;

-- Phone for: Liu Jinsong
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Liu Jinsong'), 'phone'::ContactChannelType, 'Personnel Management', 'Personnel Management', '')
ON CONFLICT DO NOTHING;

-- Phone for: Chen Wenqing
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chen Wenqing'), 'phone'::ContactChannelType, 'Anti-Corruption & Internal Security', 'Anti-Corruption & Internal Security', '')
ON CONFLICT DO NOTHING;

-- Phone for: Lee Jae-myung
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Jae-myung'), 'phone'::ContactChannelType, '+82-2-770-3131', '+82 2-770-3131', '+8227703131')
ON CONFLICT DO NOTHING;

-- Email for: Lee Jae-myung
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Jae-myung'), 'email'::ContactChannelType, 'info@president.go.kr', 'info@president.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Lee Jae-myung
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Jae-myung'), 'website'::ContactChannelType, 'https://www.president.go.kr', 'https://www.president.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Lee Jae-myung
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Jae-myung'), 'office_address'::ContactChannelType, '1 Sejongno', '1 Sejongno', '1 Sejongno', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Oh Duck-soo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Oh Duck-soo'), 'phone'::ContactChannelType, '+82-2-720-2114', '+82 2-720-2114', '+8227202114')
ON CONFLICT DO NOTHING;

-- Email for: Oh Duck-soo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Oh Duck-soo'), 'email'::ContactChannelType, 'info@pmo.go.kr', 'info@pmo.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Oh Duck-soo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Oh Duck-soo'), 'website'::ContactChannelType, 'https://www.pmo.go.kr', 'https://www.pmo.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Oh Duck-soo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Oh Duck-soo'), 'office_address'::ContactChannelType, '88 Sejong-daero', '88 Sejong-daero', '88 Sejong-daero', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Park Jin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Jin'), 'phone'::ContactChannelType, '+82-44-215-2114', '+82 44-215-2114', '+82442152114')
ON CONFLICT DO NOTHING;

-- Email for: Park Jin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Jin'), 'email'::ContactChannelType, 'info@moef.go.kr', 'info@moef.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Park Jin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Jin'), 'website'::ContactChannelType, 'https://www.moef.go.kr', 'https://www.moef.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Park Jin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Jin'), 'office_address'::ContactChannelType, '39 Sejongno', '39 Sejongno', '39 Sejongno', 'Sejong')
ON CONFLICT DO NOTHING;

-- Phone for: Cho Tae-yul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cho Tae-yul'), 'phone'::ContactChannelType, '+82-2-2100-8114', '+82 2-2100-8114', '+82221008114')
ON CONFLICT DO NOTHING;

-- Email for: Cho Tae-yul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cho Tae-yul'), 'email'::ContactChannelType, 'info@mofa.go.kr', 'info@mofa.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Cho Tae-yul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cho Tae-yul'), 'website'::ContactChannelType, 'https://www.mofa.go.kr', 'https://www.mofa.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Cho Tae-yul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cho Tae-yul'), 'office_address'::ContactChannelType, '37 Sejongno', '37 Sejongno', '37 Sejongno', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Shin Won-shik
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shin Won-shik'), 'phone'::ContactChannelType, '+82-2-2100-5800', '+82 2-2100-5800', '+82221005800')
ON CONFLICT DO NOTHING;

-- Email for: Shin Won-shik
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shin Won-shik'), 'email'::ContactChannelType, 'info@unikorea.go.kr', 'info@unikorea.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Shin Won-shik
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shin Won-shik'), 'website'::ContactChannelType, 'https://www.unikorea.go.kr', 'https://www.unikorea.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Shin Won-shik
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shin Won-shik'), 'office_address'::ContactChannelType, '310 Sejongno', '310 Sejongno', '310 Sejongno', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Shin In-mo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shin In-mo'), 'phone'::ContactChannelType, '+82-2-748-5114', '+82 2-748-5114', '+8227485114')
ON CONFLICT DO NOTHING;

-- Email for: Shin In-mo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shin In-mo'), 'email'::ContactChannelType, 'info@mnd.go.kr', 'info@mnd.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Shin In-mo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shin In-mo'), 'website'::ContactChannelType, 'https://www.mnd.go.kr', 'https://www.mnd.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Shin In-mo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shin In-mo'), 'office_address'::ContactChannelType, '30 Ichon-ro', '30 Ichon-ro', '30 Ichon-ro', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Lee Sang-min
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-min'), 'phone'::ContactChannelType, '+82-2-2100-3114', '+82 2-2100-3114', '+82221003114')
ON CONFLICT DO NOTHING;

-- Email for: Lee Sang-min
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-min'), 'email'::ContactChannelType, 'info@mois.go.kr', 'info@mois.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Lee Sang-min
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-min'), 'website'::ContactChannelType, 'https://www.mois.go.kr', 'https://www.mois.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Lee Sang-min
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-min'), 'office_address'::ContactChannelType, '311 Sejongno', '311 Sejongno', '311 Sejongno', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Park Sang-woo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Sang-woo'), 'phone'::ContactChannelType, '+82-2-2110-0114', '+82 2-2110-0114', '+82221100114')
ON CONFLICT DO NOTHING;

-- Email for: Park Sang-woo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Sang-woo'), 'email'::ContactChannelType, 'info@moj.go.kr', 'info@moj.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Park Sang-woo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Sang-woo'), 'website'::ContactChannelType, 'https://www.moj.go.kr', 'https://www.moj.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Park Sang-woo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Sang-woo'), 'office_address'::ContactChannelType, '92 Sejongno', '92 Sejongno', '92 Sejongno', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Lee Sang-hwan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-hwan'), 'phone'::ContactChannelType, '+82-44-203-6114', '+82 44-203-6114', '+82442036114')
ON CONFLICT DO NOTHING;

-- Email for: Lee Sang-hwan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-hwan'), 'email'::ContactChannelType, 'info@moe.go.kr', 'info@moe.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Lee Sang-hwan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-hwan'), 'website'::ContactChannelType, 'https://www.moe.go.kr', 'https://www.moe.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Lee Sang-hwan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-hwan'), 'office_address'::ContactChannelType, '13 Junghak-ro', '13 Junghak-ro', '13 Junghak-ro', 'Sejong')
ON CONFLICT DO NOTHING;

-- Phone for: Im Hwan-su
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Im Hwan-su'), 'phone'::ContactChannelType, '+82-2-2100-7114', '+82 2-2100-7114', '+82221007114')
ON CONFLICT DO NOTHING;

-- Email for: Im Hwan-su
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Im Hwan-su'), 'email'::ContactChannelType, 'info@mcst.go.kr', 'info@mcst.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Im Hwan-su
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Im Hwan-su'), 'website'::ContactChannelType, 'https://www.mcst.go.kr', 'https://www.mcst.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Im Hwan-su
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Im Hwan-su'), 'office_address'::ContactChannelType, '209 Sejongno', '209 Sejongno', '209 Sejongno', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Park Jin-ho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Jin-ho'), 'phone'::ContactChannelType, '+82-44-201-2114', '+82 44-201-2114', '+82442012114')
ON CONFLICT DO NOTHING;

-- Email for: Park Jin-ho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Jin-ho'), 'email'::ContactChannelType, 'info@mafra.go.kr', 'info@mafra.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Park Jin-ho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Jin-ho'), 'website'::ContactChannelType, 'https://www.mafra.go.kr', 'https://www.mafra.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Park Jin-ho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Park Jin-ho'), 'office_address'::ContactChannelType, '88 Gwanpyeong-ro', '88 Gwanpyeong-ro', '88 Gwanpyeong-ro', 'Sejong')
ON CONFLICT DO NOTHING;

-- Phone for: Ahn Young-hak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahn Young-hak'), 'phone'::ContactChannelType, '+82-44-203-9114', '+82 44-203-9114', '+82442039114')
ON CONFLICT DO NOTHING;

-- Email for: Ahn Young-hak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahn Young-hak'), 'email'::ContactChannelType, 'info@motie.go.kr', 'info@motie.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Ahn Young-hak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahn Young-hak'), 'website'::ContactChannelType, 'https://www.motie.go.kr', 'https://www.motie.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Ahn Young-hak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahn Young-hak'), 'office_address'::ContactChannelType, '92 Sejongno', '92 Sejongno', '92 Sejongno', 'Sejong')
ON CONFLICT DO NOTHING;

-- Phone for: Lee Se-jin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Se-jin'), 'phone'::ContactChannelType, '+82-44-201-6114', '+82 44-201-6114', '+82442016114')
ON CONFLICT DO NOTHING;

-- Email for: Lee Se-jin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Se-jin'), 'email'::ContactChannelType, 'info@me.go.kr', 'info@me.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Lee Se-jin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Se-jin'), 'website'::ContactChannelType, 'https://www.me.go.kr', 'https://www.me.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Lee Se-jin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Se-jin'), 'office_address'::ContactChannelType, '12 Junghak-ro', '12 Junghak-ro', '12 Junghak-ro', 'Sejong')
ON CONFLICT DO NOTHING;

-- Phone for: Yoon Young-suk
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yoon Young-suk'), 'phone'::ContactChannelType, '+82-44-202-3114', '+82 44-202-3114', '+82442023114')
ON CONFLICT DO NOTHING;

-- Email for: Yoon Young-suk
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yoon Young-suk'), 'email'::ContactChannelType, 'info@mohw.go.kr', 'info@mohw.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Yoon Young-suk
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yoon Young-suk'), 'website'::ContactChannelType, 'https://www.mohw.go.kr', 'https://www.mohw.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Yoon Young-suk
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yoon Young-suk'), 'office_address'::ContactChannelType, '13 Junghak-ro', '13 Junghak-ro', '13 Junghak-ro', 'Sejong')
ON CONFLICT DO NOTHING;

-- Phone for: Choi Sang-mok
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Choi Sang-mok'), 'phone'::ContactChannelType, '+82-2-2110-8114', '+82 2-2110-8114', '+82221108114')
ON CONFLICT DO NOTHING;

-- Email for: Choi Sang-mok
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Choi Sang-mok'), 'email'::ContactChannelType, 'info@molit.go.kr', 'info@molit.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Choi Sang-mok
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Choi Sang-mok'), 'website'::ContactChannelType, 'https://www.molit.go.kr', 'https://www.molit.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Choi Sang-mok
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Choi Sang-mok'), 'office_address'::ContactChannelType, '370 Cheonggyecheon-ro', '370 Cheonggyecheon-ro', '370 Cheonggyecheon-ro', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Ahn Duk-geun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahn Duk-geun'), 'phone'::ContactChannelType, '+82-44-202-7114', '+82 44-202-7114', '+82442027114')
ON CONFLICT DO NOTHING;

-- Email for: Ahn Duk-geun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahn Duk-geun'), 'email'::ContactChannelType, 'info@mss.go.kr', 'info@mss.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Ahn Duk-geun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahn Duk-geun'), 'website'::ContactChannelType, 'https://www.mss.go.kr', 'https://www.mss.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Ahn Duk-geun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahn Duk-geun'), 'office_address'::ContactChannelType, '98 Sejongno', '98 Sejongno', '98 Sejongno', 'Sejong')
ON CONFLICT DO NOTHING;

-- Phone for: Choi Moon-soon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Choi Moon-soon'), 'phone'::ContactChannelType, '+82-2-2110-8114', '+82 2-2110-8114', '+82221108114')
ON CONFLICT DO NOTHING;

-- Email for: Choi Moon-soon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Choi Moon-soon'), 'email'::ContactChannelType, 'info@moel.go.kr', 'info@moel.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Choi Moon-soon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Choi Moon-soon'), 'website'::ContactChannelType, 'https://www.moel.go.kr', 'https://www.moel.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Choi Moon-soon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Choi Moon-soon'), 'office_address'::ContactChannelType, '370 Cheonggyecheon-ro', '370 Cheonggyecheon-ro', '370 Cheonggyecheon-ro', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Lee In-young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee In-young'), 'phone'::ContactChannelType, '+82-44-202-3114', '+82 44-202-3114', '+82442023114')
ON CONFLICT DO NOTHING;

-- Email for: Lee In-young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee In-young'), 'email'::ContactChannelType, 'info@mogef.go.kr', 'info@mogef.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Lee In-young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee In-young'), 'website'::ContactChannelType, 'https://www.mogef.go.kr', 'https://www.mogef.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Lee In-young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee In-young'), 'office_address'::ContactChannelType, '17 Junghak-ro', '17 Junghak-ro', '17 Junghak-ro', 'Sejong')
ON CONFLICT DO NOTHING;

-- Phone for: Moon Sung-wook
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Moon Sung-wook'), 'phone'::ContactChannelType, '+82-2-720-0114', '+82 2-720-0114', '+8227200114')
ON CONFLICT DO NOTHING;

-- Email for: Moon Sung-wook
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Moon Sung-wook'), 'email'::ContactChannelType, 'info@mpva.go.kr', 'info@mpva.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Moon Sung-wook
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Moon Sung-wook'), 'website'::ContactChannelType, 'https://www.mpva.go.kr', 'https://www.mpva.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Moon Sung-wook
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Moon Sung-wook'), 'office_address'::ContactChannelType, '159 Samil-daero', '159 Samil-daero', '159 Samil-daero', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Lee Sang-min
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-min'), 'phone'::ContactChannelType, '+82-43-719-8114', '+82 43-719-8114', '+82437198114')
ON CONFLICT DO NOTHING;

-- Email for: Lee Sang-min
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-min'), 'email'::ContactChannelType, 'info@mfds.go.kr', 'info@mfds.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Lee Sang-min
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-min'), 'website'::ContactChannelType, 'https://www.mfds.go.kr', 'https://www.mfds.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Lee Sang-min
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Sang-min'), 'office_address'::ContactChannelType, '187 Osongsaengmyeong-ro', '187 Osongsaengmyeong-ro', '187 Osongsaengmyeong-ro', 'Cheongju')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+82-2-788-2114', '+82 2-788-2114', '+8227882114')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@assembly.go.kr', 'info@assembly.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.nanet.go.kr', 'https://www.nanet.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, '65 Yeouido-dong', '65 Yeouido-dong', '65 Yeouido-dong', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Speaker's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Speaker''s Office'), 'phone'::ContactChannelType, '+82-2-788-2000', '+82 2-788-2000', '+8227882000')
ON CONFLICT DO NOTHING;

-- Email for: Speaker's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Speaker''s Office'), 'email'::ContactChannelType, 'speaker@assembly.go.kr', 'speaker@assembly.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Speaker's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Speaker''s Office'), 'website'::ContactChannelType, 'https://www.nanet.go.kr', 'https://www.nanet.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Speaker's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Speaker''s Office'), 'office_address'::ContactChannelType, '65 Yeouido-dong', '65 Yeouido-dong', '65 Yeouido-dong', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+82-2-788-3114', '+82 2-788-3114', '+8227883114')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'members@assembly.go.kr', 'members@assembly.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://www.nanet.go.kr', 'https://www.nanet.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, '65 Yeouido-dong', '65 Yeouido-dong', '65 Yeouido-dong', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'phone'::ContactChannelType, '+82-2-788-4114', '+82 2-788-4114', '+8227884114')
ON CONFLICT DO NOTHING;

-- Email for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'email'::ContactChannelType, 'inquiry@assembly.go.kr', 'inquiry@assembly.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'website'::ContactChannelType, 'https://www.nanet.go.kr', 'https://www.nanet.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'office_address'::ContactChannelType, '65 Yeouido-dong', '65 Yeouido-dong', '65 Yeouido-dong', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'phone'::ContactChannelType, '+82-2-770-3131', '+82 2-770-3131', '+8227703131')
ON CONFLICT DO NOTHING;

-- Email for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'email'::ContactChannelType, 'info@president.go.kr', 'info@president.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'website'::ContactChannelType, 'https://www.president.go.kr', 'https://www.president.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'office_address'::ContactChannelType, '1 Sejongno', '1 Sejongno', '1 Sejongno', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'phone'::ContactChannelType, '+82-2-720-2114', '+82 2-720-2114', '+8227202114')
ON CONFLICT DO NOTHING;

-- Email for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'email'::ContactChannelType, 'info@pmo.go.kr', 'info@pmo.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'website'::ContactChannelType, 'https://www.pmo.go.kr', 'https://www.pmo.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'office_address'::ContactChannelType, '88 Sejong-daero', '88 Sejong-daero', '88 Sejong-daero', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'phone'::ContactChannelType, '+82-2-2100-8114', '+82 2-2100-8114', '+82221008114')
ON CONFLICT DO NOTHING;

-- Email for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'email'::ContactChannelType, 'info@mofa.go.kr', 'info@mofa.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'website'::ContactChannelType, 'https://www.mofa.go.kr', 'https://www.mofa.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'office_address'::ContactChannelType, '37 Sejongno', '37 Sejongno', '37 Sejongno', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'phone'::ContactChannelType, '+82-2-720-0002', '+82 2-720-0002', '+8227200002')
ON CONFLICT DO NOTHING;

-- Email for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'email'::ContactChannelType, 'info@gpo.go.kr', 'info@gpo.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'website'::ContactChannelType, 'https://www.gpo.go.kr', 'https://www.gpo.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'office_address'::ContactChannelType, '88 Sejong-daero', '88 Sejong-daero', '88 Sejong-daero', 'Seoul')
ON CONFLICT DO NOTHING;

-- Phone for: Salman bin Abdulaziz Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salman bin Abdulaziz Al Saud'), 'phone'::ContactChannelType, '+966-11-4028000', '+966 11 402 8000', '+966114028000')
ON CONFLICT DO NOTHING;

-- Email for: Salman bin Abdulaziz Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salman bin Abdulaziz Al Saud'), 'email'::ContactChannelType, 'info@rcyod.gov.sa', 'info@rcyod.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Salman bin Abdulaziz Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salman bin Abdulaziz Al Saud'), 'website'::ContactChannelType, 'https://www.rcyod.gov.sa', 'https://www.rcyod.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Salman bin Abdulaziz Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salman bin Abdulaziz Al Saud'), 'office_address'::ContactChannelType, 'Al-Safa Palace', 'Al-Safa Palace', 'Al-Safa Palace', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Mohammed bin Salman Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Salman Al Saud'), 'phone'::ContactChannelType, '+966-11-4028000', '+966 11 402 8000', '+966114028000')
ON CONFLICT DO NOTHING;

-- Email for: Mohammed bin Salman Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Salman Al Saud'), 'email'::ContactChannelType, 'info@cpsc.gov.sa', 'info@cpsc.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Mohammed bin Salman Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Salman Al Saud'), 'website'::ContactChannelType, 'https://www.cpsc.gov.sa', 'https://www.cpsc.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Mohammed bin Salman Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Salman Al Saud'), 'office_address'::ContactChannelType, 'Crown Prince Court Building', 'Crown Prince Court Building', 'Crown Prince Court Building', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Khalid bin Salman Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khalid bin Salman Al Saud'), 'phone'::ContactChannelType, '+966-11-4048000', '+966 11 404 8000', '+966114048000')
ON CONFLICT DO NOTHING;

-- Email for: Khalid bin Salman Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khalid bin Salman Al Saud'), 'email'::ContactChannelType, 'info@mod.gov.sa', 'info@mod.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Khalid bin Salman Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khalid bin Salman Al Saud'), 'website'::ContactChannelType, 'https://www.mod.gov.sa', 'https://www.mod.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Khalid bin Salman Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khalid bin Salman Al Saud'), 'office_address'::ContactChannelType, 'King Fahd Road', 'King Fahd Road', 'King Fahd Road', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Faisal bin Farhan Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Faisal bin Farhan Al Saud'), 'phone'::ContactChannelType, '+966-11-4077777', '+966 11 407 7777', '+966114077777')
ON CONFLICT DO NOTHING;

-- Email for: Faisal bin Farhan Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Faisal bin Farhan Al Saud'), 'email'::ContactChannelType, 'info@mofa.gov.sa', 'info@mofa.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Faisal bin Farhan Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Faisal bin Farhan Al Saud'), 'website'::ContactChannelType, 'https://www.mofa.gov.sa', 'https://www.mofa.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Faisal bin Farhan Al Saud
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Faisal bin Farhan Al Saud'), 'office_address'::ContactChannelType, 'King Saud Road', 'King Saud Road', 'King Saud Road', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Mohammed bin Abdullah Al-Jadaan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Abdullah Al-Jadaan'), 'phone'::ContactChannelType, '+966-11-4058000', '+966 11 405 8000', '+966114058000')
ON CONFLICT DO NOTHING;

-- Email for: Mohammed bin Abdullah Al-Jadaan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Abdullah Al-Jadaan'), 'email'::ContactChannelType, 'info@mof.gov.sa', 'info@mof.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Mohammed bin Abdullah Al-Jadaan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Abdullah Al-Jadaan'), 'website'::ContactChannelType, 'https://www.mof.gov.sa', 'https://www.mof.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Mohammed bin Abdullah Al-Jadaan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Abdullah Al-Jadaan'), 'office_address'::ContactChannelType, 'Al-Khazzan Street', 'Al-Khazzan Street', 'Al-Khazzan Street', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Mohammed bin Abdulmalik Al-Sheikh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Abdulmalik Al-Sheikh'), 'phone'::ContactChannelType, '+966-11-4035000', '+966 11 403 5000', '+966114035000')
ON CONFLICT DO NOTHING;

-- Email for: Mohammed bin Abdulmalik Al-Sheikh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Abdulmalik Al-Sheikh'), 'email'::ContactChannelType, 'info@moi.gov.sa', 'info@moi.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Mohammed bin Abdulmalik Al-Sheikh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Abdulmalik Al-Sheikh'), 'website'::ContactChannelType, 'https://www.moi.gov.sa', 'https://www.moi.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Mohammed bin Abdulmalik Al-Sheikh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mohammed bin Abdulmalik Al-Sheikh'), 'office_address'::ContactChannelType, 'Riyadh', 'Riyadh', 'Riyadh', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Waleed bin Ibrahim Al-Khuraiji
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Waleed bin Ibrahim Al-Khuraiji'), 'phone'::ContactChannelType, '+966-11-4770000', '+966 11 477 0000', '+966114770000')
ON CONFLICT DO NOTHING;

-- Email for: Waleed bin Ibrahim Al-Khuraiji
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Waleed bin Ibrahim Al-Khuraiji'), 'email'::ContactChannelType, 'info@moj.gov.sa', 'info@moj.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Waleed bin Ibrahim Al-Khuraiji
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Waleed bin Ibrahim Al-Khuraiji'), 'website'::ContactChannelType, 'https://www.moj.gov.sa', 'https://www.moj.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Waleed bin Ibrahim Al-Khuraiji
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Waleed bin Ibrahim Al-Khuraiji'), 'office_address'::ContactChannelType, 'Riyadh', 'Riyadh', 'Riyadh', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Yasir bin Othman Al-Rumayyan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yasir bin Othman Al-Rumayyan'), 'phone'::ContactChannelType, '+966-11-4914000', '+966 11 491 4000', '+966114914000')
ON CONFLICT DO NOTHING;

-- Email for: Yasir bin Othman Al-Rumayyan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yasir bin Othman Al-Rumayyan'), 'email'::ContactChannelType, 'info@energy.gov.sa', 'info@energy.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Yasir bin Othman Al-Rumayyan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yasir bin Othman Al-Rumayyan'), 'website'::ContactChannelType, 'https://www.energy.gov.sa', 'https://www.energy.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Yasir bin Othman Al-Rumayyan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yasir bin Othman Al-Rumayyan'), 'office_address'::ContactChannelType, 'Nakheel Neighborhood', 'Nakheel Neighborhood', 'Nakheel Neighborhood', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Abdullah bin Nasser Al-Khulaifi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdullah bin Nasser Al-Khulaifi'), 'phone'::ContactChannelType, '+966-11-4024000', '+966 11 402 4000', '+966114024000')
ON CONFLICT DO NOTHING;

-- Email for: Abdullah bin Nasser Al-Khulaifi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdullah bin Nasser Al-Khulaifi'), 'email'::ContactChannelType, 'info@sang.gov.sa', 'info@sang.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Abdullah bin Nasser Al-Khulaifi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdullah bin Nasser Al-Khulaifi'), 'website'::ContactChannelType, 'https://www.sang.gov.sa', 'https://www.sang.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Abdullah bin Nasser Al-Khulaifi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdullah bin Nasser Al-Khulaifi'), 'office_address'::ContactChannelType, 'Riyadh', 'Riyadh', 'Riyadh', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Ahmed bin Abdulrahman Al-Khatib
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahmed bin Abdulrahman Al-Khatib'), 'phone'::ContactChannelType, '+966-12-5584000', '+966 12 558 4000', '+966125584000')
ON CONFLICT DO NOTHING;

-- Email for: Ahmed bin Abdulrahman Al-Khatib
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahmed bin Abdulrahman Al-Khatib'), 'email'::ContactChannelType, 'info@hajj.gov.sa', 'info@hajj.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Ahmed bin Abdulrahman Al-Khatib
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahmed bin Abdulrahman Al-Khatib'), 'website'::ContactChannelType, 'https://www.hajj.gov.sa', 'https://www.hajj.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Ahmed bin Abdulrahman Al-Khatib
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahmed bin Abdulrahman Al-Khatib'), 'office_address'::ContactChannelType, 'Al-Aman Street', 'Al-Aman Street', 'Al-Aman Street', 'Makkah')
ON CONFLICT DO NOTHING;

-- Phone for: Tawfiq bin Faisal Al-Rabiah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tawfiq bin Faisal Al-Rabiah'), 'phone'::ContactChannelType, '+966-11-4651111', '+966 11 465 1111', '+966114651111')
ON CONFLICT DO NOTHING;

-- Email for: Tawfiq bin Faisal Al-Rabiah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tawfiq bin Faisal Al-Rabiah'), 'email'::ContactChannelType, 'info@moh.gov.sa', 'info@moh.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Tawfiq bin Faisal Al-Rabiah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tawfiq bin Faisal Al-Rabiah'), 'website'::ContactChannelType, 'https://www.moh.gov.sa', 'https://www.moh.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Tawfiq bin Faisal Al-Rabiah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tawfiq bin Faisal Al-Rabiah'), 'office_address'::ContactChannelType, 'Al-Nile Street', 'Al-Nile Street', 'Al-Nile Street', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Abdulrahman bin Abdulmohsin Al-Fadli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulrahman bin Abdulmohsin Al-Fadli'), 'phone'::ContactChannelType, '+966-11-4068888', '+966 11 406 8888', '+966114068888')
ON CONFLICT DO NOTHING;

-- Email for: Abdulrahman bin Abdulmohsin Al-Fadli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulrahman bin Abdulmohsin Al-Fadli'), 'email'::ContactChannelType, 'info@agriculture.gov.sa', 'info@agriculture.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Abdulrahman bin Abdulmohsin Al-Fadli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulrahman bin Abdulmohsin Al-Fadli'), 'website'::ContactChannelType, 'https://www.agriculture.gov.sa', 'https://www.agriculture.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Abdulrahman bin Abdulmohsin Al-Fadli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulrahman bin Abdulmohsin Al-Fadli'), 'office_address'::ContactChannelType, 'Al-Futah District', 'Al-Futah District', 'Al-Futah District', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Yousuf bin Ahmed Al-Othaimeen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yousuf bin Ahmed Al-Othaimeen'), 'phone'::ContactChannelType, '+966-11-4409911', '+966 11 440 9911', '+966114409911')
ON CONFLICT DO NOTHING;

-- Email for: Yousuf bin Ahmed Al-Othaimeen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yousuf bin Ahmed Al-Othaimeen'), 'email'::ContactChannelType, 'info@hrsd.gov.sa', 'info@hrsd.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Yousuf bin Ahmed Al-Othaimeen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yousuf bin Ahmed Al-Othaimeen'), 'website'::ContactChannelType, 'https://www.hrsd.gov.sa', 'https://www.hrsd.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Yousuf bin Ahmed Al-Othaimeen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yousuf bin Ahmed Al-Othaimeen'), 'office_address'::ContactChannelType, 'Al-Mughrazat District', 'Al-Mughrazat District', 'Al-Mughrazat District', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Ahmed bin Aqeel Al-Khateeb
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahmed bin Aqeel Al-Khateeb'), 'phone'::ContactChannelType, '+966-11-4029999', '+966 11 402 9999', '+966114029999')
ON CONFLICT DO NOTHING;

-- Email for: Ahmed bin Aqeel Al-Khateeb
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahmed bin Aqeel Al-Khateeb'), 'email'::ContactChannelType, 'info@moe.gov.sa', 'info@moe.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Ahmed bin Aqeel Al-Khateeb
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahmed bin Aqeel Al-Khateeb'), 'website'::ContactChannelType, 'https://www.moe.gov.sa', 'https://www.moe.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Ahmed bin Aqeel Al-Khateeb
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ahmed bin Aqeel Al-Khateeb'), 'office_address'::ContactChannelType, 'Al-Fatih District', 'Al-Fatih District', 'Al-Fatih District', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Abdulaziz bin Abdulmalik Al-Sheikh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulaziz bin Abdulmalik Al-Sheikh'), 'phone'::ContactChannelType, '+966-11-4651234', '+966 11 465 1234', '+966114651234')
ON CONFLICT DO NOTHING;

-- Email for: Abdulaziz bin Abdulmalik Al-Sheikh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulaziz bin Abdulmalik Al-Sheikh'), 'email'::ContactChannelType, 'info@islamic.gov.sa', 'info@islamic.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Abdulaziz bin Abdulmalik Al-Sheikh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulaziz bin Abdulmalik Al-Sheikh'), 'website'::ContactChannelType, 'https://www.islamic.gov.sa', 'https://www.islamic.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Abdulaziz bin Abdulmalik Al-Sheikh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulaziz bin Abdulmalik Al-Sheikh'), 'office_address'::ContactChannelType, 'Riyadh', 'Riyadh', 'Riyadh', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Khalid bin Abdulaziz Al-Angary
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khalid bin Abdulaziz Al-Angary'), 'phone'::ContactChannelType, '+966-11-4778888', '+966 11 477 8888', '+966114778888')
ON CONFLICT DO NOTHING;

-- Email for: Khalid bin Abdulaziz Al-Angary
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khalid bin Abdulaziz Al-Angary'), 'email'::ContactChannelType, 'info@he.gov.sa', 'info@he.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Khalid bin Abdulaziz Al-Angary
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khalid bin Abdulaziz Al-Angary'), 'website'::ContactChannelType, 'https://www.he.gov.sa', 'https://www.he.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Khalid bin Abdulaziz Al-Angary
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khalid bin Abdulaziz Al-Angary'), 'office_address'::ContactChannelType, 'Riyadh', 'Riyadh', 'Riyadh', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Majed bin Abdullah Al-Qasabi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Majed bin Abdullah Al-Qasabi'), 'phone'::ContactChannelType, '+966-11-4140000', '+966 11 414 0000', '+966114140000')
ON CONFLICT DO NOTHING;

-- Email for: Majed bin Abdullah Al-Qasabi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Majed bin Abdullah Al-Qasabi'), 'email'::ContactChannelType, 'info@commerce.gov.sa', 'info@commerce.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Majed bin Abdullah Al-Qasabi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Majed bin Abdullah Al-Qasabi'), 'website'::ContactChannelType, 'https://www.commerce.gov.sa', 'https://www.commerce.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Majed bin Abdullah Al-Qasabi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Majed bin Abdullah Al-Qasabi'), 'office_address'::ContactChannelType, 'Olaya Street', 'Olaya Street', 'Olaya Street', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Ibrahim bin Abdulaziz Al-Assaf
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ibrahim bin Abdulaziz Al-Assaf'), 'phone'::ContactChannelType, '+966-11-4028000', '+966 11 402 8000', '+966114028000')
ON CONFLICT DO NOTHING;

-- Email for: Ibrahim bin Abdulaziz Al-Assaf
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ibrahim bin Abdulaziz Al-Assaf'), 'email'::ContactChannelType, 'info@mcs.gov.sa', 'info@mcs.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Ibrahim bin Abdulaziz Al-Assaf
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ibrahim bin Abdulaziz Al-Assaf'), 'website'::ContactChannelType, 'https://www.mcs.gov.sa', 'https://www.mcs.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Ibrahim bin Abdulaziz Al-Assaf
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ibrahim bin Abdulaziz Al-Assaf'), 'office_address'::ContactChannelType, 'King Fahd Road', 'King Fahd Road', 'King Fahd Road', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Suliman bin Abdullah Al-Hamdan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Suliman bin Abdullah Al-Hamdan'), 'phone'::ContactChannelType, '+966-11-4775000', '+966 11 477 5000', '+966114775000')
ON CONFLICT DO NOTHING;

-- Email for: Suliman bin Abdullah Al-Hamdan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Suliman bin Abdullah Al-Hamdan'), 'email'::ContactChannelType, 'info@mot.gov.sa', 'info@mot.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Suliman bin Abdullah Al-Hamdan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Suliman bin Abdullah Al-Hamdan'), 'website'::ContactChannelType, 'https://www.mot.gov.sa', 'https://www.mot.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Suliman bin Abdullah Al-Hamdan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Suliman bin Abdullah Al-Hamdan'), 'office_address'::ContactChannelType, 'Prince Sultan Road', 'Prince Sultan Road', 'Prince Sultan Road', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Abdulaziz bin Khojah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulaziz bin Khojah'), 'phone'::ContactChannelType, '+966-11-4648888', '+966 11 464 8888', '+966114648888')
ON CONFLICT DO NOTHING;

-- Email for: Abdulaziz bin Khojah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulaziz bin Khojah'), 'email'::ContactChannelType, 'info@moc.gov.sa', 'info@moc.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Abdulaziz bin Khojah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulaziz bin Khojah'), 'website'::ContactChannelType, 'https://www.moc.gov.sa', 'https://www.moc.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Abdulaziz bin Khojah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulaziz bin Khojah'), 'office_address'::ContactChannelType, 'King Saud Road', 'King Saud Road', 'King Saud Road', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+966-11-4821666', '+966 11 482 1666', '+966114821666')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@shura.gov.sa', 'info@shura.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.shura.gov.sa', 'https://www.shura.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Al-Yamamh Palace', 'Al-Yamamh Palace', 'Al-Yamamh Palace', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Secretary General
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Secretary General'), 'phone'::ContactChannelType, '+966-11-4821888', '+966 11 482 1888', '+966114821888')
ON CONFLICT DO NOTHING;

-- Email for: Secretary General
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Secretary General'), 'email'::ContactChannelType, 'secretary@shura.gov.sa', 'secretary@shura.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Secretary General
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Secretary General'), 'website'::ContactChannelType, 'https://www.shura.gov.sa', 'https://www.shura.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Secretary General
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Secretary General'), 'office_address'::ContactChannelType, 'Al-Yamamh Palace', 'Al-Yamamh Palace', 'Al-Yamamh Palace', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'phone'::ContactChannelType, '+966-11-4821999', '+966 11 482 1999', '+966114821999')
ON CONFLICT DO NOTHING;

-- Email for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'email'::ContactChannelType, 'services@shura.gov.sa', 'services@shura.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'website'::ContactChannelType, 'https://www.shura.gov.sa', 'https://www.shura.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'office_address'::ContactChannelType, 'Al-Yamamh Palace', 'Al-Yamamh Palace', 'Al-Yamamh Palace', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the King
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the King'), 'phone'::ContactChannelType, '+966-11-4028000', '+966 11 402 8000', '+966114028000')
ON CONFLICT DO NOTHING;

-- Email for: Office of the King
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the King'), 'email'::ContactChannelType, 'info@rcyod.gov.sa', 'info@rcyod.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Office of the King
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the King'), 'website'::ContactChannelType, 'https://www.rcyod.gov.sa', 'https://www.rcyod.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Office of the King
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the King'), 'office_address'::ContactChannelType, 'Al-Safa Palace', 'Al-Safa Palace', 'Al-Safa Palace', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Crown Prince Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Crown Prince Office'), 'phone'::ContactChannelType, '+966-11-4028000', '+966 11 402 8000', '+966114028000')
ON CONFLICT DO NOTHING;

-- Email for: Crown Prince Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Crown Prince Office'), 'email'::ContactChannelType, 'info@cpsc.gov.sa', 'info@cpsc.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Crown Prince Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Crown Prince Office'), 'website'::ContactChannelType, 'https://www.cpsc.gov.sa', 'https://www.cpsc.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Crown Prince Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Crown Prince Office'), 'office_address'::ContactChannelType, 'Crown Prince Court Building', 'Crown Prince Court Building', 'Crown Prince Court Building', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'phone'::ContactChannelType, '+966-11-4077777', '+966 11 407 7777', '+966114077777')
ON CONFLICT DO NOTHING;

-- Email for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'email'::ContactChannelType, 'info@mofa.gov.sa', 'info@mofa.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'website'::ContactChannelType, 'https://www.mofa.gov.sa', 'https://www.mofa.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'office_address'::ContactChannelType, 'King Saud Road', 'King Saud Road', 'King Saud Road', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Vision 2030 Coordination
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vision 2030 Coordination'), 'phone'::ContactChannelType, '+966-11-4029000', '+966 11 402 9000', '+966114029000')
ON CONFLICT DO NOTHING;

-- Email for: Vision 2030 Coordination
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vision 2030 Coordination'), 'email'::ContactChannelType, 'info@vision2030.gov.sa', 'info@vision2030.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: Vision 2030 Coordination
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vision 2030 Coordination'), 'website'::ContactChannelType, 'https://www.vision2030.gov.sa', 'https://www.vision2030.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: Vision 2030 Coordination
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vision 2030 Coordination'), 'office_address'::ContactChannelType, 'Vision 2030 Centre', 'Vision 2030 Centre', 'Vision 2030 Centre', 'Riyadh')
ON CONFLICT DO NOTHING;

-- Phone for: Friedrich Merz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Friedrich Merz'), 'phone'::ContactChannelType, '+49 (0)30 18400', '+49 30 18400', '+493018400')
ON CONFLICT DO NOTHING;

-- Address for: Friedrich Merz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Friedrich Merz'), 'office_address'::ContactChannelType, 'Federal Chancellery', 'Federal Chancellery', 'Federal Chancellery', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Friedrich Merz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Friedrich Merz'), 'office_address'::ContactChannelType, 'Willy-Brandt-Straße 1', 'Willy-Brandt-Straße 1', 'Willy-Brandt-Straße 1', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Lars Klingbeil
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lars Klingbeil'), 'phone'::ContactChannelType, '+49 (0)30 18682-0', '+49 30 186820', '+4930186820')
ON CONFLICT DO NOTHING;

-- Address for: Lars Klingbeil
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lars Klingbeil'), 'office_address'::ContactChannelType, 'Federal Ministry of Finance', 'Federal Ministry of Finance', 'Federal Ministry of Finance', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Lars Klingbeil
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lars Klingbeil'), 'office_address'::ContactChannelType, 'Wilhelmstraße 97', 'Wilhelmstraße 97', 'Wilhelmstraße 97', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Alexander Dobrindt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Dobrindt'), 'phone'::ContactChannelType, '+49 (0)30 18681-0', '+49 30 186810', '+4930186810')
ON CONFLICT DO NOTHING;

-- Address for: Alexander Dobrindt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Dobrindt'), 'office_address'::ContactChannelType, 'Federal Ministry of Interior', 'Federal Ministry of Interior', 'Federal Ministry of Interior', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Alexander Dobrindt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Dobrindt'), 'office_address'::ContactChannelType, 'Alt-Moabit 140', 'Alt-Moabit 140', 'Alt-Moabit 140', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Johann Wadephul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Johann Wadephul'), 'phone'::ContactChannelType, '+49 (0)30 18170', '+49 30 18170', '+493018170')
ON CONFLICT DO NOTHING;

-- Address for: Johann Wadephul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Johann Wadephul'), 'office_address'::ContactChannelType, 'Foreign Office Berlin', 'Foreign Office Berlin', 'Foreign Office Berlin', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Johann Wadephul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Johann Wadephul'), 'office_address'::ContactChannelType, 'Werderscher Markt 1', 'Werderscher Markt 1', 'Werderscher Markt 1', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Johann Wadephul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Johann Wadephul'), 'phone'::ContactChannelType, '+49 (0)228 99170', '+49 228 99170', '+4922899170')
ON CONFLICT DO NOTHING;

-- Address for: Johann Wadephul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Johann Wadephul'), 'office_address'::ContactChannelType, 'Foreign Office Bonn', 'Foreign Office Bonn', 'Foreign Office Bonn', 'Bonn')
ON CONFLICT DO NOTHING;

-- Address for: Johann Wadephul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Johann Wadephul'), 'office_address'::ContactChannelType, 'Adenauerallee 99-103', 'Adenauerallee 99-103', 'Adenauerallee 99-103', 'Bonn')
ON CONFLICT DO NOTHING;

-- Phone for: Boris Pistorius
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Boris Pistorius'), 'phone'::ContactChannelType, '+49 (0)30 182882-0', '+49 30 1828820', '+49301828820')
ON CONFLICT DO NOTHING;

-- Address for: Boris Pistorius
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Boris Pistorius'), 'office_address'::ContactChannelType, 'Federal Ministry of Defence', 'Federal Ministry of Defence', 'Federal Ministry of Defence', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Boris Pistorius
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Boris Pistorius'), 'office_address'::ContactChannelType, 'Stauffenbergstraße 18', 'Stauffenbergstraße 18', 'Stauffenbergstraße 18', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Katherina Reiche
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Katherina Reiche'), 'phone'::ContactChannelType, '+49 (0)30 18615-0', '+49 30 186150', '+4930186150')
ON CONFLICT DO NOTHING;

-- Address for: Katherina Reiche
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Katherina Reiche'), 'office_address'::ContactChannelType, 'Federal Ministry of Economics', 'Federal Ministry of Economics', 'Federal Ministry of Economics', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Katherina Reiche
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Katherina Reiche'), 'office_address'::ContactChannelType, 'Scharnhorststraße 34-37', 'Scharnhorststraße 34-37', 'Scharnhorststraße 34-37', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Dorothee Bär
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dorothee Bär'), 'phone'::ContactChannelType, '+49 (0)228 57-0', '+49 228 570', '+49228570')
ON CONFLICT DO NOTHING;

-- Address for: Dorothee Bär
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dorothee Bär'), 'office_address'::ContactChannelType, 'Federal Ministry of Research', 'Federal Ministry of Research', 'Federal Ministry of Research', 'Bonn')
ON CONFLICT DO NOTHING;

-- Address for: Dorothee Bär
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dorothee Bär'), 'office_address'::ContactChannelType, 'Hegelstraße 2', 'Hegelstraße 2', 'Hegelstraße 2', 'Bonn')
ON CONFLICT DO NOTHING;

-- Phone for: Stefanie Hubig
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stefanie Hubig'), 'phone'::ContactChannelType, '+49 (0)30 18580-0', '+49 30 185800', '+4930185800')
ON CONFLICT DO NOTHING;

-- Address for: Stefanie Hubig
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stefanie Hubig'), 'office_address'::ContactChannelType, 'Federal Ministry of Justice', 'Federal Ministry of Justice', 'Federal Ministry of Justice', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Stefanie Hubig
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stefanie Hubig'), 'office_address'::ContactChannelType, 'Mohrenstraße 37', 'Mohrenstraße 37', 'Mohrenstraße 37', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Karin Prien
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karin Prien'), 'phone'::ContactChannelType, '+49 (0)30 18555-0', '+49 30 185550', '+4930185550')
ON CONFLICT DO NOTHING;

-- Address for: Karin Prien
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karin Prien'), 'office_address'::ContactChannelType, 'Federal Ministry of Family', 'Federal Ministry of Family', 'Federal Ministry of Family', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Karin Prien
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karin Prien'), 'office_address'::ContactChannelType, 'Glinkastraße 24', 'Glinkastraße 24', 'Glinkastraße 24', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Bärbel Bas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bärbel Bas'), 'phone'::ContactChannelType, '+49 (0)30 18527-0', '+49 30 185270', '+4930185270')
ON CONFLICT DO NOTHING;

-- Address for: Bärbel Bas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bärbel Bas'), 'office_address'::ContactChannelType, 'Federal Ministry of Labour', 'Federal Ministry of Labour', 'Federal Ministry of Labour', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Bärbel Bas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bärbel Bas'), 'office_address'::ContactChannelType, 'Wilhelmstraße 129', 'Wilhelmstraße 129', 'Wilhelmstraße 129', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Karsten Wildberger
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karsten Wildberger'), 'phone'::ContactChannelType, '+49 (0)30 18555-0', '+49 30 185550', '+4930185550')
ON CONFLICT DO NOTHING;

-- Address for: Karsten Wildberger
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karsten Wildberger'), 'office_address'::ContactChannelType, 'Federal Ministry Digital', 'Federal Ministry Digital', 'Federal Ministry Digital', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Karsten Wildberger
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karsten Wildberger'), 'office_address'::ContactChannelType, '10115 Berlin', '10115 Berlin', '10115 Berlin', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Patrick Schnieder
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patrick Schnieder'), 'phone'::ContactChannelType, '+49 (0)30 18615-0', '+49 30 186150', '+4930186150')
ON CONFLICT DO NOTHING;

-- Address for: Patrick Schnieder
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patrick Schnieder'), 'office_address'::ContactChannelType, 'Federal Ministry of Transport', 'Federal Ministry of Transport', 'Federal Ministry of Transport', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Patrick Schnieder
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patrick Schnieder'), 'office_address'::ContactChannelType, 'Invalidenstraße 44', 'Invalidenstraße 44', 'Invalidenstraße 44', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Carsten Schneider
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carsten Schneider'), 'phone'::ContactChannelType, '+49 (0)30 18305-0', '+49 30 183050', '+4930183050')
ON CONFLICT DO NOTHING;

-- Address for: Carsten Schneider
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carsten Schneider'), 'office_address'::ContactChannelType, 'Federal Ministry for Environment', 'Federal Ministry for Environment', 'Federal Ministry for Environment', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Carsten Schneider
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carsten Schneider'), 'office_address'::ContactChannelType, 'Stresemannstraße 128-130', 'Stresemannstraße 128-130', 'Stresemannstraße 128-130', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Nina Warken
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nina Warken'), 'phone'::ContactChannelType, '+49 (0)30 18441-0', '+49 30 184410', '+4930184410')
ON CONFLICT DO NOTHING;

-- Address for: Nina Warken
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nina Warken'), 'office_address'::ContactChannelType, 'Federal Ministry of Health', 'Federal Ministry of Health', 'Federal Ministry of Health', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Nina Warken
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nina Warken'), 'office_address'::ContactChannelType, 'Friedrichstraße 108', 'Friedrichstraße 108', 'Friedrichstraße 108', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Alois Rainer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alois Rainer'), 'phone'::ContactChannelType, '+49 (0)30 18529-0', '+49 30 185290', '+4930185290')
ON CONFLICT DO NOTHING;

-- Address for: Alois Rainer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alois Rainer'), 'office_address'::ContactChannelType, 'Federal Ministry of Food and Agriculture', 'Federal Ministry of Food and Agriculture', 'Federal Ministry of Food and Agriculture', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Alois Rainer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alois Rainer'), 'office_address'::ContactChannelType, 'Wilhelmstraße 54', 'Wilhelmstraße 54', 'Wilhelmstraße 54', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Reem Alabali-Radovan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Reem Alabali-Radovan'), 'phone'::ContactChannelType, '+49 (0)228 99535-0', '+49 228 995350', '+49228995350')
ON CONFLICT DO NOTHING;

-- Address for: Reem Alabali-Radovan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Reem Alabali-Radovan'), 'office_address'::ContactChannelType, 'Federal Ministry of Development', 'Federal Ministry of Development', 'Federal Ministry of Development', 'Bonn')
ON CONFLICT DO NOTHING;

-- Address for: Reem Alabali-Radovan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Reem Alabali-Radovan'), 'office_address'::ContactChannelType, 'Friedrich-Ebert-Allee 40', 'Friedrich-Ebert-Allee 40', 'Friedrich-Ebert-Allee 40', 'Bonn')
ON CONFLICT DO NOTHING;

-- Phone for: Verena Hubertz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Verena Hubertz'), 'phone'::ContactChannelType, '+49 (0)30 18401-0', '+49 30 184010', '+4930184010')
ON CONFLICT DO NOTHING;

-- Address for: Verena Hubertz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Verena Hubertz'), 'office_address'::ContactChannelType, 'Federal Ministry of Housing', 'Federal Ministry of Housing', 'Federal Ministry of Housing', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Verena Hubertz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Verena Hubertz'), 'office_address'::ContactChannelType, 'Krausenstraße 24-26', 'Krausenstraße 24-26', 'Krausenstraße 24-26', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Thorsten Frei
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thorsten Frei'), 'phone'::ContactChannelType, '+49 (0)30 18400', '+49 30 18400', '+493018400')
ON CONFLICT DO NOTHING;

-- Address for: Thorsten Frei
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thorsten Frei'), 'office_address'::ContactChannelType, 'Federal Chancellery', 'Federal Chancellery', 'Federal Chancellery', 'Berlin')
ON CONFLICT DO NOTHING;

-- Address for: Thorsten Frei
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thorsten Frei'), 'office_address'::ContactChannelType, 'Willy-Brandt-Straße 1', 'Willy-Brandt-Straße 1', 'Willy-Brandt-Straße 1', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+49 (0)30 227-0', '+49 30 2270', '+49302270')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'mail@bundestag.de', 'mail@bundestag.de')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Platz der Republik 1', 'Platz der Republik 1', 'Platz der Republik 1', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'phone'::ContactChannelType, '+49 (0)30 227-0', '+49 30 2270', '+49302270')
ON CONFLICT DO NOTHING;

-- Email for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'email'::ContactChannelType, 'postmaster@bundestag.de', 'postmaster@bundestag.de')
ON CONFLICT DO NOTHING;

-- Address for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'office_address'::ContactChannelType, 'Platz der Republik 1', 'Platz der Republik 1', 'Platz der Republik 1', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Bürgertelefon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bürgertelefon'), 'phone'::ContactChannelType, '+49 (0)180 272 00 00', '+49 180 2 720000', '+491802720000')
ON CONFLICT DO NOTHING;

-- Address for: Bürgertelefon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bürgertelefon'), 'office_address'::ContactChannelType, 'General Service', 'General Service', 'General Service', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'phone'::ContactChannelType, '+49 (0)30 18400', '+49 30 18400', '+493018400')
ON CONFLICT DO NOTHING;

-- Email for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'email'::ContactChannelType, 'info@bundeskanzler.de', 'info@bundeskanzler.de')
ON CONFLICT DO NOTHING;

-- Address for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'office_address'::ContactChannelType, 'Willy-Brandt-Straße 1', 'Willy-Brandt-Straße 1', 'Willy-Brandt-Straße 1', 'Berlin')
ON CONFLICT DO NOTHING;

-- Phone for: Donald J. Trump
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Donald J. Trump'), 'phone'::ContactChannelType, '(202) 456-1111', '(202) 456-1111', '2024561111')
ON CONFLICT DO NOTHING;

-- Website for: Donald J. Trump
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Donald J. Trump'), 'website'::ContactChannelType, 'https://www.whitehouse.gov/contact/', 'https://www.whitehouse.gov/contact/')
ON CONFLICT DO NOTHING;

-- Address for: Donald J. Trump
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Donald J. Trump'), 'office_address'::ContactChannelType, '1600 Pennsylvania Avenue NW, Washington, DC 20500', '1600 Pennsylvania Avenue NW, Washington, DC 20500', '1600 Pennsylvania Avenue NW, Washington, DC 20500', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: JD Vance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'JD Vance'), 'phone'::ContactChannelType, '(202) 456-1111', '(202) 456-1111', '2024561111')
ON CONFLICT DO NOTHING;

-- Website for: JD Vance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'JD Vance'), 'website'::ContactChannelType, 'https://www.whitehouse.gov/contact/', 'https://www.whitehouse.gov/contact/')
ON CONFLICT DO NOTHING;

-- Address for: JD Vance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'JD Vance'), 'office_address'::ContactChannelType, '1600 Pennsylvania Avenue NW, Washington, DC 20500', '1600 Pennsylvania Avenue NW, Washington, DC 20500', '1600 Pennsylvania Avenue NW, Washington, DC 20500', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tommy Tuberville
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tommy Tuberville'), 'phone'::ContactChannelType, '(202) 224-4124', '(202) 224-4124', '2022244124')
ON CONFLICT DO NOTHING;

-- Address for: Tommy Tuberville
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tommy Tuberville'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Tommy Tuberville
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tommy Tuberville'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Katie Britt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Katie Britt'), 'phone'::ContactChannelType, '(202) 224-4744', '(202) 224-4744', '2022244744')
ON CONFLICT DO NOTHING;

-- Address for: Katie Britt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Katie Britt'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Katie Britt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Katie Britt'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Dan Sullivan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dan Sullivan'), 'phone'::ContactChannelType, '(202) 224-3004', '(202) 224-3004', '2022243004')
ON CONFLICT DO NOTHING;

-- Address for: Dan Sullivan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dan Sullivan'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Dan Sullivan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dan Sullivan'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Lisa Murkowski
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lisa Murkowski'), 'phone'::ContactChannelType, '(202) 224-6665', '(202) 224-6665', '2022246665')
ON CONFLICT DO NOTHING;

-- Address for: Lisa Murkowski
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lisa Murkowski'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Lisa Murkowski
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lisa Murkowski'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Kyrsten Sinema
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kyrsten Sinema'), 'phone'::ContactChannelType, '(202) 224-4521', '(202) 224-4521', '2022244521')
ON CONFLICT DO NOTHING;

-- Address for: Kyrsten Sinema
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kyrsten Sinema'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Kyrsten Sinema
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kyrsten Sinema'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mark Kelly
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Kelly'), 'phone'::ContactChannelType, '(202) 224-2235', '(202) 224-2235', '2022242235')
ON CONFLICT DO NOTHING;

-- Address for: Mark Kelly
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Kelly'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Mark Kelly
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Kelly'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tom Cotton
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tom Cotton'), 'phone'::ContactChannelType, '(202) 224-2353', '(202) 224-2353', '2022242353')
ON CONFLICT DO NOTHING;

-- Address for: Tom Cotton
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tom Cotton'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Tom Cotton
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tom Cotton'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: J.D. Vance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'J.D. Vance'), 'phone'::ContactChannelType, '(202) 224-3823', '(202) 224-3823', '2022243823')
ON CONFLICT DO NOTHING;

-- Address for: J.D. Vance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'J.D. Vance'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: J.D. Vance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'J.D. Vance'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Dianne Feinstein
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dianne Feinstein'), 'phone'::ContactChannelType, '(202) 224-3841', '(202) 224-3841', '2022243841')
ON CONFLICT DO NOTHING;

-- Address for: Dianne Feinstein
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dianne Feinstein'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Dianne Feinstein
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dianne Feinstein'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Alex Padilla
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Padilla'), 'phone'::ContactChannelType, '(202) 224-3553', '(202) 224-3553', '2022243553')
ON CONFLICT DO NOTHING;

-- Address for: Alex Padilla
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Padilla'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Alex Padilla
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Padilla'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Michael Bennet
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michael Bennet'), 'phone'::ContactChannelType, '(202) 224-5852', '(202) 224-5852', '2022245852')
ON CONFLICT DO NOTHING;

-- Address for: Michael Bennet
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michael Bennet'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Michael Bennet
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michael Bennet'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: John Hickenlooper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Hickenlooper'), 'phone'::ContactChannelType, '(202) 224-5941', '(202) 224-5941', '2022245941')
ON CONFLICT DO NOTHING;

-- Address for: John Hickenlooper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Hickenlooper'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: John Hickenlooper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Hickenlooper'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Richard Blumenthal
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Blumenthal'), 'phone'::ContactChannelType, '(202) 224-2823', '(202) 224-2823', '2022242823')
ON CONFLICT DO NOTHING;

-- Address for: Richard Blumenthal
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Blumenthal'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Richard Blumenthal
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Blumenthal'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Chris Murphy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Murphy'), 'phone'::ContactChannelType, '(202) 224-4041', '(202) 224-4041', '2022244041')
ON CONFLICT DO NOTHING;

-- Address for: Chris Murphy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Murphy'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Chris Murphy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Murphy'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tom Carper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tom Carper'), 'phone'::ContactChannelType, '(202) 224-2441', '(202) 224-2441', '2022242441')
ON CONFLICT DO NOTHING;

-- Address for: Tom Carper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tom Carper'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Tom Carper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tom Carper'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Chris Coons
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Coons'), 'phone'::ContactChannelType, '(202) 224-5042', '(202) 224-5042', '2022245042')
ON CONFLICT DO NOTHING;

-- Address for: Chris Coons
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Coons'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Chris Coons
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Coons'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Marco Rubio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marco Rubio'), 'phone'::ContactChannelType, '(202) 224-3041', '(202) 224-3041', '2022243041')
ON CONFLICT DO NOTHING;

-- Address for: Marco Rubio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marco Rubio'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Marco Rubio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marco Rubio'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Rick Scott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rick Scott'), 'phone'::ContactChannelType, '(202) 224-5274', '(202) 224-5274', '2022245274')
ON CONFLICT DO NOTHING;

-- Address for: Rick Scott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rick Scott'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Rick Scott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rick Scott'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jon Ossoff
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jon Ossoff'), 'phone'::ContactChannelType, '(202) 224-3521', '(202) 224-3521', '2022243521')
ON CONFLICT DO NOTHING;

-- Address for: Jon Ossoff
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jon Ossoff'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Jon Ossoff
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jon Ossoff'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Raphael Warnock
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raphael Warnock'), 'phone'::ContactChannelType, '(202) 224-3643', '(202) 224-3643', '2022243643')
ON CONFLICT DO NOTHING;

-- Address for: Raphael Warnock
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raphael Warnock'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Raphael Warnock
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raphael Warnock'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mazie Hirono
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mazie Hirono'), 'phone'::ContactChannelType, '(202) 224-6361', '(202) 224-6361', '2022246361')
ON CONFLICT DO NOTHING;

-- Address for: Mazie Hirono
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mazie Hirono'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Mazie Hirono
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mazie Hirono'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Brian Schatz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Brian Schatz'), 'phone'::ContactChannelType, '(202) 224-3934', '(202) 224-3934', '2022243934')
ON CONFLICT DO NOTHING;

-- Address for: Brian Schatz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Brian Schatz'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Brian Schatz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Brian Schatz'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mike Crapo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Crapo'), 'phone'::ContactChannelType, '(202) 224-6142', '(202) 224-6142', '2022246142')
ON CONFLICT DO NOTHING;

-- Address for: Mike Crapo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Crapo'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Mike Crapo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Crapo'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jim Risch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jim Risch'), 'phone'::ContactChannelType, '(202) 224-2752', '(202) 224-2752', '2022242752')
ON CONFLICT DO NOTHING;

-- Address for: Jim Risch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jim Risch'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Jim Risch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jim Risch'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Dick Durbin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dick Durbin'), 'phone'::ContactChannelType, '(202) 224-2152', '(202) 224-2152', '2022242152')
ON CONFLICT DO NOTHING;

-- Address for: Dick Durbin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dick Durbin'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Dick Durbin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dick Durbin'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tammy Duckworth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tammy Duckworth'), 'phone'::ContactChannelType, '(202) 224-2854', '(202) 224-2854', '2022242854')
ON CONFLICT DO NOTHING;

-- Address for: Tammy Duckworth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tammy Duckworth'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Tammy Duckworth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tammy Duckworth'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Todd Young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Todd Young'), 'phone'::ContactChannelType, '(202) 224-5623', '(202) 224-5623', '2022245623')
ON CONFLICT DO NOTHING;

-- Address for: Todd Young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Todd Young'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Todd Young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Todd Young'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mike Braun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Braun'), 'phone'::ContactChannelType, '(202) 224-4814', '(202) 224-4814', '2022244814')
ON CONFLICT DO NOTHING;

-- Address for: Mike Braun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Braun'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Mike Braun
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Braun'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Chuck Grassley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chuck Grassley'), 'phone'::ContactChannelType, '(202) 224-3744', '(202) 224-3744', '2022243744')
ON CONFLICT DO NOTHING;

-- Address for: Chuck Grassley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chuck Grassley'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Chuck Grassley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chuck Grassley'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Joni Ernst
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Joni Ernst'), 'phone'::ContactChannelType, '(202) 224-3254', '(202) 224-3254', '2022243254')
ON CONFLICT DO NOTHING;

-- Address for: Joni Ernst
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Joni Ernst'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Joni Ernst
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Joni Ernst'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jerry Moran
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jerry Moran'), 'phone'::ContactChannelType, '(202) 224-6521', '(202) 224-6521', '2022246521')
ON CONFLICT DO NOTHING;

-- Address for: Jerry Moran
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jerry Moran'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Jerry Moran
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jerry Moran'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Roger Marshall
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roger Marshall'), 'phone'::ContactChannelType, '(202) 224-4505', '(202) 224-4505', '2022244505')
ON CONFLICT DO NOTHING;

-- Address for: Roger Marshall
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roger Marshall'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Roger Marshall
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roger Marshall'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Rand Paul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rand Paul'), 'phone'::ContactChannelType, '(202) 224-4343', '(202) 224-4343', '2022244343')
ON CONFLICT DO NOTHING;

-- Address for: Rand Paul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rand Paul'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Rand Paul
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rand Paul'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mitch McConnell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mitch McConnell'), 'phone'::ContactChannelType, '(202) 224-2541', '(202) 224-2541', '2022242541')
ON CONFLICT DO NOTHING;

-- Address for: Mitch McConnell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mitch McConnell'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Mitch McConnell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mitch McConnell'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: John Kennedy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Kennedy'), 'phone'::ContactChannelType, '(202) 224-4623', '(202) 224-4623', '2022244623')
ON CONFLICT DO NOTHING;

-- Address for: John Kennedy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Kennedy'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: John Kennedy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Kennedy'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Bill Cassidy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bill Cassidy'), 'phone'::ContactChannelType, '(202) 224-5824', '(202) 224-5824', '2022245824')
ON CONFLICT DO NOTHING;

-- Address for: Bill Cassidy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bill Cassidy'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Bill Cassidy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bill Cassidy'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Angus King
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angus King'), 'phone'::ContactChannelType, '(202) 224-5344', '(202) 224-5344', '2022245344')
ON CONFLICT DO NOTHING;

-- Address for: Angus King
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angus King'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Angus King
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angus King'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Susan Collins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Susan Collins'), 'phone'::ContactChannelType, '(202) 224-2523', '(202) 224-2523', '2022242523')
ON CONFLICT DO NOTHING;

-- Address for: Susan Collins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Susan Collins'), 'office_address'::ContactChannelType, 'Dirksen Senate Office Building', 'Dirksen Senate Office Building', 'Dirksen Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Susan Collins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Susan Collins'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ben Cardin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ben Cardin'), 'phone'::ContactChannelType, '(202) 224-4524', '(202) 224-4524', '2022244524')
ON CONFLICT DO NOTHING;

-- Address for: Ben Cardin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ben Cardin'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Ben Cardin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ben Cardin'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Chris Van Hollen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Van Hollen'), 'phone'::ContactChannelType, '(202) 224-4654', '(202) 224-4654', '2022244654')
ON CONFLICT DO NOTHING;

-- Address for: Chris Van Hollen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Van Hollen'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Chris Van Hollen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Van Hollen'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Elizabeth Warren
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elizabeth Warren'), 'phone'::ContactChannelType, '(202) 224-4543', '(202) 224-4543', '2022244543')
ON CONFLICT DO NOTHING;

-- Address for: Elizabeth Warren
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elizabeth Warren'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Elizabeth Warren
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elizabeth Warren'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ed Markey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ed Markey'), 'phone'::ContactChannelType, '(202) 224-2742', '(202) 224-2742', '2022242742')
ON CONFLICT DO NOTHING;

-- Address for: Ed Markey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ed Markey'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Ed Markey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ed Markey'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Debbie Stabenow
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Debbie Stabenow'), 'phone'::ContactChannelType, '(202) 224-4822', '(202) 224-4822', '2022244822')
ON CONFLICT DO NOTHING;

-- Address for: Debbie Stabenow
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Debbie Stabenow'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Debbie Stabenow
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Debbie Stabenow'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Gary Peters
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gary Peters'), 'phone'::ContactChannelType, '(202) 224-6221', '(202) 224-6221', '2022246221')
ON CONFLICT DO NOTHING;

-- Address for: Gary Peters
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gary Peters'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Gary Peters
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gary Peters'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Amy Klobuchar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Amy Klobuchar'), 'phone'::ContactChannelType, '(202) 224-3244', '(202) 224-3244', '2022243244')
ON CONFLICT DO NOTHING;

-- Address for: Amy Klobuchar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Amy Klobuchar'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Amy Klobuchar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Amy Klobuchar'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tina Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tina Smith'), 'phone'::ContactChannelType, '(202) 224-5641', '(202) 224-5641', '2022245641')
ON CONFLICT DO NOTHING;

-- Address for: Tina Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tina Smith'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Tina Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tina Smith'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Cindy Hyde-Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cindy Hyde-Smith'), 'phone'::ContactChannelType, '(202) 224-5054', '(202) 224-5054', '2022245054')
ON CONFLICT DO NOTHING;

-- Address for: Cindy Hyde-Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cindy Hyde-Smith'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Cindy Hyde-Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cindy Hyde-Smith'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Roger Wicker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roger Wicker'), 'phone'::ContactChannelType, '(202) 224-6253', '(202) 224-6253', '2022246253')
ON CONFLICT DO NOTHING;

-- Address for: Roger Wicker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roger Wicker'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Roger Wicker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roger Wicker'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Josh Hawley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Josh Hawley'), 'phone'::ContactChannelType, '(202) 224-6154', '(202) 224-6154', '2022246154')
ON CONFLICT DO NOTHING;

-- Address for: Josh Hawley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Josh Hawley'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Josh Hawley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Josh Hawley'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Eric Schmitt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Eric Schmitt'), 'phone'::ContactChannelType, '(202) 224-5721', '(202) 224-5721', '2022245721')
ON CONFLICT DO NOTHING;

-- Address for: Eric Schmitt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Eric Schmitt'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Eric Schmitt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Eric Schmitt'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jon Tester
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jon Tester'), 'phone'::ContactChannelType, '(202) 224-2644', '(202) 224-2644', '2022242644')
ON CONFLICT DO NOTHING;

-- Address for: Jon Tester
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jon Tester'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Jon Tester
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jon Tester'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Steve Daines
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steve Daines'), 'phone'::ContactChannelType, '(202) 224-2651', '(202) 224-2651', '2022242651')
ON CONFLICT DO NOTHING;

-- Address for: Steve Daines
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steve Daines'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Steve Daines
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steve Daines'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Deb Fischer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Deb Fischer'), 'phone'::ContactChannelType, '(202) 224-6551', '(202) 224-6551', '2022246551')
ON CONFLICT DO NOTHING;

-- Address for: Deb Fischer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Deb Fischer'), 'office_address'::ContactChannelType, 'Dirksen Senate Office Building', 'Dirksen Senate Office Building', 'Dirksen Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Deb Fischer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Deb Fischer'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Pete Ricketts
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pete Ricketts'), 'phone'::ContactChannelType, '(202) 224-4224', '(202) 224-4224', '2022244224')
ON CONFLICT DO NOTHING;

-- Address for: Pete Ricketts
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pete Ricketts'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Pete Ricketts
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pete Ricketts'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jacky Rosen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jacky Rosen'), 'phone'::ContactChannelType, '(202) 224-6244', '(202) 224-6244', '2022246244')
ON CONFLICT DO NOTHING;

-- Address for: Jacky Rosen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jacky Rosen'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Jacky Rosen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jacky Rosen'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Catherine Cortez Masto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Catherine Cortez Masto'), 'phone'::ContactChannelType, '(202) 224-3542', '(202) 224-3542', '2022243542')
ON CONFLICT DO NOTHING;

-- Address for: Catherine Cortez Masto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Catherine Cortez Masto'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Catherine Cortez Masto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Catherine Cortez Masto'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Maggie Hassan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maggie Hassan'), 'phone'::ContactChannelType, '(202) 224-3324', '(202) 224-3324', '2022243324')
ON CONFLICT DO NOTHING;

-- Address for: Maggie Hassan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maggie Hassan'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Maggie Hassan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maggie Hassan'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jeanne Shaheen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jeanne Shaheen'), 'phone'::ContactChannelType, '(202) 224-2841', '(202) 224-2841', '2022242841')
ON CONFLICT DO NOTHING;

-- Address for: Jeanne Shaheen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jeanne Shaheen'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Jeanne Shaheen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jeanne Shaheen'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Bob Menendez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bob Menendez'), 'phone'::ContactChannelType, '(202) 224-4744', '(202) 224-4744', '2022244744')
ON CONFLICT DO NOTHING;

-- Address for: Bob Menendez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bob Menendez'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Bob Menendez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bob Menendez'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Cory Booker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cory Booker'), 'phone'::ContactChannelType, '(202) 224-3224', '(202) 224-3224', '2022243224')
ON CONFLICT DO NOTHING;

-- Address for: Cory Booker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cory Booker'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Cory Booker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cory Booker'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Martin Heinrich
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Martin Heinrich'), 'phone'::ContactChannelType, '(202) 224-5521', '(202) 224-5521', '2022245521')
ON CONFLICT DO NOTHING;

-- Address for: Martin Heinrich
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Martin Heinrich'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Martin Heinrich
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Martin Heinrich'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ben Ray Lujan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ben Ray Lujan'), 'phone'::ContactChannelType, '(202) 224-6621', '(202) 224-6621', '2022246621')
ON CONFLICT DO NOTHING;

-- Address for: Ben Ray Lujan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ben Ray Lujan'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Ben Ray Lujan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ben Ray Lujan'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Kirsten Gillibrand
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kirsten Gillibrand'), 'phone'::ContactChannelType, '(202) 224-4451', '(202) 224-4451', '2022244451')
ON CONFLICT DO NOTHING;

-- Address for: Kirsten Gillibrand
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kirsten Gillibrand'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Kirsten Gillibrand
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kirsten Gillibrand'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Chuck Schumer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chuck Schumer'), 'phone'::ContactChannelType, '(202) 224-6542', '(202) 224-6542', '2022246542')
ON CONFLICT DO NOTHING;

-- Address for: Chuck Schumer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chuck Schumer'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Chuck Schumer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chuck Schumer'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Thom Tillis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thom Tillis'), 'phone'::ContactChannelType, '(202) 224-6362', '(202) 224-6362', '2022246362')
ON CONFLICT DO NOTHING;

-- Address for: Thom Tillis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thom Tillis'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Thom Tillis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thom Tillis'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ted Budd
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ted Budd'), 'phone'::ContactChannelType, '(202) 224-3154', '(202) 224-3154', '2022243154')
ON CONFLICT DO NOTHING;

-- Address for: Ted Budd
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ted Budd'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Ted Budd
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ted Budd'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Kevin Cramer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kevin Cramer'), 'phone'::ContactChannelType, '(202) 224-2043', '(202) 224-2043', '2022242043')
ON CONFLICT DO NOTHING;

-- Address for: Kevin Cramer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kevin Cramer'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Kevin Cramer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kevin Cramer'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: John Hoeven
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Hoeven'), 'phone'::ContactChannelType, '(202) 224-2551', '(202) 224-2551', '2022242551')
ON CONFLICT DO NOTHING;

-- Address for: John Hoeven
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Hoeven'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: John Hoeven
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Hoeven'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Sherrod Brown
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sherrod Brown'), 'phone'::ContactChannelType, '(202) 224-2744', '(202) 224-2744', '2022242744')
ON CONFLICT DO NOTHING;

-- Address for: Sherrod Brown
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sherrod Brown'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Sherrod Brown
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sherrod Brown'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: JD Vance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'JD Vance'), 'phone'::ContactChannelType, '(202) 224-5141', '(202) 224-5141', '2022245141')
ON CONFLICT DO NOTHING;

-- Address for: JD Vance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'JD Vance'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: JD Vance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'JD Vance'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: James Lankford
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James Lankford'), 'phone'::ContactChannelType, '(202) 224-5754', '(202) 224-5754', '2022245754')
ON CONFLICT DO NOTHING;

-- Address for: James Lankford
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James Lankford'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: James Lankford
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James Lankford'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Markwayne Mullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Markwayne Mullin'), 'phone'::ContactChannelType, '(202) 224-5754', '(202) 224-5754', '2022245754')
ON CONFLICT DO NOTHING;

-- Address for: Markwayne Mullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Markwayne Mullin'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Markwayne Mullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Markwayne Mullin'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ron Wyden
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ron Wyden'), 'phone'::ContactChannelType, '(202) 224-5244', '(202) 224-5244', '2022245244')
ON CONFLICT DO NOTHING;

-- Address for: Ron Wyden
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ron Wyden'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Ron Wyden
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ron Wyden'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jeff Merkley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jeff Merkley'), 'phone'::ContactChannelType, '(202) 224-3753', '(202) 224-3753', '2022243753')
ON CONFLICT DO NOTHING;

-- Address for: Jeff Merkley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jeff Merkley'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Jeff Merkley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jeff Merkley'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Bob Casey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bob Casey'), 'phone'::ContactChannelType, '(202) 224-6324', '(202) 224-6324', '2022246324')
ON CONFLICT DO NOTHING;

-- Address for: Bob Casey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bob Casey'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Bob Casey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bob Casey'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Pat Toomey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pat Toomey'), 'phone'::ContactChannelType, '(202) 224-4254', '(202) 224-4254', '2022244254')
ON CONFLICT DO NOTHING;

-- Address for: Pat Toomey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pat Toomey'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Pat Toomey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pat Toomey'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Sheldon Whitehouse
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sheldon Whitehouse'), 'phone'::ContactChannelType, '(202) 224-2921', '(202) 224-2921', '2022242921')
ON CONFLICT DO NOTHING;

-- Address for: Sheldon Whitehouse
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sheldon Whitehouse'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Sheldon Whitehouse
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sheldon Whitehouse'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jack Reed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jack Reed'), 'phone'::ContactChannelType, '(202) 224-4642', '(202) 224-4642', '2022244642')
ON CONFLICT DO NOTHING;

-- Address for: Jack Reed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jack Reed'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Jack Reed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jack Reed'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Lindsey Graham
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lindsey Graham'), 'phone'::ContactChannelType, '(202) 224-5972', '(202) 224-5972', '2022245972')
ON CONFLICT DO NOTHING;

-- Address for: Lindsey Graham
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lindsey Graham'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Lindsey Graham
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lindsey Graham'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tim Scott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tim Scott'), 'phone'::ContactChannelType, '(202) 224-6344', '(202) 224-6344', '2022246344')
ON CONFLICT DO NOTHING;

-- Address for: Tim Scott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tim Scott'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Tim Scott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tim Scott'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: John Thune
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Thune'), 'phone'::ContactChannelType, '(202) 224-2321', '(202) 224-2321', '2022242321')
ON CONFLICT DO NOTHING;

-- Address for: John Thune
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Thune'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: John Thune
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Thune'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mike Rounds
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Rounds'), 'phone'::ContactChannelType, '(202) 224-5842', '(202) 224-5842', '2022245842')
ON CONFLICT DO NOTHING;

-- Address for: Mike Rounds
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Rounds'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Mike Rounds
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Rounds'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Lamar Alexander
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lamar Alexander'), 'phone'::ContactChannelType, '(202) 224-4944', '(202) 224-4944', '2022244944')
ON CONFLICT DO NOTHING;

-- Address for: Lamar Alexander
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lamar Alexander'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Lamar Alexander
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lamar Alexander'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Marsha Blackburn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marsha Blackburn'), 'phone'::ContactChannelType, '(202) 224-3344', '(202) 224-3344', '2022243344')
ON CONFLICT DO NOTHING;

-- Address for: Marsha Blackburn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marsha Blackburn'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Marsha Blackburn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marsha Blackburn'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: John Cornyn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Cornyn'), 'phone'::ContactChannelType, '(202) 224-2934', '(202) 224-2934', '2022242934')
ON CONFLICT DO NOTHING;

-- Address for: John Cornyn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Cornyn'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: John Cornyn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Cornyn'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ted Cruz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ted Cruz'), 'phone'::ContactChannelType, '(202) 224-5922', '(202) 224-5922', '2022245922')
ON CONFLICT DO NOTHING;

-- Address for: Ted Cruz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ted Cruz'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Ted Cruz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ted Cruz'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mitt Romney
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mitt Romney'), 'phone'::ContactChannelType, '(202) 224-5251', '(202) 224-5251', '2022245251')
ON CONFLICT DO NOTHING;

-- Address for: Mitt Romney
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mitt Romney'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Mitt Romney
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mitt Romney'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mike Lee
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Lee'), 'phone'::ContactChannelType, '(202) 224-5444', '(202) 224-5444', '2022245444')
ON CONFLICT DO NOTHING;

-- Address for: Mike Lee
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Lee'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Mike Lee
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Lee'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Bernie Sanders
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bernie Sanders'), 'phone'::ContactChannelType, '(202) 224-5141', '(202) 224-5141', '2022245141')
ON CONFLICT DO NOTHING;

-- Address for: Bernie Sanders
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bernie Sanders'), 'office_address'::ContactChannelType, 'Dirksen Senate Office Building', 'Dirksen Senate Office Building', 'Dirksen Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Bernie Sanders
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bernie Sanders'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Peter Welch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Peter Welch'), 'phone'::ContactChannelType, '(202) 224-4242', '(202) 224-4242', '2022244242')
ON CONFLICT DO NOTHING;

-- Address for: Peter Welch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Peter Welch'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Peter Welch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Peter Welch'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mark Warner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Warner'), 'phone'::ContactChannelType, '(202) 224-2023', '(202) 224-2023', '2022242023')
ON CONFLICT DO NOTHING;

-- Address for: Mark Warner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Warner'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Mark Warner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Warner'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tim Kaine
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tim Kaine'), 'phone'::ContactChannelType, '(202) 224-4024', '(202) 224-4024', '2022244024')
ON CONFLICT DO NOTHING;

-- Address for: Tim Kaine
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tim Kaine'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Tim Kaine
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tim Kaine'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Patty Murray
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patty Murray'), 'phone'::ContactChannelType, '(202) 224-2621', '(202) 224-2621', '2022242621')
ON CONFLICT DO NOTHING;

-- Address for: Patty Murray
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patty Murray'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Patty Murray
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patty Murray'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Maria Cantwell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Cantwell'), 'phone'::ContactChannelType, '(202) 224-3441', '(202) 224-3441', '2022243441')
ON CONFLICT DO NOTHING;

-- Address for: Maria Cantwell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Cantwell'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Maria Cantwell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Cantwell'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Joe Manchin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Joe Manchin'), 'phone'::ContactChannelType, '(202) 224-3954', '(202) 224-3954', '2022243954')
ON CONFLICT DO NOTHING;

-- Address for: Joe Manchin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Joe Manchin'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Joe Manchin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Joe Manchin'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Shelley Moore Capito
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shelley Moore Capito'), 'phone'::ContactChannelType, '(202) 224-6472', '(202) 224-6472', '2022246472')
ON CONFLICT DO NOTHING;

-- Address for: Shelley Moore Capito
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shelley Moore Capito'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Shelley Moore Capito
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shelley Moore Capito'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ron Johnson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ron Johnson'), 'phone'::ContactChannelType, '(202) 224-5653', '(202) 224-5653', '2022245653')
ON CONFLICT DO NOTHING;

-- Address for: Ron Johnson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ron Johnson'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Ron Johnson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ron Johnson'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tammy Baldwin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tammy Baldwin'), 'phone'::ContactChannelType, '(202) 224-5653', '(202) 224-5653', '2022245653')
ON CONFLICT DO NOTHING;

-- Address for: Tammy Baldwin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tammy Baldwin'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Tammy Baldwin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tammy Baldwin'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: John Barrasso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Barrasso'), 'phone'::ContactChannelType, '(202) 224-6441', '(202) 224-6441', '2022246441')
ON CONFLICT DO NOTHING;

-- Address for: John Barrasso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Barrasso'), 'office_address'::ContactChannelType, 'Hart Senate Office Building', 'Hart Senate Office Building', 'Hart Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: John Barrasso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Barrasso'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Cynthia Lummis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cynthia Lummis'), 'phone'::ContactChannelType, '(202) 224-3424', '(202) 224-3424', '2022243424')
ON CONFLICT DO NOTHING;

-- Address for: Cynthia Lummis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cynthia Lummis'), 'office_address'::ContactChannelType, 'Russell Senate Office Building', 'Russell Senate Office Building', 'Russell Senate Office Building', NULL)
ON CONFLICT DO NOTHING;

-- Address for: Cynthia Lummis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cynthia Lummis'), 'office_address'::ContactChannelType, 'Washington, DC 20510', 'Washington, DC 20510', 'Washington, DC 20510', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mahmoud Ali Youssouf
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahmoud Ali Youssouf'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Mahmoud Ali Youssouf
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahmoud Ali Youssouf'), 'email'::ContactChannelType, 'info@africa-union.org', 'info@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Mahmoud Ali Youssouf
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahmoud Ali Youssouf'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Mahmoud Ali Youssouf
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahmoud Ali Youssouf'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Selma Malika Haddadi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Selma Malika Haddadi'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Selma Malika Haddadi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Selma Malika Haddadi'), 'email'::ContactChannelType, 'info@africa-union.org', 'info@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Selma Malika Haddadi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Selma Malika Haddadi'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Selma Malika Haddadi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Selma Malika Haddadi'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Bankole Adeoye
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bankole Adeoye'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Bankole Adeoye
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bankole Adeoye'), 'email'::ContactChannelType, 'info@africa-union.org', 'info@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Bankole Adeoye
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bankole Adeoye'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Bankole Adeoye
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bankole Adeoye'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Kwesi Quartey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kwesi Quartey'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Kwesi Quartey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kwesi Quartey'), 'email'::ContactChannelType, 'info@africa-union.org', 'info@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Kwesi Quartey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kwesi Quartey'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Kwesi Quartey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kwesi Quartey'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Amira El Fadil Mohammed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Amira El Fadil Mohammed'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Amira El Fadil Mohammed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Amira El Fadil Mohammed'), 'email'::ContactChannelType, 'info@africa-union.org', 'info@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Amira El Fadil Mohammed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Amira El Fadil Mohammed'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Amira El Fadil Mohammed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Amira El Fadil Mohammed'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Francisca Tatchouop Belobe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Francisca Tatchouop Belobe'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Francisca Tatchouop Belobe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Francisca Tatchouop Belobe'), 'email'::ContactChannelType, 'info@africa-union.org', 'info@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Francisca Tatchouop Belobe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Francisca Tatchouop Belobe'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Francisca Tatchouop Belobe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Francisca Tatchouop Belobe'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Stella Oduah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stella Oduah'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Stella Oduah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stella Oduah'), 'email'::ContactChannelType, 'info@africa-union.org', 'info@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Stella Oduah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stella Oduah'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Stella Oduah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stella Oduah'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Gaspard Banyankimbona
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gaspard Banyankimbona'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Gaspard Banyankimbona
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gaspard Banyankimbona'), 'email'::ContactChannelType, 'info@africa-union.org', 'info@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Gaspard Banyankimbona
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gaspard Banyankimbona'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Gaspard Banyankimbona
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gaspard Banyankimbona'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+27-11-545-5000', '+27 11 545 5000', '+27115455000')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@panafricanparliament.org', 'info@panafricanparliament.org')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://pap.au.int', 'https://pap.au.int')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, '19 Richards Drive, Gallagher Estate', '19 Richards Drive, Gallagher Estate', '19 Richards Drive, Gallagher Estate', 'Johannesburg')
ON CONFLICT DO NOTHING;

-- Phone for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'phone'::ContactChannelType, '+27-11-545-5100', '+27 11 545 5100', '+27115455100')
ON CONFLICT DO NOTHING;

-- Email for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'email'::ContactChannelType, 'president@panafricanparliament.org', 'president@panafricanparliament.org')
ON CONFLICT DO NOTHING;

-- Website for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'website'::ContactChannelType, 'https://pap.au.int', 'https://pap.au.int')
ON CONFLICT DO NOTHING;

-- Address for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'office_address'::ContactChannelType, '19 Richards Drive, Gallagher Estate', '19 Richards Drive, Gallagher Estate', '19 Richards Drive, Gallagher Estate', 'Johannesburg')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+27-11-545-5200', '+27 11 545 5200', '+27115455200')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'members@panafricanparliament.org', 'members@panafricanparliament.org')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://pap.au.int', 'https://pap.au.int')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, '19 Richards Drive, Gallagher Estate', '19 Richards Drive, Gallagher Estate', '19 Richards Drive, Gallagher Estate', 'Johannesburg')
ON CONFLICT DO NOTHING;

-- Phone for: Public Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Information'), 'phone'::ContactChannelType, '+27-11-545-5300', '+27 11 545 5300', '+27115455300')
ON CONFLICT DO NOTHING;

-- Email for: Public Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Information'), 'email'::ContactChannelType, 'info@panafricanparliament.org', 'info@panafricanparliament.org')
ON CONFLICT DO NOTHING;

-- Website for: Public Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Information'), 'website'::ContactChannelType, 'https://pap.au.int', 'https://pap.au.int')
ON CONFLICT DO NOTHING;

-- Address for: Public Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Information'), 'office_address'::ContactChannelType, '19 Richards Drive, Gallagher Estate', '19 Richards Drive, Gallagher Estate', '19 Richards Drive, Gallagher Estate', 'Johannesburg')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@africa-union.org', 'info@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the Chairperson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Chairperson'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Office of the Chairperson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Chairperson'), 'email'::ContactChannelType, 'chairperson@africa-union.org', 'chairperson@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Office of the Chairperson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Chairperson'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Office of the Chairperson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Chairperson'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Information and Communication
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Information and Communication'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Information and Communication
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Information and Communication'), 'email'::ContactChannelType, 'DIC@africa-union.org', 'DIC@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Information and Communication
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Information and Communication'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Information and Communication
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Information and Communication'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'phone'::ContactChannelType, '+251-11-551-7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Email for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'email'::ContactChannelType, 'assembly@africa-union.org', 'assembly@africa-union.org')
ON CONFLICT DO NOTHING;

-- Website for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'website'::ContactChannelType, 'https://au.int', 'https://au.int')
ON CONFLICT DO NOTHING;

-- Address for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'office_address'::ContactChannelType, 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Roosvelt Street, Old Airport Area', 'Addis Ababa')
ON CONFLICT DO NOTHING;

-- Phone for: Prabowo Subianto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Prabowo Subianto'), 'phone'::ContactChannelType, '+62-21-3844-7222', '+62 21 38447222', '+622138447222')
ON CONFLICT DO NOTHING;

-- Email for: Prabowo Subianto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Prabowo Subianto'), 'email'::ContactChannelType, 'hubungan.masyarakat@president.go.id', 'hubungan.masyarakat@president.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Prabowo Subianto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Prabowo Subianto'), 'website'::ContactChannelType, 'https://www.president.go.id', 'https://www.president.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Prabowo Subianto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Prabowo Subianto'), 'office_address'::ContactChannelType, 'Istana Negara, Jalan Veteran No. 1', 'Istana Negara, Jalan Veteran No. 1', 'Istana Negara, Jalan Veteran No. 1', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Gibran Rakabuming Raka
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gibran Rakabuming Raka'), 'phone'::ContactChannelType, '+62-21-345-4567', '+62 21 3454567', '+62213454567')
ON CONFLICT DO NOTHING;

-- Email for: Gibran Rakabuming Raka
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gibran Rakabuming Raka'), 'email'::ContactChannelType, 'hubungan.masyarakat@wapresid.go.id', 'hubungan.masyarakat@wapresid.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Gibran Rakabuming Raka
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gibran Rakabuming Raka'), 'website'::ContactChannelType, 'https://www.wapresid.go.id', 'https://www.wapresid.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Gibran Rakabuming Raka
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gibran Rakabuming Raka'), 'office_address'::ContactChannelType, 'Istana Wakil Presiden, Jalan Medan Merdeka Utara', 'Istana Wakil Presiden, Jalan Medan Merdeka Utara', 'Istana Wakil Presiden, Jalan Medan Merdeka Utara', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Budi Gunawan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Budi Gunawan'), 'phone'::ContactChannelType, '+62-21-3456-789', '+62 21 3456789', '+62213456789')
ON CONFLICT DO NOTHING;

-- Email for: Budi Gunawan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Budi Gunawan'), 'email'::ContactChannelType, 'info@menkopolhukam.go.id', 'info@menkopolhukam.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Budi Gunawan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Budi Gunawan'), 'website'::ContactChannelType, 'https://www.menkopolhukam.go.id', 'https://www.menkopolhukam.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Budi Gunawan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Budi Gunawan'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Barat No. 13', 'Jl. Medan Merdeka Barat No. 13', 'Jl. Medan Merdeka Barat No. 13', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Yusril Ihza Mahendra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yusril Ihza Mahendra'), 'phone'::ContactChannelType, '+62-21-3800-1234', '+62 21 38001234', '+622138001234')
ON CONFLICT DO NOTHING;

-- Email for: Yusril Ihza Mahendra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yusril Ihza Mahendra'), 'email'::ContactChannelType, 'info@menkumham.go.id', 'info@menkumham.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Yusril Ihza Mahendra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yusril Ihza Mahendra'), 'website'::ContactChannelType, 'https://www.menkumham.go.id', 'https://www.menkumham.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Yusril Ihza Mahendra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yusril Ihza Mahendra'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Barat No. 11', 'Jl. Medan Merdeka Barat No. 11', 'Jl. Medan Merdeka Barat No. 11', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Airlangga Hartarto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Airlangga Hartarto'), 'phone'::ContactChannelType, '+62-21-8000-2345', '+62 21 80002345', '+622180002345')
ON CONFLICT DO NOTHING;

-- Email for: Airlangga Hartarto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Airlangga Hartarto'), 'email'::ContactChannelType, 'info@menkeu.go.id', 'info@menkeu.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Airlangga Hartarto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Airlangga Hartarto'), 'website'::ContactChannelType, 'https://www.menkeu.go.id', 'https://www.menkeu.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Airlangga Hartarto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Airlangga Hartarto'), 'office_address'::ContactChannelType, 'Jl. Budi Raya No. 1', 'Jl. Budi Raya No. 1', 'Jl. Budi Raya No. 1', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Pratikno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pratikno'), 'phone'::ContactChannelType, '+62-21-3456-567', '+62 21 3456567', '+62213456567')
ON CONFLICT DO NOTHING;

-- Email for: Pratikno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pratikno'), 'email'::ContactChannelType, 'info@menkpp.go.id', 'info@menkpp.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Pratikno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pratikno'), 'website'::ContactChannelType, 'https://www.menkpp.go.id', 'https://www.menkpp.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Pratikno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pratikno'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Barat No. 15', 'Jl. Medan Merdeka Barat No. 15', 'Jl. Medan Merdeka Barat No. 15', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Luhut Binsar Pandjaitan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luhut Binsar Pandjaitan'), 'phone'::ContactChannelType, '+62-21-3800-5678', '+62 21 38005678', '+622138005678')
ON CONFLICT DO NOTHING;

-- Email for: Luhut Binsar Pandjaitan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luhut Binsar Pandjaitan'), 'email'::ContactChannelType, 'info@menkmarves.go.id', 'info@menkmarves.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Luhut Binsar Pandjaitan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luhut Binsar Pandjaitan'), 'website'::ContactChannelType, 'https://www.menkmarves.go.id', 'https://www.menkmarves.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Luhut Binsar Pandjaitan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luhut Binsar Pandjaitan'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Barat No. 12', 'Jl. Medan Merdeka Barat No. 12', 'Jl. Medan Merdeka Barat No. 12', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Sri Mulyani Indrawati
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sri Mulyani Indrawati'), 'phone'::ContactChannelType, '+62-21-3520-0000', '+62 21 35200000', '+622135200000')
ON CONFLICT DO NOTHING;

-- Email for: Sri Mulyani Indrawati
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sri Mulyani Indrawati'), 'email'::ContactChannelType, 'info@kemenkeu.go.id', 'info@kemenkeu.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Sri Mulyani Indrawati
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sri Mulyani Indrawati'), 'website'::ContactChannelType, 'https://www.kemenkeu.go.id', 'https://www.kemenkeu.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Sri Mulyani Indrawati
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sri Mulyani Indrawati'), 'office_address'::ContactChannelType, 'Jl. Dr. Wahidin Sudirohusodo No. 1', 'Jl. Dr. Wahidin Sudirohusodo No. 1', 'Jl. Dr. Wahidin Sudirohusodo No. 1', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Prabowo Subianto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Prabowo Subianto'), 'phone'::ContactChannelType, '+62-21-3520-1234', '+62 21 35201234', '+622135201234')
ON CONFLICT DO NOTHING;

-- Email for: Prabowo Subianto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Prabowo Subianto'), 'email'::ContactChannelType, 'info@kemhan.go.id', 'info@kemhan.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Prabowo Subianto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Prabowo Subianto'), 'website'::ContactChannelType, 'https://www.kemhan.go.id', 'https://www.kemhan.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Prabowo Subianto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Prabowo Subianto'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Timur No. 5', 'Jl. Medan Merdeka Timur No. 5', 'Jl. Medan Merdeka Timur No. 5', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Sugiyanto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sugiyanto'), 'phone'::ContactChannelType, '+62-21-3801-5678', '+62 21 38015678', '+622138015678')
ON CONFLICT DO NOTHING;

-- Email for: Sugiyanto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sugiyanto'), 'email'::ContactChannelType, 'info@kemendagri.go.id', 'info@kemendagri.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Sugiyanto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sugiyanto'), 'website'::ContactChannelType, 'https://www.kemendagri.go.id', 'https://www.kemendagri.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Sugiyanto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sugiyanto'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Utara No. 7', 'Jl. Medan Merdeka Utara No. 7', 'Jl. Medan Merdeka Utara No. 7', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Retno Marsudi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Retno Marsudi'), 'phone'::ContactChannelType, '+62-21-3441-7040', '+62 21 34417040', '+622134417040')
ON CONFLICT DO NOTHING;

-- Email for: Retno Marsudi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Retno Marsudi'), 'email'::ContactChannelType, 'info@kemlu.go.id', 'info@kemlu.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Retno Marsudi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Retno Marsudi'), 'website'::ContactChannelType, 'https://www.kemlu.go.id', 'https://www.kemlu.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Retno Marsudi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Retno Marsudi'), 'office_address'::ContactChannelType, 'Jl. Taman Pejambon No. 6', 'Jl. Taman Pejambon No. 6', 'Jl. Taman Pejambon No. 6', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Budi Gunadi Sadikin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Budi Gunadi Sadikin'), 'phone'::ContactChannelType, '+62-21-5223-0000', '+62 21 52230000', '+622152230000')
ON CONFLICT DO NOTHING;

-- Email for: Budi Gunadi Sadikin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Budi Gunadi Sadikin'), 'email'::ContactChannelType, 'info@kemkes.go.id', 'info@kemkes.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Budi Gunadi Sadikin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Budi Gunadi Sadikin'), 'website'::ContactChannelType, 'https://www.kemkes.go.id', 'https://www.kemkes.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Budi Gunadi Sadikin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Budi Gunadi Sadikin'), 'office_address'::ContactChannelType, 'Jl. H.R. Rasuna Said Blok X5 Kav. 4-9', 'Jl. H.R. Rasuna Said Blok X5 Kav. 4-9', 'Jl. H.R. Rasuna Said Blok X5 Kav. 4-9', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Abdul Mu'ti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdul Mu''ti'), 'phone'::ContactChannelType, '+62-21-5731-2250', '+62 21 57312250', '+622157312250')
ON CONFLICT DO NOTHING;

-- Email for: Abdul Mu'ti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdul Mu''ti'), 'email'::ContactChannelType, 'info@kemdikbud.go.id', 'info@kemdikbud.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Abdul Mu'ti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdul Mu''ti'), 'website'::ContactChannelType, 'https://www.kemdikbud.go.id', 'https://www.kemdikbud.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Abdul Mu'ti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdul Mu''ti'), 'office_address'::ContactChannelType, 'Jl. Jenderal Sudirman Senayan', 'Jl. Jenderal Sudirman Senayan', 'Jl. Jenderal Sudirman Senayan', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Satryo Soemantri Brodjonegoro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Satryo Soemantri Brodjonegoro'), 'phone'::ContactChannelType, '+62-21-572-0122', '+62 21 5720122', '+62215720122')
ON CONFLICT DO NOTHING;

-- Email for: Satryo Soemantri Brodjonegoro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Satryo Soemantri Brodjonegoro'), 'email'::ContactChannelType, 'info@dikti.go.id', 'info@dikti.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Satryo Soemantri Brodjonegoro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Satryo Soemantri Brodjonegoro'), 'website'::ContactChannelType, 'https://www.dikti.go.id', 'https://www.dikti.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Satryo Soemantri Brodjonegoro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Satryo Soemantri Brodjonegoro'), 'office_address'::ContactChannelType, 'Jl. Jenderal Gatot Subroto No. 10', 'Jl. Jenderal Gatot Subroto No. 10', 'Jl. Jenderal Gatot Subroto No. 10', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Andi Amran Sulaiman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andi Amran Sulaiman'), 'phone'::ContactChannelType, '+62-21-7814-4816', '+62 21 78144816', '+622178144816')
ON CONFLICT DO NOTHING;

-- Email for: Andi Amran Sulaiman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andi Amran Sulaiman'), 'email'::ContactChannelType, 'info@pertanian.go.id', 'info@pertanian.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Andi Amran Sulaiman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andi Amran Sulaiman'), 'website'::ContactChannelType, 'https://www.pertanian.go.id', 'https://www.pertanian.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Andi Amran Sulaiman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andi Amran Sulaiman'), 'office_address'::ContactChannelType, 'Jl. Harsono RM No. 3', 'Jl. Harsono RM No. 3', 'Jl. Harsono RM No. 3', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Sakti Wahyu Trenggono
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sakti Wahyu Trenggono'), 'phone'::ContactChannelType, '+62-21-3520-7890', '+62 21 35207890', '+622135207890')
ON CONFLICT DO NOTHING;

-- Email for: Sakti Wahyu Trenggono
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sakti Wahyu Trenggono'), 'email'::ContactChannelType, 'info@kkp.go.id', 'info@kkp.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Sakti Wahyu Trenggono
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sakti Wahyu Trenggono'), 'website'::ContactChannelType, 'https://www.kkp.go.id', 'https://www.kkp.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Sakti Wahyu Trenggono
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sakti Wahyu Trenggono'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Timur No. 16', 'Jl. Medan Merdeka Timur No. 16', 'Jl. Medan Merdeka Timur No. 16', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Bahlil Lahadalia
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bahlil Lahadalia'), 'phone'::ContactChannelType, '+62-21-5790-0000', '+62 21 57900000', '+622157900000')
ON CONFLICT DO NOTHING;

-- Email for: Bahlil Lahadalia
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bahlil Lahadalia'), 'email'::ContactChannelType, 'info@esdm.go.id', 'info@esdm.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Bahlil Lahadalia
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bahlil Lahadalia'), 'website'::ContactChannelType, 'https://www.esdm.go.id', 'https://www.esdm.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Bahlil Lahadalia
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bahlil Lahadalia'), 'office_address'::ContactChannelType, 'Jl. Jenderal Gatot Subroto No. 1', 'Jl. Jenderal Gatot Subroto No. 1', 'Jl. Jenderal Gatot Subroto No. 1', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Zulkifli Hasan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zulkifli Hasan'), 'phone'::ContactChannelType, '+62-21-7313-6666', '+62 21 73136666', '+622173136666')
ON CONFLICT DO NOTHING;

-- Email for: Zulkifli Hasan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zulkifli Hasan'), 'email'::ContactChannelType, 'info@kemendag.go.id', 'info@kemendag.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Zulkifli Hasan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zulkifli Hasan'), 'website'::ContactChannelType, 'https://www.kemendag.go.id', 'https://www.kemendag.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Zulkifli Hasan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Zulkifli Hasan'), 'office_address'::ContactChannelType, 'Jl. M.I. Ridho No. 1', 'Jl. M.I. Ridho No. 1', 'Jl. M.I. Ridho No. 1', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Agus Gumiwang Kartasasmita
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Agus Gumiwang Kartasasmita'), 'phone'::ContactChannelType, '+62-21-5254-0000', '+62 21 52540000', '+622152540000')
ON CONFLICT DO NOTHING;

-- Email for: Agus Gumiwang Kartasasmita
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Agus Gumiwang Kartasasmita'), 'email'::ContactChannelType, 'info@kemenperin.go.id', 'info@kemenperin.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Agus Gumiwang Kartasasmita
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Agus Gumiwang Kartasasmita'), 'website'::ContactChannelType, 'https://www.kemenperin.go.id', 'https://www.kemenperin.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Agus Gumiwang Kartasasmita
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Agus Gumiwang Kartasasmita'), 'office_address'::ContactChannelType, 'Jl. Gatot Subroto No. 52-53', 'Jl. Gatot Subroto No. 52-53', 'Jl. Gatot Subroto No. 52-53', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Natalius Pigai
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Natalius Pigai'), 'phone'::ContactChannelType, '+62-21-3800-7890', '+62 21 38007890', '+622138007890')
ON CONFLICT DO NOTHING;

-- Email for: Natalius Pigai
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Natalius Pigai'), 'email'::ContactChannelType, 'info@kemenkumham.go.id', 'info@kemenkumham.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Natalius Pigai
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Natalius Pigai'), 'website'::ContactChannelType, 'https://www.kemenkumham.go.id', 'https://www.kemenkumham.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Natalius Pigai
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Natalius Pigai'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Utara No. 13-14', 'Jl. Medan Merdeka Utara No. 13-14', 'Jl. Medan Merdeka Utara No. 13-14', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Raden Dodi Hanggodo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raden Dodi Hanggodo'), 'phone'::ContactChannelType, '+62-21-799-2000', '+62 21 7992000', '+62217992000')
ON CONFLICT DO NOTHING;

-- Email for: Raden Dodi Hanggodo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raden Dodi Hanggodo'), 'email'::ContactChannelType, 'info@pu.go.id', 'info@pu.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Raden Dodi Hanggodo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raden Dodi Hanggodo'), 'website'::ContactChannelType, 'https://www.pu.go.id', 'https://www.pu.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Raden Dodi Hanggodo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raden Dodi Hanggodo'), 'office_address'::ContactChannelType, 'Jl. Pattimura No. 20', 'Jl. Pattimura No. 20', 'Jl. Pattimura No. 20', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Yandri Susanto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yandri Susanto'), 'phone'::ContactChannelType, '+62-21-3800-9999', '+62 21 38009999', '+622138009999')
ON CONFLICT DO NOTHING;

-- Email for: Yandri Susanto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yandri Susanto'), 'email'::ContactChannelType, 'info@kemendesa.go.id', 'info@kemendesa.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Yandri Susanto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yandri Susanto'), 'website'::ContactChannelType, 'https://www.kemendesa.go.id', 'https://www.kemendesa.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Yandri Susanto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yandri Susanto'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Barat No. 14', 'Jl. Medan Merdeka Barat No. 14', 'Jl. Medan Merdeka Barat No. 14', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Fadli Zon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fadli Zon'), 'phone'::ContactChannelType, '+62-21-5721-1234', '+62 21 57211234', '+622157211234')
ON CONFLICT DO NOTHING;

-- Email for: Fadli Zon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fadli Zon'), 'email'::ContactChannelType, 'info@kemendikbud.go.id', 'info@kemendikbud.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Fadli Zon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fadli Zon'), 'website'::ContactChannelType, 'https://www.kemendikbud.go.id', 'https://www.kemendikbud.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Fadli Zon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fadli Zon'), 'office_address'::ContactChannelType, 'Jl. Jenderal Sudirman No. 2', 'Jl. Jenderal Sudirman No. 2', 'Jl. Jenderal Sudirman No. 2', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Bidadi Awt Saw
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bidadi Awt Saw'), 'phone'::ContactChannelType, '+62-21-3846-719', '+62 21 3846719', '+62213846719')
ON CONFLICT DO NOTHING;

-- Email for: Bidadi Awt Saw
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bidadi Awt Saw'), 'email'::ContactChannelType, 'humas@setkab.go.id', 'humas@setkab.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Bidadi Awt Saw
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bidadi Awt Saw'), 'website'::ContactChannelType, 'https://www.setkab.go.id', 'https://www.setkab.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Bidadi Awt Saw
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bidadi Awt Saw'), 'office_address'::ContactChannelType, 'Jl. Veteran No. 18', 'Jl. Veteran No. 18', 'Jl. Veteran No. 18', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+62-21-5715841', '+62 21 5715841', '+62215715841')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@dpr.go.id', 'info@dpr.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.dpr.go.id', 'https://www.dpr.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Jl. Jenderal Gatot Subroto, Senayan', 'Jl. Jenderal Gatot Subroto, Senayan', 'Jl. Jenderal Gatot Subroto, Senayan', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+62-21-5715880', '+62 21 5715880', '+62215715880')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@dpd.go.id', 'info@dpd.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.dpd.go.id', 'https://www.dpd.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Jl. Jenderal Gatot Subroto, Senayan', 'Jl. Jenderal Gatot Subroto, Senayan', 'Jl. Jenderal Gatot Subroto, Senayan', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+62-21-5715900', '+62 21 5715900', '+62215715900')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@mpr.go.id', 'info@mpr.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.mpr.go.id', 'https://www.mpr.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Jl. Jenderal Gatot Subroto, Senayan', 'Jl. Jenderal Gatot Subroto, Senayan', 'Jl. Jenderal Gatot Subroto, Senayan', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+62-21-5715924', '+62 21 5715924', '+62215715924')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'layanan.anggota@dpr.go.id', 'layanan.anggota@dpr.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://www.dpr.go.id', 'https://www.dpr.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, 'Jl. Jenderal Gatot Subroto, Senayan', 'Jl. Jenderal Gatot Subroto, Senayan', 'Jl. Jenderal Gatot Subroto, Senayan', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'phone'::ContactChannelType, '+62-21-3844-7222', '+62 21 38447222', '+622138447222')
ON CONFLICT DO NOTHING;

-- Email for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'email'::ContactChannelType, 'hubungan.masyarakat@president.go.id', 'hubungan.masyarakat@president.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'website'::ContactChannelType, 'https://www.president.go.id', 'https://www.president.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'office_address'::ContactChannelType, 'Jl. Veteran No. 1', 'Jl. Veteran No. 1', 'Jl. Veteran No. 1', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Cabinet Secretariat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cabinet Secretariat'), 'phone'::ContactChannelType, '+62-21-3846-719', '+62 21 3846719', '+62213846719')
ON CONFLICT DO NOTHING;

-- Email for: Cabinet Secretariat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cabinet Secretariat'), 'email'::ContactChannelType, 'humas@setkab.go.id', 'humas@setkab.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Cabinet Secretariat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cabinet Secretariat'), 'website'::ContactChannelType, 'https://www.setkab.go.id', 'https://www.setkab.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Cabinet Secretariat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cabinet Secretariat'), 'office_address'::ContactChannelType, 'Jl. Veteran No. 18', 'Jl. Veteran No. 18', 'Jl. Veteran No. 18', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Ministry of Foreign Affairs
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ministry of Foreign Affairs'), 'phone'::ContactChannelType, '+62-21-3441-7040', '+62 21 34417040', '+622134417040')
ON CONFLICT DO NOTHING;

-- Email for: Ministry of Foreign Affairs
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ministry of Foreign Affairs'), 'email'::ContactChannelType, 'info@kemlu.go.id', 'info@kemlu.go.id')
ON CONFLICT DO NOTHING;

-- Website for: Ministry of Foreign Affairs
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ministry of Foreign Affairs'), 'website'::ContactChannelType, 'https://www.kemlu.go.id', 'https://www.kemlu.go.id')
ON CONFLICT DO NOTHING;

-- Address for: Ministry of Foreign Affairs
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ministry of Foreign Affairs'), 'office_address'::ContactChannelType, 'Jl. Taman Pejambon No. 6', 'Jl. Taman Pejambon No. 6', 'Jl. Taman Pejambon No. 6', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: State Personnel Agency
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'State Personnel Agency'), 'phone'::ContactChannelType, '+62-21-3520-4567', '+62 21 35204567', '+622135204567')
ON CONFLICT DO NOTHING;

-- Email for: State Personnel Agency
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'State Personnel Agency'), 'email'::ContactChannelType, 'info@bkn.go.id', 'info@bkn.go.id')
ON CONFLICT DO NOTHING;

-- Website for: State Personnel Agency
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'State Personnel Agency'), 'website'::ContactChannelType, 'https://www.bkn.go.id', 'https://www.bkn.go.id')
ON CONFLICT DO NOTHING;

-- Address for: State Personnel Agency
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'State Personnel Agency'), 'office_address'::ContactChannelType, 'Jl. Medan Merdeka Timur No. 6', 'Jl. Medan Merdeka Timur No. 6', 'Jl. Medan Merdeka Timur No. 6', 'Jakarta')
ON CONFLICT DO NOTHING;

-- Phone for: Vladimir Putin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vladimir Putin'), 'phone'::ContactChannelType, '+7-495-697-58-00', '+7 495 697-58-00', '+74956975800')
ON CONFLICT DO NOTHING;

-- Email for: Vladimir Putin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vladimir Putin'), 'email'::ContactChannelType, 'info@kremlin.ru', 'info@kremlin.ru')
ON CONFLICT DO NOTHING;

-- Website for: Vladimir Putin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vladimir Putin'), 'website'::ContactChannelType, 'http://www.kremlin.ru', 'http://www.kremlin.ru')
ON CONFLICT DO NOTHING;

-- Address for: Vladimir Putin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vladimir Putin'), 'office_address'::ContactChannelType, 'Kremlin, ul. Ilyinka 23', 'Kremlin, ul. Ilyinka 23', 'Kremlin, ul. Ilyinka 23', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Mikhail Mishustin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Mishustin'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Mikhail Mishustin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Mishustin'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Mikhail Mishustin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Mishustin'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Mikhail Mishustin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Mishustin'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Denis Manturov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Denis Manturov'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Denis Manturov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Denis Manturov'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Denis Manturov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Denis Manturov'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Denis Manturov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Denis Manturov'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Dmitry Grigorenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Grigorenko'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Dmitry Grigorenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Grigorenko'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Dmitry Grigorenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Grigorenko'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Dmitry Grigorenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Grigorenko'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Yury Trutnev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yury Trutnev'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Yury Trutnev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yury Trutnev'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Yury Trutnev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yury Trutnev'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Yury Trutnev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yury Trutnev'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Dmitry Patrushev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Patrushev'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Dmitry Patrushev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Patrushev'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Dmitry Patrushev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Patrushev'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Dmitry Patrushev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Patrushev'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Alexey Overchuk
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexey Overchuk'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Alexey Overchuk
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexey Overchuk'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Alexey Overchuk
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexey Overchuk'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Alexey Overchuk
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexey Overchuk'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Alexander Novak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Novak'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Alexander Novak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Novak'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Alexander Novak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Novak'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Alexander Novak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Novak'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Marat Khusnullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marat Khusnullin'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Marat Khusnullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marat Khusnullin'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Marat Khusnullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marat Khusnullin'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Marat Khusnullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marat Khusnullin'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Tatyana Golikova
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tatyana Golikova'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Tatyana Golikova
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tatyana Golikova'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Tatyana Golikova
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tatyana Golikova'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Tatyana Golikova
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tatyana Golikova'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Dmitry Chernyshenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Chernyshenko'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Dmitry Chernyshenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Chernyshenko'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Dmitry Chernyshenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Chernyshenko'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Dmitry Chernyshenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dmitry Chernyshenko'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Vitaly Savelyev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vitaly Savelyev'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Vitaly Savelyev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vitaly Savelyev'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Vitaly Savelyev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vitaly Savelyev'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Vitaly Savelyev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vitaly Savelyev'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Sergey Lavrov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Lavrov'), 'phone'::ContactChannelType, '+7-499-244-41-19', '+7 499 244-41-19', '+74992444119')
ON CONFLICT DO NOTHING;

-- Email for: Sergey Lavrov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Lavrov'), 'email'::ContactChannelType, 'dip@mid.ru', 'dip@mid.ru')
ON CONFLICT DO NOTHING;

-- Website for: Sergey Lavrov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Lavrov'), 'website'::ContactChannelType, 'https://www.mid.ru', 'https://www.mid.ru')
ON CONFLICT DO NOTHING;

-- Address for: Sergey Lavrov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Lavrov'), 'office_address'::ContactChannelType, 'Smolenskaya sq. 32/34', 'Smolenskaya sq. 32/34', 'Smolenskaya sq. 32/34', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Anton Siluanov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Siluanov'), 'phone'::ContactChannelType, '+7-495-913-11-11', '+7 495 913-11-11', '+74959131111')
ON CONFLICT DO NOTHING;

-- Email for: Anton Siluanov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Siluanov'), 'email'::ContactChannelType, 'info@minfin.gov.ru', 'info@minfin.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Anton Siluanov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Siluanov'), 'website'::ContactChannelType, 'https://www.minfin.gov.ru', 'https://www.minfin.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Anton Siluanov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Siluanov'), 'office_address'::ContactChannelType, 'ul. Ilyinka 9', 'ul. Ilyinka 9', 'ul. Ilyinka 9', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Andrey Belousov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrey Belousov'), 'phone'::ContactChannelType, '+7-495-695-31-84', '+7 495 695-31-84', '+74956953184')
ON CONFLICT DO NOTHING;

-- Email for: Andrey Belousov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrey Belousov'), 'email'::ContactChannelType, 'info@mil.ru', 'info@mil.ru')
ON CONFLICT DO NOTHING;

-- Website for: Andrey Belousov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrey Belousov'), 'website'::ContactChannelType, 'https://www.mil.ru', 'https://www.mil.ru')
ON CONFLICT DO NOTHING;

-- Address for: Andrey Belousov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrey Belousov'), 'office_address'::ContactChannelType, 'Arbatskaya pl. 2', 'Arbatskaya pl. 2', 'Arbatskaya pl. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Vladimir Kolokoltsev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vladimir Kolokoltsev'), 'phone'::ContactChannelType, '+7-495-667-86-00', '+7 495 667-86-00', '+74956678600')
ON CONFLICT DO NOTHING;

-- Email for: Vladimir Kolokoltsev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vladimir Kolokoltsev'), 'email'::ContactChannelType, 'info@mvd.ru', 'info@mvd.ru')
ON CONFLICT DO NOTHING;

-- Website for: Vladimir Kolokoltsev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vladimir Kolokoltsev'), 'website'::ContactChannelType, 'https://www.mvd.ru', 'https://www.mvd.ru')
ON CONFLICT DO NOTHING;

-- Address for: Vladimir Kolokoltsev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vladimir Kolokoltsev'), 'office_address'::ContactChannelType, 'Zhitnaya ul. 16', 'Zhitnaya ul. 16', 'Zhitnaya ul. 16', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Konstantin Chuychenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Konstantin Chuychenko'), 'phone'::ContactChannelType, '+7-495-951-36-42', '+7 495 951-36-42', '+74959513642')
ON CONFLICT DO NOTHING;

-- Email for: Konstantin Chuychenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Konstantin Chuychenko'), 'email'::ContactChannelType, 'info@minjust.gov.ru', 'info@minjust.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Konstantin Chuychenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Konstantin Chuychenko'), 'website'::ContactChannelType, 'https://www.minjust.gov.ru', 'https://www.minjust.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Konstantin Chuychenko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Konstantin Chuychenko'), 'office_address'::ContactChannelType, 'Zhitnaya ul. 14', 'Zhitnaya ul. 14', 'Zhitnaya ul. 14', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Mikhail Murashko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Murashko'), 'phone'::ContactChannelType, '+7-495-627-24-67', '+7 495 627-24-67', '+74956272467')
ON CONFLICT DO NOTHING;

-- Email for: Mikhail Murashko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Murashko'), 'email'::ContactChannelType, 'info@rosminzdrav.ru', 'info@rosminzdrav.ru')
ON CONFLICT DO NOTHING;

-- Website for: Mikhail Murashko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Murashko'), 'website'::ContactChannelType, 'https://www.rosminzdrav.ru', 'https://www.rosminzdrav.ru')
ON CONFLICT DO NOTHING;

-- Address for: Mikhail Murashko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Murashko'), 'office_address'::ContactChannelType, 'Rakhmanovsky per. 3', 'Rakhmanovsky per. 3', 'Rakhmanovsky per. 3', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Sergey Kravtsov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Kravtsov'), 'phone'::ContactChannelType, '+7-495-621-64-80', '+7 495 621-64-80', '+74956216480')
ON CONFLICT DO NOTHING;

-- Email for: Sergey Kravtsov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Kravtsov'), 'email'::ContactChannelType, 'info@edu.gov.ru', 'info@edu.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Sergey Kravtsov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Kravtsov'), 'website'::ContactChannelType, 'https://www.edu.gov.ru', 'https://www.edu.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Sergey Kravtsov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Kravtsov'), 'office_address'::ContactChannelType, 'Lubyanka ul. 11', 'Lubyanka ul. 11', 'Lubyanka ul. 11', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Valery Falkov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Valery Falkov'), 'phone'::ContactChannelType, '+7-495-122-22-68', '+7 495 122-22-68', '+74951222268')
ON CONFLICT DO NOTHING;

-- Email for: Valery Falkov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Valery Falkov'), 'email'::ContactChannelType, 'inter-students@minobrnauki.gov.ru', 'inter-students@minobrnauki.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Valery Falkov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Valery Falkov'), 'website'::ContactChannelType, 'https://www.minobrnauki.gov.ru', 'https://www.minobrnauki.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Valery Falkov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Valery Falkov'), 'office_address'::ContactChannelType, 'Tverskaya ul. 11', 'Tverskaya ul. 11', 'Tverskaya ul. 11', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Maxim Reshetnikov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maxim Reshetnikov'), 'phone'::ContactChannelType, '+7-495-870-29-21', '+7 495 870-29-21', '+74958702921')
ON CONFLICT DO NOTHING;

-- Email for: Maxim Reshetnikov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maxim Reshetnikov'), 'email'::ContactChannelType, 'info@economy.gov.ru', 'info@economy.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Maxim Reshetnikov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maxim Reshetnikov'), 'website'::ContactChannelType, 'https://www.economy.gov.ru', 'https://www.economy.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Maxim Reshetnikov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maxim Reshetnikov'), 'office_address'::ContactChannelType, 'ul. Myasnitskaya 47', 'ul. Myasnitskaya 47', 'ul. Myasnitskaya 47', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Anton Alikhanov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Alikhanov'), 'phone'::ContactChannelType, '+7-495-923-47-30', '+7 495 923-47-30', '+74959234730')
ON CONFLICT DO NOTHING;

-- Email for: Anton Alikhanov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Alikhanov'), 'email'::ContactChannelType, 'info@minpromtorg.gov.ru', 'info@minpromtorg.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Anton Alikhanov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Alikhanov'), 'website'::ContactChannelType, 'https://www.minpromtorg.gov.ru', 'https://www.minpromtorg.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Anton Alikhanov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Alikhanov'), 'office_address'::ContactChannelType, 'Kitayskaya pl. 4', 'Kitayskaya pl. 4', 'Kitayskaya pl. 4', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Sergey Tsivilyov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Tsivilyov'), 'phone'::ContactChannelType, '+7-495-925-68-00', '+7 495 925-68-00', '+74959256800')
ON CONFLICT DO NOTHING;

-- Email for: Sergey Tsivilyov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Tsivilyov'), 'email'::ContactChannelType, 'info@energy.gov.ru', 'info@energy.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Sergey Tsivilyov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Tsivilyov'), 'website'::ContactChannelType, 'https://www.energy.gov.ru', 'https://www.energy.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Sergey Tsivilyov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergey Tsivilyov'), 'office_address'::ContactChannelType, 'Shlyuzovaya nab. 28', 'Shlyuzovaya nab. 28', 'Shlyuzovaya nab. 28', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Alexander Kozlov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Kozlov'), 'phone'::ContactChannelType, '+7-495-254-36-75', '+7 495 254-36-75', '+74952543675')
ON CONFLICT DO NOTHING;

-- Email for: Alexander Kozlov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Kozlov'), 'email'::ContactChannelType, 'info@mnr.gov.ru', 'info@mnr.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Alexander Kozlov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Kozlov'), 'website'::ContactChannelType, 'https://www.mnr.gov.ru', 'https://www.mnr.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Alexander Kozlov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Kozlov'), 'office_address'::ContactChannelType, 'B. Gruzinskaya ul. 4/6', 'B. Gruzinskaya ul. 4/6', 'B. Gruzinskaya ul. 4/6', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Oksana Lut
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Oksana Lut'), 'phone'::ContactChannelType, '+7-495-607-80-00', '+7 495 607-80-00', '+74956078000')
ON CONFLICT DO NOTHING;

-- Email for: Oksana Lut
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Oksana Lut'), 'email'::ContactChannelType, 'info@agro.gov.ru', 'info@agro.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Oksana Lut
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Oksana Lut'), 'website'::ContactChannelType, 'https://www.agro.gov.ru', 'https://www.agro.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Oksana Lut
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Oksana Lut'), 'office_address'::ContactChannelType, 'Orlikov per. 1/11', 'Orlikov per. 1/11', 'Orlikov per. 1/11', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Irek Faizullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Irek Faizullin'), 'phone'::ContactChannelType, '+7-495-940-20-93', '+7 495 940-20-93', '+74959402093')
ON CONFLICT DO NOTHING;

-- Email for: Irek Faizullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Irek Faizullin'), 'email'::ContactChannelType, 'info@mkrf.ru', 'info@mkrf.ru')
ON CONFLICT DO NOTHING;

-- Website for: Irek Faizullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Irek Faizullin'), 'website'::ContactChannelType, 'https://www.mkrf.ru', 'https://www.mkrf.ru')
ON CONFLICT DO NOTHING;

-- Address for: Irek Faizullin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Irek Faizullin'), 'office_address'::ContactChannelType, 'Sadovaya-Kudrinskaya ul. 13', 'Sadovaya-Kudrinskaya ul. 13', 'Sadovaya-Kudrinskaya ul. 13', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Olga Lyubimova
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Olga Lyubimova'), 'phone'::ContactChannelType, '+7-495-925-21-41', '+7 495 925-21-41', '+74959252141')
ON CONFLICT DO NOTHING;

-- Email for: Olga Lyubimova
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Olga Lyubimova'), 'email'::ContactChannelType, 'info@mkrf.ru', 'info@mkrf.ru')
ON CONFLICT DO NOTHING;

-- Website for: Olga Lyubimova
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Olga Lyubimova'), 'website'::ContactChannelType, 'https://www.mkrf.ru', 'https://www.mkrf.ru')
ON CONFLICT DO NOTHING;

-- Address for: Olga Lyubimova
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Olga Lyubimova'), 'office_address'::ContactChannelType, 'Kitayskaya pl. 2', 'Kitayskaya pl. 2', 'Kitayskaya pl. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Mikhail Degtyarev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Degtyarev'), 'phone'::ContactChannelType, '+7-495-785-14-33', '+7 495 785-14-33', '+74957851433')
ON CONFLICT DO NOTHING;

-- Email for: Mikhail Degtyarev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Degtyarev'), 'email'::ContactChannelType, 'info@minsport.gov.ru', 'info@minsport.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Mikhail Degtyarev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Degtyarev'), 'website'::ContactChannelType, 'https://www.minsport.gov.ru', 'https://www.minsport.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Mikhail Degtyarev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mikhail Degtyarev'), 'office_address'::ContactChannelType, 'Luzhnetskaya nab. 8', 'Luzhnetskaya nab. 8', 'Luzhnetskaya nab. 8', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Maksut Shadayev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maksut Shadayev'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Maksut Shadayev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maksut Shadayev'), 'email'::ContactChannelType, 'info@mtic.gov.ru', 'info@mtic.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Maksut Shadayev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maksut Shadayev'), 'website'::ContactChannelType, 'https://www.mtic.gov.ru', 'https://www.mtic.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Maksut Shadayev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maksut Shadayev'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Anton Kotyakov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Kotyakov'), 'phone'::ContactChannelType, '+7-495-915-84-43', '+7 495 915-84-43', '+74959158443')
ON CONFLICT DO NOTHING;

-- Email for: Anton Kotyakov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Kotyakov'), 'email'::ContactChannelType, 'info@mintrud.gov.ru', 'info@mintrud.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Anton Kotyakov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Kotyakov'), 'website'::ContactChannelType, 'https://www.mintrud.gov.ru', 'https://www.mintrud.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Anton Kotyakov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anton Kotyakov'), 'office_address'::ContactChannelType, 'Teatralny per. 3', 'Teatralny per. 3', 'Teatralny per. 3', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Aleksandr Kurenkov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Aleksandr Kurenkov'), 'phone'::ContactChannelType, '+7-495-621-95-35', '+7 495 621-95-35', '+74956219535')
ON CONFLICT DO NOTHING;

-- Email for: Aleksandr Kurenkov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Aleksandr Kurenkov'), 'email'::ContactChannelType, 'info@mchs.gov.ru', 'info@mchs.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Aleksandr Kurenkov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Aleksandr Kurenkov'), 'website'::ContactChannelType, 'https://www.mchs.gov.ru', 'https://www.mchs.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Aleksandr Kurenkov
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Aleksandr Kurenkov'), 'office_address'::ContactChannelType, 'ul. Delegatskaya 18', 'ul. Delegatskaya 18', 'ul. Delegatskaya 18', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+7-495-692-30-57', '+7 495 692-30-57', '+74956923057')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'stateduma@duma.gov.ru', 'stateduma@duma.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'http://www.duma.gov.ru', 'http://www.duma.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Okhotny Ryad 1', 'Okhotny Ryad 1', 'Okhotny Ryad 1', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+7-495-692-59-69', '+7 495 692-59-69', '+74956925969')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'ums.sf@senat.gov.ru', 'ums.sf@senat.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'http://www.council.gov.ru', 'http://www.council.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Bolshaya Dmitrovka 26', 'Bolshaya Dmitrovka 26', 'Bolshaya Dmitrovka 26', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Citizen Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Inquiries'), 'phone'::ContactChannelType, '+7-495-609-97-07', '+7 495 609-97-07', '+74956099707')
ON CONFLICT DO NOTHING;

-- Email for: Citizen Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Inquiries'), 'email'::ContactChannelType, 'inquiry@duma.gov.ru', 'inquiry@duma.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Citizen Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Inquiries'), 'website'::ContactChannelType, 'http://www.duma.gov.ru', 'http://www.duma.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Citizen Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Inquiries'), 'office_address'::ContactChannelType, 'Okhotny Ryad 1', 'Okhotny Ryad 1', 'Okhotny Ryad 1', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+7-495-692-59-69', '+7 495 692-59-69', '+74956925969')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'members@council.gov.ru', 'members@council.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'http://www.council.gov.ru', 'http://www.council.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, 'Bolshaya Dmitrovka 26', 'Bolshaya Dmitrovka 26', 'Bolshaya Dmitrovka 26', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'phone'::ContactChannelType, '+7-495-697-58-00', '+7 495 697-58-00', '+74956975800')
ON CONFLICT DO NOTHING;

-- Email for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'email'::ContactChannelType, 'info@kremlin.ru', 'info@kremlin.ru')
ON CONFLICT DO NOTHING;

-- Website for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'website'::ContactChannelType, 'http://www.kremlin.ru', 'http://www.kremlin.ru')
ON CONFLICT DO NOTHING;

-- Address for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'office_address'::ContactChannelType, 'Kremlin, ul. Ilyinka 23', 'Kremlin, ul. Ilyinka 23', 'Kremlin, ul. Ilyinka 23', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'phone'::ContactChannelType, '+7-495-626-93-63', '+7 495 626-93-63', '+74956269363')
ON CONFLICT DO NOTHING;

-- Email for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'email'::ContactChannelType, 'info@government.ru', 'info@government.ru')
ON CONFLICT DO NOTHING;

-- Website for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'website'::ContactChannelType, 'http://government.ru', 'http://government.ru')
ON CONFLICT DO NOTHING;

-- Address for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'office_address'::ContactChannelType, 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'ul. Krasnopresnenskaya nab. 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Press Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press Centre'), 'phone'::ContactChannelType, '+7-499-244-41-19', '+7 499 244-41-19', '+74992444119')
ON CONFLICT DO NOTHING;

-- Email for: Press Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press Centre'), 'email'::ContactChannelType, 'dip@mid.ru', 'dip@mid.ru')
ON CONFLICT DO NOTHING;

-- Website for: Press Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press Centre'), 'website'::ContactChannelType, 'https://www.mid.ru', 'https://www.mid.ru')
ON CONFLICT DO NOTHING;

-- Address for: Press Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press Centre'), 'office_address'::ContactChannelType, 'Smolenskaya sq. 32/34', 'Smolenskaya sq. 32/34', 'Smolenskaya sq. 32/34', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'phone'::ContactChannelType, '+7-495-607-95-00', '+7 495 607-95-00', '+74956079500')
ON CONFLICT DO NOTHING;

-- Email for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'email'::ContactChannelType, 'info@scrf.gov.ru', 'info@scrf.gov.ru')
ON CONFLICT DO NOTHING;

-- Website for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'website'::ContactChannelType, 'http://www.scrf.gov.ru', 'http://www.scrf.gov.ru')
ON CONFLICT DO NOTHING;

-- Address for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'office_address'::ContactChannelType, 'ul. Ilyinka 2', 'ul. Ilyinka 2', 'ul. Ilyinka 2', 'Moscow')
ON CONFLICT DO NOTHING;

-- Phone for: Sanae Takaichi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sanae Takaichi'), 'phone'::ContactChannelType, '+81-3-3581-0101', '+81 3-3581-0101', '+81335810101')
ON CONFLICT DO NOTHING;

-- Email for: Sanae Takaichi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sanae Takaichi'), 'email'::ContactChannelType, 'kantei@kantei.go.jp', 'kantei@kantei.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Sanae Takaichi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sanae Takaichi'), 'website'::ContactChannelType, 'https://www.kantei.go.jp', 'https://www.kantei.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Sanae Takaichi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sanae Takaichi'), 'office_address'::ContactChannelType, '2-3-1 Nagata-chō, Chiyoda-ku', '2-3-1 Nagata-chō, Chiyoda-ku', '2-3-1 Nagata-chō, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Minoru Kihara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Minoru Kihara'), 'phone'::ContactChannelType, '+81-3-5253-2111', '+81 3-5253-2111', '+81352532111')
ON CONFLICT DO NOTHING;

-- Email for: Minoru Kihara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Minoru Kihara'), 'email'::ContactChannelType, 'cas@cas.go.jp', 'cas@cas.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Minoru Kihara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Minoru Kihara'), 'website'::ContactChannelType, 'https://www.cas.go.jp', 'https://www.cas.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Minoru Kihara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Minoru Kihara'), 'office_address'::ContactChannelType, '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Yoshimasa Hayashi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yoshimasa Hayashi'), 'phone'::ContactChannelType, '+81-3-5253-5111', '+81 3-5253-5111', '+81352535111')
ON CONFLICT DO NOTHING;

-- Email for: Yoshimasa Hayashi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yoshimasa Hayashi'), 'email'::ContactChannelType, 'info@soumu.go.jp', 'info@soumu.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Yoshimasa Hayashi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yoshimasa Hayashi'), 'website'::ContactChannelType, 'https://www.soumu.go.jp', 'https://www.soumu.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Yoshimasa Hayashi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yoshimasa Hayashi'), 'office_address'::ContactChannelType, '2-1-2 Kasumigaseki, Chiyoda-ku', '2-1-2 Kasumigaseki, Chiyoda-ku', '2-1-2 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Hiroshi Hiraguchi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hiroshi Hiraguchi'), 'phone'::ContactChannelType, '+81-3-3580-4111', '+81 3-3580-4111', '+81335804111')
ON CONFLICT DO NOTHING;

-- Email for: Hiroshi Hiraguchi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hiroshi Hiraguchi'), 'email'::ContactChannelType, 'info@moj.go.jp', 'info@moj.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Hiroshi Hiraguchi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hiroshi Hiraguchi'), 'website'::ContactChannelType, 'https://www.moj.go.jp', 'https://www.moj.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Hiroshi Hiraguchi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hiroshi Hiraguchi'), 'office_address'::ContactChannelType, '1-1-1 Kasumigaseki, Chiyoda-ku', '1-1-1 Kasumigaseki, Chiyoda-ku', '1-1-1 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Toshimitsu Motegi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Toshimitsu Motegi'), 'phone'::ContactChannelType, '+81-3-3580-3311', '+81 3-3580-3311', '+81335803311')
ON CONFLICT DO NOTHING;

-- Email for: Toshimitsu Motegi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Toshimitsu Motegi'), 'email'::ContactChannelType, 'contact@mofa.go.jp', 'contact@mofa.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Toshimitsu Motegi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Toshimitsu Motegi'), 'website'::ContactChannelType, 'https://www.mofa.go.jp', 'https://www.mofa.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Toshimitsu Motegi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Toshimitsu Motegi'), 'office_address'::ContactChannelType, '2-2-1 Kasumigaseki, Chiyoda-ku', '2-2-1 Kasumigaseki, Chiyoda-ku', '2-2-1 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Satsuki Katayama
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Satsuki Katayama'), 'phone'::ContactChannelType, '+81-3-3581-4111', '+81 3-3581-4111', '+81335814111')
ON CONFLICT DO NOTHING;

-- Email for: Satsuki Katayama
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Satsuki Katayama'), 'email'::ContactChannelType, 'info@mof.go.jp', 'info@mof.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Satsuki Katayama
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Satsuki Katayama'), 'website'::ContactChannelType, 'https://www.mof.go.jp', 'https://www.mof.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Satsuki Katayama
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Satsuki Katayama'), 'office_address'::ContactChannelType, '3-1-1 Kasumigaseki, Chiyoda-ku', '3-1-1 Kasumigaseki, Chiyoda-ku', '3-1-1 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Yohei Matsumoto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yohei Matsumoto'), 'phone'::ContactChannelType, '+81-3-5253-4111', '+81 3-5253-4111', '+81352534111')
ON CONFLICT DO NOTHING;

-- Email for: Yohei Matsumoto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yohei Matsumoto'), 'email'::ContactChannelType, 'info@mext.go.jp', 'info@mext.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Yohei Matsumoto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yohei Matsumoto'), 'website'::ContactChannelType, 'https://www.mext.go.jp', 'https://www.mext.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Yohei Matsumoto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yohei Matsumoto'), 'office_address'::ContactChannelType, '3-2-2 Kasumigaseki, Chiyoda-ku', '3-2-2 Kasumigaseki, Chiyoda-ku', '3-2-2 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Kenichiro Ueno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kenichiro Ueno'), 'phone'::ContactChannelType, '+81-3-5253-1111', '+81 3-5253-1111', '+81352531111')
ON CONFLICT DO NOTHING;

-- Email for: Kenichiro Ueno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kenichiro Ueno'), 'email'::ContactChannelType, 'info@mhlw.go.jp', 'info@mhlw.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Kenichiro Ueno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kenichiro Ueno'), 'website'::ContactChannelType, 'https://www.mhlw.go.jp', 'https://www.mhlw.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Kenichiro Ueno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kenichiro Ueno'), 'office_address'::ContactChannelType, '1-2-2 Kasumigaseki, Chiyoda-ku', '1-2-2 Kasumigaseki, Chiyoda-ku', '1-2-2 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Norikazu Suzuki
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Norikazu Suzuki'), 'phone'::ContactChannelType, '+81-3-3595-6610', '+81 3-3595-6610', '+81335956610')
ON CONFLICT DO NOTHING;

-- Email for: Norikazu Suzuki
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Norikazu Suzuki'), 'email'::ContactChannelType, 'info@maff.go.jp', 'info@maff.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Norikazu Suzuki
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Norikazu Suzuki'), 'website'::ContactChannelType, 'https://www.maff.go.jp', 'https://www.maff.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Norikazu Suzuki
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Norikazu Suzuki'), 'office_address'::ContactChannelType, '1-2-1 Kasumigaseki, Chiyoda-ku', '1-2-1 Kasumigaseki, Chiyoda-ku', '1-2-1 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Ryosei Akazawa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ryosei Akazawa'), 'phone'::ContactChannelType, '+81-3-3501-1511', '+81 3-3501-1511', '+81335011511')
ON CONFLICT DO NOTHING;

-- Email for: Ryosei Akazawa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ryosei Akazawa'), 'email'::ContactChannelType, 'info@meti.go.jp', 'info@meti.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Ryosei Akazawa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ryosei Akazawa'), 'website'::ContactChannelType, 'https://www.meti.go.jp', 'https://www.meti.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Ryosei Akazawa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ryosei Akazawa'), 'office_address'::ContactChannelType, '1-3-1 Kasumigaseki, Chiyoda-ku', '1-3-1 Kasumigaseki, Chiyoda-ku', '1-3-1 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Yasushi Kaneko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yasushi Kaneko'), 'phone'::ContactChannelType, '+81-3-5253-8111', '+81 3-5253-8111', '+81352538111')
ON CONFLICT DO NOTHING;

-- Email for: Yasushi Kaneko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yasushi Kaneko'), 'email'::ContactChannelType, 'info@mlit.go.jp', 'info@mlit.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Yasushi Kaneko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yasushi Kaneko'), 'website'::ContactChannelType, 'https://www.mlit.go.jp', 'https://www.mlit.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Yasushi Kaneko
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yasushi Kaneko'), 'office_address'::ContactChannelType, '2-1-3 Kasumigaseki, Chiyoda-ku', '2-1-3 Kasumigaseki, Chiyoda-ku', '2-1-3 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Hirotaka Ishihara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hirotaka Ishihara'), 'phone'::ContactChannelType, '+81-3-3581-3351', '+81 3-3581-3351', '+81335813351')
ON CONFLICT DO NOTHING;

-- Email for: Hirotaka Ishihara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hirotaka Ishihara'), 'email'::ContactChannelType, 'info@env.go.jp', 'info@env.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Hirotaka Ishihara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hirotaka Ishihara'), 'website'::ContactChannelType, 'https://www.env.go.jp', 'https://www.env.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Hirotaka Ishihara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hirotaka Ishihara'), 'office_address'::ContactChannelType, '1-6-1 Uchisaiwai-chō, Chiyoda-ku', '1-6-1 Uchisaiwai-chō, Chiyoda-ku', '1-6-1 Uchisaiwai-chō, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Shinjirō Koizumi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shinjirō Koizumi'), 'phone'::ContactChannelType, '+81-3-5366-3111', '+81 3-5366-3111', '+81353663111')
ON CONFLICT DO NOTHING;

-- Email for: Shinjirō Koizumi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shinjirō Koizumi'), 'email'::ContactChannelType, 'info@mod.go.jp', 'info@mod.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Shinjirō Koizumi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shinjirō Koizumi'), 'website'::ContactChannelType, 'https://www.mod.go.jp', 'https://www.mod.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Shinjirō Koizumi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shinjirō Koizumi'), 'office_address'::ContactChannelType, '5-1-1 Ichigaya Honmura-chō, Shinjuku-ku', '5-1-1 Ichigaya Honmura-chō, Shinjuku-ku', '5-1-1 Ichigaya Honmura-chō, Shinjuku-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Hisashi Matsumoto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hisashi Matsumoto'), 'phone'::ContactChannelType, '+81-3-6459-1070', '+81 3-6459-1070', '+81364591070')
ON CONFLICT DO NOTHING;

-- Email for: Hisashi Matsumoto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hisashi Matsumoto'), 'email'::ContactChannelType, 'info@digital.go.jp', 'info@digital.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Hisashi Matsumoto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hisashi Matsumoto'), 'website'::ContactChannelType, 'https://www.digital.go.jp', 'https://www.digital.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Hisashi Matsumoto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hisashi Matsumoto'), 'office_address'::ContactChannelType, '2-1-2 Kasumigaseki, Chiyoda-ku', '2-1-2 Kasumigaseki, Chiyoda-ku', '2-1-2 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Takao Makino
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Takao Makino'), 'phone'::ContactChannelType, '+81-3-3595-8696', '+81 3-3595-8696', '+81335958696')
ON CONFLICT DO NOTHING;

-- Email for: Takao Makino
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Takao Makino'), 'email'::ContactChannelType, 'info@reconstruction.go.jp', 'info@reconstruction.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Takao Makino
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Takao Makino'), 'website'::ContactChannelType, 'https://www.reconstruction.go.jp', 'https://www.reconstruction.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Takao Makino
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Takao Makino'), 'office_address'::ContactChannelType, '3-2-4 Kasumigaseki, Chiyoda-ku', '3-2-4 Kasumigaseki, Chiyoda-ku', '3-2-4 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Jiro Akama
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jiro Akama'), 'phone'::ContactChannelType, '+81-3-3581-0141', '+81 3-3581-0141', '+81335810141')
ON CONFLICT DO NOTHING;

-- Email for: Jiro Akama
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jiro Akama'), 'email'::ContactChannelType, 'npa@npa.go.jp', 'npa@npa.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Jiro Akama
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jiro Akama'), 'website'::ContactChannelType, 'https://www.npa.go.jp', 'https://www.npa.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Jiro Akama
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jiro Akama'), 'office_address'::ContactChannelType, '2-1-1 Kasumigaseki, Chiyoda-ku', '2-1-1 Kasumigaseki, Chiyoda-ku', '2-1-1 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Hitoshi Kikawada
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hitoshi Kikawada'), 'phone'::ContactChannelType, '+81-3-5253-2111', '+81 3-5253-2111', '+81352532111')
ON CONFLICT DO NOTHING;

-- Email for: Hitoshi Kikawada
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hitoshi Kikawada'), 'email'::ContactChannelType, 'info@cao.go.jp', 'info@cao.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Hitoshi Kikawada
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hitoshi Kikawada'), 'website'::ContactChannelType, 'https://www.cao.go.jp', 'https://www.cao.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Hitoshi Kikawada
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hitoshi Kikawada'), 'office_address'::ContactChannelType, '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Minoru Kiuchi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Minoru Kiuchi'), 'phone'::ContactChannelType, '+81-3-5253-2111', '+81 3-5253-2111', '+81352532111')
ON CONFLICT DO NOTHING;

-- Email for: Minoru Kiuchi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Minoru Kiuchi'), 'email'::ContactChannelType, 'info@cao.go.jp', 'info@cao.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Minoru Kiuchi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Minoru Kiuchi'), 'website'::ContactChannelType, 'https://www.cao.go.jp', 'https://www.cao.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Minoru Kiuchi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Minoru Kiuchi'), 'office_address'::ContactChannelType, '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Kimi Onoda
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kimi Onoda'), 'phone'::ContactChannelType, '+81-3-5253-2111', '+81 3-5253-2111', '+81352532111')
ON CONFLICT DO NOTHING;

-- Email for: Kimi Onoda
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kimi Onoda'), 'email'::ContactChannelType, 'info@cao.go.jp', 'info@cao.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Kimi Onoda
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kimi Onoda'), 'website'::ContactChannelType, 'https://www.cao.go.jp', 'https://www.cao.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Kimi Onoda
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kimi Onoda'), 'office_address'::ContactChannelType, '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+81-3-3581-5111', '+81 3-3581-5111', '+81335815111')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@shugiin.go.jp', 'info@shugiin.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.shugiin.go.jp', 'https://www.shugiin.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, '7-1 Nagatacho 1-chome, Chiyoda-ku', '7-1 Nagatacho 1-chome, Chiyoda-ku', '7-1 Nagatacho 1-chome, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+81-3-3581-3111', '+81 3-3581-3111', '+81335813111')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@sangiin.go.jp', 'info@sangiin.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.sangiin.go.jp', 'https://www.sangiin.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, '2-1-1 Nagatacho, Chiyoda-ku', '2-1-1 Nagatacho, Chiyoda-ku', '2-1-1 Nagatacho, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+81-3-3581-5111', '+81 3-3581-5111', '+81335815111')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'service@shugiin.go.jp', 'service@shugiin.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://www.shugiin.go.jp', 'https://www.shugiin.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, '7-1 Nagatacho 1-chome, Chiyoda-ku', '7-1 Nagatacho 1-chome, Chiyoda-ku', '7-1 Nagatacho 1-chome, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+81-3-3581-3111', '+81 3-3581-3111', '+81335813111')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'service@sangiin.go.jp', 'service@sangiin.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://www.sangiin.go.jp', 'https://www.sangiin.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, '2-1-1 Nagatacho, Chiyoda-ku', '2-1-1 Nagatacho, Chiyoda-ku', '2-1-1 Nagatacho, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'phone'::ContactChannelType, '+81-3-3581-0101', '+81 3-3581-0101', '+81335810101')
ON CONFLICT DO NOTHING;

-- Email for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'email'::ContactChannelType, 'kantei@kantei.go.jp', 'kantei@kantei.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'website'::ContactChannelType, 'https://www.kantei.go.jp', 'https://www.kantei.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'office_address'::ContactChannelType, '2-3-1 Nagata-chō, Chiyoda-ku', '2-3-1 Nagata-chō, Chiyoda-ku', '2-3-1 Nagata-chō, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'phone'::ContactChannelType, '+81-3-5253-2111', '+81 3-5253-2111', '+81352532111')
ON CONFLICT DO NOTHING;

-- Email for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'email'::ContactChannelType, 'info@cao.go.jp', 'info@cao.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'website'::ContactChannelType, 'https://www.cao.go.jp', 'https://www.cao.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'office_address'::ContactChannelType, '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: General Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Information'), 'phone'::ContactChannelType, '+81-3-5253-2111', '+81 3-5253-2111', '+81352532111')
ON CONFLICT DO NOTHING;

-- Email for: General Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Information'), 'email'::ContactChannelType, 'cas@cas.go.jp', 'cas@cas.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: General Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Information'), 'website'::ContactChannelType, 'https://www.cas.go.jp', 'https://www.cas.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: General Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Information'), 'office_address'::ContactChannelType, '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', '1-6-1 Nagata-chō, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'phone'::ContactChannelType, '+81-3-3580-3311', '+81 3-3580-3311', '+81335803311')
ON CONFLICT DO NOTHING;

-- Email for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'email'::ContactChannelType, 'contact@mofa.go.jp', 'contact@mofa.go.jp')
ON CONFLICT DO NOTHING;

-- Website for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'website'::ContactChannelType, 'https://www.mofa.go.jp', 'https://www.mofa.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'office_address'::ContactChannelType, '2-2-1 Kasumigaseki, Chiyoda-ku', '2-2-1 Kasumigaseki, Chiyoda-ku', '2-2-1 Kasumigaseki, Chiyoda-ku', 'Tokyo')
ON CONFLICT DO NOTHING;

-- Phone for: Narendra Modi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Narendra Modi'), 'phone'::ContactChannelType, '+91-11-23012312, 23015321, 23017290', '+91-11-23012312, 23015321, 23017290', '+9111230123122301532123017290')
ON CONFLICT DO NOTHING;

-- Address for: Narendra Modi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Narendra Modi'), 'office_address'::ContactChannelType, 'South Block, Raisina Hill, New Delhi - 110011', 'South Block, Raisina Hill, New Delhi - 110011', 'South Block, Raisina Hill, New Delhi - 110011', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Narendra Modi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Narendra Modi'), 'phone'::ContactChannelType, '011-23015603', '011-23015603', '01123015603')
ON CONFLICT DO NOTHING;

-- Email for: Narendra Modi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Narendra Modi'), 'email'::ContactChannelType, 'narendramodi@sansad.nic.in', 'narendramodi@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Amit Shah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Amit Shah'), 'phone'::ContactChannelType, '011-23352577', '011-23352577', '01123352577')
ON CONFLICT DO NOTHING;

-- Email for: Amit Shah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Amit Shah'), 'email'::ContactChannelType, 'amit.shah@sansad.nic.in', 'amit.shah@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Nirmala Sitharaman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nirmala Sitharaman'), 'phone'::ContactChannelType, '011-23782349', '011-23782349', '01123782349')
ON CONFLICT DO NOTHING;

-- Email for: Nirmala Sitharaman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nirmala Sitharaman'), 'email'::ContactChannelType, 'nirmala.sitharaman@sansad.nic.in', 'nirmala.sitharaman@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Suresh Goplakrishnan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Suresh Goplakrishnan'), 'phone'::ContactChannelType, '011-23019876', '011-23019876', '01123019876')
ON CONFLICT DO NOTHING;

-- Email for: Suresh Goplakrishnan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Suresh Goplakrishnan'), 'email'::ContactChannelType, 'suresh.goplakrishnan@sansad.nic.in', 'suresh.goplakrishnan@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Piyush Goyal
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Piyush Goyal'), 'phone'::ContactChannelType, '011-23019971', '011-23019971', '01123019971')
ON CONFLICT DO NOTHING;

-- Email for: Piyush Goyal
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Piyush Goyal'), 'email'::ContactChannelType, 'piyush.goyal@sansad.nic.in', 'piyush.goyal@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Rajnath Singh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rajnath Singh'), 'phone'::ContactChannelType, '011-23034244', '011-23034244', '01123034244')
ON CONFLICT DO NOTHING;

-- Email for: Rajnath Singh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rajnath Singh'), 'email'::ContactChannelType, 'rajnath.singh@sansad.nic.in', 'rajnath.singh@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Dharmendra Pradhan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dharmendra Pradhan'), 'phone'::ContactChannelType, '011-23015890', '011-23015890', '01123015890')
ON CONFLICT DO NOTHING;

-- Email for: Dharmendra Pradhan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dharmendra Pradhan'), 'email'::ContactChannelType, 'dharmendra.pradhan@sansad.nic.in', 'dharmendra.pradhan@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: S. Jaishankar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'S. Jaishankar'), 'phone'::ContactChannelType, '011-23019234', '011-23019234', '01123019234')
ON CONFLICT DO NOTHING;

-- Email for: S. Jaishankar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'S. Jaishankar'), 'email'::ContactChannelType, 's.jaishankar@sansad.nic.in', 's.jaishankar@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Gajendra Singh Shekhawat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gajendra Singh Shekhawat'), 'phone'::ContactChannelType, '011-23034567', '011-23034567', '01123034567')
ON CONFLICT DO NOTHING;

-- Email for: Gajendra Singh Shekhawat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gajendra Singh Shekhawat'), 'email'::ContactChannelType, 'gajendra.shekhawat@sansad.nic.in', 'gajendra.shekhawat@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Anurag Singh Thakur
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anurag Singh Thakur'), 'phone'::ContactChannelType, '011-23015678', '011-23015678', '01123015678')
ON CONFLICT DO NOTHING;

-- Email for: Anurag Singh Thakur
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anurag Singh Thakur'), 'email'::ContactChannelType, 'anurag.singh@sansad.nic.in', 'anurag.singh@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Mallikarjun Kharge
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mallikarjun Kharge'), 'phone'::ContactChannelType, '040-24654849', '040-24654849', '04024654849')
ON CONFLICT DO NOTHING;

-- Email for: Mallikarjun Kharge
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mallikarjun Kharge'), 'email'::ContactChannelType, 'mallikarjun.kharge@sansad.nic.in', 'mallikarjun.kharge@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Rahul Gandhi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rahul Gandhi'), 'phone'::ContactChannelType, '011-23725589', '011-23725589', '01123725589')
ON CONFLICT DO NOTHING;

-- Email for: Rahul Gandhi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rahul Gandhi'), 'email'::ContactChannelType, 'rahul.gandhi@sansad.nic.in', 'rahul.gandhi@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Sonia Gandhi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sonia Gandhi'), 'phone'::ContactChannelType, '011-23725590', '011-23725590', '01123725590')
ON CONFLICT DO NOTHING;

-- Email for: Sonia Gandhi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sonia Gandhi'), 'email'::ContactChannelType, 'sonia.gandhi@sansad.nic.in', 'sonia.gandhi@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Priyanka Gandhi Vadra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Priyanka Gandhi Vadra'), 'phone'::ContactChannelType, '0484-2975555', '0484-2975555', '04842975555')
ON CONFLICT DO NOTHING;

-- Email for: Priyanka Gandhi Vadra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Priyanka Gandhi Vadra'), 'email'::ContactChannelType, 'priyanka.gandhi@sansad.nic.in', 'priyanka.gandhi@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Shashi Tharoor
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shashi Tharoor'), 'phone'::ContactChannelType, '0471-2330711', '0471-2330711', '04712330711')
ON CONFLICT DO NOTHING;

-- Email for: Shashi Tharoor
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Shashi Tharoor'), 'email'::ContactChannelType, 'shashi.tharoor@sansad.nic.in', 'shashi.tharoor@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Manish Tewari
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Manish Tewari'), 'phone'::ContactChannelType, '01881-237711', '01881-237711', '01881237711')
ON CONFLICT DO NOTHING;

-- Email for: Manish Tewari
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Manish Tewari'), 'email'::ContactChannelType, 'manish.tewari@sansad.nic.in', 'manish.tewari@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Adhir Ranjan Chowdhury
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adhir Ranjan Chowdhury'), 'phone'::ContactChannelType, '011-23725591', '011-23725591', '01123725591')
ON CONFLICT DO NOTHING;

-- Email for: Adhir Ranjan Chowdhury
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adhir Ranjan Chowdhury'), 'email'::ContactChannelType, 'adhir.chowdhury@sansad.nic.in', 'adhir.chowdhury@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Jairam Ramesh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jairam Ramesh'), 'phone'::ContactChannelType, '0135-2433456', '0135-2433456', '01352433456')
ON CONFLICT DO NOTHING;

-- Email for: Jairam Ramesh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jairam Ramesh'), 'email'::ContactChannelType, 'jairam.ramesh@sansad.nic.in', 'jairam.ramesh@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Neeraj Shekhar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Neeraj Shekhar'), 'phone'::ContactChannelType, '011-23725592', '011-23725592', '01123725592')
ON CONFLICT DO NOTHING;

-- Email for: Neeraj Shekhar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Neeraj Shekhar'), 'email'::ContactChannelType, 'neeraj.shekhar@sansad.nic.in', 'neeraj.shekhar@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: N.V. Subhash
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'N.V. Subhash'), 'phone'::ContactChannelType, '040-23234567', '040-23234567', '04023234567')
ON CONFLICT DO NOTHING;

-- Email for: N.V. Subhash
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'N.V. Subhash'), 'email'::ContactChannelType, 'n.v.subhash@sansad.nic.in', 'n.v.subhash@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: M.K. Stalin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'M.K. Stalin'), 'phone'::ContactChannelType, '044-24642367', '044-24642367', '04424642367')
ON CONFLICT DO NOTHING;

-- Email for: M.K. Stalin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'M.K. Stalin'), 'email'::ContactChannelType, 'm.k.stalin@sansad.nic.in', 'm.k.stalin@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Kanimozhi Karunanithy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kanimozhi Karunanithy'), 'phone'::ContactChannelType, '04639-235522', '04639-235522', '04639235522')
ON CONFLICT DO NOTHING;

-- Email for: Kanimozhi Karunanithy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kanimozhi Karunanithy'), 'email'::ContactChannelType, 'kanimozhi@sansad.nic.in', 'kanimozhi@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Tirumaan Govind
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tirumaan Govind'), 'phone'::ContactChannelType, '044-25339222', '044-25339222', '04425339222')
ON CONFLICT DO NOTHING;

-- Email for: Tirumaan Govind
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tirumaan Govind'), 'email'::ContactChannelType, 't.govind@sansad.nic.in', 't.govind@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Thol. Thirumavalavan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thol. Thirumavalavan'), 'phone'::ContactChannelType, '04144-234567', '04144-234567', '04144234567')
ON CONFLICT DO NOTHING;

-- Email for: Thol. Thirumavalavan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thol. Thirumavalavan'), 'email'::ContactChannelType, 't.thirumavalavan@sansad.nic.in', 't.thirumavalavan@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Dayanidhi Maran
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dayanidhi Maran'), 'phone'::ContactChannelType, '044-24343222', '044-24343222', '04424343222')
ON CONFLICT DO NOTHING;

-- Email for: Dayanidhi Maran
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dayanidhi Maran'), 'email'::ContactChannelType, 'd.maran@sansad.nic.in', 'd.maran@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: A. Raja
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'A. Raja'), 'phone'::ContactChannelType, '0423-234567', '0423-234567', '0423234567')
ON CONFLICT DO NOTHING;

-- Email for: A. Raja
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'A. Raja'), 'email'::ContactChannelType, 'a.raja@sansad.nic.in', 'a.raja@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: R.S. Bharathi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'R.S. Bharathi'), 'phone'::ContactChannelType, '04343-234567', '04343-234567', '04343234567')
ON CONFLICT DO NOTHING;

-- Email for: R.S. Bharathi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'R.S. Bharathi'), 'email'::ContactChannelType, 'r.s.bharathi@sansad.nic.in', 'r.s.bharathi@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Su. Venkatesan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Su. Venkatesan'), 'phone'::ContactChannelType, '0452-234567', '0452-234567', '0452234567')
ON CONFLICT DO NOTHING;

-- Email for: Su. Venkatesan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Su. Venkatesan'), 'email'::ContactChannelType, 'su.venkatesan@sansad.nic.in', 'su.venkatesan@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Mamata Banerjee
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mamata Banerjee'), 'phone'::ContactChannelType, '033-25579999', '033-25579999', '03325579999')
ON CONFLICT DO NOTHING;

-- Email for: Mamata Banerjee
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mamata Banerjee'), 'email'::ContactChannelType, 'mamata.banerjee@sansad.nic.in', 'mamata.banerjee@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Derek O'Brien
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Derek O''Brien'), 'phone'::ContactChannelType, '033-25579888', '033-25579888', '03325579888')
ON CONFLICT DO NOTHING;

-- Email for: Derek O'Brien
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Derek O''Brien'), 'email'::ContactChannelType, 'derek.obrien@sansad.nic.in', 'derek.obrien@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Asaduddin Owaisi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Asaduddin Owaisi'), 'phone'::ContactChannelType, '040-23222278', '040-23222278', '04023222278')
ON CONFLICT DO NOTHING;

-- Email for: Asaduddin Owaisi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Asaduddin Owaisi'), 'email'::ContactChannelType, 'asaduddin.owaisi@sansad.nic.in', 'asaduddin.owaisi@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Uddhav Balasaheb Thackeray
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Uddhav Balasaheb Thackeray'), 'phone'::ContactChannelType, '022-22073333', '022-22073333', '02222073333')
ON CONFLICT DO NOTHING;

-- Email for: Uddhav Balasaheb Thackeray
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Uddhav Balasaheb Thackeray'), 'email'::ContactChannelType, 'uddhav.thackeray@sansad.nic.in', 'uddhav.thackeray@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Navjot Singh Sidhu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Navjot Singh Sidhu'), 'phone'::ContactChannelType, '0183-2201234', '0183-2201234', '01832201234')
ON CONFLICT DO NOTHING;

-- Email for: Navjot Singh Sidhu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Navjot Singh Sidhu'), 'email'::ContactChannelType, 'navjot.sidhu@sansad.nic.in', 'navjot.sidhu@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Dimple Yadav
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dimple Yadav'), 'phone'::ContactChannelType, '05672-264567', '05672-264567', '05672264567')
ON CONFLICT DO NOTHING;

-- Email for: Dimple Yadav
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dimple Yadav'), 'email'::ContactChannelType, 'dimple.yadav@sansad.nic.in', 'dimple.yadav@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Saugata Roy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Saugata Roy'), 'phone'::ContactChannelType, '033-24634567', '033-24634567', '03324634567')
ON CONFLICT DO NOTHING;

-- Email for: Saugata Roy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Saugata Roy'), 'email'::ContactChannelType, 'saugata.roy@sansad.nic.in', 'saugata.roy@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Mahua Moitra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahua Moitra'), 'phone'::ContactChannelType, '033-25589999', '033-25589999', '03325589999')
ON CONFLICT DO NOTHING;

-- Email for: Mahua Moitra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahua Moitra'), 'email'::ContactChannelType, 'mahua.moitra@sansad.nic.in', 'mahua.moitra@sansad.nic.in')
ON CONFLICT DO NOTHING;

-- Phone for: Javier Milei
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Javier Milei'), 'phone'::ContactChannelType, '+54-11-4342-3600', '+54 11 4342-3600', '+541143423600')
ON CONFLICT DO NOTHING;

-- Email for: Javier Milei
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Javier Milei'), 'email'::ContactChannelType, 'info@casarosada.gov.ar', 'info@casarosada.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Javier Milei
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Javier Milei'), 'website'::ContactChannelType, 'https://www.argentina.gob.ar/presidencia', 'https://www.argentina.gob.ar/presidencia')
ON CONFLICT DO NOTHING;

-- Address for: Javier Milei
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Javier Milei'), 'office_address'::ContactChannelType, 'Balcarce 50', 'Balcarce 50', 'Balcarce 50', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Victoria Villarruel
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Victoria Villarruel'), 'phone'::ContactChannelType, '+54-11-4342-3600', '+54 11 4342-3600', '+541143423600')
ON CONFLICT DO NOTHING;

-- Email for: Victoria Villarruel
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Victoria Villarruel'), 'email'::ContactChannelType, 'vicepresidencia@casarosada.gov.ar', 'vicepresidencia@casarosada.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Victoria Villarruel
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Victoria Villarruel'), 'website'::ContactChannelType, 'https://www.argentina.gob.ar/vicepresidencia', 'https://www.argentina.gob.ar/vicepresidencia')
ON CONFLICT DO NOTHING;

-- Address for: Victoria Villarruel
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Victoria Villarruel'), 'office_address'::ContactChannelType, 'Balcarce 50', 'Balcarce 50', 'Balcarce 50', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Manuel Adorni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Manuel Adorni'), 'phone'::ContactChannelType, '+54-11-4342-3600', '+54 11 4342-3600', '+541143423600')
ON CONFLICT DO NOTHING;

-- Email for: Manuel Adorni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Manuel Adorni'), 'email'::ContactChannelType, 'jefatura@casarosada.gov.ar', 'jefatura@casarosada.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Manuel Adorni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Manuel Adorni'), 'website'::ContactChannelType, 'https://www.argentina.gob.ar/jefatura', 'https://www.argentina.gob.ar/jefatura')
ON CONFLICT DO NOTHING;

-- Address for: Manuel Adorni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Manuel Adorni'), 'office_address'::ContactChannelType, 'Balcarce 50', 'Balcarce 50', 'Balcarce 50', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Luis Caputo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Caputo'), 'phone'::ContactChannelType, '+54-11-4349-8500', '+54 11 4349-8500', '+541143498500')
ON CONFLICT DO NOTHING;

-- Email for: Luis Caputo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Caputo'), 'email'::ContactChannelType, 'info@economia.gob.ar', 'info@economia.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Luis Caputo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Caputo'), 'website'::ContactChannelType, 'https://www.economia.gob.ar', 'https://www.economia.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Luis Caputo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Caputo'), 'office_address'::ContactChannelType, 'Hipólito Yrigoyen 250', 'Hipólito Yrigoyen 250', 'Hipólito Yrigoyen 250', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Pablo Quirno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pablo Quirno'), 'phone'::ContactChannelType, '+54-11-4819-7000', '+54 11 4819-7000', '+541148197000')
ON CONFLICT DO NOTHING;

-- Email for: Pablo Quirno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pablo Quirno'), 'email'::ContactChannelType, 'info@mrecic.gov.ar', 'info@mrecic.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Pablo Quirno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pablo Quirno'), 'website'::ContactChannelType, 'https://www.cancilleria.gob.ar', 'https://www.cancilleria.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Pablo Quirno
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pablo Quirno'), 'office_address'::ContactChannelType, 'Esmeralda 1212', 'Esmeralda 1212', 'Esmeralda 1212', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Luis Petri
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Petri'), 'phone'::ContactChannelType, '+54-11-4346-4000', '+54 11 4346-4000', '+541143464000')
ON CONFLICT DO NOTHING;

-- Email for: Luis Petri
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Petri'), 'email'::ContactChannelType, 'info@mindef.gov.ar', 'info@mindef.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Luis Petri
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Petri'), 'website'::ContactChannelType, 'https://www.mindef.gov.ar', 'https://www.mindef.gov.ar')
ON CONFLICT DO NOTHING;

-- Address for: Luis Petri
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Petri'), 'office_address'::ContactChannelType, 'Azopardo 250', 'Azopardo 250', 'Azopardo 250', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Patricia Bullrich
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patricia Bullrich'), 'phone'::ContactChannelType, '+54-11-4129-5000', '+54 11 4129-5000', '+541141295000')
ON CONFLICT DO NOTHING;

-- Email for: Patricia Bullrich
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patricia Bullrich'), 'email'::ContactChannelType, 'info@seguridad.gob.ar', 'info@seguridad.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Patricia Bullrich
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patricia Bullrich'), 'website'::ContactChannelType, 'https://www.seguridad.gob.ar', 'https://www.seguridad.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Patricia Bullrich
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patricia Bullrich'), 'office_address'::ContactChannelType, 'Avenida Santa Fe 1636', 'Avenida Santa Fe 1636', 'Avenida Santa Fe 1636', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Santiago Caputo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Santiago Caputo'), 'phone'::ContactChannelType, '+54-11-4349-5700', '+54 11 4349-5700', '+541143495700')
ON CONFLICT DO NOTHING;

-- Email for: Santiago Caputo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Santiago Caputo'), 'email'::ContactChannelType, 'info@interior.gob.ar', 'info@interior.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Santiago Caputo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Santiago Caputo'), 'website'::ContactChannelType, 'https://www.interior.gob.ar', 'https://www.interior.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Santiago Caputo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Santiago Caputo'), 'office_address'::ContactChannelType, 'Rivadavia 1834', 'Rivadavia 1834', 'Rivadavia 1834', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Sebastián Amerio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sebastián Amerio'), 'phone'::ContactChannelType, '+54-11-4349-8300', '+54 11 4349-8300', '+541143498300')
ON CONFLICT DO NOTHING;

-- Email for: Sebastián Amerio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sebastián Amerio'), 'email'::ContactChannelType, 'info@justicia.gob.ar', 'info@justicia.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Sebastián Amerio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sebastián Amerio'), 'website'::ContactChannelType, 'https://www.justicia.gob.ar', 'https://www.justicia.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Sebastián Amerio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sebastián Amerio'), 'office_address'::ContactChannelType, 'Sarmiento 329', 'Sarmiento 329', 'Sarmiento 329', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Mario Lugones
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mario Lugones'), 'phone'::ContactChannelType, '+54-11-4348-8100', '+54 11 4348-8100', '+541143488100')
ON CONFLICT DO NOTHING;

-- Email for: Mario Lugones
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mario Lugones'), 'email'::ContactChannelType, 'info@salud.gob.ar', 'info@salud.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Mario Lugones
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mario Lugones'), 'website'::ContactChannelType, 'https://www.salud.gob.ar', 'https://www.salud.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Mario Lugones
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mario Lugones'), 'office_address'::ContactChannelType, 'Avenida 9 de Julio 1925', 'Avenida 9 de Julio 1925', 'Avenida 9 de Julio 1925', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Sandra Pettovello
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sandra Pettovello'), 'phone'::ContactChannelType, '+54-11-4349-6000', '+54 11 4349-6000', '+541143496000')
ON CONFLICT DO NOTHING;

-- Email for: Sandra Pettovello
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sandra Pettovello'), 'email'::ContactChannelType, 'info@capitalhumano.gob.ar', 'info@capitalhumano.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Sandra Pettovello
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sandra Pettovello'), 'website'::ContactChannelType, 'https://www.capitalhumano.gob.ar', 'https://www.capitalhumano.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Sandra Pettovello
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sandra Pettovello'), 'office_address'::ContactChannelType, 'Avenida Paseo Colón 275', 'Avenida Paseo Colón 275', 'Avenida Paseo Colón 275', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Federico Sturzenegger
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Federico Sturzenegger'), 'phone'::ContactChannelType, '+54-11-4349-7000', '+54 11 4349-7000', '+541143497000')
ON CONFLICT DO NOTHING;

-- Email for: Federico Sturzenegger
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Federico Sturzenegger'), 'email'::ContactChannelType, 'info@desregulacion.gob.ar', 'info@desregulacion.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Federico Sturzenegger
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Federico Sturzenegger'), 'website'::ContactChannelType, 'https://www.desregulacion.gob.ar', 'https://www.desregulacion.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Federico Sturzenegger
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Federico Sturzenegger'), 'office_address'::ContactChannelType, 'Avenida Córdoba 2000', 'Avenida Córdoba 2000', 'Avenida Córdoba 2000', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Guillermo Ferreyra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guillermo Ferreyra'), 'phone'::ContactChannelType, '+54-11-4349-5000', '+54 11 4349-5000', '+541143495000')
ON CONFLICT DO NOTHING;

-- Email for: Guillermo Ferreyra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guillermo Ferreyra'), 'email'::ContactChannelType, 'info@obrasPublicas.gob.ar', 'info@obrasPublicas.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Guillermo Ferreyra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guillermo Ferreyra'), 'website'::ContactChannelType, 'https://www.obraspublicas.gob.ar', 'https://www.obraspublicas.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Guillermo Ferreyra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guillermo Ferreyra'), 'office_address'::ContactChannelType, 'Avenida Paseo Colón 275', 'Avenida Paseo Colón 275', 'Avenida Paseo Colón 275', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Demián Reidel
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Demián Reidel'), 'phone'::ContactChannelType, '+54-11-4349-4000', '+54 11 4349-4000', '+541143494000')
ON CONFLICT DO NOTHING;

-- Email for: Demián Reidel
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Demián Reidel'), 'email'::ContactChannelType, 'info@infraestructura.gob.ar', 'info@infraestructura.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Demián Reidel
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Demián Reidel'), 'website'::ContactChannelType, 'https://www.infraestructura.gob.ar', 'https://www.infraestructura.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Demián Reidel
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Demián Reidel'), 'office_address'::ContactChannelType, 'San Martín 250', 'San Martín 250', 'San Martín 250', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Julio Bray
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Julio Bray'), 'phone'::ContactChannelType, '+54-11-4349-6500', '+54 11 4349-6500', '+541143496500')
ON CONFLICT DO NOTHING;

-- Email for: Julio Bray
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Julio Bray'), 'email'::ContactChannelType, 'info@comercio.gob.ar', 'info@comercio.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Julio Bray
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Julio Bray'), 'website'::ContactChannelType, 'https://www.comercio.gob.ar', 'https://www.comercio.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Julio Bray
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Julio Bray'), 'office_address'::ContactChannelType, 'Avenida Roque Sáenz Peña 511', 'Avenida Roque Sáenz Peña 511', 'Avenida Roque Sáenz Peña 511', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: José Luis Gioja
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'José Luis Gioja'), 'phone'::ContactChannelType, '+54-11-4349-3000', '+54 11 4349-3000', '+541143493000')
ON CONFLICT DO NOTHING;

-- Email for: José Luis Gioja
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'José Luis Gioja'), 'email'::ContactChannelType, 'info@ciencia.gob.ar', 'info@ciencia.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: José Luis Gioja
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'José Luis Gioja'), 'website'::ContactChannelType, 'https://www.ciencia.gob.ar', 'https://www.ciencia.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: José Luis Gioja
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'José Luis Gioja'), 'office_address'::ContactChannelType, 'Avenida Córdoba 2000', 'Avenida Córdoba 2000', 'Avenida Córdoba 2000', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: María Alejandra Vicandi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'María Alejandra Vicandi'), 'phone'::ContactChannelType, '+54-11-4349-2100', '+54 11 4349-2100', '+541143492100')
ON CONFLICT DO NOTHING;

-- Email for: María Alejandra Vicandi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'María Alejandra Vicandi'), 'email'::ContactChannelType, 'info@turismo.gob.ar', 'info@turismo.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: María Alejandra Vicandi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'María Alejandra Vicandi'), 'website'::ContactChannelType, 'https://www.turismo.gob.ar', 'https://www.turismo.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: María Alejandra Vicandi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'María Alejandra Vicandi'), 'office_address'::ContactChannelType, 'Avenida Santa Fe 883', 'Avenida Santa Fe 883', 'Avenida Santa Fe 883', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Diego Rivarola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Diego Rivarola'), 'phone'::ContactChannelType, '+54-11-4349-1000', '+54 11 4349-1000', '+541143491000')
ON CONFLICT DO NOTHING;

-- Email for: Diego Rivarola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Diego Rivarola'), 'email'::ContactChannelType, 'info@ambiente.gob.ar', 'info@ambiente.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Diego Rivarola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Diego Rivarola'), 'website'::ContactChannelType, 'https://www.ambiente.gob.ar', 'https://www.ambiente.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Diego Rivarola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Diego Rivarola'), 'office_address'::ContactChannelType, 'Avenida Santa Fe 1652', 'Avenida Santa Fe 1652', 'Avenida Santa Fe 1652', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+54-11-6075-7100', '+54 11 6075-7100', '+541160757100')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@diputados.gov.ar', 'info@diputados.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.diputados.gov.ar', 'https://www.diputados.gov.ar')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Rivadavia 1864', 'Rivadavia 1864', 'Rivadavia 1864', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+54-11-2822-3000', '+54 11 2822-3000', '+541128223000')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@senado.gov.ar', 'info@senado.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.senado.gob.ar', 'https://www.senado.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Hipólito Yrigoyen 1835', 'Hipólito Yrigoyen 1835', 'Hipólito Yrigoyen 1835', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+54-11-6075-7200', '+54 11 6075-7200', '+541160757200')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'members@diputados.gov.ar', 'members@diputados.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://www.diputados.gov.ar', 'https://www.diputados.gov.ar')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, 'Rivadavia 1864', 'Rivadavia 1864', 'Rivadavia 1864', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+54-11-2822-3100', '+54 11 2822-3100', '+541128223100')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'members@senado.gov.ar', 'members@senado.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://www.senado.gob.ar', 'https://www.senado.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, 'Hipólito Yrigoyen 1835', 'Hipólito Yrigoyen 1835', 'Hipólito Yrigoyen 1835', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'phone'::ContactChannelType, '+54-11-4342-3600', '+54 11 4342-3600', '+541143423600')
ON CONFLICT DO NOTHING;

-- Email for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'email'::ContactChannelType, 'info@casarosada.gov.ar', 'info@casarosada.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'website'::ContactChannelType, 'https://www.argentina.gob.ar/presidencia', 'https://www.argentina.gob.ar/presidencia')
ON CONFLICT DO NOTHING;

-- Address for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'office_address'::ContactChannelType, 'Balcarce 50', 'Balcarce 50', 'Balcarce 50', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Vice President Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vice President Office'), 'phone'::ContactChannelType, '+54-11-4342-3600', '+54 11 4342-3600', '+541143423600')
ON CONFLICT DO NOTHING;

-- Email for: Vice President Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vice President Office'), 'email'::ContactChannelType, 'vicepresidencia@casarosada.gov.ar', 'vicepresidencia@casarosada.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Vice President Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vice President Office'), 'website'::ContactChannelType, 'https://www.argentina.gob.ar/vicepresidencia', 'https://www.argentina.gob.ar/vicepresidencia')
ON CONFLICT DO NOTHING;

-- Address for: Vice President Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vice President Office'), 'office_address'::ContactChannelType, 'Balcarce 50', 'Balcarce 50', 'Balcarce 50', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'phone'::ContactChannelType, '+54-11-4819-7000', '+54 11 4819-7000', '+541148197000')
ON CONFLICT DO NOTHING;

-- Email for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'email'::ContactChannelType, 'info@mrecic.gov.ar', 'info@mrecic.gov.ar')
ON CONFLICT DO NOTHING;

-- Website for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'website'::ContactChannelType, 'https://www.cancilleria.gob.ar', 'https://www.cancilleria.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'office_address'::ContactChannelType, 'Esmeralda 1212', 'Esmeralda 1212', 'Esmeralda 1212', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'phone'::ContactChannelType, '+54-11-4349-1000', '+54 11 4349-1000', '+541143491000')
ON CONFLICT DO NOTHING;

-- Email for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'email'::ContactChannelType, 'info@argentina.gob.ar', 'info@argentina.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'website'::ContactChannelType, 'https://www.argentina.gob.ar', 'https://www.argentina.gob.ar')
ON CONFLICT DO NOTHING;

-- Address for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'office_address'::ContactChannelType, 'Avenida Paseo Colón 275', 'Avenida Paseo Colón 275', 'Avenida Paseo Colón 275', 'Buenos Aires')
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Daniel Sloper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Daniel Sloper'), 'phone'::ContactChannelType, '+64 4 473 6411', '+64 4 473 6411', '+6444736411')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Daniel Sloper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Daniel Sloper'), 'email'::ContactChannelType, 'ahc.wellington@dfat.gov.au', 'ahc.wellington@dfat.gov.au')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Daniel Sloper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Daniel Sloper'), 'website'::ContactChannelType, 'newzealand.embassy.gov.au', 'newzealand.embassy.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Daniel Sloper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Daniel Sloper'), 'office_address'::ContactChannelType, '125 The Terrace, Wellington', '125 The Terrace, Wellington', '125 The Terrace, Wellington', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Chris Seed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Chris Seed'), 'phone'::ContactChannelType, '+64 4 462 6000', '+64 4 462 6000', '+6444626000')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Chris Seed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Chris Seed'), 'email'::ContactChannelType, 'publicaffairsusnz@state.gov', 'publicaffairsusnz@state.gov')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Chris Seed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Chris Seed'), 'website'::ContactChannelType, 'nz.usembassy.gov', 'nz.usembassy.gov')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Chris Seed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Chris Seed'), 'office_address'::ContactChannelType, '29 Fitzherbert Terrace, Thorndon', '29 Fitzherbert Terrace, Thorndon', '29 Fitzherbert Terrace, Thorndon', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Ms Iona Thomas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Iona Thomas'), 'phone'::ContactChannelType, '+64 4 924 6019', '+64 4 924 6019', '+6449246019')
ON CONFLICT DO NOTHING;

-- Email for: HE Ms Iona Thomas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Iona Thomas'), 'email'::ContactChannelType, 'enquiries.wellington@fco.gov.uk', 'enquiries.wellington@fco.gov.uk')
ON CONFLICT DO NOTHING;

-- Website for: HE Ms Iona Thomas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Iona Thomas'), 'website'::ContactChannelType, 'gov.uk/world/new-zealand', 'gov.uk/world/new-zealand')
ON CONFLICT DO NOTHING;

-- Address for: HE Ms Iona Thomas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Iona Thomas'), 'office_address'::ContactChannelType, '44 Hill Street, Thorndon', '44 Hill Street, Thorndon', '44 Hill Street, Thorndon', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mrs Laurence Beau
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Laurence Beau'), 'phone'::ContactChannelType, '+64 4 384 2555', '+64 4 384 2555', '+6443842555')
ON CONFLICT DO NOTHING;

-- Email for: HE Mrs Laurence Beau
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Laurence Beau'), 'email'::ContactChannelType, 'ambafrance.wellington@diplomatie.gouv.fr', 'ambafrance.wellington@diplomatie.gouv.fr')
ON CONFLICT DO NOTHING;

-- Website for: HE Mrs Laurence Beau
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Laurence Beau'), 'website'::ContactChannelType, 'nz.ambafrance.org', 'nz.ambafrance.org')
ON CONFLICT DO NOTHING;

-- Address for: HE Mrs Laurence Beau
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Laurence Beau'), 'office_address'::ContactChannelType, '34-42 Manners Street, Te Aro', '34-42 Manners Street, Te Aro', '34-42 Manners Street, Te Aro', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Ms Nicole Menzenbach
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Nicole Menzenbach'), 'phone'::ContactChannelType, '+64 4 473 6065', '+64 4 473 6065', '+6444736065')
ON CONFLICT DO NOTHING;

-- Email for: HE Ms Nicole Menzenbach
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Nicole Menzenbach'), 'email'::ContactChannelType, 'info@wellington.diplo.de', 'info@wellington.diplo.de')
ON CONFLICT DO NOTHING;

-- Website for: HE Ms Nicole Menzenbach
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Nicole Menzenbach'), 'website'::ContactChannelType, 'wellington.diplo.de', 'wellington.diplo.de')
ON CONFLICT DO NOTHING;

-- Address for: HE Ms Nicole Menzenbach
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Nicole Menzenbach'), 'office_address'::ContactChannelType, 'Grand Plimmer Tower Level 11, 2-6 Gilmer Terrace', 'Grand Plimmer Tower Level 11, 2-6 Gilmer Terrace', 'Grand Plimmer Tower Level 11, 2-6 Gilmer Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Ard van der Vorst
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Ard van der Vorst'), 'phone'::ContactChannelType, '+64 4 471 6390', '+64 4 471 6390', '+6444716390')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Ard van der Vorst
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Ard van der Vorst'), 'email'::ContactChannelType, 'well@minbuza.nl', 'well@minbuza.nl')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Ard van der Vorst
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Ard van der Vorst'), 'website'::ContactChannelType, 'netherlandsandyou.nl', 'netherlandsandyou.nl')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Ard van der Vorst
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Ard van der Vorst'), 'office_address'::ContactChannelType, 'Level 5, 40 Bowen Street', 'Level 5, 40 Bowen Street', 'Level 5, 40 Bowen Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Ms Jane Connolly
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Jane Connolly'), 'phone'::ContactChannelType, '+64 4 472 8433', '+64 4 472 8433', '+6444728433')
ON CONFLICT DO NOTHING;

-- Email for: HE Ms Jane Connolly
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Jane Connolly'), 'email'::ContactChannelType, 'wellington@dfa.ie', 'wellington@dfa.ie')
ON CONFLICT DO NOTHING;

-- Website for: HE Ms Jane Connolly
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Jane Connolly'), 'website'::ContactChannelType, 'dfa.ie', 'dfa.ie')
ON CONFLICT DO NOTHING;

-- Address for: HE Ms Jane Connolly
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Jane Connolly'), 'office_address'::ContactChannelType, 'Suite 302, 90 The Terrace', 'Suite 302, 90 The Terrace', 'Suite 302, 90 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Keith Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Keith Smith'), 'phone'::ContactChannelType, '+64 4 473 9577', '+64 4 473 9577', '+6444739577')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Keith Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Keith Smith'), 'email'::ContactChannelType, 'wlgtn@international.gc.ca', 'wlgtn@international.gc.ca')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Keith Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Keith Smith'), 'website'::ContactChannelType, 'canada.ca', 'canada.ca')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Keith Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Keith Smith'), 'office_address'::ContactChannelType, 'Building 1, 125 The Terrace', 'Building 1, 125 The Terrace', 'Building 1, 125 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Ms Neeta Bhushan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Neeta Bhushan'), 'phone'::ContactChannelType, '+64 4 473 6390', '+64 4 473 6390', '+6444736390')
ON CONFLICT DO NOTHING;

-- Email for: HE Ms Neeta Bhushan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Neeta Bhushan'), 'email'::ContactChannelType, 'hoc.wellington@mea.gov.in', 'hoc.wellington@mea.gov.in')
ON CONFLICT DO NOTHING;

-- Website for: HE Ms Neeta Bhushan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Neeta Bhushan'), 'website'::ContactChannelType, 'indembassywellington.gov.in', 'indembassywellington.gov.in')
ON CONFLICT DO NOTHING;

-- Address for: HE Ms Neeta Bhushan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Neeta Bhushan'), 'office_address'::ContactChannelType, '1 Willeston Street', '1 Willeston Street', '1 Willeston Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Wang Xiaolong
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Wang Xiaolong'), 'phone'::ContactChannelType, '+64 4 472 1382', '+64 4 472 1382', '+6444721382')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Wang Xiaolong
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Wang Xiaolong'), 'email'::ContactChannelType, 'chinaemb_nz@mfa.gov.cn', 'chinaemb_nz@mfa.gov.cn')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Wang Xiaolong
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Wang Xiaolong'), 'website'::ContactChannelType, 'nz.china-embassy.gov.cn', 'nz.china-embassy.gov.cn')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Wang Xiaolong
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Wang Xiaolong'), 'office_address'::ContactChannelType, 'Grand Plimmer Tower Level 10, 2-6 Gilmer Terrace', 'Grand Plimmer Tower Level 10, 2-6 Gilmer Terrace', 'Grand Plimmer Tower Level 10, 2-6 Gilmer Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Makoto Osawa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Makoto Osawa'), 'phone'::ContactChannelType, '+64 4 473 1540', '+64 4 473 1540', '+6444731540')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Makoto Osawa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Makoto Osawa'), 'email'::ContactChannelType, 'info@jponz.org', 'info@jponz.org')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Makoto Osawa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Makoto Osawa'), 'website'::ContactChannelType, 'nz.emb-japan.go.jp', 'nz.emb-japan.go.jp')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Makoto Osawa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Makoto Osawa'), 'office_address'::ContactChannelType, 'Grand Plimmer Tower Level 17, 2-6 Gilmer Terrace', 'Grand Plimmer Tower Level 17, 2-6 Gilmer Terrace', 'Grand Plimmer Tower Level 17, 2-6 Gilmer Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Chang-sik Kim
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Chang-sik Kim'), 'phone'::ContactChannelType, '+64 4 473 9400', '+64 4 473 9400', '+6444739400')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Chang-sik Kim
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Chang-sik Kim'), 'email'::ContactChannelType, 'nzealand@mofa.go.kr', 'nzealand@mofa.go.kr')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Chang-sik Kim
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Chang-sik Kim'), 'website'::ContactChannelType, 'nz.mofa.go.kr', 'nz.mofa.go.kr')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Chang-sik Kim
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Chang-sik Kim'), 'office_address'::ContactChannelType, 'Level 15, Majestic Centre, 100 The Terrace', 'Level 15, Majestic Centre, 100 The Terrace', 'Level 15, Majestic Centre, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Waravuth Pouapinya
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Waravuth Pouapinya'), 'phone'::ContactChannelType, '+64 4 472 8522', '+64 4 472 8522', '+6444728522')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Waravuth Pouapinya
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Waravuth Pouapinya'), 'email'::ContactChannelType, 'newzealand@mfa.go.th', 'newzealand@mfa.go.th')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Waravuth Pouapinya
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Waravuth Pouapinya'), 'website'::ContactChannelType, 'mfa.go.th', 'mfa.go.th')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Waravuth Pouapinya
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Waravuth Pouapinya'), 'office_address'::ContactChannelType, 'Level 10, 100 The Terrace', 'Level 10, 100 The Terrace', 'Level 10, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mrs Kira Azucena
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Kira Azucena'), 'phone'::ContactChannelType, '+64 4 802 6820', '+64 4 802 6820', '+6448026820')
ON CONFLICT DO NOTHING;

-- Email for: HE Mrs Kira Azucena
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Kira Azucena'), 'email'::ContactChannelType, 'wellington.pe@dfa.gov.ph', 'wellington.pe@dfa.gov.ph')
ON CONFLICT DO NOTHING;

-- Website for: HE Mrs Kira Azucena
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Kira Azucena'), 'website'::ContactChannelType, 'philembassy.org.nz', 'philembassy.org.nz')
ON CONFLICT DO NOTHING;

-- Address for: HE Mrs Kira Azucena
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Kira Azucena'), 'office_address'::ContactChannelType, '50 Hobson Street, Thorndon', '50 Hobson Street, Thorndon', '50 Hobson Street, Thorndon', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mrs Fientje Maritje Suebu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Fientje Maritje Suebu'), 'phone'::ContactChannelType, '+64 4 475 8697', '+64 4 475 8697', '+6444758697')
ON CONFLICT DO NOTHING;

-- Email for: HE Mrs Fientje Maritje Suebu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Fientje Maritje Suebu'), 'email'::ContactChannelType, 'wellington@kemlu.go.id', 'wellington@kemlu.go.id')
ON CONFLICT DO NOTHING;

-- Website for: HE Mrs Fientje Maritje Suebu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Fientje Maritje Suebu'), 'website'::ContactChannelType, 'wellington.kemlu.go.id', 'wellington.kemlu.go.id')
ON CONFLICT DO NOTHING;

-- Address for: HE Mrs Fientje Maritje Suebu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Fientje Maritje Suebu'), 'office_address'::ContactChannelType, '70 Glen Road, Kelburn', '70 Glen Road, Kelburn', '70 Glen Road, Kelburn', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Ms Mazita binti Marzuki
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Mazita binti Marzuki'), 'phone'::ContactChannelType, '+64 4 472 3641', '+64 4 472 3641', '+6444723641')
ON CONFLICT DO NOTHING;

-- Email for: HE Ms Mazita binti Marzuki
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Mazita binti Marzuki'), 'email'::ContactChannelType, 'mzwellington@kln.gov.my', 'mzwellington@kln.gov.my')
ON CONFLICT DO NOTHING;

-- Website for: HE Ms Mazita binti Marzuki
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Mazita binti Marzuki'), 'website'::ContactChannelType, 'wellington.kln.gov.my', 'wellington.kln.gov.my')
ON CONFLICT DO NOTHING;

-- Address for: HE Ms Mazita binti Marzuki
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Mazita binti Marzuki'), 'office_address'::ContactChannelType, 'Level 11, 100 The Terrace', 'Level 11, 100 The Terrace', 'Level 11, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr William Tan Wei Yuan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr William Tan Wei Yuan'), 'phone'::ContactChannelType, '+64 4 471 0424', '+64 4 471 0424', '+6444710424')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr William Tan Wei Yuan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr William Tan Wei Yuan'), 'email'::ContactChannelType, 'mfa_wellington@mfa.gov.sg', 'mfa_wellington@mfa.gov.sg')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr William Tan Wei Yuan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr William Tan Wei Yuan'), 'website'::ContactChannelType, 'mfa.gov.sg', 'mfa.gov.sg')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr William Tan Wei Yuan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr William Tan Wei Yuan'), 'office_address'::ContactChannelType, 'Level 13, Majestic Centre, 100 The Terrace', 'Level 13, Majestic Centre, 100 The Terrace', 'Level 13, Majestic Centre, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Marcos Arbizu de Souza Campos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Marcos Arbizu de Souza Campos'), 'phone'::ContactChannelType, '+64 4 472 7537', '+64 4 472 7537', '+6444727537')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Marcos Arbizu de Souza Campos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Marcos Arbizu de Souza Campos'), 'email'::ContactChannelType, 'wellington@itamaraty.gov.br', 'wellington@itamaraty.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Marcos Arbizu de Souza Campos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Marcos Arbizu de Souza Campos'), 'website'::ContactChannelType, 'brasil.itamaraty.gov.br', 'brasil.itamaraty.gov.br')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Marcos Arbizu de Souza Campos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Marcos Arbizu de Souza Campos'), 'office_address'::ContactChannelType, 'Level 9, 45 Willeston Street', 'Level 9, 45 Willeston Street', 'Level 9, 45 Willeston Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Ms Maria Belen Bogado
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Maria Belen Bogado'), 'phone'::ContactChannelType, '+64 4 472 8330', '+64 4 472 8330', '+6444728330')
ON CONFLICT DO NOTHING;

-- Email for: HE Ms Maria Belen Bogado
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Maria Belen Bogado'), 'email'::ContactChannelType, 'nzelandia@cancilleria.gob.ar', 'nzelandia@cancilleria.gob.ar')
ON CONFLICT DO NOTHING;

-- Website for: HE Ms Maria Belen Bogado
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Maria Belen Bogado'), 'website'::ContactChannelType, 'chancery.mrecic.gov.ar', 'chancery.mrecic.gov.ar')
ON CONFLICT DO NOTHING;

-- Address for: HE Ms Maria Belen Bogado
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Maria Belen Bogado'), 'office_address'::ContactChannelType, 'Level 12, 45 Willeston Street', 'Level 12, 45 Willeston Street', 'Level 12, 45 Willeston Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mrs Manahi Pakarati Novoa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Manahi Pakarati Novoa'), 'phone'::ContactChannelType, '+64 4 472 5466', '+64 4 472 5466', '+6444725466')
ON CONFLICT DO NOTHING;

-- Email for: HE Mrs Manahi Pakarati Novoa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Manahi Pakarati Novoa'), 'email'::ContactChannelType, 'nz@minrel.gob.cl', 'nz@minrel.gob.cl')
ON CONFLICT DO NOTHING;

-- Website for: HE Mrs Manahi Pakarati Novoa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Manahi Pakarati Novoa'), 'website'::ContactChannelType, 'chile.gob.cl', 'chile.gob.cl')
ON CONFLICT DO NOTHING;

-- Address for: HE Mrs Manahi Pakarati Novoa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Manahi Pakarati Novoa'), 'office_address'::ContactChannelType, 'Level 8, 45 Willeston Street', 'Level 8, 45 Willeston Street', 'Level 8, 45 Willeston Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Jose Emilio Bustinza Soto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Jose Emilio Bustinza Soto'), 'phone'::ContactChannelType, '+64 4 472 8749', '+64 4 472 8749', '+6444728749')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Jose Emilio Bustinza Soto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Jose Emilio Bustinza Soto'), 'email'::ContactChannelType, 'eperu@rree.gob.pe', 'eperu@rree.gob.pe')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Jose Emilio Bustinza Soto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Jose Emilio Bustinza Soto'), 'website'::ContactChannelType, 'peru.gob.pe', 'peru.gob.pe')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Jose Emilio Bustinza Soto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Jose Emilio Bustinza Soto'), 'office_address'::ContactChannelType, 'Level 3, 50 Hobson Street, Thorndon', 'Level 3, 50 Hobson Street, Thorndon', 'Level 3, 50 Hobson Street, Thorndon', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Ratu Inoke Kubuabola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ratu Inoke Kubuabola'), 'phone'::ContactChannelType, '+64 4 473 5401', '+64 4 473 5401', '+6444735401')
ON CONFLICT DO NOTHING;

-- Email for: HE Ratu Inoke Kubuabola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ratu Inoke Kubuabola'), 'email'::ContactChannelType, 'fiji@executive.gov.fj', 'fiji@executive.gov.fj')
ON CONFLICT DO NOTHING;

-- Website for: HE Ratu Inoke Kubuabola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ratu Inoke Kubuabola'), 'website'::ContactChannelType, 'fiji.gov.fj', 'fiji.gov.fj')
ON CONFLICT DO NOTHING;

-- Address for: HE Ratu Inoke Kubuabola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ratu Inoke Kubuabola'), 'office_address'::ContactChannelType, '8 Princes Street', '8 Princes Street', '8 Princes Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Afamasaga Faamatalaupu Toleafoa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Afamasaga Faamatalaupu Toleafoa'), 'phone'::ContactChannelType, '+64 4 473 4600', '+64 4 473 4600', '+6444734600')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Afamasaga Faamatalaupu Toleafoa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Afamasaga Faamatalaupu Toleafoa'), 'email'::ContactChannelType, 'samoahc@clear.net.nz', 'samoahc@clear.net.nz')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Afamasaga Faamatalaupu Toleafoa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Afamasaga Faamatalaupu Toleafoa'), 'website'::ContactChannelType, 'mfait.gov.ws', 'mfait.gov.ws')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Afamasaga Faamatalaupu Toleafoa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Afamasaga Faamatalaupu Toleafoa'), 'office_address'::ContactChannelType, '15 Pipitea Street, Thorndon', '15 Pipitea Street, Thorndon', '15 Pipitea Street, Thorndon', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Jimmy Nipo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Jimmy Nipo'), 'phone'::ContactChannelType, '+64 4 499 5233', '+64 4 499 5233', '+6444995233')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Jimmy Nipo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Jimmy Nipo'), 'email'::ContactChannelType, 'vanuatu@xtra.co.nz', 'vanuatu@xtra.co.nz')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Jimmy Nipo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Jimmy Nipo'), 'website'::ContactChannelType, 'vanuatu.gov.vu', 'vanuatu.gov.vu')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Jimmy Nipo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Jimmy Nipo'), 'office_address'::ContactChannelType, 'Level 1, 22 Willeston Street', 'Level 1, 22 Willeston Street', 'Level 1, 22 Willeston Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Sakias Tameo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sakias Tameo'), 'phone'::ContactChannelType, '+64 4 472 3455', '+64 4 472 3455', '+6444723455')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Sakias Tameo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sakias Tameo'), 'email'::ContactChannelType, 'hc.wellington@pnghighcomm.org.nz', 'hc.wellington@pnghighcomm.org.nz')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Sakias Tameo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sakias Tameo'), 'website'::ContactChannelType, 'pngembassy.org.nz', 'pngembassy.org.nz')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Sakias Tameo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sakias Tameo'), 'office_address'::ContactChannelType, 'Level 3, 95 The Terrace', 'Level 3, 95 The Terrace', 'Level 3, 95 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Ms Kairangi Samuela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Kairangi Samuela'), 'phone'::ContactChannelType, '+64 4 473 5509', '+64 4 473 5509', '+6444735509')
ON CONFLICT DO NOTHING;

-- Email for: HE Ms Kairangi Samuela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Kairangi Samuela'), 'email'::ContactChannelType, 'admin@cookislands.org.nz', 'admin@cookislands.org.nz')
ON CONFLICT DO NOTHING;

-- Website for: HE Ms Kairangi Samuela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Kairangi Samuela'), 'website'::ContactChannelType, 'cookislands.gov.ck', 'cookislands.gov.ck')
ON CONFLICT DO NOTHING;

-- Address for: HE Ms Kairangi Samuela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Kairangi Samuela'), 'office_address'::ContactChannelType, 'Unit 3, 8 Pipitea Street, Thorndon', 'Unit 3, 8 Pipitea Street, Thorndon', 'Unit 3, 8 Pipitea Street, Thorndon', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Feue Tipu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Feue Tipu'), 'phone'::ContactChannelType, '+64 4 472 8830', '+64 4 472 8830', '+6444728830')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Feue Tipu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Feue Tipu'), 'email'::ContactChannelType, 'tuvaluhc@clear.net.nz', 'tuvaluhc@clear.net.nz')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Feue Tipu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Feue Tipu'), 'website'::ContactChannelType, 'tuvalu.tv', 'tuvalu.tv')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Feue Tipu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Feue Tipu'), 'office_address'::ContactChannelType, 'Level 2, 90 The Terrace', 'Level 2, 90 The Terrace', 'Level 2, 90 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Rashed Matar Alqemzi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Rashed Matar Alqemzi'), 'phone'::ContactChannelType, '+64 4 472 8710', '+64 4 472 8710', '+6444728710')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Rashed Matar Alqemzi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Rashed Matar Alqemzi'), 'email'::ContactChannelType, 'wln@mofa.gov.ae', 'wln@mofa.gov.ae')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Rashed Matar Alqemzi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Rashed Matar Alqemzi'), 'website'::ContactChannelType, 'mofa.gov.ae', 'mofa.gov.ae')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Rashed Matar Alqemzi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Rashed Matar Alqemzi'), 'office_address'::ContactChannelType, 'Level 3, 45 Willeston Street', 'Level 3, 45 Willeston Street', 'Level 3, 45 Willeston Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Muhanna Aba Alkhail
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Muhanna Aba Alkhail'), 'phone'::ContactChannelType, '+64 4 817 8333', '+64 4 817 8333', '+6448178333')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Muhanna Aba Alkhail
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Muhanna Aba Alkhail'), 'email'::ContactChannelType, 'nzembassy@mofa.gov.sa', 'nzembassy@mofa.gov.sa')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Muhanna Aba Alkhail
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Muhanna Aba Alkhail'), 'website'::ContactChannelType, 'mofa.gov.sa', 'mofa.gov.sa')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Muhanna Aba Alkhail
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Muhanna Aba Alkhail'), 'office_address'::ContactChannelType, 'Level 4, 50 Hobson Street, Thorndon', 'Level 4, 50 Hobson Street, Thorndon', 'Level 4, 50 Hobson Street, Thorndon', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Reza Nazar Ahari
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Reza Nazar Ahari'), 'phone'::ContactChannelType, '+64 4 475 0447', '+64 4 475 0447', '+6444750447')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Reza Nazar Ahari
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Reza Nazar Ahari'), 'email'::ContactChannelType, 'nz@mfa.gov.ir', 'nz@mfa.gov.ir')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Reza Nazar Ahari
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Reza Nazar Ahari'), 'website'::ContactChannelType, 'mfa.gov.ir', 'mfa.gov.ir')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Reza Nazar Ahari
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Reza Nazar Ahari'), 'office_address'::ContactChannelType, 'Level 2, 38 Kelburn Parade', 'Level 2, 38 Kelburn Parade', 'Level 2, 38 Kelburn Parade', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr George Tadros
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr George Tadros'), 'phone'::ContactChannelType, '+64 4 499 5544', '+64 4 499 5544', '+6444995544')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr George Tadros
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr George Tadros'), 'email'::ContactChannelType, 'wellington@mfa.gov.eg', 'wellington@mfa.gov.eg')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr George Tadros
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr George Tadros'), 'website'::ContactChannelType, 'mfa.gov.eg', 'mfa.gov.eg')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr George Tadros
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr George Tadros'), 'office_address'::ContactChannelType, 'Level 12, Majestic Centre, 100 The Terrace', 'Level 12, Majestic Centre, 100 The Terrace', 'Level 12, Majestic Centre, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Luis Morejon Rodriguez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Luis Morejon Rodriguez'), 'phone'::ContactChannelType, '+64 4 472 3606', '+64 4 472 3606', '+6444723606')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Luis Morejon Rodriguez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Luis Morejon Rodriguez'), 'email'::ContactChannelType, 'nz@minrex.gob.cu', 'nz@minrex.gob.cu')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Luis Morejon Rodriguez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Luis Morejon Rodriguez'), 'website'::ContactChannelType, 'minrex.gob.cu', 'minrex.gob.cu')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Luis Morejon Rodriguez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Luis Morejon Rodriguez'), 'office_address'::ContactChannelType, 'Level 2, 45 Willeston Street', 'Level 2, 45 Willeston Street', 'Level 2, 45 Willeston Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Georgii Zuev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Georgii Zuev'), 'phone'::ContactChannelType, '+64 4 496 2000', '+64 4 496 2000', '+6444962000')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Georgii Zuev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Georgii Zuev'), 'email'::ContactChannelType, 'rusemb.nz@mid.ru', 'rusemb.nz@mid.ru')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Georgii Zuev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Georgii Zuev'), 'website'::ContactChannelType, 'nz.mid.ru', 'nz.mid.ru')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Georgii Zuev
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Georgii Zuev'), 'office_address'::ContactChannelType, 'Level 1, 20 Customhouse Quay', 'Level 1, 20 Customhouse Quay', 'Level 1, 20 Customhouse Quay', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Lawrence Meredith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Lawrence Meredith'), 'phone'::ContactChannelType, '+64 4 499 2268', '+64 4 499 2268', '+6444992268')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Lawrence Meredith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Lawrence Meredith'), 'email'::ContactChannelType, 'wellington@eeas.europa.eu', 'wellington@eeas.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Lawrence Meredith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Lawrence Meredith'), 'website'::ContactChannelType, 'ec.europa.eu', 'ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Lawrence Meredith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Lawrence Meredith'), 'office_address'::ContactChannelType, 'Level 12, Majestic Centre, 100 The Terrace', 'Level 12, Majestic Centre, 100 The Terrace', 'Level 12, Majestic Centre, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mrs Idelta Rodrigues
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Idelta Rodrigues'), 'phone'::ContactChannelType, '+64 4 495 8100', '+64 4 495 8100', '+6444958100')
ON CONFLICT DO NOTHING;

-- Email for: HE Mrs Idelta Rodrigues
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Idelta Rodrigues'), 'email'::ContactChannelType, 'wellington@mne.gov.tl', 'wellington@mne.gov.tl')
ON CONFLICT DO NOTHING;

-- Website for: HE Mrs Idelta Rodrigues
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Idelta Rodrigues'), 'website'::ContactChannelType, 'mne.gov.tl', 'mne.gov.tl')
ON CONFLICT DO NOTHING;

-- Address for: HE Mrs Idelta Rodrigues
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mrs Idelta Rodrigues'), 'office_address'::ContactChannelType, 'Level 4, 36 Bowen Street', 'Level 4, 36 Bowen Street', 'Level 4, 36 Bowen Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Viktor Vavricka
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Viktor Vavricka'), 'phone'::ContactChannelType, '+64 4 499 0556', '+64 4 499 0556', '+6444990556')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Viktor Vavricka
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Viktor Vavricka'), 'email'::ContactChannelType, 'wln.vertretung@eda.admin.ch', 'wln.vertretung@eda.admin.ch')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Viktor Vavricka
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Viktor Vavricka'), 'website'::ContactChannelType, 'eda.admin.ch', 'eda.admin.ch')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Viktor Vavricka
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Viktor Vavricka'), 'office_address'::ContactChannelType, 'Level 21, Aon Centre, 1 Willis Street', 'Level 21, Aon Centre, 1 Willis Street', 'Level 21, Aon Centre, 1 Willis Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Dr Faisal Aziz Ahmed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Dr Faisal Aziz Ahmed'), 'phone'::ContactChannelType, '+64 4 472 7133', '+64 4 472 7133', '+6444727133')
ON CONFLICT DO NOTHING;

-- Email for: HE Dr Faisal Aziz Ahmed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Dr Faisal Aziz Ahmed'), 'email'::ContactChannelType, 'hcwellington@mofa.gov.pk', 'hcwellington@mofa.gov.pk')
ON CONFLICT DO NOTHING;

-- Website for: HE Dr Faisal Aziz Ahmed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Dr Faisal Aziz Ahmed'), 'website'::ContactChannelType, 'mofa.gov.pk', 'mofa.gov.pk')
ON CONFLICT DO NOTHING;

-- Address for: HE Dr Faisal Aziz Ahmed
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Dr Faisal Aziz Ahmed'), 'office_address'::ContactChannelType, '100 The Terrace, Level 16', '100 The Terrace, Level 16', '100 The Terrace, Level 16', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Sampath Walpita Gamage
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sampath Walpita Gamage'), 'phone'::ContactChannelType, '+64 4 473 2432', '+64 4 473 2432', '+6444732432')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Sampath Walpita Gamage
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sampath Walpita Gamage'), 'email'::ContactChannelType, 'slemb.wellington@mfa.gov.lk', 'slemb.wellington@mfa.gov.lk')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Sampath Walpita Gamage
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sampath Walpita Gamage'), 'website'::ContactChannelType, 'mfa.gov.lk', 'mfa.gov.lk')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Sampath Walpita Gamage
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sampath Walpita Gamage'), 'office_address'::ContactChannelType, 'Level 6, 50 Hobson Street, Thorndon', 'Level 6, 50 Hobson Street, Thorndon', 'Level 6, 50 Hobson Street, Thorndon', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Alon Roth-Snir
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Alon Roth-Snir'), 'phone'::ContactChannelType, '+64 4 802 4280', '+64 4 802 4280', '+6448024280')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Alon Roth-Snir
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Alon Roth-Snir'), 'email'::ContactChannelType, 'wellington@mfa.gov.il', 'wellington@mfa.gov.il')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Alon Roth-Snir
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Alon Roth-Snir'), 'website'::ContactChannelType, 'mfa.gov.il', 'mfa.gov.il')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Alon Roth-Snir
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Alon Roth-Snir'), 'office_address'::ContactChannelType, 'Level 5, 50 Hobson Street, Thorndon', 'Level 5, 50 Hobson Street, Thorndon', 'Level 5, 50 Hobson Street, Thorndon', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Sabah Alsabah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sabah Alsabah'), 'phone'::ContactChannelType, '+64 4 499 3057', '+64 4 499 3057', '+6444993057')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Sabah Alsabah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sabah Alsabah'), 'email'::ContactChannelType, 'kuna@mofa.gov.kw', 'kuna@mofa.gov.kw')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Sabah Alsabah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sabah Alsabah'), 'website'::ContactChannelType, 'mofa.gov.kw', 'mofa.gov.kw')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Sabah Alsabah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Sabah Alsabah'), 'office_address'::ContactChannelType, 'Level 15, Majestic Centre, 100 The Terrace', 'Level 15, Majestic Centre, 100 The Terrace', 'Level 15, Majestic Centre, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Dr Gabor Nagy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Dr Gabor Nagy'), 'phone'::ContactChannelType, '+64 4 499 8615', '+64 4 499 8615', '+6444998615')
ON CONFLICT DO NOTHING;

-- Email for: HE Dr Gabor Nagy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Dr Gabor Nagy'), 'email'::ContactChannelType, 'wellington@mfa.gov.hu', 'wellington@mfa.gov.hu')
ON CONFLICT DO NOTHING;

-- Website for: HE Dr Gabor Nagy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Dr Gabor Nagy'), 'website'::ContactChannelType, 'mfa.gov.hu', 'mfa.gov.hu')
ON CONFLICT DO NOTHING;

-- Address for: HE Dr Gabor Nagy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Dr Gabor Nagy'), 'office_address'::ContactChannelType, 'Level 5, 45 Willeston Street', 'Level 5, 45 Willeston Street', 'Level 5, 45 Willeston Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Luis Sánchez-Vellisco Sánchez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Luis Sánchez-Vellisco Sánchez'), 'phone'::ContactChannelType, '+64 4 472 3599', '+64 4 472 3599', '+6444723599')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Luis Sánchez-Vellisco Sánchez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Luis Sánchez-Vellisco Sánchez'), 'email'::ContactChannelType, 'secretaria.nzel@maec.es', 'secretaria.nzel@maec.es')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Luis Sánchez-Vellisco Sánchez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Luis Sánchez-Vellisco Sánchez'), 'website'::ContactChannelType, 'maec.es', 'maec.es')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Luis Sánchez-Vellisco Sánchez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Luis Sánchez-Vellisco Sánchez'), 'office_address'::ContactChannelType, 'Level 1, 100 The Terrace', 'Level 1, 100 The Terrace', 'Level 1, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Melih Karalar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Melih Karalar'), 'phone'::ContactChannelType, '+64 4 499 8000', '+64 4 499 8000', '+6444998000')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Melih Karalar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Melih Karalar'), 'email'::ContactChannelType, 'emb.wellington@mfa.gov.tr', 'emb.wellington@mfa.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Melih Karalar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Melih Karalar'), 'website'::ContactChannelType, 'mfa.gov.tr', 'mfa.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Melih Karalar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Melih Karalar'), 'office_address'::ContactChannelType, 'Level 12, Majestic Centre, 100 The Terrace', 'Level 12, Majestic Centre, 100 The Terrace', 'Level 12, Majestic Centre, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Ms Isaura Duarte
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Isaura Duarte'), 'phone'::ContactChannelType, '+64 4 472 8456', '+64 4 472 8456', '+6444728456')
ON CONFLICT DO NOTHING;

-- Email for: HE Ms Isaura Duarte
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Isaura Duarte'), 'email'::ContactChannelType, 'nz@cancilleria.gov.co', 'nz@cancilleria.gov.co')
ON CONFLICT DO NOTHING;

-- Website for: HE Ms Isaura Duarte
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Isaura Duarte'), 'website'::ContactChannelType, 'cancilleria.gov.co', 'cancilleria.gov.co')
ON CONFLICT DO NOTHING;

-- Address for: HE Ms Isaura Duarte
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Ms Isaura Duarte'), 'office_address'::ContactChannelType, 'Level 11, Aon Centre, 1 Willis Street', 'Level 11, Aon Centre, 1 Willis Street', 'Level 11, Aon Centre, 1 Willis Street', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Phan Minh Giang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Phan Minh Giang'), 'phone'::ContactChannelType, '+64 4 462 6000', '+64 4 462 6000', '+6444626000')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Phan Minh Giang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Phan Minh Giang'), 'email'::ContactChannelType, 'info@vietnamembassy.org.nz', 'info@vietnamembassy.org.nz')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Phan Minh Giang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Phan Minh Giang'), 'website'::ContactChannelType, 'mfa.gov.vn', 'mfa.gov.vn')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Phan Minh Giang
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Phan Minh Giang'), 'office_address'::ContactChannelType, 'Level 8, 100 The Terrace', 'Level 8, 100 The Terrace', 'Level 8, 100 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: HE Mr Ishmael Avui
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Ishmael Avui'), 'phone'::ContactChannelType, '+64 4 499 9922', '+64 4 499 9922', '+6444999922')
ON CONFLICT DO NOTHING;

-- Email for: HE Mr Ishmael Avui
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Ishmael Avui'), 'email'::ContactChannelType, 'hc.wellington@solomons.gov.sb', 'hc.wellington@solomons.gov.sb')
ON CONFLICT DO NOTHING;

-- Website for: HE Mr Ishmael Avui
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Ishmael Avui'), 'website'::ContactChannelType, 'pmoffice.gov.sb', 'pmoffice.gov.sb')
ON CONFLICT DO NOTHING;

-- Address for: HE Mr Ishmael Avui
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'HE Mr Ishmael Avui'), 'office_address'::ContactChannelType, 'Level 3, 95 The Terrace', 'Level 3, 95 The Terrace', 'Level 3, 95 The Terrace', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Recep Tayyip Erdoğan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Recep Tayyip Erdoğan'), 'phone'::ContactChannelType, '+90-312-525-5555', '+90 312 525 55 55', '+903125255555')
ON CONFLICT DO NOTHING;

-- Email for: Recep Tayyip Erdoğan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Recep Tayyip Erdoğan'), 'email'::ContactChannelType, 'info@tccb.gov.tr', 'info@tccb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Recep Tayyip Erdoğan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Recep Tayyip Erdoğan'), 'website'::ContactChannelType, 'https://www.tccb.gov.tr', 'https://www.tccb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Recep Tayyip Erdoğan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Recep Tayyip Erdoğan'), 'office_address'::ContactChannelType, 'Cumhuriyet Bulvarı', 'Cumhuriyet Bulvarı', 'Cumhuriyet Bulvarı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Cevdet Yılmaz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cevdet Yılmaz'), 'phone'::ContactChannelType, '+90-312-525-5555', '+90 312 525 55 55', '+903125255555')
ON CONFLICT DO NOTHING;

-- Email for: Cevdet Yılmaz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cevdet Yılmaz'), 'email'::ContactChannelType, 'vicepres@tccb.gov.tr', 'vicepres@tccb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Cevdet Yılmaz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cevdet Yılmaz'), 'website'::ContactChannelType, 'https://www.tccb.gov.tr', 'https://www.tccb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Cevdet Yılmaz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cevdet Yılmaz'), 'office_address'::ContactChannelType, 'Cumhuriyet Bulvarı', 'Cumhuriyet Bulvarı', 'Cumhuriyet Bulvarı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Yılmaz Tunç
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yılmaz Tunç'), 'phone'::ContactChannelType, '+90-312-417-3000', '+90 312 417 30 00', '+903124173000')
ON CONFLICT DO NOTHING;

-- Email for: Yılmaz Tunç
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yılmaz Tunç'), 'email'::ContactChannelType, 'info@adalet.gov.tr', 'info@adalet.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Yılmaz Tunç
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yılmaz Tunç'), 'website'::ContactChannelType, 'https://www.adalet.gov.tr', 'https://www.adalet.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Yılmaz Tunç
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yılmaz Tunç'), 'office_address'::ContactChannelType, 'Adalet Bakanlığı', 'Adalet Bakanlığı', 'Adalet Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Mahinur Özdemir Göktaş
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahinur Özdemir Göktaş'), 'phone'::ContactChannelType, '+90-312-203-6000', '+90 312 203 60 00', '+903122036000')
ON CONFLICT DO NOTHING;

-- Email for: Mahinur Özdemir Göktaş
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahinur Özdemir Göktaş'), 'email'::ContactChannelType, 'info@ahs.gov.tr', 'info@ahs.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Mahinur Özdemir Göktaş
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahinur Özdemir Göktaş'), 'website'::ContactChannelType, 'https://www.ahs.gov.tr', 'https://www.ahs.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Mahinur Özdemir Göktaş
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mahinur Özdemir Göktaş'), 'office_address'::ContactChannelType, 'Aile Hizmetleri Bakanlığı', 'Aile Hizmetleri Bakanlığı', 'Aile Hizmetleri Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Vedat Işıkhan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vedat Işıkhan'), 'phone'::ContactChannelType, '+90-312-296-6000', '+90 312 296 60 00', '+903122966000')
ON CONFLICT DO NOTHING;

-- Email for: Vedat Işıkhan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vedat Işıkhan'), 'email'::ContactChannelType, 'info@csgb.gov.tr', 'info@csgb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Vedat Işıkhan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vedat Işıkhan'), 'website'::ContactChannelType, 'https://www.csgb.gov.tr', 'https://www.csgb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Vedat Işıkhan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vedat Işıkhan'), 'office_address'::ContactChannelType, 'Çalışma Bakanlığı', 'Çalışma Bakanlığı', 'Çalışma Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Murat Kurum
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Murat Kurum'), 'phone'::ContactChannelType, '+90-312-207-5000', '+90 312 207 50 00', '+903122075000')
ON CONFLICT DO NOTHING;

-- Email for: Murat Kurum
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Murat Kurum'), 'email'::ContactChannelType, 'info@cevre.gov.tr', 'info@cevre.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Murat Kurum
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Murat Kurum'), 'website'::ContactChannelType, 'https://www.cevre.gov.tr', 'https://www.cevre.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Murat Kurum
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Murat Kurum'), 'office_address'::ContactChannelType, 'Çevre Bakanlığı', 'Çevre Bakanlığı', 'Çevre Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Hakan Fidan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hakan Fidan'), 'phone'::ContactChannelType, '+90-312-292-1000', '+90 312 292 10 00', '+903122921000')
ON CONFLICT DO NOTHING;

-- Email for: Hakan Fidan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hakan Fidan'), 'email'::ContactChannelType, 'info@mfa.gov.tr', 'info@mfa.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Hakan Fidan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hakan Fidan'), 'website'::ContactChannelType, 'https://www.mfa.gov.tr', 'https://www.mfa.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Hakan Fidan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hakan Fidan'), 'office_address'::ContactChannelType, 'Dışişleri Bakanlığı', 'Dışişleri Bakanlığı', 'Dışişleri Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Alparslan Bayraktar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alparslan Bayraktar'), 'phone'::ContactChannelType, '+90-312-455-2000', '+90 312 455 20 00', '+903124552000')
ON CONFLICT DO NOTHING;

-- Email for: Alparslan Bayraktar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alparslan Bayraktar'), 'email'::ContactChannelType, 'info@enerji.gov.tr', 'info@enerji.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Alparslan Bayraktar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alparslan Bayraktar'), 'website'::ContactChannelType, 'https://www.enerji.gov.tr', 'https://www.enerji.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Alparslan Bayraktar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alparslan Bayraktar'), 'office_address'::ContactChannelType, 'Enerji Bakanlığı', 'Enerji Bakanlığı', 'Enerji Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Osman Aşkın Bak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Osman Aşkın Bak'), 'phone'::ContactChannelType, '+90-312-507-5000', '+90 312 507 50 00', '+903125075000')
ON CONFLICT DO NOTHING;

-- Email for: Osman Aşkın Bak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Osman Aşkın Bak'), 'email'::ContactChannelType, 'info@gsb.gov.tr', 'info@gsb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Osman Aşkın Bak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Osman Aşkın Bak'), 'website'::ContactChannelType, 'https://www.gsb.gov.tr', 'https://www.gsb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Osman Aşkın Bak
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Osman Aşkın Bak'), 'office_address'::ContactChannelType, 'Gençlik ve Spor Bakanlığı', 'Gençlik ve Spor Bakanlığı', 'Gençlik ve Spor Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Mehmet Şimşek
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Şimşek'), 'phone'::ContactChannelType, '+90-312-204-7000', '+90 312 204 70 00', '+903122047000')
ON CONFLICT DO NOTHING;

-- Email for: Mehmet Şimşek
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Şimşek'), 'email'::ContactChannelType, 'info@hmb.gov.tr', 'info@hmb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Mehmet Şimşek
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Şimşek'), 'website'::ContactChannelType, 'https://www.hmb.gov.tr', 'https://www.hmb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Mehmet Şimşek
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Şimşek'), 'office_address'::ContactChannelType, 'Hazine Bakanlığı', 'Hazine Bakanlığı', 'Hazine Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Ali Yerlikaya
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ali Yerlikaya'), 'phone'::ContactChannelType, '+90-312-418-5000', '+90 312 418 50 00', '+903124185000')
ON CONFLICT DO NOTHING;

-- Email for: Ali Yerlikaya
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ali Yerlikaya'), 'email'::ContactChannelType, 'info@icisleri.gov.tr', 'info@icisleri.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Ali Yerlikaya
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ali Yerlikaya'), 'website'::ContactChannelType, 'https://www.icisleri.gov.tr', 'https://www.icisleri.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Ali Yerlikaya
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ali Yerlikaya'), 'office_address'::ContactChannelType, 'İçişleri Bakanlığı', 'İçişleri Bakanlığı', 'İçişleri Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Mehmet Nuri Ersoy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Nuri Ersoy'), 'phone'::ContactChannelType, '+90-312-470-8000', '+90 312 470 80 00', '+903124708000')
ON CONFLICT DO NOTHING;

-- Email for: Mehmet Nuri Ersoy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Nuri Ersoy'), 'email'::ContactChannelType, 'info@ktb.gov.tr', 'info@ktb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Mehmet Nuri Ersoy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Nuri Ersoy'), 'website'::ContactChannelType, 'https://www.ktb.gov.tr', 'https://www.ktb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Mehmet Nuri Ersoy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Nuri Ersoy'), 'office_address'::ContactChannelType, 'Kültür ve Turizm Bakanlığı', 'Kültür ve Turizm Bakanlığı', 'Kültür ve Turizm Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Yusuf Tekin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yusuf Tekin'), 'phone'::ContactChannelType, '+90-312-473-7000', '+90 312 473 70 00', '+903124737000')
ON CONFLICT DO NOTHING;

-- Email for: Yusuf Tekin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yusuf Tekin'), 'email'::ContactChannelType, 'info@meb.gov.tr', 'info@meb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Yusuf Tekin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yusuf Tekin'), 'website'::ContactChannelType, 'https://www.meb.gov.tr', 'https://www.meb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Yusuf Tekin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yusuf Tekin'), 'office_address'::ContactChannelType, 'Milli Eğitim Bakanlığı', 'Milli Eğitim Bakanlığı', 'Milli Eğitim Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Yaşar Güler
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yaşar Güler'), 'phone'::ContactChannelType, '+90-312-477-4000', '+90 312 477 40 00', '+903124774000')
ON CONFLICT DO NOTHING;

-- Email for: Yaşar Güler
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yaşar Güler'), 'email'::ContactChannelType, 'info@msb.gov.tr', 'info@msb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Yaşar Güler
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yaşar Güler'), 'website'::ContactChannelType, 'https://www.msb.gov.tr', 'https://www.msb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Yaşar Güler
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yaşar Güler'), 'office_address'::ContactChannelType, 'Millî Savunma Bakanlığı', 'Millî Savunma Bakanlığı', 'Millî Savunma Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Kemal Memişoğlu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kemal Memişoğlu'), 'phone'::ContactChannelType, '+90-312-585-8000', '+90 312 585 80 00', '+903125858000')
ON CONFLICT DO NOTHING;

-- Email for: Kemal Memişoğlu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kemal Memişoğlu'), 'email'::ContactChannelType, 'info@saglik.gov.tr', 'info@saglik.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Kemal Memişoğlu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kemal Memişoğlu'), 'website'::ContactChannelType, 'https://www.saglik.gov.tr', 'https://www.saglik.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Kemal Memişoğlu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kemal Memişoğlu'), 'office_address'::ContactChannelType, 'Sağlık Bakanlığı', 'Sağlık Bakanlığı', 'Sağlık Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Mehmet Fatih Kacır
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Fatih Kacır'), 'phone'::ContactChannelType, '+90-312-212-5000', '+90 312 212 50 00', '+903122125000')
ON CONFLICT DO NOTHING;

-- Email for: Mehmet Fatih Kacır
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Fatih Kacır'), 'email'::ContactChannelType, 'info@sanayi.gov.tr', 'info@sanayi.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Mehmet Fatih Kacır
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Fatih Kacır'), 'website'::ContactChannelType, 'https://www.sanayi.gov.tr', 'https://www.sanayi.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Mehmet Fatih Kacır
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Fatih Kacır'), 'office_address'::ContactChannelType, 'Sanayi ve Teknoloji Bakanlığı', 'Sanayi ve Teknoloji Bakanlığı', 'Sanayi ve Teknoloji Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: İbrahim Yumaklı
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'İbrahim Yumaklı'), 'phone'::ContactChannelType, '+90-312-596-2000', '+90 312 596 20 00', '+903125962000')
ON CONFLICT DO NOTHING;

-- Email for: İbrahim Yumaklı
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'İbrahim Yumaklı'), 'email'::ContactChannelType, 'info@tarim.gov.tr', 'info@tarim.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: İbrahim Yumaklı
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'İbrahim Yumaklı'), 'website'::ContactChannelType, 'https://www.tarim.gov.tr', 'https://www.tarim.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: İbrahim Yumaklı
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'İbrahim Yumaklı'), 'office_address'::ContactChannelType, 'Tarım ve Orman Bakanlığı', 'Tarım ve Orman Bakanlığı', 'Tarım ve Orman Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Ömer Bolat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ömer Bolat'), 'phone'::ContactChannelType, '+90-312-203-7000', '+90 312 203 70 00', '+903122037000')
ON CONFLICT DO NOTHING;

-- Email for: Ömer Bolat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ömer Bolat'), 'email'::ContactChannelType, 'info@ticaret.gov.tr', 'info@ticaret.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Ömer Bolat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ömer Bolat'), 'website'::ContactChannelType, 'https://www.ticaret.gov.tr', 'https://www.ticaret.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Ömer Bolat
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ömer Bolat'), 'office_address'::ContactChannelType, 'Ticaret Bakanlığı', 'Ticaret Bakanlığı', 'Ticaret Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Abdulkadir Uraloğlu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulkadir Uraloğlu'), 'phone'::ContactChannelType, '+90-312-203-2000', '+90 312 203 20 00', '+903122032000')
ON CONFLICT DO NOTHING;

-- Email for: Abdulkadir Uraloğlu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulkadir Uraloğlu'), 'email'::ContactChannelType, 'info@ulaştırma.gov.tr', 'info@ulaştırma.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Abdulkadir Uraloğlu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulkadir Uraloğlu'), 'website'::ContactChannelType, 'https://www.ulaştırma.gov.tr', 'https://www.ulaştırma.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Abdulkadir Uraloğlu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Abdulkadir Uraloğlu'), 'office_address'::ContactChannelType, 'Ulaştırma Bakanlığı', 'Ulaştırma Bakanlığı', 'Ulaştırma Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+90-312-420-5151', '+90 312 420 51 51', '+903124205151')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@tbmm.gov.tr', 'info@tbmm.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.tbmm.gov.tr', 'https://www.tbmm.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'TBMM, Bakanlıklar', 'TBMM, Bakanlıklar', 'TBMM, Bakanlıklar', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Speaker's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Speaker''s Office'), 'phone'::ContactChannelType, '+90-312-420-5000', '+90 312 420 50 00', '+903124205000')
ON CONFLICT DO NOTHING;

-- Email for: Speaker's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Speaker''s Office'), 'email'::ContactChannelType, 'speaker@tbmm.gov.tr', 'speaker@tbmm.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Speaker's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Speaker''s Office'), 'website'::ContactChannelType, 'https://www.tbmm.gov.tr', 'https://www.tbmm.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Speaker's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Speaker''s Office'), 'office_address'::ContactChannelType, 'TBMM, Bakanlıklar', 'TBMM, Bakanlıklar', 'TBMM, Bakanlıklar', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+90-312-420-5200', '+90 312 420 52 00', '+903124205200')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'members@tbmm.gov.tr', 'members@tbmm.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://www.tbmm.gov.tr', 'https://www.tbmm.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, 'TBMM, Bakanlıklar', 'TBMM, Bakanlıklar', 'TBMM, Bakanlıklar', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'phone'::ContactChannelType, '+90-312-420-5400', '+90 312 420 54 00', '+903124205400')
ON CONFLICT DO NOTHING;

-- Email for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'email'::ContactChannelType, 'inquiry@tbmm.gov.tr', 'inquiry@tbmm.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'website'::ContactChannelType, 'https://www.tbmm.gov.tr', 'https://www.tbmm.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Public Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Inquiries'), 'office_address'::ContactChannelType, 'TBMM, Bakanlıklar', 'TBMM, Bakanlıklar', 'TBMM, Bakanlıklar', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Presidential Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Presidential Office'), 'phone'::ContactChannelType, '+90-312-525-5555', '+90 312 525 55 55', '+903125255555')
ON CONFLICT DO NOTHING;

-- Email for: Presidential Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Presidential Office'), 'email'::ContactChannelType, 'info@tccb.gov.tr', 'info@tccb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Presidential Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Presidential Office'), 'website'::ContactChannelType, 'https://www.tccb.gov.tr', 'https://www.tccb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Presidential Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Presidential Office'), 'office_address'::ContactChannelType, 'Cumhuriyet Bulvarı', 'Cumhuriyet Bulvarı', 'Cumhuriyet Bulvarı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Vice Presidential Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vice Presidential Office'), 'phone'::ContactChannelType, '+90-312-525-5555', '+90 312 525 55 55', '+903125255555')
ON CONFLICT DO NOTHING;

-- Email for: Vice Presidential Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vice Presidential Office'), 'email'::ContactChannelType, 'vicepres@tccb.gov.tr', 'vicepres@tccb.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Vice Presidential Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vice Presidential Office'), 'website'::ContactChannelType, 'https://www.tccb.gov.tr', 'https://www.tccb.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Vice Presidential Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Vice Presidential Office'), 'office_address'::ContactChannelType, 'Cumhuriyet Bulvarı', 'Cumhuriyet Bulvarı', 'Cumhuriyet Bulvarı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'phone'::ContactChannelType, '+90-312-292-1000', '+90 312 292 10 00', '+903122921000')
ON CONFLICT DO NOTHING;

-- Email for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'email'::ContactChannelType, 'info@mfa.gov.tr', 'info@mfa.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'website'::ContactChannelType, 'https://www.mfa.gov.tr', 'https://www.mfa.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Press and Media Centre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Press and Media Centre'), 'office_address'::ContactChannelType, 'Dışişleri Bakanlığı', 'Dışişleri Bakanlığı', 'Dışişleri Bakanlığı', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'phone'::ContactChannelType, '+90-312-592-4000', '+90 312 592 40 00', '+903125924000')
ON CONFLICT DO NOTHING;

-- Email for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'email'::ContactChannelType, 'info@iletisim.gov.tr', 'info@iletisim.gov.tr')
ON CONFLICT DO NOTHING;

-- Website for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'website'::ContactChannelType, 'https://www.iletisim.gov.tr', 'https://www.iletisim.gov.tr')
ON CONFLICT DO NOTHING;

-- Address for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'office_address'::ContactChannelType, 'Iletişim Kulesi', 'Iletişim Kulesi', 'Iletişim Kulesi', 'Ankara')
ON CONFLICT DO NOTHING;

-- Phone for: Anthony Albanese
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anthony Albanese'), 'phone'::ContactChannelType, '(02) 6277 7700', '(02) 6277 7700', '0262777700')
ON CONFLICT DO NOTHING;

-- Email for: Anthony Albanese
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anthony Albanese'), 'email'::ContactChannelType, 'A.Albanese.MP@aph.gov.au', 'A.Albanese.MP@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Anthony Albanese
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anthony Albanese'), 'office_address'::ContactChannelType, 'Parliament House, Canberra ACT 2600', 'Parliament House, Canberra ACT 2600', 'Parliament House, Canberra ACT 2600', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Katy Gallagher
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Katy Gallagher'), 'phone'::ContactChannelType, '(02) 6230 0411', '(02) 6230 0411', '0262300411')
ON CONFLICT DO NOTHING;

-- Email for: Katy Gallagher
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Katy Gallagher'), 'email'::ContactChannelType, 'senator.katy.gallagher@aph.gov.au', 'senator.katy.gallagher@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Katy Gallagher
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Katy Gallagher'), 'office_address'::ContactChannelType, 'Unit 3, 40 Corinna Street, Phillip ACT 2601', 'Unit 3, 40 Corinna Street, Phillip ACT 2601', 'Unit 3, 40 Corinna Street, Phillip ACT 2601', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: David Pocock
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Pocock'), 'phone'::ContactChannelType, '(02) 6247 6444', '(02) 6247 6444', '0262476444')
ON CONFLICT DO NOTHING;

-- Email for: David Pocock
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Pocock'), 'email'::ContactChannelType, 'senator.david.pocock@aph.gov.au', 'senator.david.pocock@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: David Pocock
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Pocock'), 'office_address'::ContactChannelType, 'Shop 1, 25 Ernest Cavanagh Street, Gungahlin ACT 2912', 'Shop 1, 25 Ernest Cavanagh Street, Gungahlin ACT 2912', 'Shop 1, 25 Ernest Cavanagh Street, Gungahlin ACT 2912', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tim Ayres
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tim Ayres'), 'phone'::ContactChannelType, '(02) 9159 9330', '(02) 9159 9330', '0291599330')
ON CONFLICT DO NOTHING;

-- Email for: Tim Ayres
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tim Ayres'), 'email'::ContactChannelType, 'senator.ayres@aph.gov.au', 'senator.ayres@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Tim Ayres
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tim Ayres'), 'office_address'::ContactChannelType, 'Level 3, 1A Lawson Square, Redfern NSW 2016', 'Level 3, 1A Lawson Square, Redfern NSW 2016', 'Level 3, 1A Lawson Square, Redfern NSW 2016', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Andrew Bragg
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrew Bragg'), 'phone'::ContactChannelType, '(02) 9159 9320', '(02) 9159 9320', '0291599320')
ON CONFLICT DO NOTHING;

-- Email for: Andrew Bragg
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrew Bragg'), 'email'::ContactChannelType, 'senator.bragg@aph.gov.au', 'senator.bragg@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Andrew Bragg
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrew Bragg'), 'office_address'::ContactChannelType, 'Shop 1, 392 Oxford Street, Paddington NSW 2021', 'Shop 1, 392 Oxford Street, Paddington NSW 2021', 'Shop 1, 392 Oxford Street, Paddington NSW 2021', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ross Cadell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ross Cadell'), 'phone'::ContactChannelType, '(02) 6492 0586', '(02) 6492 0586', '0264920586')
ON CONFLICT DO NOTHING;

-- Email for: Ross Cadell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ross Cadell'), 'email'::ContactChannelType, 'senator.cadell@aph.gov.au', 'senator.cadell@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Ross Cadell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ross Cadell'), 'office_address'::ContactChannelType, 'Ground Floor, 28-30 Bolton Street, Newcastle NSW 2300', 'Ground Floor, 28-30 Bolton Street, Newcastle NSW 2300', 'Ground Floor, 28-30 Bolton Street, Newcastle NSW 2300', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jessica Collins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jessica Collins'), 'phone'::ContactChannelType, '(02) 9159 9325', '(02) 9159 9325', '0291599325')
ON CONFLICT DO NOTHING;

-- Email for: Jessica Collins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jessica Collins'), 'email'::ContactChannelType, 'senator.collins@aph.gov.au', 'senator.collins@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Jessica Collins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jessica Collins'), 'office_address'::ContactChannelType, 'Commonwealth Parliamentary Offices, Suite 14.02, Level 14, 25 Bligh Street, Sydney NSW 2000', 'Commonwealth Parliamentary Offices, Suite 14.02, Level 14, 25 Bligh Street, Sydney NSW 2000', 'Commonwealth Parliamentary Offices, Suite 14.02, Level 14, 25 Bligh Street, Sydney NSW 2000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mehreen Faruqi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehreen Faruqi'), 'phone'::ContactChannelType, '(02) 9211 1500', '(02) 9211 1500', '0292111500')
ON CONFLICT DO NOTHING;

-- Email for: Mehreen Faruqi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehreen Faruqi'), 'email'::ContactChannelType, 'senator.faruqi@aph.gov.au', 'senator.faruqi@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Mehreen Faruqi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehreen Faruqi'), 'office_address'::ContactChannelType, '72 Campbell Street, Surry Hills NSW 2010', '72 Campbell Street, Surry Hills NSW 2010', '72 Campbell Street, Surry Hills NSW 2010', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jenny McAllister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jenny McAllister'), 'phone'::ContactChannelType, '(02) 9719 8100', '(02) 9719 8100', '0297198100')
ON CONFLICT DO NOTHING;

-- Email for: Jenny McAllister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jenny McAllister'), 'email'::ContactChannelType, 'senator.mcallister@aph.gov.au', 'senator.mcallister@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Jenny McAllister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jenny McAllister'), 'office_address'::ContactChannelType, 'Suite 501, Level 5, 54-66 Wentworth Avenue, Surry Hills NSW 2010', 'Suite 501, Level 5, 54-66 Wentworth Avenue, Surry Hills NSW 2010', 'Suite 501, Level 5, 54-66 Wentworth Avenue, Surry Hills NSW 2010', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Deborah O'Neill
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Deborah O''Neill'), 'phone'::ContactChannelType, '(02) 4367 4565', '(02) 4367 4565', '0243674565')
ON CONFLICT DO NOTHING;

-- Email for: Deborah O'Neill
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Deborah O''Neill'), 'email'::ContactChannelType, 'senator.oneill@aph.gov.au', 'senator.oneill@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Deborah O'Neill
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Deborah O''Neill'), 'office_address'::ContactChannelType, 'Suite 3.12, The Platinum Building, 4 Ilya Avenue, Erina NSW 2250', 'Suite 3.12, The Platinum Building, 4 Ilya Avenue, Erina NSW 2250', 'Suite 3.12, The Platinum Building, 4 Ilya Avenue, Erina NSW 2250', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: David Shoebridge
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Shoebridge'), 'phone'::ContactChannelType, '(02) 8073 7400', '(02) 8073 7400', '0280737400')
ON CONFLICT DO NOTHING;

-- Email for: David Shoebridge
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Shoebridge'), 'email'::ContactChannelType, 'senator.shoebridge@aph.gov.au', 'senator.shoebridge@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: David Shoebridge
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Shoebridge'), 'office_address'::ContactChannelType, 'Suite 201, Level 2, 1A Lawson Square, Redfern NSW 2016', 'Suite 201, Level 2, 1A Lawson Square, Redfern NSW 2016', 'Suite 201, Level 2, 1A Lawson Square, Redfern NSW 2016', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Sean Bell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sean Bell'), 'phone'::ContactChannelType, '(02) 8289 9160', '(02) 8289 9160', '0282899160')
ON CONFLICT DO NOTHING;

-- Email for: Sean Bell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sean Bell'), 'email'::ContactChannelType, 'senator.bell@aph.gov.au', 'senator.bell@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Sean Bell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sean Bell'), 'office_address'::ContactChannelType, 'Commonwealth Parliamentary Offices, Suite 8, Level 21, 1 Bligh Street, Sydney NSW 2000', 'Commonwealth Parliamentary Offices, Suite 8, Level 21, 1 Bligh Street, Sydney NSW 2000', 'Commonwealth Parliamentary Offices, Suite 8, Level 21, 1 Bligh Street, Sydney NSW 2000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Maria Kovacic
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Kovacic'), 'phone'::ContactChannelType, '(02) 8289 9770', '(02) 8289 9770', '0282899770')
ON CONFLICT DO NOTHING;

-- Email for: Maria Kovacic
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Kovacic'), 'email'::ContactChannelType, 'senator.kovacic@aph.gov.au', 'senator.kovacic@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Maria Kovacic
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Kovacic'), 'office_address'::ContactChannelType, 'Commonwealth Parliamentary Offices, Suite 10, Level 21, 1 Bligh Street, Sydney NSW 2000', 'Commonwealth Parliamentary Offices, Suite 10, Level 21, 1 Bligh Street, Sydney NSW 2000', 'Commonwealth Parliamentary Offices, Suite 10, Level 21, 1 Bligh Street, Sydney NSW 2000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Devanand Sharma
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Devanand Sharma'), 'phone'::ContactChannelType, '(02) 8289 9800', '(02) 8289 9800', '0282899800')
ON CONFLICT DO NOTHING;

-- Email for: Devanand Sharma
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Devanand Sharma'), 'email'::ContactChannelType, 'senator.sharma@aph.gov.au', 'senator.sharma@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Devanand Sharma
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Devanand Sharma'), 'office_address'::ContactChannelType, 'Commonwealth Parliamentary Offices, Suite 9, Level 21, 1 Bligh Street, Sydney NSW 2000', 'Commonwealth Parliamentary Offices, Suite 9, Level 21, 1 Bligh Street, Sydney NSW 2000', 'Commonwealth Parliamentary Offices, Suite 9, Level 21, 1 Bligh Street, Sydney NSW 2000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tony Sheldon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tony Sheldon'), 'phone'::ContactChannelType, '(02) 9719 1078', '(02) 9719 1078', '0297191078')
ON CONFLICT DO NOTHING;

-- Email for: Tony Sheldon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tony Sheldon'), 'email'::ContactChannelType, 'senator.sheldon@aph.gov.au', 'senator.sheldon@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Tony Sheldon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tony Sheldon'), 'office_address'::ContactChannelType, 'Suite 11.02, Level 11, 66 Goulburn Street, Sydney NSW 2000', 'Suite 11.02, Level 11, 66 Goulburn Street, Sydney NSW 2000', 'Suite 11.02, Level 11, 66 Goulburn Street, Sydney NSW 2000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Malarndirri McCarthy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Malarndirri McCarthy'), 'phone'::ContactChannelType, '(08) 8941 0003', '(08) 8941 0003', '0889410003')
ON CONFLICT DO NOTHING;

-- Email for: Malarndirri McCarthy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Malarndirri McCarthy'), 'email'::ContactChannelType, 'Senator.McCarthy@aph.gov.au', 'Senator.McCarthy@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Malarndirri McCarthy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Malarndirri McCarthy'), 'office_address'::ContactChannelType, '38 Mitchell Street, Darwin NT 0800', '38 Mitchell Street, Darwin NT 0800', '38 Mitchell Street, Darwin NT 0800', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jacinta Nampijinpa Price
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jacinta Nampijinpa Price'), 'phone'::ContactChannelType, '(08) 8948 3555', '(08) 8948 3555', '0889483555')
ON CONFLICT DO NOTHING;

-- Email for: Jacinta Nampijinpa Price
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jacinta Nampijinpa Price'), 'email'::ContactChannelType, 'senator.nampijinpaprice@aph.gov.au', 'senator.nampijinpaprice@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Jacinta Nampijinpa Price
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jacinta Nampijinpa Price'), 'office_address'::ContactChannelType, '1, 229 McMillans Road, Jingili NT 0810', '1, 229 McMillans Road, Jingili NT 0810', '1, 229 McMillans Road, Jingili NT 0810', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Penny Allman-Payne
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Penny Allman-Payne'), 'phone'::ContactChannelType, '(07) 4972 0380', '(07) 4972 0380', '0749720380')
ON CONFLICT DO NOTHING;

-- Email for: Penny Allman-Payne
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Penny Allman-Payne'), 'email'::ContactChannelType, 'senator.allman-payne@aph.gov.au', 'senator.allman-payne@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Penny Allman-Payne
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Penny Allman-Payne'), 'office_address'::ContactChannelType, '20-22 Herbert Street, Gladstone QLD 4680', '20-22 Herbert Street, Gladstone QLD 4680', '20-22 Herbert Street, Gladstone QLD 4680', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Matthew Canavan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matthew Canavan'), 'phone'::ContactChannelType, '(07) 4927 2003', '(07) 4927 2003', '0749272003')
ON CONFLICT DO NOTHING;

-- Email for: Matthew Canavan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matthew Canavan'), 'email'::ContactChannelType, 'senator.canavan@aph.gov.au', 'senator.canavan@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Matthew Canavan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matthew Canavan'), 'office_address'::ContactChannelType, 'Ground Floor, 34 East Street, Rockhampton QLD 4700', 'Ground Floor, 34 East Street, Rockhampton QLD 4700', 'Ground Floor, 34 East Street, Rockhampton QLD 4700', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Anthony Chisholm
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anthony Chisholm'), 'phone'::ContactChannelType, '(07) 3881 3710', '(07) 3881 3710', '0738813710')
ON CONFLICT DO NOTHING;

-- Email for: Anthony Chisholm
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anthony Chisholm'), 'email'::ContactChannelType, 'senator.chisholm@aph.gov.au', 'senator.chisholm@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Anthony Chisholm
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anthony Chisholm'), 'office_address'::ContactChannelType, 'Level 1, 53 Endeavour Boulevard, North Lakes QLD 4509', 'Level 1, 53 Endeavour Boulevard, North Lakes QLD 4509', 'Level 1, 53 Endeavour Boulevard, North Lakes QLD 4509', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Nita Green
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nita Green'), 'phone'::ContactChannelType, '(07) 4031 3498', '(07) 4031 3498', '0740313498')
ON CONFLICT DO NOTHING;

-- Email for: Nita Green
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nita Green'), 'email'::ContactChannelType, 'senator.green@aph.gov.au', 'senator.green@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Nita Green
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nita Green'), 'office_address'::ContactChannelType, 'Shop 2, 141-143 Abbott Street, Cairns QLD 4870', 'Shop 2, 141-143 Abbott Street, Cairns QLD 4870', 'Shop 2, 141-143 Abbott Street, Cairns QLD 4870', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Pauline Hanson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pauline Hanson'), 'phone'::ContactChannelType, '(07) 3221 7644', '(07) 3221 7644', '0732217644')
ON CONFLICT DO NOTHING;

-- Email for: Pauline Hanson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pauline Hanson'), 'email'::ContactChannelType, 'senator.hanson@aph.gov.au', 'senator.hanson@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Pauline Hanson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pauline Hanson'), 'office_address'::ContactChannelType, 'Suite 3, Level 36, Waterfront Place, 1 Eagle Street, Brisbane QLD 4000', 'Suite 3, Level 36, Waterfront Place, 1 Eagle Street, Brisbane QLD 4000', 'Suite 3, Level 36, Waterfront Place, 1 Eagle Street, Brisbane QLD 4000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: James McGrath
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James McGrath'), 'phone'::ContactChannelType, '(07) 5441 1800', '(07) 5441 1800', '0754411800')
ON CONFLICT DO NOTHING;

-- Email for: James McGrath
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James McGrath'), 'email'::ContactChannelType, 'senator.mcgrath@aph.gov.au', 'senator.mcgrath@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: James McGrath
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James McGrath'), 'office_address'::ContactChannelType, 'Tenancy A 2-4 Mitchell Street, Nambour QLD 4560', 'Tenancy A 2-4 Mitchell Street, Nambour QLD 4560', 'Tenancy A 2-4 Mitchell Street, Nambour QLD 4560', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Susan McDonald
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Susan McDonald'), 'phone'::ContactChannelType, '(07) 4771 3066', '(07) 4771 3066', '0747713066')
ON CONFLICT DO NOTHING;

-- Email for: Susan McDonald
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Susan McDonald'), 'email'::ContactChannelType, 'senator.mcdonald@aph.gov.au', 'senator.mcdonald@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Susan McDonald
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Susan McDonald'), 'office_address'::ContactChannelType, 'Suite 3, 520 Flinders Street, Townsville QLD 4810', 'Suite 3, 520 Flinders Street, Townsville QLD 4810', 'Suite 3, 520 Flinders Street, Townsville QLD 4810', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Malcolm Roberts
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Malcolm Roberts'), 'phone'::ContactChannelType, '(07) 3221 9099', '(07) 3221 9099', '0732219099')
ON CONFLICT DO NOTHING;

-- Email for: Malcolm Roberts
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Malcolm Roberts'), 'email'::ContactChannelType, 'senator.roberts@aph.gov.au', 'senator.roberts@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Malcolm Roberts
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Malcolm Roberts'), 'office_address'::ContactChannelType, 'Commonwealth Parliament Offices Suite 2, Level 36, Waterfront Place, 1 Eagle Street, Brisbane QLD 4000', 'Commonwealth Parliament Offices Suite 2, Level 36, Waterfront Place, 1 Eagle Street, Brisbane QLD 4000', 'Commonwealth Parliament Offices Suite 2, Level 36, Waterfront Place, 1 Eagle Street, Brisbane QLD 4000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Paul Scarr
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paul Scarr'), 'phone'::ContactChannelType, '(07) 3186 9350', '(07) 3186 9350', '0731869350')
ON CONFLICT DO NOTHING;

-- Email for: Paul Scarr
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paul Scarr'), 'email'::ContactChannelType, 'senator.scarr@aph.gov.au', 'senator.scarr@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Paul Scarr
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paul Scarr'), 'office_address'::ContactChannelType, 'Tenancy 3, Level 6, Springfield Tower, 145 Sinnathamby Boulevard, Springfield Central QLD 4300', 'Tenancy 3, Level 6, Springfield Tower, 145 Sinnathamby Boulevard, Springfield Central QLD 4300', 'Tenancy 3, Level 6, Springfield Tower, 145 Sinnathamby Boulevard, Springfield Central QLD 4300', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Corinne Mulholland
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Corinne Mulholland'), 'phone'::ContactChannelType, '(07) 3252 7101', '(07) 3252 7101', '0732527101')
ON CONFLICT DO NOTHING;

-- Email for: Corinne Mulholland
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Corinne Mulholland'), 'email'::ContactChannelType, 'senator.mulholland@aph.gov.au', 'senator.mulholland@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Corinne Mulholland
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Corinne Mulholland'), 'office_address'::ContactChannelType, 'Level 1, 90 Kittyhawk Drive, Chermside QLD 4032', 'Level 1, 90 Kittyhawk Drive, Chermside QLD 4032', 'Level 1, 90 Kittyhawk Drive, Chermside QLD 4032', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Larissa Waters
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Larissa Waters'), 'phone'::ContactChannelType, '(07) 3367 0566', '(07) 3367 0566', '0733670566')
ON CONFLICT DO NOTHING;

-- Email for: Larissa Waters
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Larissa Waters'), 'email'::ContactChannelType, 'senator.waters@aph.gov.au', 'senator.waters@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Larissa Waters
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Larissa Waters'), 'office_address'::ContactChannelType, 'Level 2, 251 Given Terrace, Paddington QLD 4064', 'Level 2, 251 Given Terrace, Paddington QLD 4064', 'Level 2, 251 Given Terrace, Paddington QLD 4064', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Murray Watt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Murray Watt'), 'phone'::ContactChannelType, '(07) 5531 1033', '(07) 5531 1033', '0755311033')
ON CONFLICT DO NOTHING;

-- Email for: Murray Watt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Murray Watt'), 'email'::ContactChannelType, 'senator.watt@aph.gov.au', 'senator.watt@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Murray Watt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Murray Watt'), 'office_address'::ContactChannelType, 'Suite 29.07, Level 29, 1 Eagle Street, Brisbane QLD 4000', 'Suite 29.07, Level 29, 1 Eagle Street, Brisbane QLD 4000', 'Suite 29.07, Level 29, 1 Eagle Street, Brisbane QLD 4000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Alexander Antic
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Antic'), 'phone'::ContactChannelType, '(08) 8359 0303', '(08) 8359 0303', '0883590303')
ON CONFLICT DO NOTHING;

-- Email for: Alexander Antic
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Antic'), 'email'::ContactChannelType, 'senator.antic@aph.gov.au', 'senator.antic@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Alexander Antic
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexander Antic'), 'office_address'::ContactChannelType, '398 Main North Road, Blair Athol SA 5084', '398 Main North Road, Blair Athol SA 5084', '398 Main North Road, Blair Athol SA 5084', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Leah Blyth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Leah Blyth'), 'phone'::ContactChannelType, '(08) 8354 1644', '(08) 8354 1644', '0883541644')
ON CONFLICT DO NOTHING;

-- Email for: Leah Blyth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Leah Blyth'), 'email'::ContactChannelType, 'senator.blyth@aph.gov.au', 'senator.blyth@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Leah Blyth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Leah Blyth'), 'office_address'::ContactChannelType, '107 Sir Donald Bradman Drive, Hilton SA 5033', '107 Sir Donald Bradman Drive, Hilton SA 5033', '107 Sir Donald Bradman Drive, Hilton SA 5033', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Don Farrell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Don Farrell'), 'phone'::ContactChannelType, '(08) 8231 8400', '(08) 8231 8400', '0882318400')
ON CONFLICT DO NOTHING;

-- Email for: Don Farrell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Don Farrell'), 'email'::ContactChannelType, 'senator.farrell@aph.gov.au', 'senator.farrell@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Don Farrell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Don Farrell'), 'office_address'::ContactChannelType, 'Level 5, 19 Gilles Street, Adelaide SA 5000', 'Level 5, 19 Gilles Street, Adelaide SA 5000', 'Level 5, 19 Gilles Street, Adelaide SA 5000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Karen Grogan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karen Grogan'), 'phone'::ContactChannelType, '(08) 8269 6022', '(08) 8269 6022', '0882696022')
ON CONFLICT DO NOTHING;

-- Email for: Karen Grogan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karen Grogan'), 'email'::ContactChannelType, 'senator.grogan@aph.gov.au', 'senator.grogan@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Karen Grogan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karen Grogan'), 'office_address'::ContactChannelType, '265 Churchill Road, Prospect SA 5082', '265 Churchill Road, Prospect SA 5082', '265 Churchill Road, Prospect SA 5082', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Sarah Hanson-Young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sarah Hanson-Young'), 'phone'::ContactChannelType, '(08) 8227 0425', '(08) 8227 0425', '0882270425')
ON CONFLICT DO NOTHING;

-- Email for: Sarah Hanson-Young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sarah Hanson-Young'), 'email'::ContactChannelType, 'senator.hanson-young@aph.gov.au', 'senator.hanson-young@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Sarah Hanson-Young
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sarah Hanson-Young'), 'office_address'::ContactChannelType, 'Level 7, 147 Pirie Street, Adelaide SA 5000', 'Level 7, 147 Pirie Street, Adelaide SA 5000', 'Level 7, 147 Pirie Street, Adelaide SA 5000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Kerrynne Liddle
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kerrynne Liddle'), 'phone'::ContactChannelType, '(08) 8232 1144', '(08) 8232 1144', '0882321144')
ON CONFLICT DO NOTHING;

-- Email for: Kerrynne Liddle
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kerrynne Liddle'), 'email'::ContactChannelType, 'senator.liddle@aph.gov.au', 'senator.liddle@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Kerrynne Liddle
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kerrynne Liddle'), 'office_address'::ContactChannelType, 'Level 2, 31 Ebenezer Place, Adelaide SA 5000', 'Level 2, 31 Ebenezer Place, Adelaide SA 5000', 'Level 2, 31 Ebenezer Place, Adelaide SA 5000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Andrew McLachlan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrew McLachlan'), 'phone'::ContactChannelType, '(08) 8362 8600', '(08) 8362 8600', '0883628600')
ON CONFLICT DO NOTHING;

-- Email for: Andrew McLachlan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrew McLachlan'), 'email'::ContactChannelType, 'senator.mclachlan@aph.gov.au', 'senator.mclachlan@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Andrew McLachlan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrew McLachlan'), 'office_address'::ContactChannelType, 'Level 1, 97 King William Street, Kent Town SA 5067', 'Level 1, 97 King William Street, Kent Town SA 5067', 'Level 1, 97 King William Street, Kent Town SA 5067', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Barbara Pocock
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Barbara Pocock'), 'phone'::ContactChannelType, '(08) 8272 7575', '(08) 8272 7575', '0882727575')
ON CONFLICT DO NOTHING;

-- Email for: Barbara Pocock
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Barbara Pocock'), 'email'::ContactChannelType, 'senator.barbara.pocock@aph.gov.au', 'senator.barbara.pocock@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Barbara Pocock
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Barbara Pocock'), 'office_address'::ContactChannelType, 'Level 1, 110 King William Road, Goodwood SA 5034', 'Level 1, 110 King William Road, Goodwood SA 5034', 'Level 1, 110 King William Road, Goodwood SA 5034', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Anne Ruston
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anne Ruston'), 'phone'::ContactChannelType, '(08) 8586 6600', '(08) 8586 6600', '0885866600')
ON CONFLICT DO NOTHING;

-- Email for: Anne Ruston
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anne Ruston'), 'email'::ContactChannelType, 'senator.ruston@aph.gov.au', 'senator.ruston@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Anne Ruston
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anne Ruston'), 'office_address'::ContactChannelType, '9 Renmark Avenue, Renmark SA 5341', '9 Renmark Avenue, Renmark SA 5341', '9 Renmark Avenue, Renmark SA 5341', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Marielle Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marielle Smith'), 'phone'::ContactChannelType, '(08) 8340 0444', '(08) 8340 0444', '0883400444')
ON CONFLICT DO NOTHING;

-- Email for: Marielle Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marielle Smith'), 'email'::ContactChannelType, 'senator.marielle.smith@aph.gov.au', 'senator.marielle.smith@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Marielle Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marielle Smith'), 'office_address'::ContactChannelType, 'T1 10 Park Terrace, Bowden SA 5007', 'T1 10 Park Terrace, Bowden SA 5007', 'T1 10 Park Terrace, Bowden SA 5007', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Charlotte Walker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Charlotte Walker'), 'phone'::ContactChannelType, '(08) 8205 1040', '(08) 8205 1040', '0882051040')
ON CONFLICT DO NOTHING;

-- Email for: Charlotte Walker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Charlotte Walker'), 'email'::ContactChannelType, 'senator.walker@aph.gov.au', 'senator.walker@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Charlotte Walker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Charlotte Walker'), 'office_address'::ContactChannelType, 'Commonwealth Parliament Offices, Level 27, Festival Tower, Station Road, Adelaide SA 5000', 'Commonwealth Parliament Offices, Level 27, Festival Tower, Station Road, Adelaide SA 5000', 'Commonwealth Parliament Offices, Level 27, Festival Tower, Station Road, Adelaide SA 5000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Penny Wong
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Penny Wong'), 'phone'::ContactChannelType, '(08) 8212 8272', '(08) 8212 8272', '0882128272')
ON CONFLICT DO NOTHING;

-- Email for: Penny Wong
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Penny Wong'), 'email'::ContactChannelType, 'senator.wong@aph.gov.au', 'senator.wong@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Penny Wong
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Penny Wong'), 'office_address'::ContactChannelType, 'Level 4, 19 Gouger Street, Adelaide SA 5000', 'Level 4, 19 Gouger Street, Adelaide SA 5000', 'Level 4, 19 Gouger Street, Adelaide SA 5000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Wendy Askew
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wendy Askew'), 'phone'::ContactChannelType, '(03) 6331 8501', '(03) 6331 8501', '0363318501')
ON CONFLICT DO NOTHING;

-- Email for: Wendy Askew
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wendy Askew'), 'email'::ContactChannelType, 'senator.askew@aph.gov.au', 'senator.askew@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Wendy Askew
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wendy Askew'), 'office_address'::ContactChannelType, '46 Cameron Street, Launceston TAS 7250', '46 Cameron Street, Launceston TAS 7250', '46 Cameron Street, Launceston TAS 7250', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Carol Brown
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carol Brown'), 'phone'::ContactChannelType, '(03) 6231 0099', '(03) 6231 0099', '0362310099')
ON CONFLICT DO NOTHING;

-- Email for: Carol Brown
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carol Brown'), 'email'::ContactChannelType, 'senator.carol.brown@aph.gov.au', 'senator.carol.brown@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Carol Brown
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carol Brown'), 'office_address'::ContactChannelType, '1st Floor, 136 Davey Street, Hobart TAS 7000', '1st Floor, 136 Davey Street, Hobart TAS 7000', '1st Floor, 136 Davey Street, Hobart TAS 7000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Claire Chandler
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Claire Chandler'), 'phone'::ContactChannelType, '(03) 6260 2018', '(03) 6260 2018', '0362602018')
ON CONFLICT DO NOTHING;

-- Email for: Claire Chandler
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Claire Chandler'), 'email'::ContactChannelType, 'senator.chandler@aph.gov.au', 'senator.chandler@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Claire Chandler
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Claire Chandler'), 'office_address'::ContactChannelType, '45 Bridge Street, Richmond TAS 7025', '45 Bridge Street, Richmond TAS 7025', '45 Bridge Street, Richmond TAS 7025', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Richard Colbeck
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Colbeck'), 'phone'::ContactChannelType, '(03) 6424 5960', '(03) 6424 5960', '0364245960')
ON CONFLICT DO NOTHING;

-- Email for: Richard Colbeck
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Colbeck'), 'email'::ContactChannelType, 'senator.colbeck@aph.gov.au', 'senator.colbeck@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Richard Colbeck
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Colbeck'), 'office_address'::ContactChannelType, '5-7 Best Street, Devonport TAS 7310', '5-7 Best Street, Devonport TAS 7310', '5-7 Best Street, Devonport TAS 7310', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Josh Dolega
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Josh Dolega'), 'phone'::ContactChannelType, '(03) 6423 1933', '(03) 6423 1933', '0364231933')
ON CONFLICT DO NOTHING;

-- Email for: Josh Dolega
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Josh Dolega'), 'email'::ContactChannelType, 'senator.dolega@aph.gov.au', 'senator.dolega@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Josh Dolega
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Josh Dolega'), 'office_address'::ContactChannelType, '1-3 Rooke Street, Devonport TAS 7310', '1-3 Rooke Street, Devonport TAS 7310', '1-3 Rooke Street, Devonport TAS 7310', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Richard Dowling
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Dowling'), 'phone'::ContactChannelType, '(03) 6229 4444', '(03) 6229 4444', '0362294444')
ON CONFLICT DO NOTHING;

-- Email for: Richard Dowling
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Dowling'), 'email'::ContactChannelType, 'senator.dowling@aph.gov.au', 'senator.dowling@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Richard Dowling
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Dowling'), 'office_address'::ContactChannelType, 'Shop 3, Kingston Plaza, 20 Channel Highway, Kingston TAS 7050', 'Shop 3, Kingston Plaza, 20 Channel Highway, Kingston TAS 7050', 'Shop 3, Kingston Plaza, 20 Channel Highway, Kingston TAS 7050', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jonathon Duniam
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jonathon Duniam'), 'phone'::ContactChannelType, '(03) 6231 2444', '(03) 6231 2444', '0362312444')
ON CONFLICT DO NOTHING;

-- Email for: Jonathon Duniam
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jonathon Duniam'), 'email'::ContactChannelType, 'senator.duniam@aph.gov.au', 'senator.duniam@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Jonathon Duniam
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jonathon Duniam'), 'office_address'::ContactChannelType, '85 Macquarie Street, Hobart TAS 7000', '85 Macquarie Street, Hobart TAS 7000', '85 Macquarie Street, Hobart TAS 7000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jacqui Lambie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jacqui Lambie'), 'phone'::ContactChannelType, '(03) 6431 3112', '(03) 6431 3112', '0364313112')
ON CONFLICT DO NOTHING;

-- Email for: Jacqui Lambie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jacqui Lambie'), 'email'::ContactChannelType, 'senator.lambie@aph.gov.au', 'senator.lambie@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Jacqui Lambie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jacqui Lambie'), 'office_address'::ContactChannelType, 'Shop 4, 22 Mount Street, Burnie TAS 7320', 'Shop 4, 22 Mount Street, Burnie TAS 7320', 'Shop 4, 22 Mount Street, Burnie TAS 7320', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Nick McKim
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nick McKim'), 'phone'::ContactChannelType, '(03) 6224 8899', '(03) 6224 8899', '0362248899')
ON CONFLICT DO NOTHING;

-- Email for: Nick McKim
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nick McKim'), 'email'::ContactChannelType, 'senator.mckim@aph.gov.au', 'senator.mckim@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Nick McKim
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nick McKim'), 'office_address'::ContactChannelType, '149B Macquarie Street, Hobart TAS 7000', '149B Macquarie Street, Hobart TAS 7000', '149B Macquarie Street, Hobart TAS 7000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Helen Polley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Helen Polley'), 'phone'::ContactChannelType, '(03) 6331 2599', '(03) 6331 2599', '0363312599')
ON CONFLICT DO NOTHING;

-- Email for: Helen Polley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Helen Polley'), 'email'::ContactChannelType, 'senator.polley@aph.gov.au', 'senator.polley@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Helen Polley
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Helen Polley'), 'office_address'::ContactChannelType, 'The Charles, Suite 101, 287 Charles Street, Launceston TAS 7250', 'The Charles, Suite 101, 287 Charles Street, Launceston TAS 7250', 'The Charles, Suite 101, 287 Charles Street, Launceston TAS 7250', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tammy Tyrrell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tammy Tyrrell'), 'phone'::ContactChannelType, '(03) 9070 1910', '(03) 9070 1910', '0390701910')
ON CONFLICT DO NOTHING;

-- Email for: Tammy Tyrrell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tammy Tyrrell'), 'email'::ContactChannelType, 'senator.tyrrell@aph.gov.au', 'senator.tyrrell@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Tammy Tyrrell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tammy Tyrrell'), 'office_address'::ContactChannelType, 'Shop 2, 111-113 St John Street, Launceston TAS 7250', 'Shop 2, 111-113 St John Street, Launceston TAS 7250', 'Shop 2, 111-113 St John Street, Launceston TAS 7250', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Peter Whish-Wilson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Peter Whish-Wilson'), 'phone'::ContactChannelType, '(03) 6331 0033', '(03) 6331 0033', '0363310033')
ON CONFLICT DO NOTHING;

-- Email for: Peter Whish-Wilson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Peter Whish-Wilson'), 'email'::ContactChannelType, 'senator.whish-wilson@aph.gov.au', 'senator.whish-wilson@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Peter Whish-Wilson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Peter Whish-Wilson'), 'office_address'::ContactChannelType, '37 George Street, Launceston TAS 7250', '37 George Street, Launceston TAS 7250', '37 George Street, Launceston TAS 7250', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Michelle Ananda-Rajah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michelle Ananda-Rajah'), 'phone'::ContactChannelType, '(03) 9822 4422', '(03) 9822 4422', '0398224422')
ON CONFLICT DO NOTHING;

-- Email for: Michelle Ananda-Rajah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michelle Ananda-Rajah'), 'email'::ContactChannelType, 'senator.ananda-rajah@aph.gov.au', 'senator.ananda-rajah@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Michelle Ananda-Rajah
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michelle Ananda-Rajah'), 'office_address'::ContactChannelType, 'Suite 1.03, 261-271 Wattletree Road, Malvern VIC 3144', 'Suite 1.03, 261-271 Wattletree Road, Malvern VIC 3144', 'Suite 1.03, 261-271 Wattletree Road, Malvern VIC 3144', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ralph Babet
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ralph Babet'), 'phone'::ContactChannelType, '(03) 9070 1900', '(03) 9070 1900', '0390701900')
ON CONFLICT DO NOTHING;

-- Email for: Ralph Babet
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ralph Babet'), 'email'::ContactChannelType, 'senator.babet@aph.gov.au', 'senator.babet@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Ralph Babet
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ralph Babet'), 'office_address'::ContactChannelType, 'Suite 2, 77 Victor Crescent, Narre Warren VIC 3805', 'Suite 2, 77 Victor Crescent, Narre Warren VIC 3805', 'Suite 2, 77 Victor Crescent, Narre Warren VIC 3805', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Raffaele Ciccone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raffaele Ciccone'), 'phone'::ContactChannelType, '(03) 9894 2098', '(03) 9894 2098', '0398942098')
ON CONFLICT DO NOTHING;

-- Email for: Raffaele Ciccone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raffaele Ciccone'), 'email'::ContactChannelType, 'senator.ciccone@aph.gov.au', 'senator.ciccone@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Raffaele Ciccone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raffaele Ciccone'), 'office_address'::ContactChannelType, 'Suite 12.01, Level 12, 1 Collins Street, Melbourne VIC 3000', 'Suite 12.01, Level 12, 1 Collins Street, Melbourne VIC 3000', 'Suite 12.01, Level 12, 1 Collins Street, Melbourne VIC 3000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Lisa Darmanin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lisa Darmanin'), 'phone'::ContactChannelType, '(03) 9232 8260', '(03) 9232 8260', '0392328260')
ON CONFLICT DO NOTHING;

-- Email for: Lisa Darmanin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lisa Darmanin'), 'email'::ContactChannelType, 'senator.darmanin@aph.gov.au', 'senator.darmanin@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Lisa Darmanin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lisa Darmanin'), 'office_address'::ContactChannelType, 'Level 3 North, 4 Treasury Place, East Melbourne VIC 3002', 'Level 3 North, 4 Treasury Place, East Melbourne VIC 3002', 'Level 3 North, 4 Treasury Place, East Melbourne VIC 3002', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Steph Hodgins-May
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steph Hodgins-May'), 'phone'::ContactChannelType, '(03) 9381 1446', '(03) 9381 1446', '0393811446')
ON CONFLICT DO NOTHING;

-- Email for: Steph Hodgins-May
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steph Hodgins-May'), 'email'::ContactChannelType, 'senator.hodgins-may@aph.gov.au', 'senator.hodgins-may@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Steph Hodgins-May
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steph Hodgins-May'), 'office_address'::ContactChannelType, '1 Eastbourne Street, Windsor VIC 3181', '1 Eastbourne Street, Windsor VIC 3181', '1 Eastbourne Street, Windsor VIC 3181', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jane Hume
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jane Hume'), 'phone'::ContactChannelType, '(03) 9428 1773', '(03) 9428 1773', '0394281773')
ON CONFLICT DO NOTHING;

-- Email for: Jane Hume
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jane Hume'), 'email'::ContactChannelType, 'senator.hume@aph.gov.au', 'senator.hume@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Jane Hume
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jane Hume'), 'office_address'::ContactChannelType, '223 Bridge Road, Richmond VIC 3121', '223 Bridge Road, Richmond VIC 3121', '223 Bridge Road, Richmond VIC 3121', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Sarah Henderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sarah Henderson'), 'phone'::ContactChannelType, '(03) 5221 5900', '(03) 5221 5900', '0352215900')
ON CONFLICT DO NOTHING;

-- Email for: Sarah Henderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sarah Henderson'), 'email'::ContactChannelType, 'senator.henderson@aph.gov.au', 'senator.henderson@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Sarah Henderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sarah Henderson'), 'office_address'::ContactChannelType, '231-233 Moorabool Street, Geelong VIC 3220', '231-233 Moorabool Street, Geelong VIC 3220', '231-233 Moorabool Street, Geelong VIC 3220', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: James Paterson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James Paterson'), 'phone'::ContactChannelType, '(03) 9690 2201', '(03) 9690 2201', '0396902201')
ON CONFLICT DO NOTHING;

-- Email for: James Paterson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James Paterson'), 'email'::ContactChannelType, 'senator.paterson@aph.gov.au', 'senator.paterson@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: James Paterson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James Paterson'), 'office_address'::ContactChannelType, 'Ground Floor, 63 York Street, South Melbourne VIC 3205', 'Ground Floor, 63 York Street, South Melbourne VIC 3205', 'Ground Floor, 63 York Street, South Melbourne VIC 3205', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Bridget McKenzie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bridget McKenzie'), 'phone'::ContactChannelType, '(02) 6024 2560', '(02) 6024 2560', '0260242560')
ON CONFLICT DO NOTHING;

-- Email for: Bridget McKenzie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bridget McKenzie'), 'email'::ContactChannelType, 'senator.mckenzie@aph.gov.au', 'senator.mckenzie@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Bridget McKenzie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bridget McKenzie'), 'office_address'::ContactChannelType, '172 High Street, Wodonga VIC 3690', '172 High Street, Wodonga VIC 3690', '172 High Street, Wodonga VIC 3690', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jess Walsh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jess Walsh'), 'phone'::ContactChannelType, '(03) 9381 5448', '(03) 9381 5448', '0393815448')
ON CONFLICT DO NOTHING;

-- Email for: Jess Walsh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jess Walsh'), 'email'::ContactChannelType, 'senator.walsh@aph.gov.au', 'senator.walsh@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Jess Walsh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jess Walsh'), 'office_address'::ContactChannelType, '240-250 Lygon Street, Brunswick East VIC 3057', '240-250 Lygon Street, Brunswick East VIC 3057', '240-250 Lygon Street, Brunswick East VIC 3057', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jana Stewart
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jana Stewart'), 'phone'::ContactChannelType, '(03) 9070 1920', '(03) 9070 1920', '0390701920')
ON CONFLICT DO NOTHING;

-- Email for: Jana Stewart
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jana Stewart'), 'email'::ContactChannelType, 'senator.stewart@aph.gov.au', 'senator.stewart@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Jana Stewart
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jana Stewart'), 'office_address'::ContactChannelType, '293 Spring Street, Reservoir VIC 3073', '293 Spring Street, Reservoir VIC 3073', '293 Spring Street, Reservoir VIC 3073', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Lidia Thorpe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lidia Thorpe'), 'phone'::ContactChannelType, '(03) 9070 1950', '(03) 9070 1950', '0390701950')
ON CONFLICT DO NOTHING;

-- Email for: Lidia Thorpe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lidia Thorpe'), 'email'::ContactChannelType, 'senator.thorpe@aph.gov.au', 'senator.thorpe@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Lidia Thorpe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lidia Thorpe'), 'office_address'::ContactChannelType, '474 Smith Street, Collingwood VIC 3066', '474 Smith Street, Collingwood VIC 3066', '474 Smith Street, Collingwood VIC 3066', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Slade Brockman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Slade Brockman'), 'phone'::ContactChannelType, '(08) 6245 3305', '(08) 6245 3305', '0862453305')
ON CONFLICT DO NOTHING;

-- Email for: Slade Brockman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Slade Brockman'), 'email'::ContactChannelType, 'senator.brockman@aph.gov.au', 'senator.brockman@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Slade Brockman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Slade Brockman'), 'office_address'::ContactChannelType, 'Unit 4, 1 Harper Terrace, South Perth WA 6151', 'Unit 4, 1 Harper Terrace, South Perth WA 6151', 'Unit 4, 1 Harper Terrace, South Perth WA 6151', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Michaelia Cash
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michaelia Cash'), 'phone'::ContactChannelType, '(08) 9226 2000', '(08) 9226 2000', '0892262000')
ON CONFLICT DO NOTHING;

-- Email for: Michaelia Cash
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michaelia Cash'), 'email'::ContactChannelType, 'senator.michaelia.cash@aph.gov.au', 'senator.michaelia.cash@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Michaelia Cash
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michaelia Cash'), 'office_address'::ContactChannelType, '44 Outram Street, West Perth WA 6005', '44 Outram Street, West Perth WA 6005', '44 Outram Street, West Perth WA 6005', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Dorinda Cox
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dorinda Cox'), 'phone'::ContactChannelType, '(08) 9228 3277', '(08) 9228 3277', '0892283277')
ON CONFLICT DO NOTHING;

-- Email for: Dorinda Cox
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dorinda Cox'), 'email'::ContactChannelType, 'senator.cox@aph.gov.au', 'senator.cox@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Dorinda Cox
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dorinda Cox'), 'office_address'::ContactChannelType, 'Shop 5, 13 Riseley Street, Ardross WA 6153', 'Shop 5, 13 Riseley Street, Ardross WA 6153', 'Shop 5, 13 Riseley Street, Ardross WA 6153', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Varun Ghosh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Varun Ghosh'), 'phone'::ContactChannelType, '(08) 6245 3323', '(08) 6245 3323', '0862453323')
ON CONFLICT DO NOTHING;

-- Email for: Varun Ghosh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Varun Ghosh'), 'email'::ContactChannelType, 'senator.ghosh@aph.gov.au', 'senator.ghosh@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Varun Ghosh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Varun Ghosh'), 'office_address'::ContactChannelType, 'Tenancy 2, 1195 Hay Street, West Perth WA 6005', 'Tenancy 2, 1195 Hay Street, West Perth WA 6005', 'Tenancy 2, 1195 Hay Street, West Perth WA 6005', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Sue Lines
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sue Lines'), 'phone'::ContactChannelType, '(08) 9481 4844', '(08) 9481 4844', '0894814844')
ON CONFLICT DO NOTHING;

-- Email for: Sue Lines
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sue Lines'), 'email'::ContactChannelType, 'senator.lines@aph.gov.au', 'senator.lines@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Sue Lines
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sue Lines'), 'office_address'::ContactChannelType, '51 Ord Street, West Perth WA 6005', '51 Ord Street, West Perth WA 6005', '51 Ord Street, West Perth WA 6005', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Matt O'Sullivan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matt O''Sullivan'), 'phone'::ContactChannelType, '(08) 9226 5387', '(08) 9226 5387', '0892265387')
ON CONFLICT DO NOTHING;

-- Email for: Matt O'Sullivan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matt O''Sullivan'), 'email'::ContactChannelType, 'senator.matt.o'sullivan@aph.gov.au', 'senator.matt.o'sullivan@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Matt O'Sullivan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matt O''Sullivan'), 'office_address'::ContactChannelType, 'Unit 10, Cockburn Gateway Shopping Centre, 816 Beeliar Drive, Success WA 6164', 'Unit 10, Cockburn Gateway Shopping Centre, 816 Beeliar Drive, Success WA 6164', 'Unit 10, Cockburn Gateway Shopping Centre, 816 Beeliar Drive, Success WA 6164', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Fatima Payman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fatima Payman'), 'phone'::ContactChannelType, '(08) 6245 3322', '(08) 6245 3322', '0862453322')
ON CONFLICT DO NOTHING;

-- Email for: Fatima Payman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fatima Payman'), 'email'::ContactChannelType, 'senator.payman@aph.gov.au', 'senator.payman@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Fatima Payman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fatima Payman'), 'office_address'::ContactChannelType, 'Commonwealth Parliamentary Offices, Level 7, Suite 4 and 5, 1 The Esplanade, Perth WA 6000', 'Commonwealth Parliamentary Offices, Level 7, Suite 4 and 5, 1 The Esplanade, Perth WA 6000', 'Commonwealth Parliamentary Offices, Level 7, Suite 4 and 5, 1 The Esplanade, Perth WA 6000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Dean Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dean Smith'), 'phone'::ContactChannelType, '(08) 9343 4108', '(08) 9343 4108', '0893434108')
ON CONFLICT DO NOTHING;

-- Email for: Dean Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dean Smith'), 'email'::ContactChannelType, 'senator.smith@aph.gov.au', 'senator.smith@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Dean Smith
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dean Smith'), 'office_address'::ContactChannelType, 'Unit 2, 91-97 Wanneroo Road, Greenwood WA 6024', 'Unit 2, 91-97 Wanneroo Road, Greenwood WA 6024', 'Unit 2, 91-97 Wanneroo Road, Greenwood WA 6024', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Glenn Sterle
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Glenn Sterle'), 'phone'::ContactChannelType, '(08) 9455 1420', '(08) 9455 1420', '0894551420')
ON CONFLICT DO NOTHING;

-- Email for: Glenn Sterle
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Glenn Sterle'), 'email'::ContactChannelType, 'senator.sterle@aph.gov.au', 'senator.sterle@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Glenn Sterle
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Glenn Sterle'), 'office_address'::ContactChannelType, 'Units G2 and G3, 150-152 Riseley Street, Booragoon WA 6154', 'Units G2 and G3, 150-152 Riseley Street, Booragoon WA 6154', 'Units G2 and G3, 150-152 Riseley Street, Booragoon WA 6154', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jordon Steele-John
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jordon Steele-John'), 'phone'::ContactChannelType, '(08) 6245 3310', '(08) 6245 3310', '0862453310')
ON CONFLICT DO NOTHING;

-- Email for: Jordon Steele-John
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jordon Steele-John'), 'email'::ContactChannelType, 'senator.steele-john@aph.gov.au', 'senator.steele-john@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Jordon Steele-John
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jordon Steele-John'), 'office_address'::ContactChannelType, 'Office 1.19, Level 1, 140 William Street, Perth WA 6000', 'Office 1.19, Level 1, 140 William Street, Perth WA 6000', 'Office 1.19, Level 1, 140 William Street, Perth WA 6000', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Ellie Whiteaker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ellie Whiteaker'), 'phone'::ContactChannelType, '(08) 9277 1502', '(08) 9277 1502', '0892771502')
ON CONFLICT DO NOTHING;

-- Email for: Ellie Whiteaker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ellie Whiteaker'), 'email'::ContactChannelType, 'senator.whiteaker@aph.gov.au', 'senator.whiteaker@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Ellie Whiteaker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ellie Whiteaker'), 'office_address'::ContactChannelType, '183 Great Eastern Highway, Belmont WA 6104', '183 Great Eastern Highway, Belmont WA 6104', '183 Great Eastern Highway, Belmont WA 6104', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Tyron Whitten
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tyron Whitten'), 'phone'::ContactChannelType, '(08) 9477 5411', '(08) 9477 5411', '0894775411')
ON CONFLICT DO NOTHING;

-- Email for: Tyron Whitten
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tyron Whitten'), 'email'::ContactChannelType, 'senator.whitten@aph.gov.au', 'senator.whitten@aph.gov.au')
ON CONFLICT DO NOTHING;

-- Address for: Tyron Whitten
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tyron Whitten'), 'office_address'::ContactChannelType, 'Suite C, 117 Great Eastern Highway, Rivervale WA 6103', 'Suite C, 117 Great Eastern Highway, Rivervale WA 6103', 'Suite C, 117 Great Eastern Highway, Rivervale WA 6103', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mark Carney
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Carney'), 'phone'::ContactChannelType, '613-996-0047', '613-996-0047', '6139960047')
ON CONFLICT DO NOTHING;

-- Email for: Mark Carney
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Carney'), 'email'::ContactChannelType, 'mark.carney@parl.gc.ca', 'mark.carney@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Address for: Mark Carney
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Carney'), 'office_address'::ContactChannelType, 'Langevin Block, 80 Wellington Street, Ottawa, ON K1A 0A2', 'Langevin Block, 80 Wellington Street, Ottawa, ON K1A 0A2', 'Langevin Block, 80 Wellington Street, Ottawa, ON K1A 0A2', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Mark Carney
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Carney'), 'phone'::ContactChannelType, '613-996-0047', '613-996-0047', '6139960047')
ON CONFLICT DO NOTHING;

-- Email for: Mark Carney
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mark Carney'), 'email'::ContactChannelType, 'mark.carney@parl.gc.ca', 'mark.carney@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Chrystia Freeland
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chrystia Freeland'), 'phone'::ContactChannelType, '613-995-0833', '613-995-0833', '6139950833')
ON CONFLICT DO NOTHING;

-- Email for: Chrystia Freeland
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chrystia Freeland'), 'email'::ContactChannelType, 'chrystia.freeland@parl.gc.ca', 'chrystia.freeland@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Dominic LeBlanc
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dominic LeBlanc'), 'phone'::ContactChannelType, '613-996-0050', '613-996-0050', '6139960050')
ON CONFLICT DO NOTHING;

-- Email for: Dominic LeBlanc
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dominic LeBlanc'), 'email'::ContactChannelType, 'dominic.leblanc@parl.gc.ca', 'dominic.leblanc@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Arif Virani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Arif Virani'), 'phone'::ContactChannelType, '613-995-9920', '613-995-9920', '6139959920')
ON CONFLICT DO NOTHING;

-- Email for: Arif Virani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Arif Virani'), 'email'::ContactChannelType, 'arif.virani@parl.gc.ca', 'arif.virani@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Karina Gould
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karina Gould'), 'phone'::ContactChannelType, '613-995-8847', '613-995-8847', '6139958847')
ON CONFLICT DO NOTHING;

-- Email for: Karina Gould
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Karina Gould'), 'email'::ContactChannelType, 'karina.gould@parl.gc.ca', 'karina.gould@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Sean Fraser
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sean Fraser'), 'phone'::ContactChannelType, '613-995-2839', '613-995-2839', '6139952839')
ON CONFLICT DO NOTHING;

-- Email for: Sean Fraser
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sean Fraser'), 'email'::ContactChannelType, 'sean.fraser@parl.gc.ca', 'sean.fraser@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Harjit Sajjan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Harjit Sajjan'), 'phone'::ContactChannelType, '613-995-8887', '613-995-8887', '6139958887')
ON CONFLICT DO NOTHING;

-- Email for: Harjit Sajjan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Harjit Sajjan'), 'email'::ContactChannelType, 'harjit.sajjan@parl.gc.ca', 'harjit.sajjan@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Andy Fillmore
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andy Fillmore'), 'phone'::ContactChannelType, '613-995-9900', '613-995-9900', '6139959900')
ON CONFLICT DO NOTHING;

-- Email for: Andy Fillmore
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andy Fillmore'), 'email'::ContactChannelType, 'andy.fillmore@parl.gc.ca', 'andy.fillmore@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Randeep Sarai
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Randeep Sarai'), 'phone'::ContactChannelType, '613-995-8767', '613-995-8767', '6139958767')
ON CONFLICT DO NOTHING;

-- Email for: Randeep Sarai
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Randeep Sarai'), 'email'::ContactChannelType, 'randeep.sarai@parl.gc.ca', 'randeep.sarai@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Salma Zahid
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salma Zahid'), 'phone'::ContactChannelType, '613-995-8999', '613-995-8999', '6139958999')
ON CONFLICT DO NOTHING;

-- Email for: Salma Zahid
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salma Zahid'), 'email'::ContactChannelType, 'salma.zahid@parl.gc.ca', 'salma.zahid@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Marie-France Lalonde
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marie-France Lalonde'), 'phone'::ContactChannelType, '613-996-8800', '613-996-8800', '6139968800')
ON CONFLICT DO NOTHING;

-- Email for: Marie-France Lalonde
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marie-France Lalonde'), 'email'::ContactChannelType, 'marie-france.lalonde@parl.gc.ca', 'marie-france.lalonde@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Filomena Tassi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Filomena Tassi'), 'phone'::ContactChannelType, '613-995-7890', '613-995-7890', '6139957890')
ON CONFLICT DO NOTHING;

-- Email for: Filomena Tassi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Filomena Tassi'), 'email'::ContactChannelType, 'filomena.tassi@parl.gc.ca', 'filomena.tassi@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Adam van Koeverden
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adam van Koeverden'), 'phone'::ContactChannelType, '613-992-3456', '613-992-3456', '6139923456')
ON CONFLICT DO NOTHING;

-- Email for: Adam van Koeverden
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adam van Koeverden'), 'email'::ContactChannelType, 'adam.van.koeverden@parl.gc.ca', 'adam.van.koeverden@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Pierre Poilievre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pierre Poilievre'), 'phone'::ContactChannelType, '613-996-2345', '613-996-2345', '6139962345')
ON CONFLICT DO NOTHING;

-- Email for: Pierre Poilievre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pierre Poilievre'), 'email'::ContactChannelType, 'pierre.poilievre@parl.gc.ca', 'pierre.poilievre@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Michelle Rempel Garner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michelle Rempel Garner'), 'phone'::ContactChannelType, '613-996-5678', '613-996-5678', '6139965678')
ON CONFLICT DO NOTHING;

-- Email for: Michelle Rempel Garner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michelle Rempel Garner'), 'email'::ContactChannelType, 'michelle.rempel.garner@parl.gc.ca', 'michelle.rempel.garner@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Luc Berthold
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luc Berthold'), 'phone'::ContactChannelType, '613-992-1111', '613-992-1111', '6139921111')
ON CONFLICT DO NOTHING;

-- Email for: Luc Berthold
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luc Berthold'), 'email'::ContactChannelType, 'luc.berthold@parl.gc.ca', 'luc.berthold@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Leslyn Lewis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Leslyn Lewis'), 'phone'::ContactChannelType, '613-996-1234', '613-996-1234', '6139961234')
ON CONFLICT DO NOTHING;

-- Email for: Leslyn Lewis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Leslyn Lewis'), 'email'::ContactChannelType, 'leslyn.lewis@parl.gc.ca', 'leslyn.lewis@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: John Brassard
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Brassard'), 'phone'::ContactChannelType, '613-996-5432', '613-996-5432', '6139965432')
ON CONFLICT DO NOTHING;

-- Email for: John Brassard
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Brassard'), 'email'::ContactChannelType, 'john.brassard@parl.gc.ca', 'john.brassard@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Melissa Lantsman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Melissa Lantsman'), 'phone'::ContactChannelType, '613-996-4321', '613-996-4321', '6139964321')
ON CONFLICT DO NOTHING;

-- Email for: Melissa Lantsman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Melissa Lantsman'), 'email'::ContactChannelType, 'melissa.lantsman@parl.gc.ca', 'melissa.lantsman@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Jasraj Singh Hallan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jasraj Singh Hallan'), 'phone'::ContactChannelType, '613-996-6789', '613-996-6789', '6139966789')
ON CONFLICT DO NOTHING;

-- Email for: Jasraj Singh Hallan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jasraj Singh Hallan'), 'email'::ContactChannelType, 'jasraj.singh.hallan@parl.gc.ca', 'jasraj.singh.hallan@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Raquel Dancho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raquel Dancho'), 'phone'::ContactChannelType, '613-992-8899', '613-992-8899', '6139928899')
ON CONFLICT DO NOTHING;

-- Email for: Raquel Dancho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raquel Dancho'), 'email'::ContactChannelType, 'raquel.dancho@parl.gc.ca', 'raquel.dancho@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Dan Albas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dan Albas'), 'phone'::ContactChannelType, '613-996-7777', '613-996-7777', '6139967777')
ON CONFLICT DO NOTHING;

-- Email for: Dan Albas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dan Albas'), 'email'::ContactChannelType, 'dan.albas@parl.gc.ca', 'dan.albas@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Alex Ruff
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Ruff'), 'phone'::ContactChannelType, '613-996-3333', '613-996-3333', '6139963333')
ON CONFLICT DO NOTHING;

-- Email for: Alex Ruff
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Ruff'), 'email'::ContactChannelType, 'alex.ruff@parl.gc.ca', 'alex.ruff@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Jagmeet Singh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jagmeet Singh'), 'phone'::ContactChannelType, '613-996-1200', '613-996-1200', '6139961200')
ON CONFLICT DO NOTHING;

-- Email for: Jagmeet Singh
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jagmeet Singh'), 'email'::ContactChannelType, 'jagmeet.singh@parl.gc.ca', 'jagmeet.singh@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Alexandre Boulerice
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexandre Boulerice'), 'phone'::ContactChannelType, '613-996-2100', '613-996-2100', '6139962100')
ON CONFLICT DO NOTHING;

-- Email for: Alexandre Boulerice
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexandre Boulerice'), 'email'::ContactChannelType, 'alexandre.boulerice@parl.gc.ca', 'alexandre.boulerice@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Laurel Collins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Laurel Collins'), 'phone'::ContactChannelType, '613-996-3300', '613-996-3300', '6139963300')
ON CONFLICT DO NOTHING;

-- Email for: Laurel Collins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Laurel Collins'), 'email'::ContactChannelType, 'laurel.collins@parl.gc.ca', 'laurel.collins@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Niki Ashton
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Niki Ashton'), 'phone'::ContactChannelType, '613-996-4400', '613-996-4400', '6139964400')
ON CONFLICT DO NOTHING;

-- Email for: Niki Ashton
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Niki Ashton'), 'email'::ContactChannelType, 'niki.ashton@parl.gc.ca', 'niki.ashton@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Daniel Blaikie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Daniel Blaikie'), 'phone'::ContactChannelType, '613-996-5500', '613-996-5500', '6139965500')
ON CONFLICT DO NOTHING;

-- Email for: Daniel Blaikie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Daniel Blaikie'), 'email'::ContactChannelType, 'daniel.blaikie@parl.gc.ca', 'daniel.blaikie@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Yves-François Blanchet
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yves-François Blanchet'), 'phone'::ContactChannelType, '613-996-6600', '613-996-6600', '6139966600')
ON CONFLICT DO NOTHING;

-- Email for: Yves-François Blanchet
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yves-François Blanchet'), 'email'::ContactChannelType, 'yves-francois.blanchet@parl.gc.ca', 'yves-francois.blanchet@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Alain Therrien
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alain Therrien'), 'phone'::ContactChannelType, '613-996-7700', '613-996-7700', '6139967700')
ON CONFLICT DO NOTHING;

-- Email for: Alain Therrien
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alain Therrien'), 'email'::ContactChannelType, 'alain.therrien@parl.gc.ca', 'alain.therrien@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Elizabeth May
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elizabeth May'), 'phone'::ContactChannelType, '613-996-9900', '613-996-9900', '6139969900')
ON CONFLICT DO NOTHING;

-- Email for: Elizabeth May
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elizabeth May'), 'email'::ContactChannelType, 'elizabeth.may@parl.gc.ca', 'elizabeth.may@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Mike Morrice
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Morrice'), 'phone'::ContactChannelType, '613-992-0987', '613-992-0987', '6139920987')
ON CONFLICT DO NOTHING;

-- Email for: Mike Morrice
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mike Morrice'), 'email'::ContactChannelType, 'mike.morrice@parl.gc.ca', 'mike.morrice@parl.gc.ca')
ON CONFLICT DO NOTHING;

-- Phone for: Ursula von der Leyen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ursula von der Leyen'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Ursula von der Leyen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ursula von der Leyen'), 'email'::ContactChannelType, 'president@ec.europa.eu', 'president@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Ursula von der Leyen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ursula von der Leyen'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Ursula von der Leyen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ursula von der Leyen'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Teresa Ribiera Rodríguez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Teresa Ribiera Rodríguez'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Teresa Ribiera Rodríguez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Teresa Ribiera Rodríguez'), 'email'::ContactChannelType, 'evp@ec.europa.eu', 'evp@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Teresa Ribiera Rodríguez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Teresa Ribiera Rodríguez'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Teresa Ribiera Rodríguez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Teresa Ribiera Rodríguez'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Henna Virkkunen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Henna Virkkunen'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Henna Virkkunen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Henna Virkkunen'), 'email'::ContactChannelType, 'evp@ec.europa.eu', 'evp@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Henna Virkkunen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Henna Virkkunen'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Henna Virkkunen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Henna Virkkunen'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Stéphane Séjourné
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stéphane Séjourné'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Stéphane Séjourné
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stéphane Séjourné'), 'email'::ContactChannelType, 'evp@ec.europa.eu', 'evp@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Stéphane Séjourné
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stéphane Séjourné'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Stéphane Séjourné
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stéphane Séjourné'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Kaja Kallas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kaja Kallas'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Kaja Kallas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kaja Kallas'), 'email'::ContactChannelType, 'hr@ec.europa.eu', 'hr@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Kaja Kallas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kaja Kallas'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Kaja Kallas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kaja Kallas'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Roxana Mînzatu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roxana Mînzatu'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Roxana Mînzatu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roxana Mînzatu'), 'email'::ContactChannelType, 'evp@ec.europa.eu', 'evp@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Roxana Mînzatu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roxana Mînzatu'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Roxana Mînzatu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roxana Mînzatu'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Raffaele Fitto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raffaele Fitto'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Raffaele Fitto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raffaele Fitto'), 'email'::ContactChannelType, 'evp@ec.europa.eu', 'evp@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Raffaele Fitto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raffaele Fitto'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Raffaele Fitto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Raffaele Fitto'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Maroš Šefčovič
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maroš Šefčovič'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Maroš Šefčovič
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maroš Šefčovič'), 'email'::ContactChannelType, 'vp@ec.europa.eu', 'vp@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Maroš Šefčovič
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maroš Šefčovič'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Maroš Šefčovič
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maroš Šefčovič'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Valdis Dombrovskis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Valdis Dombrovskis'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Valdis Dombrovskis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Valdis Dombrovskis'), 'email'::ContactChannelType, 'vp@ec.europa.eu', 'vp@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Valdis Dombrovskis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Valdis Dombrovskis'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Valdis Dombrovskis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Valdis Dombrovskis'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Wopke Hoekstra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wopke Hoekstra'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Wopke Hoekstra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wopke Hoekstra'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Wopke Hoekstra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wopke Hoekstra'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Wopke Hoekstra
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wopke Hoekstra'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Andrius Kubilius
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrius Kubilius'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Andrius Kubilius
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrius Kubilius'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Andrius Kubilius
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrius Kubilius'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Andrius Kubilius
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrius Kubilius'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Marta Kos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marta Kos'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Marta Kos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marta Kos'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Marta Kos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marta Kos'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Marta Kos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marta Kos'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Jozef Síkela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jozef Síkela'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Jozef Síkela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jozef Síkela'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Jozef Síkela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jozef Síkela'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Jozef Síkela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jozef Síkela'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Costas Kadis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Costas Kadis'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Costas Kadis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Costas Kadis'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Costas Kadis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Costas Kadis'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Costas Kadis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Costas Kadis'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Maria Luís Albuquerque
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Luís Albuquerque'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Maria Luís Albuquerque
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Luís Albuquerque'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Maria Luís Albuquerque
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Luís Albuquerque'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Maria Luís Albuquerque
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maria Luís Albuquerque'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Hadja Lahbib
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hadja Lahbib'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Hadja Lahbib
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hadja Lahbib'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Hadja Lahbib
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hadja Lahbib'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Hadja Lahbib
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hadja Lahbib'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Magnus Brunner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Magnus Brunner'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Magnus Brunner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Magnus Brunner'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Magnus Brunner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Magnus Brunner'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Magnus Brunner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Magnus Brunner'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Jessika Roswall
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jessika Roswall'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Jessika Roswall
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jessika Roswall'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Jessika Roswall
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jessika Roswall'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Jessika Roswall
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jessika Roswall'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Piotr Serafin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Piotr Serafin'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Piotr Serafin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Piotr Serafin'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Piotr Serafin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Piotr Serafin'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Piotr Serafin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Piotr Serafin'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Dan Jørgensen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dan Jørgensen'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Dan Jørgensen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dan Jørgensen'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Dan Jørgensen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dan Jørgensen'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Dan Jørgensen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dan Jørgensen'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Ekaterina Zaharieva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ekaterina Zaharieva'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Ekaterina Zaharieva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ekaterina Zaharieva'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Ekaterina Zaharieva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ekaterina Zaharieva'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Ekaterina Zaharieva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ekaterina Zaharieva'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Michael McGrath
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michael McGrath'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Michael McGrath
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michael McGrath'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Michael McGrath
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michael McGrath'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Michael McGrath
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Michael McGrath'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Apostolos Tzitzikostas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Apostolos Tzitzikostas'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Apostolos Tzitzikostas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Apostolos Tzitzikostas'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Apostolos Tzitzikostas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Apostolos Tzitzikostas'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Apostolos Tzitzikostas
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Apostolos Tzitzikostas'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Christophe Hansen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Christophe Hansen'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Christophe Hansen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Christophe Hansen'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Christophe Hansen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Christophe Hansen'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Christophe Hansen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Christophe Hansen'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Glenn Micallef
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Glenn Micallef'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Glenn Micallef
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Glenn Micallef'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Glenn Micallef
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Glenn Micallef'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Glenn Micallef
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Glenn Micallef'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Dubravka Šuica
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dubravka Šuica'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Dubravka Šuica
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dubravka Šuica'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Dubravka Šuica
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dubravka Šuica'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Dubravka Šuica
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dubravka Šuica'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Olivér Várhelyi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Olivér Várhelyi'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Olivér Várhelyi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Olivér Várhelyi'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Olivér Várhelyi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Olivér Várhelyi'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Olivér Várhelyi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Olivér Várhelyi'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Mehmet Şimşek
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Şimşek'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: Mehmet Şimşek
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Şimşek'), 'email'::ContactChannelType, 'commissioner@ec.europa.eu', 'commissioner@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Mehmet Şimşek
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Şimşek'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Mehmet Şimşek
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mehmet Şimşek'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+32-2-284-21111', '+32-2-284-21111', '+32228421111')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@europarl.europa.eu', 'info@europarl.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.europarl.europa.eu', 'https://www.europarl.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Rue Wiertz 60', 'Rue Wiertz 60', 'Rue Wiertz 60', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'phone'::ContactChannelType, '+32-2-284-5686', '+32 2 284 56 86', '+3222845686')
ON CONFLICT DO NOTHING;

-- Email for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'email'::ContactChannelType, 'president@europarl.europa.eu', 'president@europarl.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'website'::ContactChannelType, 'https://www.europarl.europa.eu', 'https://www.europarl.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'office_address'::ContactChannelType, 'Rue Wiertz 60, Room 09B011', 'Rue Wiertz 60, Room 09B011', 'Rue Wiertz 60, Room 09B011', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+32-2-281-6111', '+32 2 281 61 11', '+3222816111')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@consilium.europa.eu', 'info@consilium.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.consilium.europa.eu', 'https://www.consilium.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Rue de la Loi 175', 'Rue de la Loi 175', 'Rue de la Loi 175', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'phone'::ContactChannelType, '+32-2-281-6111', '+32 2 281 61 11', '+3222816111')
ON CONFLICT DO NOTHING;

-- Email for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'email'::ContactChannelType, 'info@european-council.europa.eu', 'info@european-council.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'website'::ContactChannelType, 'https://www.european-council.europa.eu', 'https://www.european-council.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'office_address'::ContactChannelType, 'Rue de la Loi 175', 'Rue de la Loi 175', 'Rue de la Loi 175', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'phone'::ContactChannelType, '+32-2-299-11111', '+32-2-299-11111', '+32229911111')
ON CONFLICT DO NOTHING;

-- Email for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'email'::ContactChannelType, 'info@ec.europa.eu', 'info@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: General Inquiries
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'General Inquiries'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'phone'::ContactChannelType, '+32-2-229-91111', '+32-2-229-91111', '+32222991111')
ON CONFLICT DO NOTHING;

-- Email for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'email'::ContactChannelType, 'president@ec.europa.eu', 'president@ec.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'website'::ContactChannelType, 'https://commission.europa.eu', 'https://commission.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: President's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'President''s Office'), 'office_address'::ContactChannelType, 'Rue de la Loi 200', 'Rue de la Loi 200', 'Rue de la Loi 200', 'Brussels')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+352-4303-1', '+352 43 031', '+35243031')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@curia.europa.eu', 'info@curia.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://curia.europa.eu', 'https://curia.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Rue du Fort Niedergrünewald', 'Rue du Fort Niedergrünewald', 'Rue du Fort Niedergrünewald', 'Luxembourg')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+49-69-1344-0', '+49 69 13440', '+496913440')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@ecb.europa.eu', 'info@ecb.europa.eu')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.ecb.europa.eu', 'https://www.ecb.europa.eu')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Sonnemannstraße 20', 'Sonnemannstraße 20', 'Sonnemannstraße 20', 'Frankfurt am Main')
ON CONFLICT DO NOTHING;

-- Phone for: Giorgia Meloni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giorgia Meloni'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Giorgia Meloni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giorgia Meloni'), 'email'::ContactChannelType, 'MELONI_G@CAMERA.IT', 'MELONI_G@CAMERA.IT')
ON CONFLICT DO NOTHING;

-- Email for: Giorgia Meloni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giorgia Meloni'), 'email'::ContactChannelType, 'presidente@pec.governo.it', 'presidente@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Giorgia Meloni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giorgia Meloni'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Giorgia Meloni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giorgia Meloni'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Antonio Tajani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Antonio Tajani'), 'phone'::ContactChannelType, '+39 (0)6 36911', '+39 06 36911', '+390636911')
ON CONFLICT DO NOTHING;

-- Email for: Antonio Tajani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Antonio Tajani'), 'email'::ContactChannelType, 'gabinetto@esteri.it', 'gabinetto@esteri.it')
ON CONFLICT DO NOTHING;

-- Email for: Antonio Tajani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Antonio Tajani'), 'email'::ContactChannelType, 'gabinetto.ministro@cert.esteri.it', 'gabinetto.ministro@cert.esteri.it')
ON CONFLICT DO NOTHING;

-- Website for: Antonio Tajani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Antonio Tajani'), 'website'::ContactChannelType, 'https://www.esteri.it', 'https://www.esteri.it')
ON CONFLICT DO NOTHING;

-- Address for: Antonio Tajani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Antonio Tajani'), 'office_address'::ContactChannelType, 'Palazzo Farnesina, Via dei Giureconsulti 4', 'Palazzo Farnesina, Via dei Giureconsulti 4', 'Palazzo Farnesina, Via dei Giureconsulti 4', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Matteo Salvini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Salvini'), 'phone'::ContactChannelType, '+39 (0)6 5951-1', '+39 06 59511', '+390659511')
ON CONFLICT DO NOTHING;

-- Email for: Matteo Salvini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Salvini'), 'email'::ContactChannelType, 'gabinetto.vicepresidentesalvini@governo.it', 'gabinetto.vicepresidentesalvini@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Matteo Salvini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Salvini'), 'email'::ContactChannelType, 'gabinetto.vicepresdente.salvini@pec.governo.it', 'gabinetto.vicepresdente.salvini@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Matteo Salvini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Salvini'), 'website'::ContactChannelType, 'https://www.mit.gov.it', 'https://www.mit.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Matteo Salvini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Salvini'), 'office_address'::ContactChannelType, 'Via Giuseppe Verdi 65', 'Via Giuseppe Verdi 65', 'Via Giuseppe Verdi 65', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Matteo Piantedosi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Piantedosi'), 'phone'::ContactChannelType, '+39 (0)6 4664-1', '+39 06 46641', '+390646641')
ON CONFLICT DO NOTHING;

-- Email for: Matteo Piantedosi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Piantedosi'), 'email'::ContactChannelType, 'gabinetto@interno.gov.it', 'gabinetto@interno.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Matteo Piantedosi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Piantedosi'), 'email'::ContactChannelType, 'gabinetto@pec.interno.gov.it', 'gabinetto@pec.interno.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Matteo Piantedosi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Piantedosi'), 'website'::ContactChannelType, 'https://www.interno.gov.it', 'https://www.interno.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Matteo Piantedosi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Matteo Piantedosi'), 'office_address'::ContactChannelType, 'Piazza del Viminale 1', 'Piazza del Viminale 1', 'Piazza del Viminale 1', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Carlo Nordio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carlo Nordio'), 'phone'::ContactChannelType, '+39 (0)6 6857-1', '+39 06 68571', '+390668571')
ON CONFLICT DO NOTHING;

-- Email for: Carlo Nordio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carlo Nordio'), 'email'::ContactChannelType, 'gabinetto.ministro@giustizia.it', 'gabinetto.ministro@giustizia.it')
ON CONFLICT DO NOTHING;

-- Email for: Carlo Nordio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carlo Nordio'), 'email'::ContactChannelType, 'gabinetto.ministro@pec.giustizia.it', 'gabinetto.ministro@pec.giustizia.it')
ON CONFLICT DO NOTHING;

-- Website for: Carlo Nordio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carlo Nordio'), 'website'::ContactChannelType, 'https://www.giustizia.it', 'https://www.giustizia.it')
ON CONFLICT DO NOTHING;

-- Address for: Carlo Nordio
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carlo Nordio'), 'office_address'::ContactChannelType, 'Via Arenula 70', 'Via Arenula 70', 'Via Arenula 70', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Guido Crosetto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guido Crosetto'), 'phone'::ContactChannelType, '+39 (0)6 4880-1', '+39 06 48801', '+390648801')
ON CONFLICT DO NOTHING;

-- Email for: Guido Crosetto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guido Crosetto'), 'email'::ContactChannelType, 'gabinetto@difesa.it', 'gabinetto@difesa.it')
ON CONFLICT DO NOTHING;

-- Email for: Guido Crosetto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guido Crosetto'), 'email'::ContactChannelType, 'gabinetto@pec.difesa.it', 'gabinetto@pec.difesa.it')
ON CONFLICT DO NOTHING;

-- Website for: Guido Crosetto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guido Crosetto'), 'website'::ContactChannelType, 'https://www.difesa.it', 'https://www.difesa.it')
ON CONFLICT DO NOTHING;

-- Address for: Guido Crosetto
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guido Crosetto'), 'office_address'::ContactChannelType, 'Via XX Settembre 8', 'Via XX Settembre 8', 'Via XX Settembre 8', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Giancarlo Giorgetti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giancarlo Giorgetti'), 'phone'::ContactChannelType, '+39 (0)6 4761-1', '+39 06 47611', '+390647611')
ON CONFLICT DO NOTHING;

-- Email for: Giancarlo Giorgetti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giancarlo Giorgetti'), 'email'::ContactChannelType, 'gabinetto.ministro@mef.gov.it', 'gabinetto.ministro@mef.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Giancarlo Giorgetti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giancarlo Giorgetti'), 'email'::ContactChannelType, 'gabinetto.ministro@pec.mef.gov.it', 'gabinetto.ministro@pec.mef.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Giancarlo Giorgetti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giancarlo Giorgetti'), 'website'::ContactChannelType, 'https://www.mef.gov.it', 'https://www.mef.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Giancarlo Giorgetti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giancarlo Giorgetti'), 'office_address'::ContactChannelType, 'Via XX Settembre 97', 'Via XX Settembre 97', 'Via XX Settembre 97', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Adolfo Urso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adolfo Urso'), 'phone'::ContactChannelType, '+39 (0)6 4705-1', '+39 06 47051', '+390647051')
ON CONFLICT DO NOTHING;

-- Email for: Adolfo Urso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adolfo Urso'), 'email'::ContactChannelType, 'gabinetto@mimit.gov.it', 'gabinetto@mimit.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Adolfo Urso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adolfo Urso'), 'email'::ContactChannelType, 'gabinetto@pec.mimit.gov.it', 'gabinetto@pec.mimit.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Adolfo Urso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adolfo Urso'), 'website'::ContactChannelType, 'https://www.mimit.gov.it', 'https://www.mimit.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Adolfo Urso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adolfo Urso'), 'office_address'::ContactChannelType, 'Via Molise 2', 'Via Molise 2', 'Via Molise 2', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Francesco Lollobrigida
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Francesco Lollobrigida'), 'phone'::ContactChannelType, '+39 (0)6 4665-1', '+39 06 46651', '+390646651')
ON CONFLICT DO NOTHING;

-- Email for: Francesco Lollobrigida
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Francesco Lollobrigida'), 'email'::ContactChannelType, 'gabinetto.ministro@politicheagricole.it', 'gabinetto.ministro@politicheagricole.it')
ON CONFLICT DO NOTHING;

-- Email for: Francesco Lollobrigida
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Francesco Lollobrigida'), 'email'::ContactChannelType, 'gabinetto.ministro@pec.politicheagricole.it', 'gabinetto.ministro@pec.politicheagricole.it')
ON CONFLICT DO NOTHING;

-- Website for: Francesco Lollobrigida
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Francesco Lollobrigida'), 'website'::ContactChannelType, 'https://www.politicheagricole.it', 'https://www.politicheagricole.it')
ON CONFLICT DO NOTHING;

-- Address for: Francesco Lollobrigida
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Francesco Lollobrigida'), 'office_address'::ContactChannelType, 'Via XX Settembre 20', 'Via XX Settembre 20', 'Via XX Settembre 20', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Gilberto Pichetto Fratin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gilberto Pichetto Fratin'), 'phone'::ContactChannelType, '+39 (0)6 5722-1', '+39 06 57221', '+390657221')
ON CONFLICT DO NOTHING;

-- Email for: Gilberto Pichetto Fratin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gilberto Pichetto Fratin'), 'email'::ContactChannelType, 'gabinetto@mite.gov.it', 'gabinetto@mite.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Gilberto Pichetto Fratin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gilberto Pichetto Fratin'), 'email'::ContactChannelType, 'gabinetto@pec.mite.gov.it', 'gabinetto@pec.mite.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Gilberto Pichetto Fratin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gilberto Pichetto Fratin'), 'website'::ContactChannelType, 'https://www.mite.gov.it', 'https://www.mite.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Gilberto Pichetto Fratin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gilberto Pichetto Fratin'), 'office_address'::ContactChannelType, 'Via Cristoforo Colombo 44', 'Via Cristoforo Colombo 44', 'Via Cristoforo Colombo 44', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Marina Elvira Calderone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marina Elvira Calderone'), 'phone'::ContactChannelType, '+39 (0)6 4665-2', '+39 06 46652', '+390646652')
ON CONFLICT DO NOTHING;

-- Email for: Marina Elvira Calderone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marina Elvira Calderone'), 'email'::ContactChannelType, 'gabinetto.ministro@lavoro.gov.it', 'gabinetto.ministro@lavoro.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Marina Elvira Calderone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marina Elvira Calderone'), 'email'::ContactChannelType, 'gabinetto.ministro@pec.lavoro.gov.it', 'gabinetto.ministro@pec.lavoro.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Marina Elvira Calderone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marina Elvira Calderone'), 'website'::ContactChannelType, 'https://www.lavoro.gov.it', 'https://www.lavoro.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Marina Elvira Calderone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marina Elvira Calderone'), 'office_address'::ContactChannelType, 'Via Flavia 6', 'Via Flavia 6', 'Via Flavia 6', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Giuseppe Valditara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giuseppe Valditara'), 'phone'::ContactChannelType, '+39 (0)6 5849-1', '+39 06 58491', '+390658491')
ON CONFLICT DO NOTHING;

-- Email for: Giuseppe Valditara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giuseppe Valditara'), 'email'::ContactChannelType, 'gabinetto@istruzione.it', 'gabinetto@istruzione.it')
ON CONFLICT DO NOTHING;

-- Email for: Giuseppe Valditara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giuseppe Valditara'), 'email'::ContactChannelType, 'gabinetto@pec.istruzione.it', 'gabinetto@pec.istruzione.it')
ON CONFLICT DO NOTHING;

-- Website for: Giuseppe Valditara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giuseppe Valditara'), 'website'::ContactChannelType, 'https://www.miur.gov.it', 'https://www.miur.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Giuseppe Valditara
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Giuseppe Valditara'), 'office_address'::ContactChannelType, 'Viale Trastevere 76-A', 'Viale Trastevere 76-A', 'Viale Trastevere 76-A', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Anna Maria Bernini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anna Maria Bernini'), 'phone'::ContactChannelType, '+39 (0)6 5722-1', '+39 06 57221', '+390657221')
ON CONFLICT DO NOTHING;

-- Email for: Anna Maria Bernini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anna Maria Bernini'), 'email'::ContactChannelType, 'gabinetto.ministro@mur.gov.it', 'gabinetto.ministro@mur.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Anna Maria Bernini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anna Maria Bernini'), 'email'::ContactChannelType, 'gabinetto.ministro@pec.mur.gov.it', 'gabinetto.ministro@pec.mur.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Anna Maria Bernini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anna Maria Bernini'), 'website'::ContactChannelType, 'https://www.mur.gov.it', 'https://www.mur.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Anna Maria Bernini
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Anna Maria Bernini'), 'office_address'::ContactChannelType, 'Piazza Kennedy 20', 'Piazza Kennedy 20', 'Piazza Kennedy 20', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Alessandro Giuli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandro Giuli'), 'phone'::ContactChannelType, '+39 (0)6 67231-1', '+39 06 672311', '+3906672311')
ON CONFLICT DO NOTHING;

-- Email for: Alessandro Giuli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandro Giuli'), 'email'::ContactChannelType, 'gabinetto.ministro@beniculturali.it', 'gabinetto.ministro@beniculturali.it')
ON CONFLICT DO NOTHING;

-- Email for: Alessandro Giuli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandro Giuli'), 'email'::ContactChannelType, 'gabinetto.ministro@pec.beniculturali.it', 'gabinetto.ministro@pec.beniculturali.it')
ON CONFLICT DO NOTHING;

-- Website for: Alessandro Giuli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandro Giuli'), 'website'::ContactChannelType, 'https://www.beniculturali.it', 'https://www.beniculturali.it')
ON CONFLICT DO NOTHING;

-- Address for: Alessandro Giuli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandro Giuli'), 'office_address'::ContactChannelType, 'Via del Collegio Romano 27', 'Via del Collegio Romano 27', 'Via del Collegio Romano 27', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Orazio Schillaci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Orazio Schillaci'), 'phone'::ContactChannelType, '+39 (0)6 5994-1', '+39 06 59941', '+390659941')
ON CONFLICT DO NOTHING;

-- Email for: Orazio Schillaci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Orazio Schillaci'), 'email'::ContactChannelType, 'gabinetto.ministro@salute.gov.it', 'gabinetto.ministro@salute.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Orazio Schillaci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Orazio Schillaci'), 'email'::ContactChannelType, 'gabinetto.ministro@pec.salute.gov.it', 'gabinetto.ministro@pec.salute.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Orazio Schillaci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Orazio Schillaci'), 'website'::ContactChannelType, 'https://www.salute.gov.it', 'https://www.salute.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Orazio Schillaci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Orazio Schillaci'), 'office_address'::ContactChannelType, 'Lungotevere Ripa 1', 'Lungotevere Ripa 1', 'Lungotevere Ripa 1', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Daniela Santanchè
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Daniela Santanchè'), 'phone'::ContactChannelType, '+39 (0)6 723031', '+39 06 723031', '+3906723031')
ON CONFLICT DO NOTHING;

-- Email for: Daniela Santanchè
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Daniela Santanchè'), 'email'::ContactChannelType, 'italia.it@ministeroturismo.gov.it', 'italia.it@ministeroturismo.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Daniela Santanchè
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Daniela Santanchè'), 'email'::ContactChannelType, 'gabinetto.ministro@pec.turismo.gov.it', 'gabinetto.ministro@pec.turismo.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Daniela Santanchè
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Daniela Santanchè'), 'website'::ContactChannelType, 'https://www.turismo.gov.it', 'https://www.turismo.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Daniela Santanchè
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Daniela Santanchè'), 'office_address'::ContactChannelType, 'Via della Ferratella in Laterano 51', 'Via della Ferratella in Laterano 51', 'Via della Ferratella in Laterano 51', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Luca Ciriani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luca Ciriani'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Luca Ciriani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luca Ciriani'), 'email'::ContactChannelType, 'segreteria.ss.editoria@governo.it', 'segreteria.ss.editoria@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Luca Ciriani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luca Ciriani'), 'email'::ContactChannelType, 'gabinetto.ciriani@pec.governo.it', 'gabinetto.ciriani@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Luca Ciriani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luca Ciriani'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Luca Ciriani
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luca Ciriani'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Paolo Zangrillo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paolo Zangrillo'), 'phone'::ContactChannelType, '+39 (0)6 8440-1', '+39 06 84401', '+390684401')
ON CONFLICT DO NOTHING;

-- Email for: Paolo Zangrillo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paolo Zangrillo'), 'email'::ContactChannelType, 'gabinetto.ministro@funzionepubblica.gov.it', 'gabinetto.ministro@funzionepubblica.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Paolo Zangrillo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paolo Zangrillo'), 'email'::ContactChannelType, 'gabinetto.ministro@pec.funzionepubblica.gov.it', 'gabinetto.ministro@pec.funzionepubblica.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Paolo Zangrillo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paolo Zangrillo'), 'website'::ContactChannelType, 'https://www.funzionepubblica.gov.it', 'https://www.funzionepubblica.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Paolo Zangrillo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paolo Zangrillo'), 'office_address'::ContactChannelType, 'Via dell''Impresa 8-A', 'Via dell''Impresa 8-A', 'Via dell''Impresa 8-A', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Roberto Calderoli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roberto Calderoli'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Roberto Calderoli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roberto Calderoli'), 'email'::ContactChannelType, 'r.calderoli@governo.it', 'r.calderoli@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Roberto Calderoli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roberto Calderoli'), 'email'::ContactChannelType, 'r.calderoli@pec.governo.it', 'r.calderoli@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Roberto Calderoli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roberto Calderoli'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Roberto Calderoli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Roberto Calderoli'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Nello Musumeci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nello Musumeci'), 'phone'::ContactChannelType, '+39 (0)6 6420-1', '+39 06 64201', '+390664201')
ON CONFLICT DO NOTHING;

-- Email for: Nello Musumeci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nello Musumeci'), 'email'::ContactChannelType, 'gabinetto@protezionecivile.gov.it', 'gabinetto@protezionecivile.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Nello Musumeci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nello Musumeci'), 'email'::ContactChannelType, 'protezionecivile@pec.governo.it', 'protezionecivile@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Nello Musumeci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nello Musumeci'), 'website'::ContactChannelType, 'https://www.protezionecivile.gov.it', 'https://www.protezionecivile.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Nello Musumeci
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nello Musumeci'), 'office_address'::ContactChannelType, 'Via Vitorchiano 2', 'Via Vitorchiano 2', 'Via Vitorchiano 2', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Tommaso Foti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tommaso Foti'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Tommaso Foti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tommaso Foti'), 'email'::ContactChannelType, 't.foti@governo.it', 't.foti@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Tommaso Foti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tommaso Foti'), 'email'::ContactChannelType, 't.foti@pec.governo.it', 't.foti@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Tommaso Foti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tommaso Foti'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Tommaso Foti
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tommaso Foti'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Andrea Abodi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrea Abodi'), 'phone'::ContactChannelType, '+39 (0)6 5694-1', '+39 06 56941', '+390656941')
ON CONFLICT DO NOTHING;

-- Email for: Andrea Abodi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrea Abodi'), 'email'::ContactChannelType, 'gabinetto@sport.gov.it', 'gabinetto@sport.gov.it')
ON CONFLICT DO NOTHING;

-- Email for: Andrea Abodi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrea Abodi'), 'email'::ContactChannelType, 'gabinetto@pec.sport.gov.it', 'gabinetto@pec.sport.gov.it')
ON CONFLICT DO NOTHING;

-- Website for: Andrea Abodi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrea Abodi'), 'website'::ContactChannelType, 'https://www.sport.gov.it', 'https://www.sport.gov.it')
ON CONFLICT DO NOTHING;

-- Address for: Andrea Abodi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andrea Abodi'), 'office_address'::ContactChannelType, 'Largo Lauro Gallo 1', 'Largo Lauro Gallo 1', 'Largo Lauro Gallo 1', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Eugenia Roccella
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Eugenia Roccella'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Eugenia Roccella
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Eugenia Roccella'), 'email'::ContactChannelType, 'e.roccella@governo.it', 'e.roccella@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Eugenia Roccella
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Eugenia Roccella'), 'email'::ContactChannelType, 'e.roccella@pec.governo.it', 'e.roccella@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Eugenia Roccella
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Eugenia Roccella'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Eugenia Roccella
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Eugenia Roccella'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Alessandra Locatelli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandra Locatelli'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Alessandra Locatelli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandra Locatelli'), 'email'::ContactChannelType, 'a.locatelli@governo.it', 'a.locatelli@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Alessandra Locatelli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandra Locatelli'), 'email'::ContactChannelType, 'a.locatelli@pec.governo.it', 'a.locatelli@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Alessandra Locatelli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandra Locatelli'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Alessandra Locatelli
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alessandra Locatelli'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Elisabetta Casellati
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elisabetta Casellati'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Elisabetta Casellati
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elisabetta Casellati'), 'email'::ContactChannelType, 'e.casellati@governo.it', 'e.casellati@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Elisabetta Casellati
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elisabetta Casellati'), 'email'::ContactChannelType, 'e.casellati@pec.governo.it', 'e.casellati@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Elisabetta Casellati
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elisabetta Casellati'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Elisabetta Casellati
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Elisabetta Casellati'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Alfredo Mantovano
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alfredo Mantovano'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Alfredo Mantovano
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alfredo Mantovano'), 'email'::ContactChannelType, 'segrgen@governo.it', 'segrgen@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Alfredo Mantovano
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alfredo Mantovano'), 'email'::ContactChannelType, 'segrgen@pec.governo.it', 'segrgen@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Alfredo Mantovano
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alfredo Mantovano'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Alfredo Mantovano
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alfredo Mantovano'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+39 (0)6 67601', '+39 06 67601', '+390667601')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'segreteria@camera.it', 'segreteria@camera.it')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'segreteria@pec.camera.it', 'segreteria@pec.camera.it')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.camera.it', 'https://www.camera.it')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Piazza Montecitorio', 'Piazza Montecitorio', 'Piazza Montecitorio', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+39 (0)6 67061', '+39 06 67061', '+390667061')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'segreteria.generale@senato.it', 'segreteria.generale@senato.it')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'segreteria.generale@pec.senato.it', 'segreteria.generale@pec.senato.it')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.senato.it', 'https://www.senato.it')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Palazzo Madama - Via della Dogana Vecchia 29', 'Palazzo Madama - Via della Dogana Vecchia 29', 'Palazzo Madama - Via della Dogana Vecchia 29', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Citizen Services Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services Hotline'), 'phone'::ContactChannelType, '800-012955 (toll-free, Italy only)', '800-012955 (toll-free, Italy only)', '800012955')
ON CONFLICT DO NOTHING;

-- Email for: Citizen Services Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services Hotline'), 'email'::ContactChannelType, 'info@camera.it', 'info@camera.it')
ON CONFLICT DO NOTHING;

-- Email for: Citizen Services Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services Hotline'), 'email'::ContactChannelType, 'segreteria@pec.camera.it', 'segreteria@pec.camera.it')
ON CONFLICT DO NOTHING;

-- Website for: Citizen Services Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services Hotline'), 'website'::ContactChannelType, 'https://www.camera.it', 'https://www.camera.it')
ON CONFLICT DO NOTHING;

-- Address for: Citizen Services Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services Hotline'), 'office_address'::ContactChannelType, 'Piazza Montecitorio', 'Piazza Montecitorio', 'Piazza Montecitorio', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Public Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Information'), 'phone'::ContactChannelType, '+39 (0)6 67061', '+39 06 67061', '+390667061')
ON CONFLICT DO NOTHING;

-- Email for: Public Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Information'), 'email'::ContactChannelType, 'info@senato.it', 'info@senato.it')
ON CONFLICT DO NOTHING;

-- Email for: Public Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Information'), 'email'::ContactChannelType, 'segreteria.generale@pec.senato.it', 'segreteria.generale@pec.senato.it')
ON CONFLICT DO NOTHING;

-- Website for: Public Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Information'), 'website'::ContactChannelType, 'https://www.senato.it', 'https://www.senato.it')
ON CONFLICT DO NOTHING;

-- Address for: Public Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Information'), 'office_address'::ContactChannelType, 'Palazzo Madama - Via della Dogana Vecchia 29', 'Palazzo Madama - Via della Dogana Vecchia 29', 'Palazzo Madama - Via della Dogana Vecchia 29', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'email'::ContactChannelType, 'segreteria.presidente@governo.it', 'segreteria.presidente@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'email'::ContactChannelType, 'segreteria.presidente@pec.governo.it', 'segreteria.presidente@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Office of the Prime Minister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the Prime Minister'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Citizen Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services'), 'phone'::ContactChannelType, '+39 (0)6 6779-2', '+39 06 67792', '+390667792')
ON CONFLICT DO NOTHING;

-- Email for: Citizen Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services'), 'email'::ContactChannelType, 'info@governo.it', 'info@governo.it')
ON CONFLICT DO NOTHING;

-- Email for: Citizen Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services'), 'email'::ContactChannelType, 'info@pec.governo.it', 'info@pec.governo.it')
ON CONFLICT DO NOTHING;

-- Website for: Citizen Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services'), 'website'::ContactChannelType, 'https://www.governo.it', 'https://www.governo.it')
ON CONFLICT DO NOTHING;

-- Address for: Citizen Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services'), 'office_address'::ContactChannelType, 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Palazzo Chigi, Piazza Colonna 370', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'phone'::ContactChannelType, '+39 (0)6 46991', '+39 06 46991', '+390646991')
ON CONFLICT DO NOTHING;

-- Email for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'email'::ContactChannelType, 'segreteria.generale@quirinale.it', 'segreteria.generale@quirinale.it')
ON CONFLICT DO NOTHING;

-- Email for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'email'::ContactChannelType, 'segreteria.generale@pec.quirinale.it', 'segreteria.generale@pec.quirinale.it')
ON CONFLICT DO NOTHING;

-- Website for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'website'::ContactChannelType, 'https://www.quirinale.it', 'https://www.quirinale.it')
ON CONFLICT DO NOTHING;

-- Address for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'office_address'::ContactChannelType, 'Palazzo del Quirinale - Piazza del Quirinale 1', 'Palazzo del Quirinale - Piazza del Quirinale 1', 'Palazzo del Quirinale - Piazza del Quirinale 1', 'Rome')
ON CONFLICT DO NOTHING;

-- Phone for: Cyril Ramaphosa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cyril Ramaphosa'), 'phone'::ContactChannelType, '+27-12-300-5200', '+27 12 300 5200', '+27123005200')
ON CONFLICT DO NOTHING;

-- Email for: Cyril Ramaphosa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cyril Ramaphosa'), 'email'::ContactChannelType, 'president@presidency.gov.za', 'president@presidency.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Cyril Ramaphosa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cyril Ramaphosa'), 'website'::ContactChannelType, 'https://www.thepresidency.gov.za', 'https://www.thepresidency.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Cyril Ramaphosa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Cyril Ramaphosa'), 'office_address'::ContactChannelType, 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Paul Mashatile
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paul Mashatile'), 'phone'::ContactChannelType, '+27-12-300-5200', '+27 12 300 5200', '+27123005200')
ON CONFLICT DO NOTHING;

-- Email for: Paul Mashatile
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paul Mashatile'), 'email'::ContactChannelType, 'deputypresident@presidency.gov.za', 'deputypresident@presidency.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Paul Mashatile
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paul Mashatile'), 'website'::ContactChannelType, 'https://www.thepresidency.gov.za', 'https://www.thepresidency.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Paul Mashatile
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paul Mashatile'), 'office_address'::ContactChannelType, 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Khumbudzo Ntshavheni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khumbudzo Ntshavheni'), 'phone'::ContactChannelType, '+27-12-300-5200', '+27 12 300 5200', '+27123005200')
ON CONFLICT DO NOTHING;

-- Email for: Khumbudzo Ntshavheni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khumbudzo Ntshavheni'), 'email'::ContactChannelType, 'minister@presidency.gov.za', 'minister@presidency.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Khumbudzo Ntshavheni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khumbudzo Ntshavheni'), 'website'::ContactChannelType, 'https://www.thepresidency.gov.za', 'https://www.thepresidency.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Khumbudzo Ntshavheni
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Khumbudzo Ntshavheni'), 'office_address'::ContactChannelType, 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Sindisiwe Chikunga
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sindisiwe Chikunga'), 'phone'::ContactChannelType, '+27-12-300-5200', '+27 12 300 5200', '+27123005200')
ON CONFLICT DO NOTHING;

-- Email for: Sindisiwe Chikunga
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sindisiwe Chikunga'), 'email'::ContactChannelType, 'schikunga@presidency.gov.za', 'schikunga@presidency.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Sindisiwe Chikunga
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sindisiwe Chikunga'), 'website'::ContactChannelType, 'https://www.thepresidency.gov.za', 'https://www.thepresidency.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Sindisiwe Chikunga
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sindisiwe Chikunga'), 'office_address'::ContactChannelType, 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Enoch Godongwana
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Enoch Godongwana'), 'phone'::ContactChannelType, '+27-12-315-5111', '+27 12 315 5111', '+27123155111')
ON CONFLICT DO NOTHING;

-- Email for: Enoch Godongwana
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Enoch Godongwana'), 'email'::ContactChannelType, 'info@treasury.gov.za', 'info@treasury.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Enoch Godongwana
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Enoch Godongwana'), 'website'::ContactChannelType, 'https://www.treasury.gov.za', 'https://www.treasury.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Enoch Godongwana
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Enoch Godongwana'), 'office_address'::ContactChannelType, '40 Church Street', '40 Church Street', '40 Church Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Mmamoloko Kubayi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mmamoloko Kubayi'), 'phone'::ContactChannelType, '+27-21-467-1700', '+27 21 467 1700', '+27214671700')
ON CONFLICT DO NOTHING;

-- Email for: Mmamoloko Kubayi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mmamoloko Kubayi'), 'email'::ContactChannelType, 'info@justice.gov.za', 'info@justice.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Mmamoloko Kubayi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mmamoloko Kubayi'), 'website'::ContactChannelType, 'https://www.justice.gov.za', 'https://www.justice.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Mmamoloko Kubayi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mmamoloko Kubayi'), 'office_address'::ContactChannelType, '120 Plein Street', '120 Plein Street', '120 Plein Street', 'Cape Town')
ON CONFLICT DO NOTHING;

-- Phone for: Thembi Simelane
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thembi Simelane'), 'phone'::ContactChannelType, '+27-11-355-3500', '+27 11 355 3500', '+27113553500')
ON CONFLICT DO NOTHING;

-- Email for: Thembi Simelane
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thembi Simelane'), 'email'::ContactChannelType, 'info@dhs.gov.za', 'info@dhs.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Thembi Simelane
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thembi Simelane'), 'website'::ContactChannelType, 'https://www.dhs.gov.za', 'https://www.dhs.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Thembi Simelane
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Thembi Simelane'), 'office_address'::ContactChannelType, 'Lutuli House, 11 Diagonal Street', 'Lutuli House, 11 Diagonal Street', 'Lutuli House, 11 Diagonal Street', 'Johannesburg')
ON CONFLICT DO NOTHING;

-- Phone for: Ronald Lamola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ronald Lamola'), 'phone'::ContactChannelType, '+27-12-351-1000', '+27 12 351 1000', '+27123511000')
ON CONFLICT DO NOTHING;

-- Email for: Ronald Lamola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ronald Lamola'), 'email'::ContactChannelType, 'info@dirco.gov.za', 'info@dirco.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Ronald Lamola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ronald Lamola'), 'website'::ContactChannelType, 'https://www.dirco.gov.za', 'https://www.dirco.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Ronald Lamola
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ronald Lamola'), 'office_address'::ContactChannelType, 'South African Reserve Bank, 370 Main Street', 'South African Reserve Bank, 370 Main Street', 'South African Reserve Bank, 370 Main Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Angie Motshekga
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angie Motshekga'), 'phone'::ContactChannelType, '+27-12-428-6911', '+27 12 428 6911', '+27124286911')
ON CONFLICT DO NOTHING;

-- Email for: Angie Motshekga
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angie Motshekga'), 'email'::ContactChannelType, 'info@dod.gov.za', 'info@dod.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Angie Motshekga
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angie Motshekga'), 'website'::ContactChannelType, 'https://www.dod.gov.za', 'https://www.dod.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Angie Motshekga
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angie Motshekga'), 'office_address'::ContactChannelType, 'Armscor, 1717 Pretorius Street', 'Armscor, 1717 Pretorius Street', 'Armscor, 1717 Pretorius Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Senzo Mchunu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Senzo Mchunu'), 'phone'::ContactChannelType, '+27-12-393-2000', '+27 12 393 2000', '+27123932000')
ON CONFLICT DO NOTHING;

-- Email for: Senzo Mchunu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Senzo Mchunu'), 'email'::ContactChannelType, 'info@saps.gov.za', 'info@saps.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Senzo Mchunu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Senzo Mchunu'), 'website'::ContactChannelType, 'https://www.saps.gov.za', 'https://www.saps.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Senzo Mchunu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Senzo Mchunu'), 'office_address'::ContactChannelType, '321 Pretorius Street', '321 Pretorius Street', '321 Pretorius Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Aaron Motsoaledi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Aaron Motsoaledi'), 'phone'::ContactChannelType, '+27-12-395-8000', '+27 12 395 8000', '+27123958000')
ON CONFLICT DO NOTHING;

-- Email for: Aaron Motsoaledi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Aaron Motsoaledi'), 'email'::ContactChannelType, 'info@health.gov.za', 'info@health.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Aaron Motsoaledi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Aaron Motsoaledi'), 'website'::ContactChannelType, 'https://www.health.gov.za', 'https://www.health.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Aaron Motsoaledi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Aaron Motsoaledi'), 'office_address'::ContactChannelType, 'Cnr Madiba and Thabo Mbeki Street', 'Cnr Madiba and Thabo Mbeki Street', 'Cnr Madiba and Thabo Mbeki Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Siviwe Gwarube
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Siviwe Gwarube'), 'phone'::ContactChannelType, '+27-12-357-3000', '+27 12 357 3000', '+27123573000')
ON CONFLICT DO NOTHING;

-- Email for: Siviwe Gwarube
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Siviwe Gwarube'), 'email'::ContactChannelType, 'info@dbe.gov.za', 'info@dbe.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Siviwe Gwarube
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Siviwe Gwarube'), 'website'::ContactChannelType, 'https://www.dbe.gov.za', 'https://www.dbe.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Siviwe Gwarube
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Siviwe Gwarube'), 'office_address'::ContactChannelType, '222 Struben Street', '222 Struben Street', '222 Struben Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Buti Manamela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Buti Manamela'), 'phone'::ContactChannelType, '+27-12-312-1000', '+27 12 312 1000', '+27123121000')
ON CONFLICT DO NOTHING;

-- Email for: Buti Manamela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Buti Manamela'), 'email'::ContactChannelType, 'info@dhet.gov.za', 'info@dhet.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Buti Manamela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Buti Manamela'), 'website'::ContactChannelType, 'https://www.dhet.gov.za', 'https://www.dhet.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Buti Manamela
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Buti Manamela'), 'office_address'::ContactChannelType, '111 Main Street', '111 Main Street', '111 Main Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: John Steenhuisen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Steenhuisen'), 'phone'::ContactChannelType, '+27-12-319-6000', '+27 12 319 6000', '+27123196000')
ON CONFLICT DO NOTHING;

-- Email for: John Steenhuisen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Steenhuisen'), 'email'::ContactChannelType, 'info@agriculture.gov.za', 'info@agriculture.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: John Steenhuisen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Steenhuisen'), 'website'::ContactChannelType, 'https://www.agriculture.gov.za', 'https://www.agriculture.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: John Steenhuisen
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'John Steenhuisen'), 'office_address'::ContactChannelType, 'Pretoria National Botanical Gardens', 'Pretoria National Botanical Gardens', 'Pretoria National Botanical Gardens', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Solly Malatsi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Solly Malatsi'), 'phone'::ContactChannelType, '+27-12-323-3200', '+27 12 323 3200', '+27123233200')
ON CONFLICT DO NOTHING;

-- Email for: Solly Malatsi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Solly Malatsi'), 'email'::ContactChannelType, 'info@dcdt.gov.za', 'info@dcdt.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Solly Malatsi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Solly Malatsi'), 'website'::ContactChannelType, 'https://www.dcdt.gov.za', 'https://www.dcdt.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Solly Malatsi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Solly Malatsi'), 'office_address'::ContactChannelType, '1st Floor, Trevenna Office Park', '1st Floor, Trevenna Office Park', '1st Floor, Trevenna Office Park', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Leon Schreiber
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Leon Schreiber'), 'phone'::ContactChannelType, '+27-12-406-8911', '+27 12 406 8911', '+27124068911')
ON CONFLICT DO NOTHING;

-- Email for: Leon Schreiber
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Leon Schreiber'), 'email'::ContactChannelType, 'info@dha.gov.za', 'info@dha.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Leon Schreiber
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Leon Schreiber'), 'website'::ContactChannelType, 'https://www.dha.gov.za', 'https://www.dha.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Leon Schreiber
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Leon Schreiber'), 'office_address'::ContactChannelType, 'Cnr Madiba and Simba Road', 'Cnr Madiba and Simba Road', 'Cnr Madiba and Simba Road', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Dean Macpherson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dean Macpherson'), 'phone'::ContactChannelType, '+27-12-326-6000', '+27 12 326 6000', '+27123266000')
ON CONFLICT DO NOTHING;

-- Email for: Dean Macpherson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dean Macpherson'), 'email'::ContactChannelType, 'info@dpw.gov.za', 'info@dpw.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Dean Macpherson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dean Macpherson'), 'website'::ContactChannelType, 'https://www.dpw.gov.za', 'https://www.dpw.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Dean Macpherson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dean Macpherson'), 'office_address'::ContactChannelType, 'Cnr Madiba and Tshwane Streets', 'Cnr Madiba and Tshwane Streets', 'Cnr Madiba and Tshwane Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Willie Aucamp
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Willie Aucamp'), 'phone'::ContactChannelType, '+27-11-644-4500', '+27 11 644 4500', '+27116444500')
ON CONFLICT DO NOTHING;

-- Email for: Willie Aucamp
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Willie Aucamp'), 'email'::ContactChannelType, 'info@dffe.gov.za', 'info@dffe.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Willie Aucamp
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Willie Aucamp'), 'website'::ContactChannelType, 'https://www.dffe.gov.za', 'https://www.dffe.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Willie Aucamp
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Willie Aucamp'), 'office_address'::ContactChannelType, 'Bonwapele Street, Dunkeld', 'Bonwapele Street, Dunkeld', 'Bonwapele Street, Dunkeld', 'Johannesburg')
ON CONFLICT DO NOTHING;

-- Phone for: Mzwanele Nyhontso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mzwanele Nyhontso'), 'phone'::ContactChannelType, '+27-12-312-8550', '+27 12 312 8550', '+27123128550')
ON CONFLICT DO NOTHING;

-- Email for: Mzwanele Nyhontso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mzwanele Nyhontso'), 'email'::ContactChannelType, 'info@landreform.gov.za', 'info@landreform.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Mzwanele Nyhontso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mzwanele Nyhontso'), 'website'::ContactChannelType, 'https://www.landreform.gov.za', 'https://www.landreform.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Mzwanele Nyhontso
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mzwanele Nyhontso'), 'office_address'::ContactChannelType, '123 Main Street', '123 Main Street', '123 Main Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Gwede Mantashe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gwede Mantashe'), 'phone'::ContactChannelType, '+27-12-219-7000', '+27 12 219 7000', '+27122197000')
ON CONFLICT DO NOTHING;

-- Email for: Gwede Mantashe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gwede Mantashe'), 'email'::ContactChannelType, 'info@dmr.gov.za', 'info@dmr.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Gwede Mantashe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gwede Mantashe'), 'website'::ContactChannelType, 'https://www.dmr.gov.za', 'https://www.dmr.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Gwede Mantashe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gwede Mantashe'), 'office_address'::ContactChannelType, '241 Visagie Street', '241 Visagie Street', '241 Visagie Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Kgosientsho Ramokgopa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kgosientsho Ramokgopa'), 'phone'::ContactChannelType, '+27-12-428-6000', '+27 12 428 6000', '+27124286000')
ON CONFLICT DO NOTHING;

-- Email for: Kgosientsho Ramokgopa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kgosientsho Ramokgopa'), 'email'::ContactChannelType, 'info@energy.gov.za', 'info@energy.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Kgosientsho Ramokgopa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kgosientsho Ramokgopa'), 'website'::ContactChannelType, 'https://www.energy.gov.za', 'https://www.energy.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Kgosientsho Ramokgopa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kgosientsho Ramokgopa'), 'office_address'::ContactChannelType, 'Cnr Bosman and Hans Strijdom Streets', 'Cnr Bosman and Hans Strijdom Streets', 'Cnr Bosman and Hans Strijdom Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Nomakhosazana Meth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nomakhosazana Meth'), 'phone'::ContactChannelType, '+27-12-392-9630', '+27 12 392 9630', '+27123929630')
ON CONFLICT DO NOTHING;

-- Email for: Nomakhosazana Meth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nomakhosazana Meth'), 'email'::ContactChannelType, 'info@labour.gov.za', 'info@labour.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Nomakhosazana Meth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nomakhosazana Meth'), 'website'::ContactChannelType, 'https://www.labour.gov.za', 'https://www.labour.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Nomakhosazana Meth
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nomakhosazana Meth'), 'office_address'::ContactChannelType, '215 Laboria House, Cnr Francis Baard and Paul Kruger', '215 Laboria House, Cnr Francis Baard and Paul Kruger', '215 Laboria House, Cnr Francis Baard and Paul Kruger', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Barbara Creecy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Barbara Creecy'), 'phone'::ContactChannelType, '+27-12-309-3000', '+27 12 309 3000', '+27123093000')
ON CONFLICT DO NOTHING;

-- Email for: Barbara Creecy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Barbara Creecy'), 'email'::ContactChannelType, 'info@dot.gov.za', 'info@dot.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Barbara Creecy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Barbara Creecy'), 'website'::ContactChannelType, 'https://www.dot.gov.za', 'https://www.dot.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Barbara Creecy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Barbara Creecy'), 'office_address'::ContactChannelType, 'Cnr Bosman and Schoeman Streets', 'Cnr Bosman and Schoeman Streets', 'Cnr Bosman and Schoeman Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Parks Tau
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Parks Tau'), 'phone'::ContactChannelType, '+27-12-394-6000', '+27 12 394 6000', '+27123946000')
ON CONFLICT DO NOTHING;

-- Email for: Parks Tau
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Parks Tau'), 'email'::ContactChannelType, 'info@tict.gov.za', 'info@tict.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Parks Tau
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Parks Tau'), 'website'::ContactChannelType, 'https://www.tict.gov.za', 'https://www.tict.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Parks Tau
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Parks Tau'), 'office_address'::ContactChannelType, '77 Meintjies Street', '77 Meintjies Street', '77 Meintjies Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Pemmy Majodina
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pemmy Majodina'), 'phone'::ContactChannelType, '+27-12-336-6580', '+27 12 336 6580', '+27123366580')
ON CONFLICT DO NOTHING;

-- Email for: Pemmy Majodina
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pemmy Majodina'), 'email'::ContactChannelType, 'info@dws.gov.za', 'info@dws.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Pemmy Majodina
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pemmy Majodina'), 'website'::ContactChannelType, 'https://www.dws.gov.za', 'https://www.dws.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Pemmy Majodina
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pemmy Majodina'), 'office_address'::ContactChannelType, 'Cnr Madiba and Van Der Walt Streets', 'Cnr Madiba and Van Der Walt Streets', 'Cnr Madiba and Van Der Walt Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Stella Ndabeni-Abrahams
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stella Ndabeni-Abrahams'), 'phone'::ContactChannelType, '+27-12-394-2500', '+27 12 394 2500', '+27123942500')
ON CONFLICT DO NOTHING;

-- Email for: Stella Ndabeni-Abrahams
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stella Ndabeni-Abrahams'), 'email'::ContactChannelType, 'info@dsbd.gov.za', 'info@dsbd.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Stella Ndabeni-Abrahams
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stella Ndabeni-Abrahams'), 'website'::ContactChannelType, 'https://www.dsbd.gov.za', 'https://www.dsbd.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Stella Ndabeni-Abrahams
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stella Ndabeni-Abrahams'), 'office_address'::ContactChannelType, 'Cnr Nile and Pretorius Streets', 'Cnr Nile and Pretorius Streets', 'Cnr Nile and Pretorius Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Sisisi Tolashe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sisisi Tolashe'), 'phone'::ContactChannelType, '+27-12-312-7500', '+27 12 312 7500', '+27123127500')
ON CONFLICT DO NOTHING;

-- Email for: Sisisi Tolashe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sisisi Tolashe'), 'email'::ContactChannelType, 'info@dsd.gov.za', 'info@dsd.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Sisisi Tolashe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sisisi Tolashe'), 'website'::ContactChannelType, 'https://www.dsd.gov.za', 'https://www.dsd.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Sisisi Tolashe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sisisi Tolashe'), 'office_address'::ContactChannelType, 'Hoffmann Square, Cnr Madiba and Thabo Mbeki', 'Hoffmann Square, Cnr Madiba and Thabo Mbeki', 'Hoffmann Square, Cnr Madiba and Thabo Mbeki', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Gayton McKenzie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gayton McKenzie'), 'phone'::ContactChannelType, '+27-12-441-3000', '+27 12 441 3000', '+27124413000')
ON CONFLICT DO NOTHING;

-- Email for: Gayton McKenzie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gayton McKenzie'), 'email'::ContactChannelType, 'info@dsac.gov.za', 'info@dsac.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Gayton McKenzie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gayton McKenzie'), 'website'::ContactChannelType, 'https://www.dsac.gov.za', 'https://www.dsac.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Gayton McKenzie
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gayton McKenzie'), 'office_address'::ContactChannelType, 'Sechaba House, 202 Madiba Street', 'Sechaba House, 202 Madiba Street', 'Sechaba House, 202 Madiba Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Patricia de Lille
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patricia de Lille'), 'phone'::ContactChannelType, '+27-12-309-3000', '+27 12 309 3000', '+27123093000')
ON CONFLICT DO NOTHING;

-- Email for: Patricia de Lille
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patricia de Lille'), 'email'::ContactChannelType, 'info@tourism.gov.za', 'info@tourism.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Patricia de Lille
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patricia de Lille'), 'website'::ContactChannelType, 'https://www.tourism.gov.za', 'https://www.tourism.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Patricia de Lille
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Patricia de Lille'), 'office_address'::ContactChannelType, 'Cnr Schoeman and Madiba Streets', 'Cnr Schoeman and Madiba Streets', 'Cnr Schoeman and Madiba Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Blade Nzimande
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Blade Nzimande'), 'phone'::ContactChannelType, '+27-12-843-6500', '+27 12 843 6500', '+27128436500')
ON CONFLICT DO NOTHING;

-- Email for: Blade Nzimande
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Blade Nzimande'), 'email'::ContactChannelType, 'info@dsti.gov.za', 'info@dsti.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Blade Nzimande
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Blade Nzimande'), 'website'::ContactChannelType, 'https://www.dsti.gov.za', 'https://www.dsti.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Blade Nzimande
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Blade Nzimande'), 'office_address'::ContactChannelType, 'Meiring Naude Road, Brummeria', 'Meiring Naude Road, Brummeria', 'Meiring Naude Road, Brummeria', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Velenkosini Hlabisa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Velenkosini Hlabisa'), 'phone'::ContactChannelType, '+27-12-334-5500', '+27 12 334 5500', '+27123345500')
ON CONFLICT DO NOTHING;

-- Email for: Velenkosini Hlabisa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Velenkosini Hlabisa'), 'email'::ContactChannelType, 'info@cogta.gov.za', 'info@cogta.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Velenkosini Hlabisa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Velenkosini Hlabisa'), 'website'::ContactChannelType, 'https://www.cogta.gov.za', 'https://www.cogta.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Velenkosini Hlabisa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Velenkosini Hlabisa'), 'office_address'::ContactChannelType, 'Cnr Madiba and Thabo Mbeki Streets', 'Cnr Madiba and Thabo Mbeki Streets', 'Cnr Madiba and Thabo Mbeki Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Pieter Groenewald
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pieter Groenewald'), 'phone'::ContactChannelType, '+27-12-309-8000', '+27 12 309 8000', '+27123098000')
ON CONFLICT DO NOTHING;

-- Email for: Pieter Groenewald
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pieter Groenewald'), 'email'::ContactChannelType, 'info@dcs.gov.za', 'info@dcs.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Pieter Groenewald
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pieter Groenewald'), 'website'::ContactChannelType, 'https://www.dcs.gov.za', 'https://www.dcs.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Pieter Groenewald
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Pieter Groenewald'), 'office_address'::ContactChannelType, 'Cnr Paul Kruger and Witteboom Streets', 'Cnr Paul Kruger and Witteboom Streets', 'Cnr Paul Kruger and Witteboom Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Mzamo Buthelezi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mzamo Buthelezi'), 'phone'::ContactChannelType, '+27-12-314-8000', '+27 12 314 8000', '+27123148000')
ON CONFLICT DO NOTHING;

-- Email for: Mzamo Buthelezi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mzamo Buthelezi'), 'email'::ContactChannelType, 'info@dpsa.gov.za', 'info@dpsa.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Mzamo Buthelezi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mzamo Buthelezi'), 'website'::ContactChannelType, 'https://www.dpsa.gov.za', 'https://www.dpsa.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Mzamo Buthelezi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mzamo Buthelezi'), 'office_address'::ContactChannelType, 'Cnr Madiba and Thabo Mbeki Streets', 'Cnr Madiba and Thabo Mbeki Streets', 'Cnr Madiba and Thabo Mbeki Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Maropene Ramokgopa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maropene Ramokgopa'), 'phone'::ContactChannelType, '+27-12-312-0000', '+27 12 312 0000', '+27123120000')
ON CONFLICT DO NOTHING;

-- Email for: Maropene Ramokgopa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maropene Ramokgopa'), 'email'::ContactChannelType, 'info@dpme.gov.za', 'info@dpme.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Maropene Ramokgopa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maropene Ramokgopa'), 'website'::ContactChannelType, 'https://www.dpme.gov.za', 'https://www.dpme.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Maropene Ramokgopa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Maropene Ramokgopa'), 'office_address'::ContactChannelType, 'Cnr Madiba and Thabo Mbeki Streets', 'Cnr Madiba and Thabo Mbeki Streets', 'Cnr Madiba and Thabo Mbeki Streets', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+27-21-403-2911', '+27 21 403 2911', '+27214032911')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@parliament.gov.za', 'info@parliament.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.parliament.gov.za', 'https://www.parliament.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Parliament Street, Parliament Building', 'Parliament Street, Parliament Building', 'Parliament Street, Parliament Building', 'Cape Town')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+27-21-403-2110', '+27 21 403 2110', '+27214032110')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@parliament.gov.za', 'info@parliament.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.parliament.gov.za', 'https://www.parliament.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Parliament Street, Parliament Building Room S11', 'Parliament Street, Parliament Building Room S11', 'Parliament Street, Parliament Building Room S11', 'Cape Town')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+27-21-403-2595', '+27 21 403 2595', '+27214032595')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'members@parliament.gov.za', 'members@parliament.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://www.parliament.gov.za', 'https://www.parliament.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, 'Parliament Street, Parliament Building Room E118', 'Parliament Street, Parliament Building Room E118', 'Parliament Street, Parliament Building Room E118', 'Cape Town')
ON CONFLICT DO NOTHING;

-- Phone for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'phone'::ContactChannelType, '+27-21-403-2118', '+27 21 403 2118', '+27214032118')
ON CONFLICT DO NOTHING;

-- Email for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'email'::ContactChannelType, 'members.ncop@parliament.gov.za', 'members.ncop@parliament.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'website'::ContactChannelType, 'https://www.parliament.gov.za', 'https://www.parliament.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Member Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Member Services'), 'office_address'::ContactChannelType, 'Parliament Street, Parliament Building Room S25', 'Parliament Street, Parliament Building Room S25', 'Parliament Street, Parliament Building Room S25', 'Cape Town')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'phone'::ContactChannelType, '+27-12-300-5200', '+27 12 300 5200', '+27123005200')
ON CONFLICT DO NOTHING;

-- Email for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'email'::ContactChannelType, 'president@presidency.gov.za', 'president@presidency.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'website'::ContactChannelType, 'https://www.thepresidency.gov.za', 'https://www.thepresidency.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'office_address'::ContactChannelType, 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Presidential Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Presidential Hotline'), 'phone'::ContactChannelType, '17737', '17737', '17737')
ON CONFLICT DO NOTHING;

-- Email for: Presidential Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Presidential Hotline'), 'email'::ContactChannelType, 'presidential.hotline@presidency.gov.za', 'presidential.hotline@presidency.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Presidential Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Presidential Hotline'), 'website'::ContactChannelType, 'https://www.thepresidency.gov.za', 'https://www.thepresidency.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Presidential Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Presidential Hotline'), 'office_address'::ContactChannelType, 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Union Buildings, Government Avenue', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'phone'::ContactChannelType, '+27-12-351-1000', '+27 12 351 1000', '+27123511000')
ON CONFLICT DO NOTHING;

-- Email for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'email'::ContactChannelType, 'info@dirco.gov.za', 'info@dirco.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'website'::ContactChannelType, 'https://www.dirco.gov.za', 'https://www.dirco.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Main Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Office'), 'office_address'::ContactChannelType, 'South African Reserve Bank, 370 Main Street', 'South African Reserve Bank, 370 Main Street', 'South African Reserve Bank, 370 Main Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Government Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Government Information'), 'phone'::ContactChannelType, '+27-12-314-2911', '+27 12 314 2911', '+27123142911')
ON CONFLICT DO NOTHING;

-- Email for: Government Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Government Information'), 'email'::ContactChannelType, 'info@gcis.gov.za', 'info@gcis.gov.za')
ON CONFLICT DO NOTHING;

-- Website for: Government Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Government Information'), 'website'::ContactChannelType, 'https://www.gcis.gov.za', 'https://www.gcis.gov.za')
ON CONFLICT DO NOTHING;

-- Address for: Government Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Government Information'), 'office_address'::ContactChannelType, 'GCIS, 1035 Schoeman Street', 'GCIS, 1035 Schoeman Street', 'GCIS, 1035 Schoeman Street', 'Pretoria')
ON CONFLICT DO NOTHING;

-- Phone for: Keir Starmer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Keir Starmer'), 'phone'::ContactChannelType, '020 7219 6234', '020 7219 6234', '02072196234')
ON CONFLICT DO NOTHING;

-- Email for: Keir Starmer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Keir Starmer'), 'email'::ContactChannelType, 'keir.starmer.mp@parliament.uk', 'keir.starmer.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Address for: Keir Starmer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Keir Starmer'), 'office_address'::ContactChannelType, '10 Downing Street, London SW1A 2AA', '10 Downing Street, London SW1A 2AA', '10 Downing Street, London SW1A 2AA', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Angela Rayner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angela Rayner'), 'phone'::ContactChannelType, '020 7219 5175', '020 7219 5175', '02072195175')
ON CONFLICT DO NOTHING;

-- Email for: Angela Rayner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angela Rayner'), 'email'::ContactChannelType, 'angela.rayner.mp@parliament.uk', 'angela.rayner.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Address for: Angela Rayner
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Angela Rayner'), 'office_address'::ContactChannelType, 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: David Lammy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Lammy'), 'phone'::ContactChannelType, '020 7219 8560', '020 7219 8560', '02072198560')
ON CONFLICT DO NOTHING;

-- Email for: David Lammy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Lammy'), 'email'::ContactChannelType, 'david.lammy.mp@parliament.uk', 'david.lammy.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Address for: David Lammy
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Lammy'), 'office_address'::ContactChannelType, 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Rachel Reeves
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rachel Reeves'), 'phone'::ContactChannelType, '020 7219 5225', '020 7219 5225', '02072195225')
ON CONFLICT DO NOTHING;

-- Email for: Rachel Reeves
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rachel Reeves'), 'email'::ContactChannelType, 'rachel.reeves.mp@parliament.uk', 'rachel.reeves.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Address for: Rachel Reeves
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rachel Reeves'), 'office_address'::ContactChannelType, 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Yvette Cooper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yvette Cooper'), 'phone'::ContactChannelType, '020 7219 5080', '020 7219 5080', '02072195080')
ON CONFLICT DO NOTHING;

-- Email for: Yvette Cooper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yvette Cooper'), 'email'::ContactChannelType, 'coopery@parliament.uk', 'coopery@parliament.uk')
ON CONFLICT DO NOTHING;

-- Address for: Yvette Cooper
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Yvette Cooper'), 'office_address'::ContactChannelType, 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Wes Streeting
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wes Streeting'), 'phone'::ContactChannelType, '020 7219 6861', '020 7219 6861', '02072196861')
ON CONFLICT DO NOTHING;

-- Email for: Wes Streeting
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wes Streeting'), 'email'::ContactChannelType, 'wes.streeting.mp@parliament.uk', 'wes.streeting.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Address for: Wes Streeting
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wes Streeting'), 'office_address'::ContactChannelType, 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Bridget Phillipson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bridget Phillipson'), 'phone'::ContactChannelType, '020 7219 4355', '020 7219 4355', '02072194355')
ON CONFLICT DO NOTHING;

-- Email for: Bridget Phillipson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bridget Phillipson'), 'email'::ContactChannelType, 'bridget.phillipson.mp@parliament.uk', 'bridget.phillipson.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Address for: Bridget Phillipson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bridget Phillipson'), 'office_address'::ContactChannelType, 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', 'House of Commons, Westminster, London SW1A 2AA', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Jack Abbott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jack Abbott'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Jack Abbott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jack Abbott'), 'email'::ContactChannelType, 'jack.abbott.mp@parliament.uk', 'jack.abbott.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Diane Abbott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Diane Abbott'), 'phone'::ContactChannelType, '020 7219 4426', '020 7219 4426', '02072194426')
ON CONFLICT DO NOTHING;

-- Email for: Diane Abbott
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Diane Abbott'), 'email'::ContactChannelType, 'diane.abbott.office@parliament.uk', 'diane.abbott.office@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Debbie Abrahams
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Debbie Abrahams'), 'phone'::ContactChannelType, '020 7219 1041', '020 7219 1041', '02072191041')
ON CONFLICT DO NOTHING;

-- Email for: Debbie Abrahams
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Debbie Abrahams'), 'email'::ContactChannelType, 'abrahamsd@parliament.uk', 'abrahamsd@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Sadik Al-Hassan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sadik Al-Hassan'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Sadik Al-Hassan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sadik Al-Hassan'), 'email'::ContactChannelType, 'sadik.alhassan.mp@parliament.uk', 'sadik.alhassan.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Bayo Alaba
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bayo Alaba'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Bayo Alaba
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Bayo Alaba'), 'email'::ContactChannelType, 'bayo.alaba.mp@parliament.uk', 'bayo.alaba.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Heidi Alexander
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Heidi Alexander'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Heidi Alexander
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Heidi Alexander'), 'email'::ContactChannelType, 'heidi.alexander.mp@parliament.uk', 'heidi.alexander.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Rushanara Ali
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rushanara Ali'), 'phone'::ContactChannelType, '020 7219 7200', '020 7219 7200', '02072197200')
ON CONFLICT DO NOTHING;

-- Email for: Rushanara Ali
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rushanara Ali'), 'email'::ContactChannelType, 'rushanara.ali.mp@parliament.uk', 'rushanara.ali.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Tahir Ali
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tahir Ali'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Tahir Ali
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tahir Ali'), 'email'::ContactChannelType, 'tahir.ali.mp@parliament.uk', 'tahir.ali.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Rosena Allin-Khan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosena Allin-Khan'), 'phone'::ContactChannelType, '020 3621 2509', '020 3621 2509', '02036212509')
ON CONFLICT DO NOTHING;

-- Email for: Rosena Allin-Khan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosena Allin-Khan'), 'email'::ContactChannelType, 'rosena.allinkhan.mp@parliament.uk', 'rosena.allinkhan.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Callum Anderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Callum Anderson'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Callum Anderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Callum Anderson'), 'email'::ContactChannelType, 'callum.anderson.mp@parliament.uk', 'callum.anderson.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Fleur Anderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fleur Anderson'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Fleur Anderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fleur Anderson'), 'email'::ContactChannelType, 'fleur.anderson.mp@parliament.uk', 'fleur.anderson.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Tonia Antoniazzi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tonia Antoniazzi'), 'phone'::ContactChannelType, '020 7219 1199', '020 7219 1199', '02072191199')
ON CONFLICT DO NOTHING;

-- Email for: Tonia Antoniazzi
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Tonia Antoniazzi'), 'email'::ContactChannelType, 'tonia.antoniazzi.mp@parliament.uk', 'tonia.antoniazzi.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Catherine Atkinson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Catherine Atkinson'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Catherine Atkinson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Catherine Atkinson'), 'email'::ContactChannelType, 'catherine.atkinson.mp@parliament.uk', 'catherine.atkinson.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Lewis Atkinson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lewis Atkinson'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Lewis Atkinson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lewis Atkinson'), 'email'::ContactChannelType, 'lewis.atkinson.mp@parliament.uk', 'lewis.atkinson.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: David Baines
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Baines'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: David Baines
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Baines'), 'email'::ContactChannelType, 'david.baines.mp@parliament.uk', 'david.baines.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Alex Baker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Baker'), 'phone'::ContactChannelType, '020 7219 4085', '020 7219 4085', '02072194085')
ON CONFLICT DO NOTHING;

-- Email for: Alex Baker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Baker'), 'email'::ContactChannelType, 'alex.baker.mp@parliament.uk', 'alex.baker.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Richard Baker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Baker'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Richard Baker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Richard Baker'), 'email'::ContactChannelType, 'richard.baker.mp@parliament.uk', 'richard.baker.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Alex Ballinger
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Ballinger'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Alex Ballinger
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Ballinger'), 'email'::ContactChannelType, 'alex.ballinger.mp@parliament.uk', 'alex.ballinger.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Antonia Bance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Antonia Bance'), 'phone'::ContactChannelType, '0121 716 5233', '0121 716 5233', '01217165233')
ON CONFLICT DO NOTHING;

-- Email for: Antonia Bance
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Antonia Bance'), 'email'::ContactChannelType, 'antonia.bance.mp@parliament.uk', 'antonia.bance.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Paula Barker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paula Barker'), 'phone'::ContactChannelType, '0151 724 5767', '0151 724 5767', '01517245767')
ON CONFLICT DO NOTHING;

-- Email for: Paula Barker
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paula Barker'), 'email'::ContactChannelType, 'paula.barker.mp@parliament.uk', 'paula.barker.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Lee Barron
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Barron'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Lee Barron
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Barron'), 'email'::ContactChannelType, 'lee.barron.mp@parliament.uk', 'lee.barron.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Alex Barros-Curtis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Barros-Curtis'), 'phone'::ContactChannelType, '020 7219 6387', '020 7219 6387', '02072196387')
ON CONFLICT DO NOTHING;

-- Email for: Alex Barros-Curtis
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Barros-Curtis'), 'email'::ContactChannelType, 'alex.barroscurtis.mp@parliament.uk', 'alex.barroscurtis.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Johanna Baxter
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Johanna Baxter'), 'phone'::ContactChannelType, '020 7219 8493', '020 7219 8493', '02072198493')
ON CONFLICT DO NOTHING;

-- Email for: Johanna Baxter
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Johanna Baxter'), 'email'::ContactChannelType, 'johanna.baxter.mp@parliament.uk', 'johanna.baxter.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Danny Beales
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Danny Beales'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Danny Beales
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Danny Beales'), 'email'::ContactChannelType, 'danny.beales.mp@parliament.uk', 'danny.beales.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Lorraine Beavers
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lorraine Beavers'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Lorraine Beavers
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lorraine Beavers'), 'email'::ContactChannelType, 'lorraine.beavers.mp@parliament.uk', 'lorraine.beavers.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Torsten Bell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Torsten Bell'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Torsten Bell
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Torsten Bell'), 'email'::ContactChannelType, 'torsten.bell.mp@parliament.uk', 'torsten.bell.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Hilary Benn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hilary Benn'), 'phone'::ContactChannelType, '020 7219 5770', '020 7219 5770', '02072195770')
ON CONFLICT DO NOTHING;

-- Email for: Hilary Benn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Hilary Benn'), 'email'::ContactChannelType, 'bennh@parliament.uk', 'bennh@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Clive Betts
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Clive Betts'), 'phone'::ContactChannelType, '020 7219 5114', '020 7219 5114', '02072195114')
ON CONFLICT DO NOTHING;

-- Email for: Clive Betts
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Clive Betts'), 'email'::ContactChannelType, 'officeofclivebettsmp@parliament.uk', 'officeofclivebettsmp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Polly Billington
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Polly Billington'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Polly Billington
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Polly Billington'), 'email'::ContactChannelType, 'polly.billington.mp@parliament.uk', 'polly.billington.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Stuart Anderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stuart Anderson'), 'phone'::ContactChannelType, '01746 555025', '01746 555025', '01746555025')
ON CONFLICT DO NOTHING;

-- Email for: Stuart Anderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stuart Anderson'), 'email'::ContactChannelType, 'stuart.anderson.mp@parliament.uk', 'stuart.anderson.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Stuart Andrew
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stuart Andrew'), 'phone'::ContactChannelType, '020 7219 3615', '020 7219 3615', '02072193615')
ON CONFLICT DO NOTHING;

-- Email for: Stuart Andrew
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stuart Andrew'), 'email'::ContactChannelType, 'stuart.andrew.mp@parliament.uk', 'stuart.andrew.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Victoria Atkins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Victoria Atkins'), 'phone'::ContactChannelType, '020 7219 5897', '020 7219 5897', '02072195897')
ON CONFLICT DO NOTHING;

-- Email for: Victoria Atkins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Victoria Atkins'), 'email'::ContactChannelType, 'vmatkins@parliament.uk', 'vmatkins@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Kemi Badenoch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kemi Badenoch'), 'phone'::ContactChannelType, '020 7219 1943', '020 7219 1943', '02072191943')
ON CONFLICT DO NOTHING;

-- Email for: Kemi Badenoch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kemi Badenoch'), 'email'::ContactChannelType, 'kemi.badenoch.mp@parliament.uk', 'kemi.badenoch.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Gareth Bacon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gareth Bacon'), 'phone'::ContactChannelType, '020 7219 8538', '020 7219 8538', '02072198538')
ON CONFLICT DO NOTHING;

-- Email for: Gareth Bacon
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gareth Bacon'), 'email'::ContactChannelType, 'gareth.bacon.mp@parliament.uk', 'gareth.bacon.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Steve Barclay
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steve Barclay'), 'phone'::ContactChannelType, '020 7219 7117', '020 7219 7117', '02072197117')
ON CONFLICT DO NOTHING;

-- Email for: Steve Barclay
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steve Barclay'), 'email'::ContactChannelType, 'stephen.barclay.mp@parliament.uk', 'stephen.barclay.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: James Cleverly
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James Cleverly'), 'phone'::ContactChannelType, '020 7219 8593', '020 7219 8593', '02072198593')
ON CONFLICT DO NOTHING;

-- Email for: James Cleverly
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'James Cleverly'), 'email'::ContactChannelType, 'james.cleverly.mp@parliament.uk', 'james.cleverly.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Geoffrey Clifton-Brown
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Geoffrey Clifton-Brown'), 'phone'::ContactChannelType, '020 7219 5147', '020 7219 5147', '02072195147')
ON CONFLICT DO NOTHING;

-- Email for: Geoffrey Clifton-Brown
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Geoffrey Clifton-Brown'), 'email'::ContactChannelType, 'cliftonbrowng@parliament.uk', 'cliftonbrowng@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Geoffrey Cox
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Geoffrey Cox'), 'phone'::ContactChannelType, '020 7219 4719', '020 7219 4719', '02072194719')
ON CONFLICT DO NOTHING;

-- Email for: Geoffrey Cox
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Geoffrey Cox'), 'email'::ContactChannelType, 'coxg@parliament.uk', 'coxg@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Jeremy Hunt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jeremy Hunt'), 'phone'::ContactChannelType, '020 7219 6813', '020 7219 6813', '02072196813')
ON CONFLICT DO NOTHING;

-- Email for: Jeremy Hunt
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jeremy Hunt'), 'email'::ContactChannelType, 'huntj@parliament.uk', 'huntj@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Gideon Amos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gideon Amos'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Gideon Amos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gideon Amos'), 'email'::ContactChannelType, 'gideon.amos.mp@parliament.uk', 'gideon.amos.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Steff Aquarone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steff Aquarone'), 'phone'::ContactChannelType, '020 7219 7585', '020 7219 7585', '02072197585')
ON CONFLICT DO NOTHING;

-- Email for: Steff Aquarone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Steff Aquarone'), 'email'::ContactChannelType, 'steff.aquarone.mp@parliament.uk', 'steff.aquarone.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Josh Babarinde
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Josh Babarinde'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Josh Babarinde
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Josh Babarinde'), 'email'::ContactChannelType, 'josh.babarinde.mp@parliament.uk', 'josh.babarinde.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Alison Bennett
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alison Bennett'), 'phone'::ContactChannelType, '01444 222192', '01444 222192', '01444222192')
ON CONFLICT DO NOTHING;

-- Email for: Alison Bennett
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alison Bennett'), 'email'::ContactChannelType, 'alison.bennett.mp@parliament.uk', 'alison.bennett.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Alex Brewer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Brewer'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Alex Brewer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alex Brewer'), 'email'::ContactChannelType, 'alex.brewer.mp@parliament.uk', 'alex.brewer.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Jess Brown-Fuller
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jess Brown-Fuller'), 'phone'::ContactChannelType, '07979 301755', '07979 301755', '07979301755')
ON CONFLICT DO NOTHING;

-- Email for: Jess Brown-Fuller
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jess Brown-Fuller'), 'email'::ContactChannelType, 'jess.brownfuller.mp@parliament.uk', 'jess.brownfuller.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: David Chadwick
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Chadwick'), 'phone'::ContactChannelType, '01792 316380', '01792 316380', '01792316380')
ON CONFLICT DO NOTHING;

-- Email for: David Chadwick
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'David Chadwick'), 'email'::ContactChannelType, 'david.chadwick.mp@parliament.uk', 'david.chadwick.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Wendy Chamberlain
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wendy Chamberlain'), 'phone'::ContactChannelType, '020 7219 4409', '020 7219 4409', '02072194409')
ON CONFLICT DO NOTHING;

-- Email for: Wendy Chamberlain
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Wendy Chamberlain'), 'email'::ContactChannelType, 'wendy.chamberlain.mp@parliament.uk', 'wendy.chamberlain.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Danny Chambers
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Danny Chambers'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Danny Chambers
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Danny Chambers'), 'email'::ContactChannelType, 'danny.chambers.mp@parliament.uk', 'danny.chambers.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Ed Davey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ed Davey'), 'phone'::ContactChannelType, '020 7219 4530', '020 7219 4530', '02072194530')
ON CONFLICT DO NOTHING;

-- Email for: Ed Davey
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ed Davey'), 'email'::ContactChannelType, 'edward.davey.mp@parliament.uk', 'edward.davey.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Kirsty Blackman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kirsty Blackman'), 'phone'::ContactChannelType, '020 7219 8791', '020 7219 8791', '02072198791')
ON CONFLICT DO NOTHING;

-- Email for: Kirsty Blackman
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kirsty Blackman'), 'email'::ContactChannelType, 'kirsty.blackman.mp@parliament.uk', 'kirsty.blackman.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Dave Doogan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dave Doogan'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Dave Doogan
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Dave Doogan'), 'email'::ContactChannelType, 'dave.doogan.mp@parliament.uk', 'dave.doogan.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Stephen Flynn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stephen Flynn'), 'phone'::ContactChannelType, '01224 213114', '01224 213114', '01224213114')
ON CONFLICT DO NOTHING;

-- Email for: Stephen Flynn
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stephen Flynn'), 'email'::ContactChannelType, 'stephen.flynn.mp@parliament.uk', 'stephen.flynn.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Stephen Gethins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stephen Gethins'), 'phone'::ContactChannelType, '01382 623200', '01382 623200', '01382623200')
ON CONFLICT DO NOTHING;

-- Email for: Stephen Gethins
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Stephen Gethins'), 'email'::ContactChannelType, 'stephen.gethins.mp@parliament.uk', 'stephen.gethins.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Chris Law
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Law'), 'phone'::ContactChannelType, '01382 848906', '01382 848906', '01382848906')
ON CONFLICT DO NOTHING;

-- Email for: Chris Law
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chris Law'), 'email'::ContactChannelType, 'chris.law.mp@parliament.uk', 'chris.law.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Sian Berry
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sian Berry'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Sian Berry
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sian Berry'), 'email'::ContactChannelType, 'sian.berry.mp@parliament.uk', 'sian.berry.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Carla Denyer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carla Denyer'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Carla Denyer
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carla Denyer'), 'email'::ContactChannelType, 'carla.denyer.mp@parliament.uk', 'carla.denyer.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Ellie Chowns
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ellie Chowns'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Ellie Chowns
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ellie Chowns'), 'email'::ContactChannelType, 'ellie.chowns.mp@parliament.uk', 'ellie.chowns.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Adrian Ramsay
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adrian Ramsay'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Adrian Ramsay
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adrian Ramsay'), 'email'::ContactChannelType, 'adrian.ramsay.mp@parliament.uk', 'adrian.ramsay.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Jim Allister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jim Allister'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Jim Allister
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jim Allister'), 'email'::ContactChannelType, 'jim.allister.mp@parliament.uk', 'jim.allister.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Lee Anderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Anderson'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Lee Anderson
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Lee Anderson'), 'email'::ContactChannelType, 'lee.anderson.mp@parliament.uk', 'lee.anderson.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Nigel Farage
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nigel Farage'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Nigel Farage
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nigel Farage'), 'email'::ContactChannelType, 'nigel.farage.mp@parliament.uk', 'nigel.farage.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: Rupert Lowe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rupert Lowe'), 'phone'::ContactChannelType, '020 7219 3000', '020 7219 3000', '02072193000')
ON CONFLICT DO NOTHING;

-- Email for: Rupert Lowe
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rupert Lowe'), 'email'::ContactChannelType, 'rupert.lowe.mp@parliament.uk', 'rupert.lowe.mp@parliament.uk')
ON CONFLICT DO NOTHING;

-- Phone for: contact@asean.org
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'contact@asean.org'), 'phone'::ContactChannelType, '+62 21 726 2991', '+62 21 7262991', '+62217262991')
ON CONFLICT DO NOTHING;

-- Address for: contact@asean.org
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'contact@asean.org'), 'office_address'::ContactChannelType, 'Jakarta, Indonesia', 'Jakarta, Indonesia', 'Jakarta, Indonesia', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: au-info@au.int
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'au-info@au.int'), 'phone'::ContactChannelType, '+251 11 551 7700', '+251 11 551 7700', '+251115517700')
ON CONFLICT DO NOTHING;

-- Address for: au-info@au.int
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'au-info@au.int'), 'office_address'::ContactChannelType, 'Addis Ababa, Ethiopia', 'Addis Ababa, Ethiopia', 'Addis Ababa, Ethiopia', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: europa@ec.europa.eu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'europa@ec.europa.eu'), 'phone'::ContactChannelType, '+32 2 229 9111', '+32 2 229 91 11', '+3222299111')
ON CONFLICT DO NOTHING;

-- Address for: europa@ec.europa.eu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'europa@ec.europa.eu'), 'office_address'::ContactChannelType, 'Brussels, Belgium', 'Brussels, Belgium', 'Brussels, Belgium', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: inquiries@un.org
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'inquiries@un.org'), 'phone'::ContactChannelType, '+1 212 963 1234', '+1 212-963-1234', '+12129631234')
ON CONFLICT DO NOTHING;

-- Address for: inquiries@un.org
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'inquiries@un.org'), 'office_address'::ContactChannelType, 'New York, USA', 'New York, USA', 'New York, USA', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: info@thecommonwealth.org
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'info@thecommonwealth.org'), 'phone'::ContactChannelType, '+44 20 7747 6500', '+44 20 7747 6500', '+442077476500')
ON CONFLICT DO NOTHING;

-- Address for: info@thecommonwealth.org
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'info@thecommonwealth.org'), 'office_address'::ContactChannelType, 'London, UK', 'London, UK', 'London, UK', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: apecsecretary@apec.org
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'apecsecretary@apec.org'), 'phone'::ContactChannelType, 'Varies by host', 'Varies by host', '')
ON CONFLICT DO NOTHING;

-- Address for: apecsecretary@apec.org
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'apecsecretary@apec.org'), 'office_address'::ContactChannelType, 'See apec.org', 'See apec.org', 'See apec.org', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Emmanuel Macron
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Emmanuel Macron'), 'phone'::ContactChannelType, 'Postal only - see contact guide', 'Postal only - see contact guide', '')
ON CONFLICT DO NOTHING;

-- Address for: Emmanuel Macron
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Emmanuel Macron'), 'office_address'::ContactChannelType, '55 rue du Faubourg-Saint-Honoré, 75008 Paris', '55 rue du Faubourg-Saint-Honoré, 75008 Paris', '55 rue du Faubourg-Saint-Honoré, 75008 Paris', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Sébastien Lecornu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sébastien Lecornu'), 'phone'::ContactChannelType, 'contact.gouv.fr/premier-ministre', 'contact.gouv.fr/premier-ministre', '')
ON CONFLICT DO NOTHING;

-- Address for: Sébastien Lecornu
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sébastien Lecornu'), 'office_address'::ContactChannelType, '57 rue de Varenne, 75700 Paris', '57 rue de Varenne, 75700 Paris', '57 rue de Varenne, 75700 Paris', NULL)
ON CONFLICT DO NOTHING;

-- Phone for: Luiz Inácio Lula da Silva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luiz Inácio Lula da Silva'), 'phone'::ContactChannelType, '+55-61-3411-1000', '+55 61 3411-1000', '+556134111000')
ON CONFLICT DO NOTHING;

-- Email for: Luiz Inácio Lula da Silva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luiz Inácio Lula da Silva'), 'email'::ContactChannelType, 'contato@presidencia.gov.br', 'contato@presidencia.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Luiz Inácio Lula da Silva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luiz Inácio Lula da Silva'), 'website'::ContactChannelType, 'https://www.presidencia.gov.br', 'https://www.presidencia.gov.br')
ON CONFLICT DO NOTHING;

-- Address for: Luiz Inácio Lula da Silva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luiz Inácio Lula da Silva'), 'office_address'::ContactChannelType, 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Geraldo Alckmin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Geraldo Alckmin'), 'phone'::ContactChannelType, '+55-61-2020-9000', '+55 61 2020-9000', '+556120209000')
ON CONFLICT DO NOTHING;

-- Email for: Geraldo Alckmin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Geraldo Alckmin'), 'email'::ContactChannelType, 'info@mdic.gov.br', 'info@mdic.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Geraldo Alckmin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Geraldo Alckmin'), 'website'::ContactChannelType, 'https://www.gov.br/mdic', 'https://www.gov.br/mdic')
ON CONFLICT DO NOTHING;

-- Address for: Geraldo Alckmin
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Geraldo Alckmin'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco C', 'Esplanada dos Ministérios, Bloco C', 'Esplanada dos Ministérios, Bloco C', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Rui Costa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rui Costa'), 'phone'::ContactChannelType, '+55-61-3411-2000', '+55 61 3411-2000', '+556134112000')
ON CONFLICT DO NOTHING;

-- Email for: Rui Costa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rui Costa'), 'email'::ContactChannelType, 'gabinete.chefe@presidencia.gov.br', 'gabinete.chefe@presidencia.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Rui Costa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rui Costa'), 'website'::ContactChannelType, 'https://www.gov.br/gab', 'https://www.gov.br/gab')
ON CONFLICT DO NOTHING;

-- Address for: Rui Costa
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rui Costa'), 'office_address'::ContactChannelType, 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Fernando Haddad
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fernando Haddad'), 'phone'::ContactChannelType, '+55-61-3414-2000', '+55 61 3414-2000', '+556134142000')
ON CONFLICT DO NOTHING;

-- Email for: Fernando Haddad
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fernando Haddad'), 'email'::ContactChannelType, 'info@fazenda.gov.br', 'info@fazenda.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Fernando Haddad
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fernando Haddad'), 'website'::ContactChannelType, 'https://www.gov.br/fazenda', 'https://www.gov.br/fazenda')
ON CONFLICT DO NOTHING;

-- Address for: Fernando Haddad
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Fernando Haddad'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco P', 'Esplanada dos Ministérios, Bloco P', 'Esplanada dos Ministérios, Bloco P', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Mauro Vieira
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mauro Vieira'), 'phone'::ContactChannelType, '+55-61-2030-6160', '+55 61 2030-6160', '+556120306160')
ON CONFLICT DO NOTHING;

-- Email for: Mauro Vieira
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mauro Vieira'), 'email'::ContactChannelType, 'imprensa@itamaraty.gov.br', 'imprensa@itamaraty.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Mauro Vieira
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mauro Vieira'), 'website'::ContactChannelType, 'https://www.gov.br/mre', 'https://www.gov.br/mre')
ON CONFLICT DO NOTHING;

-- Address for: Mauro Vieira
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mauro Vieira'), 'office_address'::ContactChannelType, 'Palácio Itamaraty, Esplanada dos Ministérios Bloco H', 'Palácio Itamaraty, Esplanada dos Ministérios Bloco H', 'Palácio Itamaraty, Esplanada dos Ministérios Bloco H', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: José Múcio Monteiro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'José Múcio Monteiro'), 'phone'::ContactChannelType, '+55-61-3413-5000', '+55 61 3413-5000', '+556134135000')
ON CONFLICT DO NOTHING;

-- Email for: José Múcio Monteiro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'José Múcio Monteiro'), 'email'::ContactChannelType, 'info@defesa.gov.br', 'info@defesa.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: José Múcio Monteiro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'José Múcio Monteiro'), 'website'::ContactChannelType, 'https://www.gov.br/defesa', 'https://www.gov.br/defesa')
ON CONFLICT DO NOTHING;

-- Address for: José Múcio Monteiro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'José Múcio Monteiro'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco Q', 'Esplanada dos Ministérios, Bloco Q', 'Esplanada dos Ministérios, Bloco Q', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Camilo Santana
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Camilo Santana'), 'phone'::ContactChannelType, '+55-61-2022-9000', '+55 61 2022-9000', '+556120229000')
ON CONFLICT DO NOTHING;

-- Email for: Camilo Santana
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Camilo Santana'), 'email'::ContactChannelType, 'info@mec.gov.br', 'info@mec.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Camilo Santana
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Camilo Santana'), 'website'::ContactChannelType, 'https://www.gov.br/mec', 'https://www.gov.br/mec')
ON CONFLICT DO NOTHING;

-- Address for: Camilo Santana
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Camilo Santana'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco L', 'Esplanada dos Ministérios, Bloco L', 'Esplanada dos Ministérios, Bloco L', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Nísia Trindade Lima
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nísia Trindade Lima'), 'phone'::ContactChannelType, '+55-61-3315-2425', '+55 61 3315-2425', '+556133152425')
ON CONFLICT DO NOTHING;

-- Email for: Nísia Trindade Lima
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nísia Trindade Lima'), 'email'::ContactChannelType, 'info@saude.gov.br', 'info@saude.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Nísia Trindade Lima
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nísia Trindade Lima'), 'website'::ContactChannelType, 'https://www.gov.br/saude', 'https://www.gov.br/saude')
ON CONFLICT DO NOTHING;

-- Address for: Nísia Trindade Lima
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Nísia Trindade Lima'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco G', 'Esplanada dos Ministérios, Bloco G', 'Esplanada dos Ministérios, Bloco G', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Carlos Favaro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carlos Favaro'), 'phone'::ContactChannelType, '+55-61-3218-2700', '+55 61 3218-2700', '+556132182700')
ON CONFLICT DO NOTHING;

-- Email for: Carlos Favaro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carlos Favaro'), 'email'::ContactChannelType, 'info@agricultura.gov.br', 'info@agricultura.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Carlos Favaro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carlos Favaro'), 'website'::ContactChannelType, 'https://www.gov.br/agricultura', 'https://www.gov.br/agricultura')
ON CONFLICT DO NOTHING;

-- Address for: Carlos Favaro
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Carlos Favaro'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco D', 'Esplanada dos Ministérios, Bloco D', 'Esplanada dos Ministérios, Bloco D', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Marina Silva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marina Silva'), 'phone'::ContactChannelType, '+55-61-2028-1111', '+55 61 2028-1111', '+556120281111')
ON CONFLICT DO NOTHING;

-- Email for: Marina Silva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marina Silva'), 'email'::ContactChannelType, 'info@mma.gov.br', 'info@mma.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Marina Silva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marina Silva'), 'website'::ContactChannelType, 'https://www.gov.br/mma', 'https://www.gov.br/mma')
ON CONFLICT DO NOTHING;

-- Address for: Marina Silva
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marina Silva'), 'office_address'::ContactChannelType, 'SAIN Lote 2, Ed. Sede do Ibama', 'SAIN Lote 2, Ed. Sede do Ibama', 'SAIN Lote 2, Ed. Sede do Ibama', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Alexandre Silveira
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexandre Silveira'), 'phone'::ContactChannelType, '+55-61-2032-6000', '+55 61 2032-6000', '+556120326000')
ON CONFLICT DO NOTHING;

-- Email for: Alexandre Silveira
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexandre Silveira'), 'email'::ContactChannelType, 'info@mme.gov.br', 'info@mme.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Alexandre Silveira
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexandre Silveira'), 'website'::ContactChannelType, 'https://www.gov.br/mme', 'https://www.gov.br/mme')
ON CONFLICT DO NOTHING;

-- Address for: Alexandre Silveira
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Alexandre Silveira'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco U', 'Esplanada dos Ministérios, Bloco U', 'Esplanada dos Ministérios, Bloco U', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Andréa Siqueira Franco
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andréa Siqueira Franco'), 'phone'::ContactChannelType, '+55-61-2025-3070', '+55 61 2025-3070', '+556120253070')
ON CONFLICT DO NOTHING;

-- Email for: Andréa Siqueira Franco
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andréa Siqueira Franco'), 'email'::ContactChannelType, 'info@mulheres.gov.br', 'info@mulheres.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Andréa Siqueira Franco
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andréa Siqueira Franco'), 'website'::ContactChannelType, 'https://www.gov.br/mulheres', 'https://www.gov.br/mulheres')
ON CONFLICT DO NOTHING;

-- Address for: Andréa Siqueira Franco
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Andréa Siqueira Franco'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco A', 'Esplanada dos Ministérios, Bloco A', 'Esplanada dos Ministérios, Bloco A', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Guilherme Boulos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guilherme Boulos'), 'phone'::ContactChannelType, '+55-61-3411-1894', '+55 61 3411-1894', '+556134111894')
ON CONFLICT DO NOTHING;

-- Email for: Guilherme Boulos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guilherme Boulos'), 'email'::ContactChannelType, 'sgpr.agenda@presidencia.gov.br', 'sgpr.agenda@presidencia.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Guilherme Boulos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guilherme Boulos'), 'website'::ContactChannelType, 'https://www.gov.br/sgpr', 'https://www.gov.br/sgpr')
ON CONFLICT DO NOTHING;

-- Address for: Guilherme Boulos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Guilherme Boulos'), 'office_address'::ContactChannelType, 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Flávio Dino
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Flávio Dino'), 'phone'::ContactChannelType, '+55-61-2025-3088', '+55 61 2025-3088', '+556120253088')
ON CONFLICT DO NOTHING;

-- Email for: Flávio Dino
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Flávio Dino'), 'email'::ContactChannelType, 'chefiadegabinete@mj.gov.br', 'chefiadegabinete@mj.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Flávio Dino
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Flávio Dino'), 'website'::ContactChannelType, 'https://www.gov.br/mj', 'https://www.gov.br/mj')
ON CONFLICT DO NOTHING;

-- Address for: Flávio Dino
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Flávio Dino'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco T', 'Esplanada dos Ministérios, Bloco T', 'Esplanada dos Ministérios, Bloco T', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Renan Filho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Renan Filho'), 'phone'::ContactChannelType, '+55-61-2033-7000', '+55 61 2033-7000', '+556120337000')
ON CONFLICT DO NOTHING;

-- Email for: Renan Filho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Renan Filho'), 'email'::ContactChannelType, 'info@transportes.gov.br', 'info@transportes.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Renan Filho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Renan Filho'), 'website'::ContactChannelType, 'https://www.gov.br/transportes', 'https://www.gov.br/transportes')
ON CONFLICT DO NOTHING;

-- Address for: Renan Filho
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Renan Filho'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco R', 'Esplanada dos Ministérios, Bloco R', 'Esplanada dos Ministérios, Bloco R', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Margherita Sansone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Margherita Sansone'), 'phone'::ContactChannelType, '+55-61-2023-9280', '+55 61 2023-9280', '+556120239280')
ON CONFLICT DO NOTHING;

-- Email for: Margherita Sansone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Margherita Sansone'), 'email'::ContactChannelType, 'info@cultura.gov.br', 'info@cultura.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Margherita Sansone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Margherita Sansone'), 'website'::ContactChannelType, 'https://www.gov.br/cultura', 'https://www.gov.br/cultura')
ON CONFLICT DO NOTHING;

-- Address for: Margherita Sansone
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Margherita Sansone'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco C', 'Esplanada dos Ministérios, Bloco C', 'Esplanada dos Ministérios, Bloco C', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Paulo Pimenta
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paulo Pimenta'), 'phone'::ContactChannelType, '+55-61-3411-1300', '+55 61 3411-1300', '+556134111300')
ON CONFLICT DO NOTHING;

-- Email for: Paulo Pimenta
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paulo Pimenta'), 'email'::ContactChannelType, 'imprensa@presidencia.gov.br', 'imprensa@presidencia.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Paulo Pimenta
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paulo Pimenta'), 'website'::ContactChannelType, 'https://www.gov.br/secom', 'https://www.gov.br/secom')
ON CONFLICT DO NOTHING;

-- Address for: Paulo Pimenta
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Paulo Pimenta'), 'office_address'::ContactChannelType, 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Luciana Santos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luciana Santos'), 'phone'::ContactChannelType, '+55-61-2033-7500', '+55 61 2033-7500', '+556120337500')
ON CONFLICT DO NOTHING;

-- Email for: Luciana Santos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luciana Santos'), 'email'::ContactChannelType, 'info@mcti.gov.br', 'info@mcti.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Luciana Santos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luciana Santos'), 'website'::ContactChannelType, 'https://www.gov.br/mcti', 'https://www.gov.br/mcti')
ON CONFLICT DO NOTHING;

-- Address for: Luciana Santos
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luciana Santos'), 'office_address'::ContactChannelType, 'Esplanada dos Ministérios, Bloco E', 'Esplanada dos Ministérios, Bloco E', 'Esplanada dos Ministérios, Bloco E', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+55-61-3215-8000', '+55 61 3215-8000', '+556132158000')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@camara.leg.br', 'info@camara.leg.br')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www2.camara.leg.br', 'https://www2.camara.leg.br')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Câmara dos Deputados, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Câmara dos Deputados, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Câmara dos Deputados, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+55-61-3303-4569', '+55 61 3303-4569', '+556133034569')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@senado.leg.br', 'info@senado.leg.br')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www12.senado.leg.br', 'https://www12.senado.leg.br')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Senado Federal, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Senado Federal, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Senado Federal, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'phone'::ContactChannelType, '0800-061-9619', '0800-061-9619', '08000619619')
ON CONFLICT DO NOTHING;

-- Email for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'email'::ContactChannelType, 'publico@camara.leg.br', 'publico@camara.leg.br')
ON CONFLICT DO NOTHING;

-- Website for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'website'::ContactChannelType, 'https://www2.camara.leg.br', 'https://www2.camara.leg.br')
ON CONFLICT DO NOTHING;

-- Address for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'office_address'::ContactChannelType, 'Câmara dos Deputados, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Câmara dos Deputados, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Câmara dos Deputados, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'phone'::ContactChannelType, '0800-061-2211', '0800-061-2211', '08000612211')
ON CONFLICT DO NOTHING;

-- Email for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'email'::ContactChannelType, 'publico@senado.leg.br', 'publico@senado.leg.br')
ON CONFLICT DO NOTHING;

-- Website for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'website'::ContactChannelType, 'https://www12.senado.leg.br', 'https://www12.senado.leg.br')
ON CONFLICT DO NOTHING;

-- Address for: Public Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Public Services'), 'office_address'::ContactChannelType, 'Senado Federal, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Senado Federal, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Senado Federal, Palácio do Congresso Nacional, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'phone'::ContactChannelType, '+55-61-3411-1000', '+55 61 3411-1000', '+556134111000')
ON CONFLICT DO NOTHING;

-- Email for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'email'::ContactChannelType, 'contato@presidencia.gov.br', 'contato@presidencia.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'website'::ContactChannelType, 'https://www.presidencia.gov.br', 'https://www.presidencia.gov.br')
ON CONFLICT DO NOTHING;

-- Address for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'office_address'::ContactChannelType, 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Chief of Staff Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chief of Staff Office'), 'phone'::ContactChannelType, '+55-61-3411-2000', '+55 61 3411-2000', '+556134112000')
ON CONFLICT DO NOTHING;

-- Email for: Chief of Staff Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chief of Staff Office'), 'email'::ContactChannelType, 'gabinete.chefe@presidencia.gov.br', 'gabinete.chefe@presidencia.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Chief of Staff Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chief of Staff Office'), 'website'::ContactChannelType, 'https://www.gov.br/gab', 'https://www.gov.br/gab')
ON CONFLICT DO NOTHING;

-- Address for: Chief of Staff Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Chief of Staff Office'), 'office_address'::ContactChannelType, 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Palácio do Planalto, Praça dos Três Poderes', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Ministry of Foreign Affairs
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ministry of Foreign Affairs'), 'phone'::ContactChannelType, '+55-61-2030-6160', '+55 61 2030-6160', '+556120306160')
ON CONFLICT DO NOTHING;

-- Email for: Ministry of Foreign Affairs
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ministry of Foreign Affairs'), 'email'::ContactChannelType, 'imprensa@itamaraty.gov.br', 'imprensa@itamaraty.gov.br')
ON CONFLICT DO NOTHING;

-- Website for: Ministry of Foreign Affairs
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ministry of Foreign Affairs'), 'website'::ContactChannelType, 'https://www.gov.br/mre', 'https://www.gov.br/mre')
ON CONFLICT DO NOTHING;

-- Address for: Ministry of Foreign Affairs
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ministry of Foreign Affairs'), 'office_address'::ContactChannelType, 'Palácio Itamaraty, Esplanada dos Ministérios Bloco H', 'Palácio Itamaraty, Esplanada dos Ministérios Bloco H', 'Palácio Itamaraty, Esplanada dos Ministérios Bloco H', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Attorney General's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Attorney General''s Office'), 'phone'::ContactChannelType, '+55-61-3105-6111', '+55 61 3105-6111', '+556131056111')
ON CONFLICT DO NOTHING;

-- Email for: Attorney General's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Attorney General''s Office'), 'email'::ContactChannelType, 'protocolo@mpf.mp.br', 'protocolo@mpf.mp.br')
ON CONFLICT DO NOTHING;

-- Website for: Attorney General's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Attorney General''s Office'), 'website'::ContactChannelType, 'https://www.mpf.mp.br', 'https://www.mpf.mp.br')
ON CONFLICT DO NOTHING;

-- Address for: Attorney General's Office
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Attorney General''s Office'), 'office_address'::ContactChannelType, 'SAFS Quadra 4, Bloco J, Lote 2 e 3', 'SAFS Quadra 4, Bloco J, Lote 2 e 3', 'SAFS Quadra 4, Bloco J, Lote 2 e 3', 'Brasília')
ON CONFLICT DO NOTHING;

-- Phone for: Claudia Sheinbaum Pardo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Claudia Sheinbaum Pardo'), 'phone'::ContactChannelType, '+52 (0)55 5093-4900', '+52 (0)55 5093-4900', '+5205550934900')
ON CONFLICT DO NOTHING;

-- Email for: Claudia Sheinbaum Pardo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Claudia Sheinbaum Pardo'), 'email'::ContactChannelType, 'presidencia@presidencia.gob.mx', 'presidencia@presidencia.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Claudia Sheinbaum Pardo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Claudia Sheinbaum Pardo'), 'website'::ContactChannelType, 'https://www.presidencia.gob.mx', 'https://www.presidencia.gob.mx')
ON CONFLICT DO NOTHING;

-- Address for: Claudia Sheinbaum Pardo
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Claudia Sheinbaum Pardo'), 'office_address'::ContactChannelType, 'Puerta 8 Palacio Nacional, Plaza de la Constitución S/N', 'Puerta 8 Palacio Nacional, Plaza de la Constitución S/N', 'Puerta 8 Palacio Nacional, Plaza de la Constitución S/N', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Juan Ramón de la Fuente
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Juan Ramón de la Fuente'), 'phone'::ContactChannelType, '+52 (0)55 3686-5100', '+52 (0)55 3686-5100', '+5205536865100')
ON CONFLICT DO NOTHING;

-- Email for: Juan Ramón de la Fuente
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Juan Ramón de la Fuente'), 'email'::ContactChannelType, 'comunicacion@sre.gob.mx', 'comunicacion@sre.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Juan Ramón de la Fuente
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Juan Ramón de la Fuente'), 'website'::ContactChannelType, 'https://www.gob.mx/sre', 'https://www.gob.mx/sre')
ON CONFLICT DO NOTHING;

-- Address for: Juan Ramón de la Fuente
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Juan Ramón de la Fuente'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Marcelo Ebrard Casaubón
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marcelo Ebrard Casaubón'), 'phone'::ContactChannelType, '+52 (0)55 5729-9100', '+52 (0)55 5729-9100', '+5205557299100')
ON CONFLICT DO NOTHING;

-- Email for: Marcelo Ebrard Casaubón
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marcelo Ebrard Casaubón'), 'email'::ContactChannelType, 'gabinete@economia.gob.mx', 'gabinete@economia.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Marcelo Ebrard Casaubón
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marcelo Ebrard Casaubón'), 'website'::ContactChannelType, 'https://www.gob.mx/se', 'https://www.gob.mx/se')
ON CONFLICT DO NOTHING;

-- Address for: Marcelo Ebrard Casaubón
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marcelo Ebrard Casaubón'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Rogelio Ramírez de la O
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rogelio Ramírez de la O'), 'phone'::ContactChannelType, '+52 (0)55 3688-1100', '+52 (0)55 3688-1100', '+5205536881100')
ON CONFLICT DO NOTHING;

-- Email for: Rogelio Ramírez de la O
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rogelio Ramírez de la O'), 'email'::ContactChannelType, 'gabinete@hacienda.gob.mx', 'gabinete@hacienda.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Rogelio Ramírez de la O
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rogelio Ramírez de la O'), 'website'::ContactChannelType, 'https://www.gob.mx/shcp', 'https://www.gob.mx/shcp')
ON CONFLICT DO NOTHING;

-- Address for: Rogelio Ramírez de la O
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rogelio Ramírez de la O'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Rosa Icela Rodríguez Mixtega
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosa Icela Rodríguez Mixtega'), 'phone'::ContactChannelType, '+52 (0)55 5209-8800', '+52 (0)55 5209-8800', '+5205552098800')
ON CONFLICT DO NOTHING;

-- Email for: Rosa Icela Rodríguez Mixtega
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosa Icela Rodríguez Mixtega'), 'email'::ContactChannelType, 'contacto@segob.gob.mx', 'contacto@segob.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Rosa Icela Rodríguez Mixtega
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosa Icela Rodríguez Mixtega'), 'website'::ContactChannelType, 'https://www.gob.mx/segob', 'https://www.gob.mx/segob')
ON CONFLICT DO NOTHING;

-- Address for: Rosa Icela Rodríguez Mixtega
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosa Icela Rodríguez Mixtega'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Omar García Harfuch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Omar García Harfuch'), 'phone'::ContactChannelType, '+52 (0)55 5080-1000', '+52 (0)55 5080-1000', '+5205550801000')
ON CONFLICT DO NOTHING;

-- Email for: Omar García Harfuch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Omar García Harfuch'), 'email'::ContactChannelType, 'comunicacion@sspc.gob.mx', 'comunicacion@sspc.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Omar García Harfuch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Omar García Harfuch'), 'website'::ContactChannelType, 'https://www.gob.mx/sspc', 'https://www.gob.mx/sspc')
ON CONFLICT DO NOTHING;

-- Address for: Omar García Harfuch
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Omar García Harfuch'), 'office_address'::ContactChannelType, 'Av. Insurgentes Sur No. 2150', 'Av. Insurgentes Sur No. 2150', 'Av. Insurgentes Sur No. 2150', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Luis Cresencio Sandoval González
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Cresencio Sandoval González'), 'phone'::ContactChannelType, '+52 (0)55 2122-8800', '+52 (0)55 2122-8800', '+5205521228800')
ON CONFLICT DO NOTHING;

-- Email for: Luis Cresencio Sandoval González
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Cresencio Sandoval González'), 'email'::ContactChannelType, 'gabinete@sedena.gob.mx', 'gabinete@sedena.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Luis Cresencio Sandoval González
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Cresencio Sandoval González'), 'website'::ContactChannelType, 'https://www.gob.mx/sedena', 'https://www.gob.mx/sedena')
ON CONFLICT DO NOTHING;

-- Address for: Luis Cresencio Sandoval González
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luis Cresencio Sandoval González'), 'office_address'::ContactChannelType, 'Blvd. 20 de Noviembre s/n', 'Blvd. 20 de Noviembre s/n', 'Blvd. 20 de Noviembre s/n', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Iván Martín Olivares Bonilla
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Iván Martín Olivares Bonilla'), 'phone'::ContactChannelType, '+52 (0)55 5624-6500', '+52 (0)55 5624-6500', '+5205556246500')
ON CONFLICT DO NOTHING;

-- Email for: Iván Martín Olivares Bonilla
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Iván Martín Olivares Bonilla'), 'email'::ContactChannelType, 'comunicacion@semar.gob.mx', 'comunicacion@semar.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Iván Martín Olivares Bonilla
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Iván Martín Olivares Bonilla'), 'website'::ContactChannelType, 'https://www.gob.mx/semar', 'https://www.gob.mx/semar')
ON CONFLICT DO NOTHING;

-- Address for: Iván Martín Olivares Bonilla
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Iván Martín Olivares Bonilla'), 'office_address'::ContactChannelType, 'Eje 2 Norte 926', 'Eje 2 Norte 926', 'Eje 2 Norte 926', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Mario Delgado
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mario Delgado'), 'phone'::ContactChannelType, '+52 (0)55 3601-7599', '+52 (0)55 3601-7599', '+5205536017599')
ON CONFLICT DO NOTHING;

-- Email for: Mario Delgado
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mario Delgado'), 'email'::ContactChannelType, 'gabinete@sep.gob.mx', 'gabinete@sep.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Mario Delgado
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mario Delgado'), 'website'::ContactChannelType, 'https://www.gob.mx/sep', 'https://www.gob.mx/sep')
ON CONFLICT DO NOTHING;

-- Address for: Mario Delgado
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Mario Delgado'), 'office_address'::ContactChannelType, 'Av. Universidad s/n', 'Av. Universidad s/n', 'Av. Universidad s/n', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Luz Elena González Escobar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luz Elena González Escobar'), 'phone'::ContactChannelType, '+52 (0)55 5000-6000', '+52 (0)55 5000-6000', '+5205550006000')
ON CONFLICT DO NOTHING;

-- Email for: Luz Elena González Escobar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luz Elena González Escobar'), 'email'::ContactChannelType, 'comunicacion@sener.gob.mx', 'comunicacion@sener.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Luz Elena González Escobar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luz Elena González Escobar'), 'website'::ContactChannelType, 'https://www.gob.mx/sener', 'https://www.gob.mx/sener')
ON CONFLICT DO NOTHING;

-- Address for: Luz Elena González Escobar
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Luz Elena González Escobar'), 'office_address'::ContactChannelType, 'Insurgentes Sur 890, Del Valle', 'Insurgentes Sur 890, Del Valle', 'Insurgentes Sur 890, Del Valle', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Ariadna Montiel Reyes
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ariadna Montiel Reyes'), 'phone'::ContactChannelType, '+52 (0)55 5328-5000', '+52 (0)55 5328-5000', '+5205553285000')
ON CONFLICT DO NOTHING;

-- Email for: Ariadna Montiel Reyes
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ariadna Montiel Reyes'), 'email'::ContactChannelType, 'comunicacion@bienestar.gob.mx', 'comunicacion@bienestar.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Ariadna Montiel Reyes
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ariadna Montiel Reyes'), 'website'::ContactChannelType, 'https://www.gob.mx/bienestar', 'https://www.gob.mx/bienestar')
ON CONFLICT DO NOTHING;

-- Address for: Ariadna Montiel Reyes
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Ariadna Montiel Reyes'), 'office_address'::ContactChannelType, 'Prol. Paseo de la Reforma 505', 'Prol. Paseo de la Reforma 505', 'Prol. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Salomón Jara Cruz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salomón Jara Cruz'), 'phone'::ContactChannelType, '+52 (0)55 5128-0000', '+52 (0)55 5128-0000', '+5205551280000')
ON CONFLICT DO NOTHING;

-- Email for: Salomón Jara Cruz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salomón Jara Cruz'), 'email'::ContactChannelType, 'gabinete@salud.gob.mx', 'gabinete@salud.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Salomón Jara Cruz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salomón Jara Cruz'), 'website'::ContactChannelType, 'https://www.gob.mx/salud', 'https://www.gob.mx/salud')
ON CONFLICT DO NOTHING;

-- Address for: Salomón Jara Cruz
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Salomón Jara Cruz'), 'office_address'::ContactChannelType, 'Lieja 7, Juárez', 'Lieja 7, Juárez', 'Lieja 7, Juárez', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Marath Baruch Bolaños López
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marath Baruch Bolaños López'), 'phone'::ContactChannelType, '+52 (0)55 2000-5300', '+52 (0)55 2000-5300', '+5205520005300')
ON CONFLICT DO NOTHING;

-- Email for: Marath Baruch Bolaños López
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marath Baruch Bolaños López'), 'email'::ContactChannelType, 'comunicacion@stps.gob.mx', 'comunicacion@stps.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Marath Baruch Bolaños López
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marath Baruch Bolaños López'), 'website'::ContactChannelType, 'https://www.gob.mx/stps', 'https://www.gob.mx/stps')
ON CONFLICT DO NOTHING;

-- Address for: Marath Baruch Bolaños López
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Marath Baruch Bolaños López'), 'office_address'::ContactChannelType, 'Av. Lázaro Cárdenas 911', 'Av. Lázaro Cárdenas 911', 'Av. Lázaro Cárdenas 911', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Adenauer Hernández García
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adenauer Hernández García'), 'phone'::ContactChannelType, '+52 (0)55 3871-1000', '+52 (0)55 3871-1000', '+5205538711000')
ON CONFLICT DO NOTHING;

-- Email for: Adenauer Hernández García
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adenauer Hernández García'), 'email'::ContactChannelType, 'gabinete@agricultura.gob.mx', 'gabinete@agricultura.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Adenauer Hernández García
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adenauer Hernández García'), 'website'::ContactChannelType, 'https://www.gob.mx/agricultura', 'https://www.gob.mx/agricultura')
ON CONFLICT DO NOTHING;

-- Address for: Adenauer Hernández García
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Adenauer Hernández García'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Rosaura Ruiz Gutiérrez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosaura Ruiz Gutiérrez'), 'phone'::ContactChannelType, '+52 (0)55 5490-0900', '+52 (0)55 5490-0900', '+5205554900900')
ON CONFLICT DO NOTHING;

-- Email for: Rosaura Ruiz Gutiérrez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosaura Ruiz Gutiérrez'), 'email'::ContactChannelType, 'comunicacion@semarnat.gob.mx', 'comunicacion@semarnat.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Rosaura Ruiz Gutiérrez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosaura Ruiz Gutiérrez'), 'website'::ContactChannelType, 'https://www.gob.mx/semarnat', 'https://www.gob.mx/semarnat')
ON CONFLICT DO NOTHING;

-- Address for: Rosaura Ruiz Gutiérrez
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Rosaura Ruiz Gutiérrez'), 'office_address'::ContactChannelType, 'Av. Ejército Nacional 223', 'Av. Ejército Nacional 223', 'Av. Ejército Nacional 223', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Julio Berdegué Sacristán
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Julio Berdegué Sacristán'), 'phone'::ContactChannelType, '+52 (0)55 5624-0000', '+52 (0)55 5624-0000', '+5205556240000')
ON CONFLICT DO NOTHING;

-- Email for: Julio Berdegué Sacristán
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Julio Berdegué Sacristán'), 'email'::ContactChannelType, 'gabinete@sedatu.gob.mx', 'gabinete@sedatu.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Julio Berdegué Sacristán
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Julio Berdegué Sacristán'), 'website'::ContactChannelType, 'https://www.gob.mx/sedatu', 'https://www.gob.mx/sedatu')
ON CONFLICT DO NOTHING;

-- Address for: Julio Berdegué Sacristán
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Julio Berdegué Sacristán'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Jesús Antonio Esteva Medina
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jesús Antonio Esteva Medina'), 'phone'::ContactChannelType, '+52 (0)55 5723-9300', '+52 (0)55 5723-9300', '+5205557239300')
ON CONFLICT DO NOTHING;

-- Email for: Jesús Antonio Esteva Medina
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jesús Antonio Esteva Medina'), 'email'::ContactChannelType, 'comunicacion@sct.gob.mx', 'comunicacion@sct.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Jesús Antonio Esteva Medina
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jesús Antonio Esteva Medina'), 'website'::ContactChannelType, 'https://www.gob.mx/sct', 'https://www.gob.mx/sct')
ON CONFLICT DO NOTHING;

-- Address for: Jesús Antonio Esteva Medina
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jesús Antonio Esteva Medina'), 'office_address'::ContactChannelType, 'Av. Xola 2 esq. Universidad', 'Av. Xola 2 esq. Universidad', 'Av. Xola 2 esq. Universidad', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Gisela Gutiérrez de la Torre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gisela Gutiérrez de la Torre'), 'phone'::ContactChannelType, '+52 (0)55 4155-0200', '+52 (0)55 4155-0200', '+5205541550200')
ON CONFLICT DO NOTHING;

-- Email for: Gisela Gutiérrez de la Torre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gisela Gutiérrez de la Torre'), 'email'::ContactChannelType, 'gabinete@cultura.gob.mx', 'gabinete@cultura.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Gisela Gutiérrez de la Torre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gisela Gutiérrez de la Torre'), 'website'::ContactChannelType, 'https://www.gob.mx/cultura', 'https://www.gob.mx/cultura')
ON CONFLICT DO NOTHING;

-- Address for: Gisela Gutiérrez de la Torre
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Gisela Gutiérrez de la Torre'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Kathia Barrera Peña
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kathia Barrera Peña'), 'phone'::ContactChannelType, '+52 (0)55 3002-6300', '+52 (0)55 3002-6300', '+5205530026300')
ON CONFLICT DO NOTHING;

-- Email for: Kathia Barrera Peña
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kathia Barrera Peña'), 'email'::ContactChannelType, 'comunicacion@sectur.gob.mx', 'comunicacion@sectur.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Kathia Barrera Peña
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kathia Barrera Peña'), 'website'::ContactChannelType, 'https://www.gob.mx/sectur', 'https://www.gob.mx/sectur')
ON CONFLICT DO NOTHING;

-- Address for: Kathia Barrera Peña
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Kathia Barrera Peña'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Sergio González López
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergio González López'), 'phone'::ContactChannelType, '+52 (0)55 3000-0700', '+52 (0)55 3000-0700', '+5205530000700')
ON CONFLICT DO NOTHING;

-- Email for: Sergio González López
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergio González López'), 'email'::ContactChannelType, 'gabinete@conade.gob.mx', 'gabinete@conade.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Sergio González López
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergio González López'), 'website'::ContactChannelType, 'https://www.gob.mx/conade', 'https://www.gob.mx/conade')
ON CONFLICT DO NOTHING;

-- Address for: Sergio González López
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Sergio González López'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Scheherazade Sahagún
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Scheherazade Sahagún'), 'phone'::ContactChannelType, '+52 (0)55 2000-3000', '+52 (0)55 2000-3000', '+5205520003000')
ON CONFLICT DO NOTHING;

-- Email for: Scheherazade Sahagún
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Scheherazade Sahagún'), 'email'::ContactChannelType, 'comunicacion@sfp.gob.mx', 'comunicacion@sfp.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Scheherazade Sahagún
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Scheherazade Sahagún'), 'website'::ContactChannelType, 'https://www.gob.mx/sfp', 'https://www.gob.mx/sfp')
ON CONFLICT DO NOTHING;

-- Address for: Scheherazade Sahagún
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Scheherazade Sahagún'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Jaime Cárdenas Gracia
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jaime Cárdenas Gracia'), 'phone'::ContactChannelType, '+52 (0)55 5093-4900', '+52 (0)55 5093-4900', '+5205550934900')
ON CONFLICT DO NOTHING;

-- Email for: Jaime Cárdenas Gracia
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jaime Cárdenas Gracia'), 'email'::ContactChannelType, 'presidencia@presidencia.gob.mx', 'presidencia@presidencia.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Jaime Cárdenas Gracia
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jaime Cárdenas Gracia'), 'website'::ContactChannelType, 'https://www.presidencia.gob.mx', 'https://www.presidencia.gob.mx')
ON CONFLICT DO NOTHING;

-- Address for: Jaime Cárdenas Gracia
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Jaime Cárdenas Gracia'), 'office_address'::ContactChannelType, 'Puerta 8 Palacio Nacional', 'Puerta 8 Palacio Nacional', 'Puerta 8 Palacio Nacional', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+52 (0)55 5628-1300', '+52 (0)55 5628-1300', '+5205556281300')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@diputados.gob.mx', 'info@diputados.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.diputados.gob.mx', 'https://www.diputados.gob.mx')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Av. Congreso de la Unión No. 66', 'Av. Congreso de la Unión No. 66', 'Av. Congreso de la Unión No. 66', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'phone'::ContactChannelType, '+52 (0)55 5534-3000', '+52 (0)55 5534-3000', '+5205555343000')
ON CONFLICT DO NOTHING;

-- Email for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'email'::ContactChannelType, 'info@senado.gob.mx', 'info@senado.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'website'::ContactChannelType, 'https://www.senado.gob.mx', 'https://www.senado.gob.mx')
ON CONFLICT DO NOTHING;

-- Address for: Main Reception
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Main Reception'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 135', 'Av. Paseo de la Reforma 135', 'Av. Paseo de la Reforma 135', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Legislative Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Legislative Services'), 'phone'::ContactChannelType, '+52 (0)55 5628-1824', '+52 (0)55 5628-1824', '+5205556281824')
ON CONFLICT DO NOTHING;

-- Email for: Legislative Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Legislative Services'), 'email'::ContactChannelType, 'servicios@diputados.gob.mx', 'servicios@diputados.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Legislative Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Legislative Services'), 'website'::ContactChannelType, 'https://www.diputados.gob.mx', 'https://www.diputados.gob.mx')
ON CONFLICT DO NOTHING;

-- Address for: Legislative Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Legislative Services'), 'office_address'::ContactChannelType, 'Av. Congreso de la Unión No. 66', 'Av. Congreso de la Unión No. 66', 'Av. Congreso de la Unión No. 66', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Legislative Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Legislative Services'), 'phone'::ContactChannelType, '+52 (0)55 5572-2489', '+52 (0)55 5572-2489', '+5205555722489')
ON CONFLICT DO NOTHING;

-- Email for: Legislative Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Legislative Services'), 'email'::ContactChannelType, 'servicios@senado.gob.mx', 'servicios@senado.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Legislative Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Legislative Services'), 'website'::ContactChannelType, 'https://www.senado.gob.mx', 'https://www.senado.gob.mx')
ON CONFLICT DO NOTHING;

-- Address for: Legislative Services
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Legislative Services'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 135', 'Av. Paseo de la Reforma 135', 'Av. Paseo de la Reforma 135', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'phone'::ContactChannelType, '+52 (0)55 5093-4900', '+52 (0)55 5093-4900', '+5205550934900')
ON CONFLICT DO NOTHING;

-- Email for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'email'::ContactChannelType, 'presidencia@presidencia.gob.mx', 'presidencia@presidencia.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'website'::ContactChannelType, 'https://www.presidencia.gob.mx', 'https://www.presidencia.gob.mx')
ON CONFLICT DO NOTHING;

-- Address for: Office of the President
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Office of the President'), 'office_address'::ContactChannelType, 'Puerta 8 Palacio Nacional, Plaza de la Constitución S/N', 'Puerta 8 Palacio Nacional, Plaza de la Constitución S/N', 'Puerta 8 Palacio Nacional, Plaza de la Constitución S/N', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Citizen Services Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services Hotline'), 'phone'::ContactChannelType, '01-800-080-1127', '01-800-080-1127', '018000801127')
ON CONFLICT DO NOTHING;

-- Email for: Citizen Services Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services Hotline'), 'email'::ContactChannelType, 'ciudadania@presidencia.gob.mx', 'ciudadania@presidencia.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Citizen Services Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services Hotline'), 'website'::ContactChannelType, 'https://www.presidencia.gob.mx', 'https://www.presidencia.gob.mx')
ON CONFLICT DO NOTHING;

-- Address for: Citizen Services Hotline
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Citizen Services Hotline'), 'office_address'::ContactChannelType, 'Palacio Nacional', 'Palacio Nacional', 'Palacio Nacional', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Government Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Government Information'), 'phone'::ContactChannelType, '+52 (0)55 5209-8800', '+52 (0)55 5209-8800', '+5205552098800')
ON CONFLICT DO NOTHING;

-- Email for: Government Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Government Information'), 'email'::ContactChannelType, 'contacto@segob.gob.mx', 'contacto@segob.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Government Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Government Information'), 'website'::ContactChannelType, 'https://www.gob.mx/segob', 'https://www.gob.mx/segob')
ON CONFLICT DO NOTHING;

-- Address for: Government Information
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Government Information'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

-- Phone for: Federal Judiciary
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, phone_normalized) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Federal Judiciary'), 'phone'::ContactChannelType, '+52 (0)55 4000-1000', '+52 (0)55 4000-1000', '+5205540001000')
ON CONFLICT DO NOTHING;

-- Email for: Federal Judiciary
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Federal Judiciary'), 'email'::ContactChannelType, 'info@pjf.gob.mx', 'info@pjf.gob.mx')
ON CONFLICT DO NOTHING;

-- Website for: Federal Judiciary
INSERT INTO contact_channels (contact_id, channel_type, value, display_value) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Federal Judiciary'), 'website'::ContactChannelType, 'https://www.pjf.gob.mx', 'https://www.pjf.gob.mx')
ON CONFLICT DO NOTHING;

-- Address for: Federal Judiciary
INSERT INTO contact_channels (contact_id, channel_type, value, display_value, address_line_1, city) VALUES
    ((SELECT id FROM contacts WHERE full_name = 'Federal Judiciary'), 'office_address'::ContactChannelType, 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Av. Paseo de la Reforma 505', 'Mexico City')
ON CONFLICT DO NOTHING;

