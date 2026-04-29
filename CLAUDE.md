# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Golden Pages** is a centralized, versioned contact directory for organizations (government, corporate, diplomatic missions, international organizations, businesses, nonprofits). It serves as a "Golden Record" system designed for outreach workflows and data management.

## Commands

### Development
```bash
npm run dev          # Start Vite dev server (port 3000, host 0.0.0.0)
npm run build        # TypeScript compile + Vite build
npm run preview      # Preview production build
```

### Code Quality
```bash
npm run check        # Run ESLint + TypeScript type check (no emit)
npm run lint         # Run ESLint with auto-fix
```

### Database Operations
```bash
npm run db:push      # Push Prisma schema to database
npm tsx prisma/seed.ts   # Seed database (use this exact command - NOT npm run db:seed)
```

## Architecture

### Tech Stack
- **Frontend**: React 18.3+ with TypeScript 5.7
- **Build Tool**: Vite 6.0 (browser-native ES Modules via import maps)
- **Styling**: Tailwind CSS 3.4 (configured via CDN in `index.html`)
- **Backend/Database**: Supabase (PostgreSQL with Row Level Security)
- **ORM**: Prisma 6.2
- **Validation**: Zod 3.22
- **Icons**: Lucide React 0.469

### Project Type
Modern React SPA with Supabase backend - client-side React application with direct Supabase client calls (no API middleware layer). Row Level Security (RLS) handles data access control.

### Key Directories
```
components/              # React UI components (Dashboard, OrganizationTable, OrgDetail, Sidebar)
services/               # Business logic & API clients (supabaseClient.ts, frontendSeeder.ts, seedContent.ts)
prisma/                 # Database schema & seeding (schema.prisma, seed.ts, utils/seed-helper.ts)
docs/                   # Documentation (RBAC_SYSTEM.md, etc.)
"Country Contacts/"     # Excel data import pipeline (Python scripts → SQL seeds)
```

### Data Model (Conceptual)
Core tables (from PRD):
- `organisations` - Organizations with hierarchical support (parent_org_id)
- `contacts` - People within organizations
- `contact_channels` - Versioned contact methods (email, phone, postal) with `is_current` flag
- `organisation_notes` / `contact_notes` - Notes with visibility levels
- `regions` - Geographic regions (countries, states)
- `outreach_logs` - Communication tracking
- `user_roles` / `permissions` - RBAC tables

Data is versioned - changes preserve historical records.

## Critical Engineering Standards (from gemini.md)

### TypeScript Rules
- **Zero tolerance for `any` type** - use `unknown` with type guards if necessary
- No unused variables - prefix unused with `_` or remove
- All data structures must have defined interfaces in `types.ts`
- Use `import type` where applicable

### Component Rules
- Max **500 lines per file** - split components if larger
- Icons: All `lucide-react` icons must be styled via Tailwind (e.g., `className="h-4 w-4"`)
- Accessibility: Interactive elements need proper roles and keyboard listeners
- Keys: Do not use array indexes as keys - use stable IDs

### Data Handling
- No hardcoded "magic" data - use `services/mockData.ts` or proper constants
- Always use the singleton Supabase client from `services/supabaseClient.ts`
- Zod validation required for all forms

### File Organization
- Root: Configuration files only
- `components/`: React UI components
- `services/`: API clients, mock data, helpers
- `docs/`: Documentation
- `types.ts`: Centralized TypeScript definitions
- **Do NOT create unrelated files in the project root**

## Design System ("The Golden Theme")

### Typography
- Headings: `font-serif` ('Playfair Display') - Branding, top-level headers
- Body: `font-sans` ('Inter') - Data tables, UI controls

### Color Palette
- **Slate**: `slate-900` (Sidebar), `slate-800` (Text)
- **Gold**: `gold-50` (Bg) to `gold-600` (Primary Action)
- **Stone**: `stone-50` (App Bg), `stone-200` (Borders)

## RBAC System

**Users gain permissions through assigned roles, NOT individually.**

### Permission Format
`resource:action` (e.g., `org:write`, `contact:read`)

### Roles
- **Admin** (`role:admin`): All permissions (`*:*`) - manage users, view audit logs, hard delete
- **Editor** (`role:editor`): `org:read/write`, `contact:read/write/archive`, `channel:read/write`, `note:read/write`, `outreach:read/initiate` - cannot delete orgs or manage users
- **User** (`role:user`): Read-only - `org:read`, `contact:read`, `channel:read`, `note:read` (public/team only)

### Enforcement
- **Database**: Postgres RLS policies checking `user_roles` table
- **Frontend**: UI elements hidden/disabled based on loaded permissions
- See `docs/RBAC_SYSTEM.md` for authoritative permission matrix

### Audit Logging
All write operations must log to `activity_logs`: `user_id`, `action`, `resource_id`, `timestamp`, `changes` (JSONB diff)

## PDF & File Generation Standards

**Thumbnail/Preview Generation**: Use `pdftocairo` (Cairo Graphics) in Edge Functions/Backend
- ❌ FORBIDDEN: `pdftoppm`, ImageMagick `convert`, `pdf2png` (they fail to render embedded text correctly)
- Exported PDFs must allow text selection and searchability (no raster-only exports)

## Environment

### Required
- `GEMINI_API_KEY` in `.env.local`
- Node.js

### Vite Configuration
- Port 3000, host 0.0.0.0
- Environment variables accessed via `process.env.GEMINI_API_KEY`
- Path alias: `@` resolves to project root

## Current State

- **Prisma schema**: Currently empty (schema defined in SQL files instead)
- **RLS policies**: Set to permissive/demo mode (`USING (true)`) - production requires strict role-based policies
- **Testing**: No test framework currently configured
