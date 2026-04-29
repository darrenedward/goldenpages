# Golden Pages - Implementation Tasks
## Hierarchical Navigation & Package Management System

**Based on:** `plans/unified-spec.md` (Version 2.0) and `plans/archive/hierarchical-navigation-spec.md`
**Last Updated:** 2026-01-30

---

## Critical Architecture Notes

### How This Codebase Works

**IMPORTANT:** This app uses **view-state pattern** (SPA-style), NOT Next.js file-based routing.

```typescript
// app/page.tsx manages all views via state
const [activeView, setActiveView] = useState('dashboard');
const [selectedOrg, setSelectedOrg] = useState(null);

// Views: dashboard, directory, detail, contacts, outreach, admin, settings
// NEW VIEWS TO ADD: organizations, packages, documents, department-contacts
```

### What We're Adding

| New View | Component Location | Description |
|----------|-------------------|-------------|
| `organizations` | `components/hierarchy/OrganizationsList.tsx` | List all orgs with dept counts |
| `organization-detail` | `components/hierarchy/OrganizationDetail.tsx` | Org with departments list |
| `department-contacts` | `components/hierarchy/DepartmentContacts.tsx` | Contacts in a department |
| `packages` | `components/packages/PackageList.tsx` | Package management dashboard |
| `package-detail` | `components/packages/PackageDetail.tsx` | Package detail view |
| `create-package` | `components/packages/CreatePackageWizard.tsx` | Multi-step package creation |
| `documents` | `components/documents/DocumentLibrary.tsx` | Document browser |

### Key Files to Modify

| File | Changes |
|------|---------|
| `app/page.tsx` | Add new view states and switch cases |
| `components/Sidebar.tsx` | Add menu items for new views |
| `types.ts` | Add new TypeScript interfaces |
| `services/permissionsService.ts` | Add new permissions |

---

## Design System: "The Golden Theme"

All new components must follow:

```typescript
// Typography
className="font-serif"  // 'Playfair Display' - Headings, branding
className="font-sans"   // 'Inter' - Data tables, UI controls

// Colors
bg-slate-900           // Sidebar background
text-slate-800         // Body text
bg-stone-50            // App background
gold-50 to gold-600    // Primary action color

// Heavy Rounding
rounded-[2rem], rounded-[2.5rem], rounded-[3.5rem]

// Gradients
bg-gradient-to-br, bg-gradient-to-r

// Icons (Lucide React)
className="h-4 w-4"  // ALWAYS specify size
```

---

## Overview

**Important:** No mock data allowed - always use live data from Supabase.

**Implementation Order:**
- Phase 0: Database Foundation (Week 1)
- Phase 1: Hierarchy Layer (Week 2-5)
- Phase 2: Package Layer (Week 6-11)
- Phase 3: Deployment (Week 12)

---

## Phase 0: Database Foundation (Week 1)

**Status:** ✅ COMPLETE
**Dependencies:** None

### 0.1 Database Backup
- [x] N/A - Fresh database setup
- [ ] Document backup location and restoration procedure
- [ ] Test restoration in staging environment

### 0.2 Prisma Schema Updates

**Current State:** `Contact.department` exists as a string field

**Changes to Make:**

- [x] Add `Department` model to `prisma/schema.prisma`
  ```prisma
  model Department {
    id             String       @id @default(uuid_generate_v4())
    name           String
    code           String?      @unique           // e.g., "FIN-001"
    description    String?
    organisation   Organisation @relation("DepartmentOrganisation", fields: [organisationId], references: [id])
    organisationId String
    parentId       String?                       // Sub-departments
    parent         Department?  @relation("DepartmentHierarchy", fields: [parentId], references: [id], onDelete: SetNull)
    children       Department[] @relation("DepartmentHierarchy")
    isActive       Boolean      @default(true)
    createdAt      DateTime     @default(now())
    createdBy      String?
    updatedAt      DateTime     @updatedAt
    updatedBy      String?
    contacts       Contact[]
    packageRecipients PackageRecipient[]

    @@unique([organisationId, name])
    @@index([organisationId])
    @@index([parentId])
    @@index([isActive])
    @@index([code])
    @@map("departments")
  }
  ```

- [x] Update `Contact` model:
  ```prisma
  model Contact {
    // ... existing fields ...
    department      Department?   @relation("ContactDepartment", fields: [departmentId], references: [id])
    departmentId    String?
    departmentLegacy String?      // Keep for migration
    // ... rest of existing fields ...
    @@index([departmentId])
  }
  ```

- [x] Update `Organisation` model:
  ```prisma
  model Organisation {
    // ... existing fields ...
    departments  Department[] @relation("DepartmentOrganisation")
    // ... rest of existing fields ...
  }
  ```

- [x] Add `Package` model
- [x] Add `SubPackage` model
- [x] Add `Document` model
- [x] Add `PackageDocument` junction model
- [x] Add `PackageRecipient` model
- [x] Add `SubPackageResponse` model
- [x] Update `User` model with package relations
- [x] Add all enums: `PackageStatus`, `SubPackageStatus`, `DeliveryStatus`, `ResponseStatus`, `DocumentCategory`
- [x] Run `npx prisma migrate dev --name add_unified_schema`
- [x] Verify schema in Prisma Studio

### 0.3 Department Migration Script
- [x] Create `scripts/migrate-departments.ts` (Python version: `excel_to_prisma_enhanced.py`, `generate-seed-from-extraction.py`)
- [x] Extract contact data from Excel files with department classification
- [x] Group contacts by organization and department name
- [x] Generate unique department codes (e.g., "FIN-001", "HR-001")
- [x] Create seed JSON files with proper UUID and FK relationships
- [x] Generate SQL seed files from JSON
- [x] Seed database: 23 regions, 64 organisations, 127 departments, 1,028 contacts, 2,720 contact channels
- [x] Verify migration: all foreign keys properly linked

### 0.4 Supabase Storage Setup
- [x] Create `packages-storage` bucket in Supabase console
- [x] Configure bucket RLS policies for authenticated users
- [x] Set file size limit to 50 MB
- [x] Update allowed MIME types (PDF, images, docs, text, zip)
- [x] Test file upload with a sample document
- [x] Verify public URL generation
- [ ] Create folder structure: `documents/{year}/{month}/`, `thumbnails/`, `exports/`

### 0.5 Permissions Setup (Existing System)

**Note:** We're ADDING to the existing `services/permissionsService.ts`, not replacing it.

- [x] Add base roles (admin, editor, user) to database
- [x] Add existing permissions (org, contact, channel, note, outreach)
- [x] Add new permissions to database `role_permissions` table:
  ```sql
  -- Department permissions
  INSERT INTO role_permissions (role_id, permission) VALUES
    ((SELECT id FROM roles WHERE name = 'admin'), 'department:read'),
    ((SELECT id FROM roles WHERE name = 'admin'), 'department:write'),
    ((SELECT id FROM roles WHERE name = 'editor'), 'department:read'),
    ((SELECT id FROM roles WHERE name = 'editor'), 'department:write'),
    ((SELECT id FROM roles WHERE name = 'user'), 'department:read');

  -- Package permissions
  INSERT INTO role_permissions (role_id, permission) VALUES
    ((SELECT id FROM roles WHERE name = 'admin'), 'package:read'),
    ((SELECT id FROM roles WHERE name = 'admin'), 'package:write'),
    ((SELECT id FROM roles WHERE name = 'admin'), 'package:delete'),
    ((SELECT id FROM roles WHERE name = 'admin'), 'package:send'),
    ((SELECT id FROM roles WHERE name = 'admin'), 'package:close'),
    ((SELECT id FROM roles WHERE name = 'editor'), 'package:read'),
    ((SELECT id FROM roles WHERE name = 'editor'), 'package:write'),
    ((SELECT id FROM roles WHERE name = 'editor'), 'package:send'),
    ((SELECT id FROM roles WHERE name = 'user'), 'package:read');

  -- Document permissions
  INSERT INTO role_permissions (role_id, permission) VALUES
    ((SELECT id FROM roles WHERE name = 'admin'), 'document:read'),
    ((SELECT id FROM roles WHERE name = 'admin'), 'document:write'),
    ((SELECT id FROM roles WHERE name = 'admin'), 'document:delete'),
    ((SELECT id FROM roles WHERE name = 'editor'), 'document:read'),
    ((SELECT id FROM roles WHERE name = 'editor'), 'document:write'),
    ((SELECT id FROM roles WHERE name = 'user'), 'document:read');
  ```

- [x] Verify permissions work with existing `permissionsService.ts`

### 0.6 RLS Policies
- [x] Enable RLS on `departments` table
- [x] Create RLS policies for `departments` (read, insert, update, delete)
- [x] Enable RLS on `packages` table
- [x] Create RLS policies for `packages` (read, insert, update, delete)
- [x] Enable RLS on `sub_packages` table
- [x] Create RLS policies for `sub_packages` (read, insert, update, delete)
- [x] Enable RLS on `documents` table
- [x] Create RLS policies for `documents` (read, insert, delete)
- [x] Create RLS policies for `package_documents` (read)
- [x] Create RLS policies for `package_recipients` (read, insert, update, delete)
- [x] Create RLS policies for `sub_package_responses` (read)
- [x] Enable RLS on `contacts` table
- [x] Update RLS policies on `contacts` table for department access
- [x] Test RLS policies with different user roles

### 0.7 Rollback Testing
- [x] Create `scripts/rollback-phase0.ts` (SQL and TypeScript versions)
- [x] Test rollback procedure with --dry-run
- [x] Verify rollback targets (7 tables, 20 permissions)
- [ ] Test rollback procedure in staging environment
- [ ] Verify `departmentLegacy` field restoration works
- [ ] Verify all package tables are cleaned up
- [ ] Document rollback procedure

### 0.8 Database Indexes
- [x] Create index on `organisations(name)`
- [x] Create index on `departments(organisationId, isActive)`
- [x] Create index on `departments(parentId)`
- [x] Create index on `contacts(departmentId)`
- [x] Create index on `packages(status, createdAt DESC)`
- [x] Create index on `sub_packages(expectedReply)`
- [x] Create index on `package_recipients(deliveryStatus)`
- [ ] Verify query plans with `EXPLAIN ANALYZE`

---

## Phase 1: Hierarchy Layer (Week 2-5)

**Status:** ⬸ Not Started
**Dependencies:** Phase 0 Complete

### Week 2: Core Components (View-State Pattern)

#### 1.1 Create Hierarchy Component Directory
- [ ] Create `components/hierarchy/` directory

#### 1.2 Update Main Page with New Views
- [ ] Open `app/page.tsx`
- [ ] Add new state variables:
  ```typescript
  const [selectedDepartment, setSelectedDepartment] = useState(null);
  ```
- [ ] Add new view cases to switch statement:
  ```typescript
  case 'organizations':
    return <OrganizationsList onSelectOrg={setSelectedOrg} onChangeView={setActiveView} />;
  case 'organization-detail':
    return <OrganizationDetail orgId={selectedOrg} onSelectDept={setSelectedDepartment} onChangeView={setActiveView} />;
  case 'department-contacts':
    return <DepartmentContacts orgId={selectedOrg} deptId={selectedDepartment} onChangeView={setActiveView} />;
  ```

#### 1.3 OrganizationsList Component
- [ ] Create `components/hierarchy/OrganizationsList.tsx`
- [ ] Add `'use client'` directive
- [ ] Implement search by organization name (debounced)
- [ ] Implement filter by organization type (government, corporate, diplomatic_mission, etc.)
- [ ] Implement sort (name, type, contact count)
- [ ] Display department count per organization
- [ ] Add pagination (20 per page)
- [ ] Add loading state (spinner or skeleton)
- [ ] Add empty state illustration with message
- [ ] Add error handling with retry button
- [ ] **Styling:** Use Golden Theme (gold accents, serif headings, heavy rounding)
- [ ] **Icons:** Lucide with `className="h-4 w-4"`
- [ ] **Data Fetching:** Use Supabase client from `@/services/supabaseClient`

```typescript
// Example structure for OrganizationsList
interface OrganizationsListProps {
  onSelectOrg: (orgId: string) => void;
  onChangeView: (view: string) => void;
}

interface OrganizationWithDeptCount extends Organization {
  departmentCount: number;
  contactCount: number;
}
```

#### 1.4 OrganizationDetail Component
- [ ] Create `components/hierarchy/OrganizationDetail.tsx`
- [ ] Add `'use client'` directive
- [ ] Display organization header with details (name, type, location)
- [ ] Display departments list with contact counts
- [ ] Add "All Contacts" view option
- [ ] Implement search/filter departments
- [ ] Add back button to return to organizations list
- [ ] Add loading/empty/error states
- [ ] **Styling:** Golden Theme with gradient header
- [ ] **Icons:** Lucide with proper sizing

```typescript
// Example structure
interface OrganizationDetailProps {
  orgId: string;
  onSelectDept: (deptId: string) => void;
  onChangeView: (view: string) => void;
}
```

#### 1.5 DepartmentList Component (for use in OrganizationDetail)
- [ ] Create `components/hierarchy/DepartmentList.tsx`
- [ ] Grid layout for department cards (responsive: 1 col mobile, 2 col tablet, 3 col desktop)
- [ ] Display department name, code, contact count
- [ ] Add hover effects (scale, shadow)
- [ ] Click to navigate to department contacts
- [ ] Handle large organizations (pagination for 50+ departments)

#### 1.6 DepartmentContacts Component
- [ ] Create `components/hierarchy/DepartmentContacts.tsx`
- [ ] Add `'use client'` directive
- [ ] Display department header with organization context
- [ ] List contacts with their channels (phone, email, etc.)
- [ ] Implement search by name or role (debounced)
- [ ] Implement sort (name, role)
- [ ] Add breadcrumb navigation (Organizations > Org Name > Department)
- [ ] Add pagination (25 per page)
- [ ] Add loading/empty/error states
- [ ] **Styling:** Contact cards with golden accents

```typescript
// Example structure
interface DepartmentContactsProps {
  orgId: string;
  deptId: string;
  onChangeView: (view: string) => void;
}
```

### Week 3: Data Services & Hooks

#### 1.7 HierarchyService
- [ ] Create `services/hierarchyService.ts`
- [ ] Implement `getOrganizations()` with department/contact counts
  ```typescript
  async getOrganizations(): Promise<OrganizationWithDeptCount[]> {
    const { data } = await supabase
      .from('organisations')
      .select(`
        *,
        departments(count),
        contacts(count)
      `)
      .order('name');
    return data.map(org => ({
      ...org,
      departmentCount: org.departments?.[0]?.count || 0,
      contactCount: org.contacts?.[0]?.count || 0
    }));
  }
  ```
- [ ] Implement `getOrganizationDetails(id)` with departments
- [ ] Implement `getDepartments(organisationId)` with hierarchy
- [ ] Implement `getDepartmentContacts(departmentId)` with channels
- [ ] Implement `createDepartment(input, userId)`
- [ ] Implement `updateDepartment(id, input, userId)`
- [ ] Implement `buildDepartmentTree()` helper for hierarchical display
- [ ] Add error handling and logging

#### 1.8 Custom Hooks (Optional - can use direct service calls)
- [ ] Create `lib/hooks/useHierarchy.ts` (if needed)
- [ ] OR use direct service calls in components (current pattern)
- [ ] Implement `useOrganizations(filters?)`
- [ ] Implement `useOrganization(id)`
- [ ] Implement `useDepartments(organisationId?)`
- [ ] Implement `useDepartmentContacts(departmentId)`

#### 1.9 Update TypeScript Types
- [ ] Open `types.ts`
- [ ] Add `Department` interface:
  ```typescript
  export interface Department {
    id: string;
    name: string;
    code?: string;
    description?: string;
    organisationId: string;
    parentId?: string;
    isActive: boolean;
    createdAt: string;
    updatedAt: string;
  }
  ```
- [ ] Add `DepartmentWithContacts` interface
- [ ] Add `OrganizationWithDeptCount` interface
- [ ] Add `DepartmentNode` interface (for tree structure)
- [ ] Add `ContactWithChannels` interface

### Week 4: Tree View & Department Management

#### 1.10 DepartmentTree Component (for Package Management later)
- [ ] Create `components/hierarchy/DepartmentTree.tsx`
- [ ] Render hierarchical tree from flat department list
- [ ] Expand/collapse functionality with chevron icons
- [ ] Indent child departments (margin-left)
- [ ] Display contact count badges
- [ ] Display department codes
- [ ] Handle deep hierarchies (3+ levels)

#### 1.11 DepartmentSelector Component (for Package Recipients)
- [ ] Create `components/hierarchy/DepartmentSelector.tsx`
- [ ] Multi-select with checkboxes
- [ ] Search by department name or code (debounced)
- [ ] Filter by organization dropdown
- [ ] Show selected count badge
- [ ] Allow parent + all children selection
- [ ] Display contact counts
- [ ] Remove from selection button

#### 1.12 DepartmentForm Component
- [ ] Create `components/hierarchy/DepartmentForm.tsx`
- [ ] Form fields: name, code, description, parentId, isActive
- [ ] Parent department dropdown (hierarchical display)
- [ ] Zod validation schema
- [ ] Code uniqueness check per organization
- [ ] Name uniqueness check per organization
- [ ] Handle create vs edit modes
- [ ] Success/error handling with toast notification
- [ ] **Styling:** Golden Theme form inputs with heavy rounding

#### 1.13 Search & Filter Enhancements
- [ ] Add debounced search to OrganizationsList (300ms delay)
- [ ] Add debounced search to DepartmentList
- [ ] Add debounced search to DepartmentContacts
- [ ] Implement multi-filter (type + status)
- [ ] Add local state for filter persistence
- [ ] Test with 1000+ records

### Week 5: Sidebar Navigation & Integration

#### 1.14 Update Sidebar Navigation
- [ ] Open `components/Sidebar.tsx`
- [ ] Add new menu items to the menuItems array:
  ```typescript
  const menuItems = [
    // ... existing items ...
    { id: 'organizations', label: 'Organizations', icon: Building2 },
    { id: 'packages', label: 'Packages', icon: Package },
    { id: 'documents', label: 'Documents', icon: FileText },
  ];
  ```
- [ ] Update active route highlighting with golden gradient
- [ ] Test navigation flow between all views

#### 1.15 Shared Components
- [ ] Create `components/shared/BreadcrumbNav.tsx`
- [ ] Create `components/shared/LoadingSpinner.tsx` (golden accent)
- [ ] Create `components/shared/EmptyState.tsx` (with illustration)
- [ ] Create `components/shared/ErrorBoundary.tsx`
- [ ] Create `components/shared/StatusBadge.tsx` (color-coded)

#### 1.16 RBAC Integration
- [ ] Add permission checks to OrganizationsList using `usePermissions()` hook
- [ ] Add permission checks to OrganizationDetail
- [ ] Add permission checks to DepartmentContacts
- [ ] Hide "Create Department" button without `department:write` permission
- [ ] Hide edit/delete buttons based on permissions
- [ ] Test with Admin, Editor, User roles from existing auth system

#### 1.17 Integration Testing
- [ ] Test navigation: Dashboard → Organizations → Org → Dept → Contacts
- [ ] Test back button navigation at each level
- [ ] Test department creation flow (if permissions allow)
- [ ] Test department editing flow
- [ ] Test search across all list views
- [ ] Test pagination behavior
- [ ] Test error handling (network failures, 404s)

#### 1.18 Performance Testing
- [ ] Load test with 64 organizations
- [ ] Load test with 100+ departments per organization
- [ ] Load test with 1000+ contacts per department
- [ ] Measure page load times (target: < 500ms org list, < 300ms org detail, < 200ms contacts)
- [ ] Optimize queries if needed
- [ ] Test with slow network (3G)

---

## Phase 2: Package Layer (Week 6-11)

**Status:** ⸲ Not Started
**Dependencies:** Phase 1 Complete

### Week 6: Package Components (View-State Pattern)

#### 2.1 Create Package Component Directories
- [ ] Create `components/packages/` directory
- [ ] Create `components/documents/` directory

#### 2.2 Update Main Page for Package Views
- [ ] Open `app/page.tsx`
- [ ] Add new state:
  ```typescript
  const [selectedPackage, setSelectedPackage] = useState(null);
  const [selectedSubPackage, setSelectedSubPackage] = useState(null);
  ```
- [ ] Add new view cases:
  ```typescript
  case 'packages':
    return <PackageList onSelectPkg={setSelectedPackage} onChangeView={setActiveView} />;
  case 'package-detail':
    return <PackageDetail packageId={selectedPackage} onSelectSub={setSelectedSubPackage} onChangeView={setActiveView} />;
  case 'create-package':
    return <CreatePackageWizard onChangeView={setActiveView} />;
  case 'sub-package-detail':
    return <SubPackageDetail packageId={selectedPackage} subPackageId={selectedSubPackage} onChangeView={setActiveView} />;
  case 'documents':
    return <DocumentLibrary onChangeView={setActiveView} />;
  ```

#### 2.3 PackageList Component
- [ ] Create `components/packages/PackageList.tsx`
- [ ] Add `'use client'` directive
- [ ] Display packages with status badges (DRAFT, SENT, COMPLETED, etc.)
- [ ] Show sub-package count and recipient count
- [ ] Show progress bar (responses received / total expected)
- [ ] Implement filter by status
- [ ] Implement filter by date range
- [ ] Implement search by name
- [ ] Add pagination (25 per page)
- [ ] Add loading/empty/error states
- [ ] **Styling:** Golden Theme package cards

```typescript
interface PackageListProps {
  onSelectPkg: (packageId: string) => void;
  onChangeView: (view: string) => void;
}
```

#### 2.4 PackageCard Component
- [ ] Create `components/packages/PackageCard.tsx`
- [ ] Display package name, status, created date
- [ ] Show progress indicator (gradient bar)
- [ ] Show sub-package and recipient counts
- [ ] Click to navigate to detail
- [ ] Hover effects (scale, shadow)
- [ ] Status badge with color coding

#### 2.5 PackageDetail Component
- [ ] Create `components/packages/PackageDetail.tsx`
- [ ] Display package header (name, status, dates)
- [ ] Show description
- [ ] List recipients (departments) with delivery status
- [ ] Show sub-packages with response tracking
- [ ] Add activity timeline
- [ ] Edit button (if permissions)
- [ ] Send button (if DRAFT/PENDING)
- [ ] Close button (if COMPLETED, admin only)
- [ ] **Styling:** Golden Theme with gradient header

```typescript
interface PackageDetailProps {
  packageId: string;
  onSelectSub: (subPackageId: string) => void;
  onChangeView: (view: string) => void;
}
```

#### 2.6 RecipientSelector Component (Integration Point)
- [ ] Create `components/packages/RecipientSelector.tsx`
- [ ] Use `DepartmentSelector` from hierarchy
- [ ] Filter by organization dropdown
- [ ] Allow hierarchy selection (parent + children)
- [ ] Show selected departments with contact counts
- [ ] Remove from selection button
- [ ] Validate at least one recipient selected
- [ ] **Integration:** Uses Department model from Phase 1

### Week 7: Package Creation & Documents

#### 2.7 CreatePackageWizard Component
- [ ] Create `components/packages/CreatePackageWizard.tsx`
- [ ] Multi-step wizard (3 steps with progress indicator)
- [ ] Step 1: Package details (name, description)
- [ ] Step 2: Select recipients (use RecipientSelector)
- [ ] Step 3: Add sub-packages and documents
- [ ] Back/Next navigation buttons
- [ ] Review before save
- [ ] Save as draft or send now options
- [ ] **Styling:** Golden Theme wizard with step indicator

#### 2.8 SubPackageForm Component
- [ ] Create `components/packages/SubPackageForm.tsx`
- [ ] Form fields: name, description, expected reply date, sequence
- [ ] Document upload section
- [ ] Add multiple documents
- [ ] Remove documents
- [ ] Zod validation
- [ ] Handle create vs edit

#### 2.9 DocumentUploader Component
- [ ] Create `components/documents/DocumentUploader.tsx`
- [ ] Drag & drop zone with golden border
- [ ] File type validation (PDF, PNG, JPG, DOCX)
- [ ] File size validation (max 25MB)
- [ ] Multiple file selection
- [ ] Upload progress bar (golden gradient)
- [ ] Cancel upload button
- [ ] Success/error handling

#### 2.10 DocumentLibrary Component
- [ ] Create `components/documents/DocumentLibrary.tsx`
- [ ] Display all uploaded documents
- [ ] Filter by category dropdown
- [ ] Search by filename
- [ ] Show file size, type, upload date
- [ ] Preview PDF/images
- [ ] Download button
- [ ] Delete button (admin only)

#### 2.11 PackageService
- [ ] Create `services/packageService.ts`
- [ ] Implement `getPackages(filters?)`
- [ ] Implement `getPackage(id)` with all relations
- [ ] Implement `createPackage(input, userId)`
- [ ] Implement `updatePackage(id, input, userId)`
- [ ] Implement `deletePackage(id, userId)`
- [ ] Implement `sendPackage(id, userId)`
- [ ] Implement `closePackage(id, userId)`
- [ ] Implement `createSubPackage(input, userId)`
- [ ] Implement `updateSubPackage(id, input, userId)`
- [ ] Implement logActivity helper

### Week 8: Sub-Packages & Responses

#### 2.12 SubPackageList Component
- [ ] Create `components/packages/SubPackageList.tsx`
- [ ] Display sub-packages in sequence order
- [ ] Show status badge for each
- [ ] Show expected reply date
- [ ] Show response count vs recipient count
- [ ] Click to view details
- [ ] Progress indicator

#### 2.13 SubPackageDetail Component
- [ ] Create `components/packages/SubPackageDetail.tsx`
- [ ] Display sub-package details
- [ ] List attached documents
- [ ] Show recipients (departments) with response status
- [ ] Track expected vs actual reply dates
- [ ] Add response recording
- [ ] Show overdue indicator (red badge)

#### 2.14 ResponseTracker Component
- [ ] Create `components/packages/ResponseTracker.tsx`
- [ ] Display response status per department
- [ ] Show: Not Sent, Sent, Responded, Overdue
- [ ] Color-coded badges (green, blue, yellow, red)
- [ ] Filter by status
- [ ] Export response report button

#### 2.15 PackageTimeline Component
- [ ] Create `components/packages/PackageTimeline.tsx`
- [ ] Display activity history
- [ ] Show: created, sent, responses received, closed
- [ ] Group by date
- [ ] Show user who performed action
- [ ] Auto-scroll to latest
- [ ] **Styling:** Golden accent timeline

#### 2.16 PackageSendWizard Component
- [ ] Create `components/packages/PackageSendWizard.tsx`
- [ ] Step 1: Review package details
- [ ] Step 2: Confirm recipients
- [ ] Step 3: Schedule & send options
- [ ] Send now vs schedule for later
- [ ] Email settings (BCC, template selection)
- [ ] Final confirmation
- [ ] Show progress during send

### Week 9: Document Storage & Email

#### 2.17 PackageStorageService
- [ ] Create `services/packageStorageService.ts`
- [ ] Implement `uploadDocument(file, userId)`
- [ ] Implement `deleteDocument(path)`
- [ ] Implement `getPublicUrl(path)`
- [ ] Implement `createPackageExport(packageId, subPackageIds)`
- [ ] Add progress callbacks
- [ ] Handle chunked uploads for large files

#### 2.18 PDF Thumbnail Edge Function
- [ ] Create `supabase/functions/generate-pdf-thumbnail/index.ts`
- [ ] Use `pdftocairo` for PNG generation (NOT pdftoppm)
- [ ] Upload thumbnail to `thumbnails/` folder
- [ ] Error handling for non-PDF files
- [ ] Test with various PDF types

#### 2.19 Email Notification System
- [ ] Create email templates for package delivery
- [ ] Create email template for follow-up reminders
- [ ] Implement email sending via Supabase
- [ ] Add BCC option for sender
- [ ] Track email delivery status
- [ ] Handle bounced emails
- [ ] Test email rendering

#### 2.20 DocumentPreview Component
- [ ] Create `components/documents/DocumentPreview.tsx`
- [ ] PDF preview with pagination
- [ ] Image preview (PNG, JPG)
- [ ] DOCX preview (placeholder)
- [ ] Download button
- [ ] Fullscreen mode
- [ ] Print option

### Week 10: Integration Testing

#### 2.21 Package Hooks (Optional)
- [ ] Create `lib/hooks/usePackages.ts` (if needed)
- [ ] Implement `usePackages(filters?)`
- [ ] Implement `usePackage(id)`
- [ ] Implement `useCreatePackage()`
- [ ] Implement `useUpdatePackage()`
- [ ] Implement `useDeletePackage()`
- [ ] Implement `useSendPackage()`
- [ ] Implement `useClosePackage()`

#### 2.22 Document Hooks (Optional)
- [ ] Create `lib/hooks/useDocuments.ts` (if needed)
- [ ] Implement `useDocuments(filters?)`
- [ ] Implement `useUploadDocument()`
- [ ] Implement `useDeleteDocument()`
- [ ] Add progress tracking

#### 2.23 Package Workflows
- [ ] Test: Create package → Add recipients → Add sub-packages → Upload docs → Save draft
- [ ] Test: Open draft → Edit → Send package
- [ ] Test: View sent package → Check delivery status
- [ ] Test: Record response for sub-package
- [ ] Test: Close completed package
- [ ] Test: Delete package (admin)
- [ ] Test: Export package as ZIP

#### 2.24 Error Handling
- [ ] Add error boundaries to all package views
- [ ] Handle network errors gracefully
- [ ] Show user-friendly error messages
- [ ] Add retry functionality
- [ ] Log errors to service

#### 2.25 RBAC for Packages
- [ ] Add permission checks to PackageList
- [ ] Add permission checks to PackageDetail
- [ ] Add permission checks to CreatePackageWizard (create/edit)
- [ ] Add permission checks to send operation
- [ ] Add permission checks to close operation
- [ ] Add permission checks to delete operation
- [ ] Add permission checks to document operations
- [ ] Test with all roles (admin, editor, user)

#### 2.26 Performance Testing
- [ ] Load test with 100+ packages
- [ ] Load test with 10+ sub-packages per package
- [ ] Load test with 50+ recipients per package
- [ ] Load test with large documents (25MB)
- [ ] Measure page load times
- [ ] Optimize queries if needed

### Week 11: Polish & Bug Fixes

#### 2.27 UI Polish
- [ ] Add animations for transitions (fade-in, slide-up)
- [ ] Add loading skeletons
- [ ] Improve hover states (scale, shadow, brightness)
- [ ] Add keyboard navigation
- [ ] Add ARIA labels for accessibility
- [ ] Test with screen reader
- [ ] Add focus indicators (golden ring)
- [ ] Test tab order

#### 2.28 Mobile Responsiveness
- [ ] Test PackageList on mobile
- [ ] Test PackageDetail on mobile
- [ ] Test CreatePackageWizard on mobile
- [ ] Test RecipientSelector on mobile
- [ ] Test DocumentUploader on mobile
- [ ] Adjust layouts for small screens
- [ ] Touch gesture support

#### 2.29 Bug Fixes
- [ ] Fix identified bugs from testing
- [ ] Fix edge cases (empty lists, large data, special characters)
- [ ] Fix timezone issues in date handling
- [ ] Fix file upload issues
- [ ] Fix race conditions in mutations
- [ ] Fix memory leaks in event listeners

#### 2.30 Documentation
- [ ] Document package creation workflow
- [ ] Document response tracking workflow
- [ ] Document permission model
- [ ] Document API usage
- [ ] Create user guide
- [ ] Create admin guide

#### 2.31 UAT Preparation
- [ ] Prepare test scenarios
- [ ] Create test data package
- [ ] Set up UAT environment
- [ ] Create feedback forms
- [ ] Schedule UAT sessions

---

## Phase 3: Deployment (Week 12)

**Status:** ⸲ Not Started
**Dependencies:** Phase 2 Complete

### 3.1 Pre-Deployment
- [ ] Final code review
- [ ] Security audit
- [ ] Performance audit
- [ ] Backup production database
- [ ] Prepare deployment checklist
- [ ] Create rollback plan

### 3.2 Staging Deployment
- [ ] Deploy to staging environment
- [ ] Run database migration
- [ ] Execute department migration
- [ ] Verify all views work (organizations, packages, documents)
- [ ] Test all user workflows
- [ ] Load test staging environment
- [ ] Fix any issues found

### 3.3 UAT
- [ ] Conduct user acceptance testing
- [ ] Gather feedback from stakeholders
- [ ] Fix critical issues
- [ ] Address feedback items
- [ ] Re-test fixes
- [ ] Get sign-off from stakeholders

### 3.4 Production Deployment
- [ ] Schedule maintenance window
- [ ] Notify users of upcoming changes
- [ ] Deploy to production
- [ ] Run database migration
- [ ] Execute department migration
- [ ] Verify production deployment
- [ ] Monitor for issues

### 3.5 Post-Deployment
- [ ] Monitor application performance
- [ ] Monitor error logs
- [ ] Address any issues promptly
- [ ] Gather user feedback
- [ ] Create training materials
- [ ] Conduct user training sessions

### 3.6 Cleanup
- [ ] Remove `departmentLegacy` field after 30 days
- [ ] Archive old data if needed
- [ ] Update documentation
- [ ] Conduct post-mortem
- [ ] Document lessons learned
- [ ] Plan next iteration

---

## Task Legend

| Symbol | Meaning |
|--------|---------|
| ⸲ | Not Started |
| 🔄 | In Progress |
| ✅ | Complete |
| ⚠️ | Blocked |
| ❌ | Failed |

---

## Quick Reference

### Key Files to Modify

| File | Changes |
|------|---------|
| `app/page.tsx` | Add new view states and switch cases |
| `components/Sidebar.tsx` | Add menu items for new views |
| `types.ts` | Add new TypeScript interfaces |
| `services/permissionsService.ts` | Add new permissions (not replace) |
| `services/supabaseClient.ts` | Use existing singleton |

### New Files to Create

**Phase 1 (Hierarchy):**
- `components/hierarchy/OrganizationsList.tsx`
- `components/hierarchy/OrganizationDetail.tsx`
- `components/hierarchy/DepartmentList.tsx`
- `components/hierarchy/DepartmentContacts.tsx`
- `components/hierarchy/DepartmentTree.tsx`
- `components/hierarchy/DepartmentSelector.tsx`
- `components/hierarchy/DepartmentForm.tsx`
- `services/hierarchyService.ts`
- `components/shared/BreadcrumbNav.tsx`
- `components/shared/LoadingSpinner.tsx`
- `components/shared/EmptyState.tsx`
- `components/shared/ErrorBoundary.tsx`
- `components/shared/StatusBadge.tsx`

**Phase 2 (Packages):**
- `components/packages/PackageList.tsx`
- `components/packages/PackageCard.tsx`
- `components/packages/PackageDetail.tsx`
- `components/packages/CreatePackageWizard.tsx`
- `components/packages/SubPackageList.tsx`
- `components/packages/SubPackageDetail.tsx`
- `components/packages/RecipientSelector.tsx`
- `components/packages/ResponseTracker.tsx`
- `components/packages/PackageTimeline.tsx`
- `components/packages/PackageSendWizard.tsx`
- `components/documents/DocumentLibrary.tsx`
- `components/documents/DocumentUploader.tsx`
- `components/documents/DocumentPreview.tsx`
- `services/packageService.ts`
- `services/packageStorageService.ts`

**Phase 0 (Database):**
- `scripts/migrate-departments.ts`
- `scripts/rollback-unified.ts`
- `supabase/functions/generate-pdf-thumbnail/index.ts`

### Command Reference

```bash
# Database operations
npx prisma migrate dev --name add_unified_schema
npx prisma generate
npx prisma studio

# Migration
npm tsx scripts/migrate-departments.ts

# Rollback (if needed)
npm tsx scripts/rollback-unified.ts

# Development
npm run dev

# Build & Type Check
npm run build
npm run check
```

### Component Template (Golden Theme)

```typescript
'use client';

import { useState, useEffect } from 'react';
import { Building2, Search } from 'lucide-react';
import { supabase } from '@/services/supabaseClient';

export default function MyComponent({ onSelect, onChangeView }: Props) {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function fetchData() {
      const { data, error } = await supabase
        .from('table_name')
        .select('*');

      if (error) {
        setError(error);
      } else {
        setData(data);
      }
      setLoading(false);
    }

    fetchData();
  }, []);

  if (loading) return <LoadingSpinner />;
  if (error) return <ErrorState error={error} />;

  return (
    <div className="p-6 bg-stone-50 min-h-screen">
      {/* Golden Theme Header */}
      <div className="mb-6">
        <h1 className="font-serif text-3xl text-slate-800 mb-2">
          Page Title
        </h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24" />
      </div>

      {/* Content with Golden Accents */}
      {/* Use rounded-[2rem] for heavy rounding */}
      {/* Use bg-gradient-to-br for gradients */}
      {/* Icons: className="h-4 w-4" */}
    </div>
  );
}
```

---

**Note:** As tasks are completed, mark them with [x] and update the phase status at the top of each section.
