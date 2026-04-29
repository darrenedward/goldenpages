-- Migration: add_unified_schema
-- Date: 2026-01-30
-- Description: Add Department hierarchy and Package management models

-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================================
-- ENUMS
-- ============================================================================

-- Package Status Enum
CREATE TYPE "PackageStatus" AS ENUM ('DRAFT', 'PENDING', 'SENT', 'PARTIAL', 'COMPLETED', 'CLOSED', 'CANCELLED');

-- SubPackage Status Enum
CREATE TYPE "SubPackageStatus" AS ENUM ('DRAFT', 'READY', 'SENT', 'RESPONDED', 'OVERDUE', 'CANCELLED');

-- Delivery Status Enum
CREATE TYPE "DeliveryStatus" AS ENUM ('PENDING', 'SENDING', 'SENT', 'DELIVERED', 'FAILED', 'BOUNCED');

-- Response Status Enum
CREATE TYPE "ResponseStatus" AS ENUM ('RECEIVED', 'REVIEWING', 'ACCEPTED', 'REJECTED', 'INCOMPLETE');

-- Document Category Enum
CREATE TYPE "DocumentCategory" AS ENUM ('NOTICE', 'FORM', 'CERTIFICATE', 'CORRESPONDENCE', 'REPORT', 'OTHER');

-- ============================================================================
-- ADD NEW COLUMNS TO EXISTING TABLES
-- ============================================================================

-- Add department_legacy column to contacts (for migration backup)
ALTER TABLE "contacts" ADD COLUMN IF NOT EXISTS "department_legacy" TEXT;

-- Add department_id column to contacts
ALTER TABLE "contacts" ADD COLUMN IF NOT EXISTS "department_id" UUID;

-- Add index on department_id
CREATE INDEX IF NOT EXISTS "contacts_department_id_idx" ON "contacts"("department_id");

-- ============================================================================
-- CREATE NEW TABLES
-- ============================================================================

-- Departments Table
CREATE TABLE "departments" (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "name" TEXT NOT NULL,
    "code" TEXT UNIQUE,
    "description" TEXT,
    "organisation_id" UUID NOT NULL,
    "parent_id" UUID,
    "isActive" BOOLEAN DEFAULT true,
    "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "createdBy" TEXT,
    "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" TEXT,
    UNIQUE("organisation_id", "name")
);

-- Department indexes
CREATE INDEX "departments_organisation_id_idx" ON "departments"("organisation_id");
CREATE INDEX "departments_parent_id_idx" ON "departments"("parent_id");
CREATE INDEX "departments_isActive_idx" ON "departments"("isActive");
CREATE INDEX "departments_code_idx" ON "departments"("code");

-- Packages Table
CREATE TABLE "packages" (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "status" "PackageStatus" DEFAULT 'DRAFT',
    "closed_at" TIMESTAMP,
    "closed_by" TEXT,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT NOT NULL,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_by" TEXT
);

CREATE INDEX "packages_status_idx" ON "packages"("status");
CREATE INDEX "packages_created_by_idx" ON "packages"("created_by");
CREATE INDEX "packages_closed_at_idx" ON "packages"("closed_at");

-- SubPackages Table
CREATE TABLE "sub_packages" (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "package_id" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "sequence" INTEGER DEFAULT 0,
    "expected_reply" TIMESTAMP,
    "actual_reply" TIMESTAMP,
    "status" "SubPackageStatus" DEFAULT 'DRAFT',
    "sent_at" TIMESTAMP,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT NOT NULL,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_by" TEXT,
    CONSTRAINT "sub_packages_package_id_fkey" FOREIGN KEY ("package_id") REFERENCES "packages"("id") ON DELETE CASCADE
);

CREATE INDEX "sub_packages_package_id_idx" ON "sub_packages"("package_id");
CREATE INDEX "sub_packages_status_idx" ON "sub_packages"("status");
CREATE INDEX "sub_packages_expected_reply_idx" ON "sub_packages"("expected_reply");

-- Documents Table
CREATE TABLE "documents" (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "filename" VARCHAR(255) NOT NULL,
    "original_name" VARCHAR(255) NOT NULL,
    "mime_type" VARCHAR(100) NOT NULL,
    "size_bytes" INTEGER NOT NULL,
    "storage_path" VARCHAR(500) NOT NULL,
    "checksum" VARCHAR(64),
    "description" TEXT,
    "category" "DocumentCategory" DEFAULT 'OTHER',
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT NOT NULL
);

CREATE INDEX "documents_created_by_idx" ON "documents"("created_by");
CREATE INDEX "documents_category_idx" ON "documents"("category");

-- Package Documents Junction Table
CREATE TABLE "package_documents" (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "sub_package_id" UUID NOT NULL,
    "document_id" UUID NOT NULL,
    "attached_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "attached_by" TEXT,
    "description" TEXT,
    UNIQUE("sub_package_id", "document_id"),
    CONSTRAINT "package_documents_sub_package_id_fkey" FOREIGN KEY ("sub_package_id") REFERENCES "sub_packages"("id") ON DELETE CASCADE,
    CONSTRAINT "package_documents_document_id_fkey" FOREIGN KEY ("document_id") REFERENCES "documents"("id") ON DELETE CASCADE
);

CREATE INDEX "package_documents_sub_package_id_idx" ON "package_documents"("sub_package_id");

-- Package Recipients Table
CREATE TABLE "package_recipients" (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "package_id" UUID NOT NULL,
    "department_id" UUID NOT NULL,
    "delivery_status" "DeliveryStatus" DEFAULT 'PENDING',
    "sent_at" TIMESTAMP,
    "delivered_at" TIMESTAMP,
    "recipient_name" TEXT,
    "recipient_email" TEXT,
    "notes" TEXT,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT,
    UNIQUE("package_id", "department_id"),
    CONSTRAINT "package_recipients_package_id_fkey" FOREIGN KEY ("package_id") REFERENCES "packages"("id") ON DELETE CASCADE,
    CONSTRAINT "package_recipients_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "departments"("id") ON DELETE CASCADE
);

CREATE INDEX "package_recipients_package_id_idx" ON "package_recipients"("package_id");
CREATE INDEX "package_recipients_department_id_idx" ON "package_recipients"("department_id");
CREATE INDEX "package_recipients_delivery_status_idx" ON "package_recipients"("delivery_status");

-- SubPackage Responses Table
CREATE TABLE "sub_package_responses" (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "sub_package_id" UUID NOT NULL,
    "department_id" UUID NOT NULL,
    "response_date" TIMESTAMP NOT NULL,
    "status" "ResponseStatus" DEFAULT 'RECEIVED',
    "notes" TEXT,
    "document_ids" TEXT[],
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "created_by" TEXT,
    CONSTRAINT "sub_package_responses_sub_package_id_fkey" FOREIGN KEY ("sub_package_id") REFERENCES "sub_packages"("id") ON DELETE CASCADE
);

CREATE INDEX "sub_package_responses_sub_package_id_idx" ON "sub_package_responses"("sub_package_id");
CREATE INDEX "sub_package_responses_department_id_idx" ON "sub_package_responses"("department_id");

-- ============================================================================
-- ADD FOREIGN KEY CONSTRAINTS (for new department_id in contacts)
-- ============================================================================

-- Add foreign key constraint to contacts for department_id (deferred to avoid issues with existing data)
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
        WHERE conname = 'contacts_department_id_fkey'
    ) THEN
        ALTER TABLE "contacts"
        ADD CONSTRAINT "contacts_department_id_fkey"
        FOREIGN KEY ("department_id") REFERENCES "departments"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- ============================================================================
-- ADD INDEX FOR ORGANISATIONS NAME (for performance)
-- ============================================================================

CREATE INDEX IF NOT EXISTS "organisations_name_idx" ON "organisations"("name");

-- ============================================================================
-- GRANT PERMISSIONS (RLS policies will be handled separately)
-- ============================================================================

-- Grant necessary permissions to authenticated users
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO authenticated;

-- ============================================================================
-- MIGRATION COMPLETE
-- ============================================================================
