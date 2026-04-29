# AGENTS.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

**Golden Pages** is a centralized, versioned contact directory for organizations (government, corporate, diplomatic missions, international organizations). It serves as a "Golden Record" system for outreach workflows. Built with Next.js (App Router) + Supabase (PostgreSQL with RLS) + Prisma ORM.

## Commands

```bash
npm run dev          # Start Next.js dev server
npm run build        # Production build
npm run start        # Start production server
npm run lint         # ESLint with auto-fix
npm run check        # ESLint + TypeScript type check (no emit)
npm run db:push      # Push Prisma schema to Supabase
npm run db:seed      # Seed database via ts-node (prisma/seed.ts)
```

## Architecture

### SPA-Style View Routing (Critical Pattern)

This app does **NOT** use Next.js file-based routing for primary views. Instead, `app/page.tsx` manages all views via `activeView` state (dashboard, organizations, organization-detail, department-contacts, directory, admin, etc.). The `Sidebar.tsx` component drives view changes by updating this state. All main views are rendered conditionally in `app/page.tsx`.

### Data Flow

- **Supabase client** (`services/supabaseClient.ts`): Singleton client for all DB operations. Components make direct Supabase calls or use service classes.
- **HierarchyService** (`services/hierarchyService.ts`): Singleton service handling organization → department → contact hierarchy queries. Builds department trees from flat data.
- **Auth flow**: `lib/authContext.tsx` provides `AuthProvider` wrapping the app in `app/layout.tsx`. Uses `useAuth()` hook for user state, roles, permissions. Backed by `services/authService.ts` and `services/permissionsService.ts`.
- **Prisma** (`lib/prisma.ts`): Singleton PrismaClient for server-side/script usage. The main app UI primarily uses Supabase client directly.

### Data Model Hierarchy

`Region → Organisation → Department → Contact → ContactChannel`

- **Departments** support parent-child hierarchy (self-referential `parentId`)
- **ContactChannels** store typed contact methods (phone, email, website, office_address, mobile, fax) per contact
- **Package Management** system tracks document packages sent to departments with sub-packages, delivery status, and responses

All TypeScript interfaces live in `types.ts` at the project root.

### Database Seeding

Real data extracted from Excel spreadsheets in `Country Contacts/` directory. SQL seed files are in `prisma/seeds/` and must be run in order (001_regions → 002_organisations → 004_contacts → 005_contact_channels). See `SEEDING.md` for details.

### RBAC System

Permission format: `resource:action` (e.g., `org:write`, `contact:read`). Three roles: admin (`*:*`), editor (read/write most resources), user (read-only). Enforced via Supabase RLS policies + frontend permission checks. See `docs/RBAC_SYSTEM.md` and `prisma/RBAC_RLS_POLICIES.sql`.

## Code Standards

### TypeScript
- **Zero tolerance for `any`** — use `unknown` with type guards; ESLint enforces `@typescript-eslint/no-explicit-any: error`
- Use `import type` for type-only imports (enforced by `consistent-type-imports` rule)
- All data structures must have interfaces in `types.ts`
- Prefix unused variables with `_`

### Components
- Max **500 lines per file** — split if larger
- Icons: `lucide-react` only, styled via Tailwind classes (e.g., `className="h-4 w-4"`)
- Use stable UUIDs as keys, never array indexes
- Accessibility: interactive elements need proper roles and keyboard listeners

### Design System ("The Golden Theme")
- Headings: `font-serif` (Playfair Display) — Body: `font-sans` (Inter)
- Colors: Slate (sidebar/text), Gold (bg/primary actions), Stone (app bg/borders)
- Heavy rounding on cards/buttons (`rounded-[2rem]`+), subtle hover transitions
- Path alias: `@/*` resolves to project root

### Data Handling
- Always use the singleton Supabase client from `@/services/supabaseClient.ts`
- No hardcoded mock data — use live Supabase data
- Zod validation required for all forms
- All write operations should log to `activity_logs`

### PDF Generation
Use `pdftocairo` only for thumbnail/preview generation. Do NOT use `pdftoppm`, ImageMagick `convert`, or `pdf2png`.

## Environment Variables

Required in `.env.local`:
- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `DATABASE_URL` (for Prisma CLI operations)
- `GEMINI_API_KEY`

## Current State

- RLS policies are in permissive/demo mode (`USING (true)`) — production requires strict role-based policies
- No test framework currently configured
- `tsconfig.json` excludes `prisma/seed.ts` and `scripts/` from type checking
