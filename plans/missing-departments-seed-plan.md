# Seed File Plan: Missing Departments for Argentina, Italy, and New Zealand

## Overview

This plan outlines the creation of a SQL seed file to add missing government departments for:
1. **Argentina Government** (organisation ID: `6a330f5c-7861-42c1-a1d0-2424eed7b396`)
2. **Italy Government** (organisation ID: `0bc40e8f-067c-4d96-be96-f8d22b5cf036`)
3. **New Zealand Government** (to be created or use existing ID)

## Department Structure

Based on the existing pattern in the database (UK, Australia, Canada, Mexico), each government will receive the following standard cabinet departments:

| Code | Department Name | Description |
| --- | --- | --- |
| EXEC | Executive Office / Prime Minister | Executive Office department |
| FIN | Finance | Finance department |
| FA | Foreign Affairs | Foreign Affairs department |
| DEF | Defense | Defense department |
| HLTH | Health | Health department |
| EDU | Education | Education department |
| INT | Interior | Interior department |
| JUST | Justice | Justice department |
| AGRI | Agriculture | Agriculture department |
| ENV | Environment | Environment department |
| TRANS | Transportation | Transportation department |
| LABOR | Labor | Labor department |
| COMM | Commerce | Commerce department |
| IND | Industry | Industry department |
| PARL | Parliament | Parliament department |
| ENGY | Energy | Energy department |

## Seed File Structure

The SQL will follow the existing pattern from `prisma/seeds/03_departments.sql`:

```sql
INSERT INTO departments ("id", "name", "code", "description", "organisationId", "parentId", "isActive", "createdAt", "updatedAt", "createdBy", "updatedBy") VALUES
  (uuid, 'Department Name', 'CODE', 'Department description', 'organisation-uuid', NULL, TRUE, NOW(), NOW(), NULL, NULL);
```

## Implementation Steps

1. Create new seed file: `prisma/seeds/06_missing_departments.sql`
2. Generate UUIDs for each department
3. Add departments for Argentina Government
4. Add departments for Italy Government
5. Add departments for New Zealand Government
6. Include ON CONFLICT DO NOTHING to handle any duplicates

## File Location

- Target file: `prisma/seeds/06_missing_departments.sql`
- Total departments to create: ~48 (16 departments × 3 governments)
