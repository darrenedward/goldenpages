-- ==============================================================================
-- LINK COMMUNICATIONS TO ISSUE CATEGORIES + ZERO TRUST RLS
-- ==============================================================================

-- Add category_id FK to communications (uuid to match issue_categories.id type)
ALTER TABLE communications ADD COLUMN category_id UUID REFERENCES issue_categories(id);
CREATE INDEX idx_communications_category_id ON communications(category_id);

-- Replace permissive public read policy with zero-trust version
-- Public users (anon) can only see communications that are BOTH public AND approved
DROP POLICY IF EXISTS "Public can read public communications" ON communications;
CREATE POLICY "Public can read approved public communications" ON communications
  FOR SELECT TO anon
  USING (is_public = true AND is_approved = true);

-- Authenticated users keep full read access (they use the dashboard)
-- The existing "Authenticated read all communications" policy remains unchanged
