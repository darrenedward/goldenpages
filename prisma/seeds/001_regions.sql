-- ============================================================================
-- REGIONS SEED DATA
-- Countries and regions for geographic filtering
-- ============================================================================

INSERT INTO regions (name, code, region_type, created_at, updated_at) VALUES
    ('African Union', 'AF', 'country', NOW(), NOW()),
    ('Argentina', 'AR', 'country', NOW(), NOW()),
    ('Australia', 'AU', 'country', NOW(), NOW()),
    ('Brazil', 'BR', 'country', NOW(), NOW()),
    ('Canada', 'CA', 'country', NOW(), NOW()),
    ('China', 'CN', 'country', NOW(), NOW()),
    ('European Union', 'EU', 'country', NOW(), NOW()),
    ('France', 'FR', 'country', NOW(), NOW()),
    ('Germany', 'DE', 'country', NOW(), NOW()),
    ('India', 'IN', 'country', NOW(), NOW()),
    ('Indonesia', 'ID', 'country', NOW(), NOW()),
    ('International', 'XX', 'country', NOW(), NOW()),
    ('Italy', 'IT', 'country', NOW(), NOW()),
    ('Japan', 'JP', 'country', NOW(), NOW()),
    ('Mexico', 'MX', 'country', NOW(), NOW()),
    ('New Zealand', 'NZ', 'country', NOW(), NOW()),
    ('Russia', 'RU', 'country', NOW(), NOW()),
    ('Saudi Arabia', 'SA', 'country', NOW(), NOW()),
    ('South Africa', 'ZA', 'country', NOW(), NOW()),
    ('South Korea', 'KR', 'country', NOW(), NOW()),
    ('Turkey', 'TR', 'country', NOW(), NOW()),
    ('United Kingdom', 'GB', 'country', NOW(), NOW()),
    ('United States', 'US', 'country', NOW(), NOW())
ON CONFLICT (code, region_type) DO NOTHING;
