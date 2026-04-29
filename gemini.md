# Golden Pages - Project Context & Rules

## Project Overview
Golden Pages is a centralized, versioned contact directory for organizations (government, business, nonprofits) designed to be the "Golden Record" of truth. It prioritizes current contact info while preserving historical data and enforcing data standards via RBAC.

## 🏗️ Architecture & Engineering Standards

### 1. View-State Pattern (CRITICAL)
- **NOT** using Next.js file-based routing for primary app views.
- **SPA-Style**: `app/page.tsx` manages all views via state (`activeView`).
- **State Management**: Use `useState` in `app/page.tsx` to toggle between: `dashboard`, `organizations`, `organization-detail`, `department-contacts`, `packages`, `documents`, etc.
- **Sidebar Integration**: The `Sidebar.tsx` component must update the global view state.

### 2. Strict TypeScript
- ❌ **Zero Tolerance for `any`**: Do not use `any`. Use `unknown` with type guards.
- ❌ **No Unused Variables**: All variables must be used or prefixed with `_`.
- ✅ **Explicit Interfaces**: All data structures must have defined interfaces in `types.ts`.
- ✅ **Type Imports**: Use `import type` for type-only imports.

### 3. Data & State
- ❌ **No Mock Data**: Always use live data from Supabase. No hardcoded magic data.
- ✅ **Supabase Client**: Always use the singleton from `@/services/supabaseClient.ts`.
- ✅ **Validation**: Zod is required for all forms and data mutations.
- ✅ **RLS Enforcement**: Respect Row Level Security (RLS) policies.

### 4. Component Rules
- **Icons**: Use `lucide-react`. Always style via Tailwind (e.g., `className="h-4 w-4"`).
- **Accessibility**: Proper roles (`button`, `link`) and keyboard listeners.
- **File Size**: Max **500 lines** per file. Split components if they grow too large.
- **Keys**: Use stable IDs (UUIDs), never array indexes.

---

## 🎨 Design System ("The Golden Theme")

We use a premium, high-contrast theme optimized for data-rich applications.

### Typography
- **Headings**: `font-serif` ('Playfair Display') - Used for branding, top-level headers, and section titles.
- **Body**: `font-sans` ('Inter') - Used for data tables, UI controls, and general text.

### Color Palette
- **Slate**: `slate-900` (Sidebar), `slate-800` (Main text).
- **Gold**: `gold-50` (Bg) to `gold-600` (Primary Actions).
- **Stone**: `stone-50` (App Bg), `stone-200` (Borders).

### Visual Aesthetics (Antigravity Standard)
- **Heavy Rounding**: Use extreme rounding for cards and buttons (`rounded-[2rem]`, `rounded-[2.5rem]`, `rounded-[3.5rem]`).
- **Gradients**: Use smooth gradients for headers and active states (`bg-gradient-to-br from-gold-500 to-gold-700`).
- **Micro-animations**: Subtle hover transitions on all interactive elements.

---

## 📂 File Organization
- **Root**: Configuration files only (`next.config.mjs`, `tailwind.config.ts`, `gemini.md`).
- **`app/`**: Main entry point and global layout.
- **`components/`**: React UI components organized by domain:
  - `components/hierarchy/`: Organization and Department management.
  - `components/packages/`: Document package tracking.
  - `components/shared/`: Reusable UI primitives.
- **`services/`**: API clients, business logic, and permission services.
- **`docs/`**: Feature specifications and RBAC matrix.
- **`types.ts`**: Centralized TypeScript definitions.

---

## 🛡️ RBAC & Security
- **Permissions**: `resource:action` format (e.g., `org:write`, `package:send`).
- **Multi-tenancy**: Use `owner_id` for resource ownership where applicable.
- **PDF Generation**: Use **`pdftocairo`** (Cairo Graphics) for thumbnail/preview generation. DO NOT use `pdftoppm` or ImageMagick.

---

## 🛠️ Common Commands
- `npm run dev` - Start development server
- `npm run check` - Lint and Type-check
- `npm run db:push` - Sync Prisma schema to Supabase
- `npm tsx prisma/seed.ts` - Seed the database
- `npm run build` - Production build preview
