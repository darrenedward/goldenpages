-- Add isActive column to contacts table
-- Used to distinguish current officeholders from former ones
ALTER TABLE contacts ADD COLUMN IF NOT EXISTS "isActive" BOOLEAN NOT NULL DEFAULT true;
CREATE INDEX IF NOT EXISTS idx_contacts_is_active ON contacts("isActive");
