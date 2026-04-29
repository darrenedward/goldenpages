# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Golden Pages** is a centralized, versioned contact directory for organizations (government, corporate, diplomatic missions, international organizations). It serves as a "Golden Record" system designed for outreach workflows, communication tracking, and public transparency.

## Commands

### Development
```bash
npm run dev          # Start Next.js dev server
npm run build        # Next.js production build (TypeScript compile + bundling)
npm run start        # Start production server
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

### Deployment
```bash
vercel --prod        # Deploy to production on Vercel
```

## Architecture

### Tech Stack
- **Framework**: Next.js 16 (App Router) with React 18.3+ and TypeScript 5.7
- **Styling**: Tailwind CSS 3.4
- **Backend/Database**: Supabase (PostgreSQL with Row Level Security)
- **ORM**: Prisma 7.4
- **Validation**: Zod 3.22
- **Icons**: Lucide React 0.469
- **Auth**: Supabase Auth (email/password + OAuth)
- **Deployment**: Vercel

### Project Type
Next.js App Router application with two distinct areas:
1. **Public site** (`app/(public)/`) — Marketing pages, public transparency register, report form, contact form. Server-rendered with client interactivity.
2. **Dashboard** (`app/dashboard/`) — Client-side SPA using view-state pattern (single route, `activeView` state drives component rendering via `ViewRenderer.tsx`).

Row Level Security (RLS) handles data access control at the database level.

### Key Directories
```
app/
  (public)/            # Public pages (home, about, contact, report, communications, privacy, terms)
  dashboard/           # Dashboard SPA (single page with view-state routing)
  login/               # Authentication page
components/
  public/              # PublicNav, PublicFooter
  dashboard/           # ViewRenderer, AdminPanel, SettingsPanel, useDashboardState
  hierarchy/           # OrganizationsList, OrganizationDetail, DepartmentContacts, etc.
  packages/            # PackageList, PackageDetail, CreatePackageWizard, etc.
  communications/      # CommunicationList, PublicCommunicationBrowser, CategorySidebar, etc.
  documents/           # DocumentLibrary, DocumentUploader
  shared/              # BreadcrumbNav, LoadingSpinner, EmptyState, StatusBadge, visual components
  auth/                # LoginForm, ProtectedRoute
  admin/               # IssueCategoryManager
services/              # Business logic (supabaseClient, authService, hierarchyService, communicationService, etc.)
lib/                   # Auth context, hooks (usePermissions, useUser)
prisma/                # Schema, migrations, seeds
types.ts               # Centralized TypeScript definitions
```

### Data Model
Core tables:
- `organisations` - Organizations (government, corporate, diplomatic, international)
- `departments` - Departments within organizations with portfolio types
- `contacts` - People within organizations
- `contact_channels` - Contact methods (email, phone, address) with versioning
- `communications` - Communication tracker (letters, emails, meetings)
- `communication_documents` - Documents attached to communications
- `issue_categories` - Admin-managed categories for communications/reports
- `reports` - Public issue reports from the transparency form
- `contact_submissions` - Contact form submissions
- `newsletter_subscribers` - Newsletter email subscriptions
- `packages` / `sub_packages` - Package management for document delivery
- `regions` - Geographic regions (countries, states)
- `user_roles` / `role_permissions` - RBAC tables

## Critical Engineering Standards

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
- Always use the singleton Supabase client from `services/supabaseClient.ts`
- Use service layer files (not inline Supabase calls in components) for data operations
- Zod validation required for all forms

### File Organization
- Root: Configuration files only
- `components/`: React UI components
- `services/`: API clients, business logic
- `lib/`: Context providers, hooks
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

### Visual Enhancement Layer
- `app/globals.css` — Custom keyframes, glass morphism, shimmer, dot grid, noise overlay
- `components/shared/` — ScrollReveal, GradientMesh, DotGrid, GlowCard, AnimatedCounter, etc.
- `@media (prefers-reduced-motion: reduce)` kills all animations for accessibility

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
- **Frontend**: UI elements hidden/disabled based on loaded permissions via `usePermissions()` hook
- See `docs/RBAC_SYSTEM.md` for authoritative permission matrix

## Environment

### Required
- `NEXT_PUBLIC_SUPABASE_URL` — Supabase project URL
- `NEXT_PUBLIC_SUPABASE_ANON_KEY` — Supabase anon/public key
- `DATABASE_URL` — PostgreSQL connection string (for Prisma CLI)
- See `.env.example` for full list

### Next.js Configuration
- Path alias: `@` resolves to project root
- Edge runtime used for OG image generation (`app/opengraph-image.tsx`)

## Current State

- **Prisma schema**: Full schema with 20+ models in `prisma/schema.prisma`
- **RLS policies**: Zero-trust mode — communications require `is_public AND is_approved` for anon access
- **Testing**: No test framework currently configured
- **Deployment**: Live at goldenpages.vercel.app
