# Diplomatic Missions to New Zealand - Migration Guide

## Overview

This migration restructures the diplomatic missions (High Commissions, Embassies) to New Zealand from being separate organizations with NZ as head office, to being **departments under their sending country's organization**.

## Problem

**Current (Incorrect) Structure:**
```
Organization: "Diplomatic Missions To New Zealand"
├── head_office_country: New Zealand (NZ) ❌
└── Contacts: 80+ Ambassadors/High Commissioners from various countries
    ├── HE Ms Neeta Bhushan (India's High Commissioner)
    ├── HE Mr Wang Xiaolong (China's Ambassador)
    └── ... (all countries lumped together)
```

**Correct Structure After Migration:**
```
Organization: India (Government of India)
├── head_office_country: India (IN) ✅
└── Departments:
    ├── Prime Minister's Office
    ├── Ministry of Finance
    └── High Commission to New Zealand ← DIPLOMATIC MISSION AS DEPARTMENT
        └── Contacts: HE Ms Neeta Bhushan (High Commissioner)
        └── Location: Wellington, New Zealand (physical address)
```

## Files Created

| File | Purpose |
|------|---------|
| `prisma/seeds/02b_missing_diplomatic_orgs.sql` | Creates missing country organizations |
| `prisma/seeds/03b_diplomatic_missions_departments.sql` | Creates diplomatic mission departments |
| `prisma/seeds/08_update_diplomatic_contacts.sql` | Updates contacts to link to departments |
| `scripts/migrate-diplomatic-missions.ts` | TypeScript migration script |

## Migration Steps

### Option 1: Run SQL Files Directly (Recommended for Supabase)

1. **Run in order:**
   ```bash
   # In Supabase SQL Editor or via psql
   \i prisma/seeds/02b_missing_diplomatic_orgs.sql
   \i prisma/seeds/03b_diplomatic_missions_departments.sql
   \i prisma/seeds/08_update_diplomatic_contacts.sql
   ```

2. **Verify migration:**
   ```sql
   -- Check contacts now linked to departments
   SELECT c.full_name, c.role_title, d.name as department, o.name as organisation
   FROM contacts c
   LEFT JOIN departments d ON c."departmentId" = d.id
   LEFT JOIN organisations o ON c."organisation_id" = o.id
   WHERE c."departmentId" IS NOT NULL
     AND d.name LIKE '%New Zealand%'
   ORDER BY o.name, c.full_name;
   ```

### Option 2: Run TypeScript Migration Script

```bash
npm tsx scripts/migrate-diplomatic-missions.ts
```

## Countries with Diplomatic Missions to NZ

### High Commissions (Commonwealth Countries)
- Botswana
- Fiji
- India
- Lesotho
- Malta
- Papua New Guinea
- Rwanda
- Sierra Leone
- Solomon Islands
- Zimbabwe

### Embassies (Non-Commonwealth Countries)
- Afghanistan
- Bangladesh
- Belgium
- Canada
- Central African Republic
- China
- Dominican Republic
- Ecuador
- Guatemala
- Guinea
- Iceland
- Indonesia
- Iraq
- Kyrgyzstan
- Latvia
- Lebanon
- Lithuania
- Myanmar
- New Zealand (MFAT - diplomatic representation)
- Oman
- Paraguay
- Peru
- Romania
- Russia
- Senegal
- Slovakia
- Suriname
- Turkey
- United Arab Emirates

## Verification Queries

```sql
-- Count contacts by diplomatic mission
SELECT o.name as country, d.name as department, COUNT(*) as contact_count
FROM contacts c
JOIN departments d ON c."departmentId" = d.id
JOIN organisations o ON d."organisationId" = o.id
WHERE d.name LIKE '%New Zealand%'
GROUP BY o.name, d.name
ORDER BY contact_count DESC;

-- Verify no contacts left with old org
SELECT COUNT(*) as orphaned_contacts
FROM contacts c
JOIN organisations o ON c."organisation_id" = o.id
WHERE o.name LIKE '%Diplomatic Missions To New Zealand%'
  AND c."departmentId" IS NULL;
```

## Rollback

If needed, rollback steps:

```sql
-- 1. Restore old organization links
UPDATE contacts c SET
  "organisation_id" = (SELECT id FROM organisations WHERE name LIKE 'Diplomatic Missions To New Zealand%' LIMIT 1),
  "departmentId" = NULL
WHERE "departmentId" IN (
  SELECT id FROM departments WHERE name LIKE '%New Zealand%'
);

-- 2. Delete new departments
DELETE FROM departments WHERE name LIKE '%New Zealand%';

-- 3. Delete new country organizations (if added)
DELETE FROM organisations WHERE id IN (
  'org_af_001', 'org_bd_001', 'org_bj_001', 'org_bw_001', 'org_cf_001',
  'org_do_001', 'org_ec_001', 'org_fj_001', 'org_gn_001', 'org_is_001',
  'org_iq_001', 'org_kg_001', 'org_lb_001', 'org_ls_001', 'org_mm_001',
  'org_mt_001', 'org_om_001', 'org_pg_001', 'org_py_001', 'org_ro_001',
  'org_rw_001', 'org_sn_001', 'org_sk_001', 'org_sb_001', 'org_sr_001',
  'org_ae_001', 'org_zw_001'
);
```

## Notes

1. **Commonwealth vs Non-Commonwealth**: Commonwealth countries use "High Commission" while others use "Embassy"
2. **Location Data**: Each diplomatic mission should have a location in Wellington, NZ recorded in `organisation_locations` table
3. **is_head_office_based**: Diplomatic contacts should have this set to `false` since they're based in Wellington, not their home country
