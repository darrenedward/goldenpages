# Golden Pages PRD

**Version**: 1.0  
**Date**: January 22, 2026  
**Status**: Draft  
**Tech Stack**: Supabase (Postgres/Auth/Storage), Next.js 15 (App Router), React 19, TypeScript, Tailwind CSS, shadcn/ui, Zod  

## Overview

Golden Pages is a centralized, versioned contact directory for organisations (businesses, government agencies, churches, nonprofits) and their key contacts. It prioritizes current ("golden") contact info while preserving historical data, supports physical/digital outreach workflows, and enforces data standards via RBAC-protected CRUD. Built for operational use like letter/email campaigns, with structured imports from XLS like US Government Officials.[file:1]

**Goals**:  
- Reliable single source of truth for outreach.  
- Track changes without data loss.  
- Granular permissions for teams.  
- Bulk import/export for scaling.

## User Roles & Permissions

RBAC via Supabase Auth + RLS + custom permissions table.

| Role | Default Access | Can Grant |
|------|----------------|-----------|
| **Admin** | Full read/write/delete on all | Roles, per-resource perms |
| **User** | Read-only (all public data) | None |
| **Editor** | Read + write (assigned resources) | None |

**Granular perms**: Per-user/resource (e.g. "notes:write on contact #123", "write on org #456"). UI: Share modals with checkboxes. Enforcement: RLS policies + middleware.

**Key features**: Audit logs, ownership (`owner_id`), multi-tenant prep (`tenant_id`).

## Data Model

Normalized Postgres schema with versioning and structured fields.

### Core Tables

**organisations**  
| Field | Type | Constraints |
|-------|------|-------------|
| `id` | uuid | PK |
| `name` | text | Required |
| `type` | enum('business','government','agency','church','nonprofit','other') | Required |
| `parent_org_id` | uuid | Self-FK (hierarchies) |
| `primary_website` | text | URL |
| `country`, `state_region`, `city` | text | Filters |
| `general_mailing_address` | jsonb | `{recipient_line1, street, city, postal_code, country}` |
| `owner_id`, `tenant_id` | uuid | FKs |
| `is_active`, `created_at`, `updated_at` | bool/timestamptz | - |

**contacts** (people)  
| Field | Type | Constraints |
|-------|------|-------------|
| `id` | uuid | PK |
| `organisation_id` | uuid | FK |
| `full_name` | text | Required |
| `role_title` | text | e.g. "President", "Senator"[file:1] |
| `is_primary_contact` | bool | - |
| `owner_id` | uuid | - |

**contact_channels** (versioned)  
| Field | Type | Constraints |
|-------|------|-------------|
| `id` | uuid | PK |
| `contact_id` | uuid | FK |
| `channel_type` | enum('email','phone','postal_address','mailing_address','website','fax','social') | Required |
| `value` | text | e.g. phone display format |
| `normalized_value` | text | e.g. E.164 for phones |
| `postal_details` | jsonb | `{recipient_line1: "The Honorable...", street: "...", postal_code: "..."}`[file:1] |
| `is_current` | bool | One true per type/contact |
| `valid_from`, `valid_to` | timestamptz | Versioning |
| `notes` | text | - |

**notes** (per org/contact)  
| Field | Type | Constraints |
|-------|------|-------------|
| `id` | uuid | PK |
| `resource_type` | enum('organisation','contact') | - |
| `resource_id` | uuid | FK target |
| `author_id` | uuid | FK auth.users |
| `body` | text | Markdown |
| `visibility` | enum('private','team','public') | - |

### Workflow Tables

**outreach_logs**  
| Field | Type | Constraints |
|-------|------|-------------|
| `id` | uuid | PK |
| `contact_id` / `organisation_id` | uuid | FK |
| `channel_used` | enum('mail','email','phone') | - |
| `template_used` | uuid | FK |
| `sent_date`, `response_received` | timestamptz | Nullable |
| `tracking_number`, `status` | text/enum | - |

**letter_templates**  
| Field | Type | Constraints |
|-------|------|-------------|
| `id` | uuid | PK |
| `name` | text | e.g. "US Senator" |
| `body` | text | `{recipient_name}`, `{address}` placeholders |
| `category` | text | "government" etc. |

**RBAC/Audit Tables**  
- `permissions`: `user_id`, `resource_type`, `resource_id`, `permission`
- `activity_logs`: `user_id`, `action`, `resource_type/id`, `old_values` (JSONB)
- `user_profiles`: `role`, `tenant_id`

**Views**: `current_channels_view`, `formatted_addresses_view`, `organisation_directory_view`.

**Standards/Validation** (Zod + triggers): Full postal structure required for mail; one `is_current` per type; formal recipient formats.

## Key Features

### Directory & Search
- Filter by type/region/role; search names/emails.  
- Table: org name, primary contact, current phone/email/postal.

### CRUD with Versioning
- Update email/address → new channel row, old `is_current=false`.  
- History toggle shows all versions.

### Outreach Workflow
- "Send letter": Template picker → PDF preview/export (labels/envelopes).  
- Bulk select → batch mail/email → log to `outreach_logs`.  
- Dashboard: Sent stats, response rates.

### Notes & Sharing
- Inline notes per org/contact.  
- Per-resource perms (e.g. notes:read/write).

### Imports/Exports
- XLS parser: Map "Name,Position,Office Address,Phone,Website" → contacts/channels.[file:1]  
- CSV/Excel export with current data.

## UI/UX Flows

- **Auth**: Supabase Auth UI (email/OTP); role badges.  
- **Dashboard**: Directory table → org detail (tabs: contacts, notes, outreach, history).  
- **Forms**: shadcn + Zod; structured postal picker (autocomplete countries/postcodes).  
- **Mobile**: Responsive Tailwind; PWA-ready.

## API & Backend

- **Supabase RLS**: Per-role/resource policies with JWT claims (`role`, `permissions`).  
- **Triggers**: Enforce `is_current`; log activities.  
- **Edge Functions**: Bulk import processor, PDF generation.  
- **Realtime**: Notes/outreach updates via Supabase Realtime.

## Security & Compliance

### Authentication & API Security
- Supabase Auth: Email/OTP + MFA; JWT claims for `role`/`permissions`.  
- API Keys: Anon key for reads; service_role only in Edge Functions.  
- CORS: Strict origins only.

### Rate Limiting
| Layer | Tool | Limits |
|-------|------|--------|
| Supabase | Built-in | 1000 rows/query; Statement Cost Limit |
| Next.js | Upstash Redis | 100 req/min IP; 10 req/min unauth |
| Edge Functions | Custom Redis | 5 req/10s per user |
| Forms | Server Actions | Per-session cooldowns |

### Input Validation
- **Zod**: All forms/Server Actions (postal validation, email formats).  
- **Triggers**: DB-level constraints.  
- **SQL**: Parametrized via Supabase client.

### Data Protection
- RLS on ALL tables; ownership checks.  
- Audit logs for mutations.  
- Signed Storage URLs; private buckets.

**Testing**: RLS policy tester; security scans.

## Non-Functional

| Aspect | Target |
|--------|--------|
| Performance | <200ms queries; indexes on name/type/region |
| Scale | 10k+ orgs; Supabase Pro |
| Uptime | Supabase SLA |
| Backup | Daily PITR |

## Roadmap

1. **MVP (2 weeks)**: Schema, auth/RBAC, directory CRUD, search.  
2. **v1.1 (1 week)**: Versioning, notes, imports.  
3. **v1.2 (1 week)**: Outreach, templates, dashboard.  
4. **Future**: AI enrichment, CRM integrations.

## Risks & Mitigations

- **Data staleness**: Scheduled imports + user flags.  
- **Permission complexity**: Admin UI; start simple.  
- **Import errors**: Validation previews.

---
