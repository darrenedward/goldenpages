# Database Seeding Guide

## Overview

The database has been seeded with **real data** extracted from Excel spreadsheets via Python scripts located in `Country Contacts/`.

## Generated Files

All files are in `/prisma/seeds/`:

| File | Records | Description |
|------|---------|-------------|
| `001_regions.sql` | 23 countries | Countries and regions (US, UK, China, etc.) |
| `002_organisations.sql` | 64 organizations | Government bodies, corporations, diplomatic missions |
| `004_contacts.sql` | 1,028 contacts | Individual people within organizations |
| `005_contact_channels.sql` | 13,606 records | Phone, email, website, and address data |

## Method 1: Supabase Dashboard (Recommended)

1. Go to your Supabase project: https://ywvdextusnszhbqpexgb.supabase.co
2. Navigate to **SQL Editor**
3. Run the SQL files in order:
   - `001_regions.sql`
   - `002_organisations.sql`
   - `004_contacts.sql`
   - `005_contact_channels.sql`

## Method 2: Using Prisma Push

```bash
# Push the schema to Supabase
npm run db:push

# Then use the SQL files via Supabase SQL Editor or psql
```

## Method 3: Direct PostgreSQL Connection

If you have the database connection string:

```bash
# Set DATABASE_URL in .env.local
DATABASE_URL="postgresql://postgres:[password]@db.ywvdextusnszhbqpexgb.supabase.co:5432/postgres"

# Execute SQL files in order
psql $DATABASE_URL -f prisma/seeds/001_regions.sql
psql $DATABASE_URL -f prisma/seeds/002_organisations.sql
psql $DATABASE_URL -f prisma/seeds/004_contacts.sql
psql $DATABASE_URL -f prisma/seeds/005_contact_channels.sql
```

## Data Summary

| Metric | Count |
|--------|-------|
| Countries | 23 |
| Organizations | 64 |
| Contacts | 1,028 |
| Contact Channels | 13,606 |
| Excel Files Processed | 23 |
| Departments Found | 128 |

## Organization Types

- **government** - National governments, ministries, agencies
- **corporate** - Corporations and businesses
- **diplomatic_mission** - Embassies, consulates, missions
- **international_organization** - EU, AU, UN, etc.

## Regions Covered

- Americas: US, Canada, Argentina, Brazil, Mexico
- Europe: UK, Germany, France, Italy, EU, Russia, Turkey
- Asia: China, India, Japan, South Korea, Indonesia, Saudi Arabia
- Oceania: Australia, New Zealand
- Africa: South Africa, African Union
- International: Various global organizations
