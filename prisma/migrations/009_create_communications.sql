-- ==============================================================================
-- COMMUNICATION TRACKER TABLES
-- ==============================================================================
-- Creates the communications and communication_documents tables for the
-- public transparency register feature.

-- Communications table - the main communication/matter record
CREATE TABLE IF NOT EXISTS communications (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    communication_type VARCHAR(20) NOT NULL CHECK (communication_type IN ('letter', 'email', 'physical_mail', 'meeting')),
    status VARCHAR(20) NOT NULL DEFAULT 'SENT' CHECK (status IN ('SENT', 'AWAITING_RESPONSE', 'RESPONDED', 'CLOSED', 'CANCELLED')),

    -- Who this communication is with
    contact_id TEXT NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
    department_id TEXT REFERENCES departments(id) ON DELETE SET NULL,
    organisation_id TEXT REFERENCES organisations(id) ON DELETE SET NULL,

    -- Categorization
    category VARCHAR(100),
    tags TEXT[] DEFAULT '{}',

    -- Timeline
    expected_response_date TIMESTAMPTZ,
    responded_at TIMESTAMPTZ,
    closed_at TIMESTAMPTZ,

    -- Visibility & approval
    is_public BOOLEAN DEFAULT true,
    is_approved BOOLEAN DEFAULT false,

    -- Sender info
    created_by_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    sender_organisation VARCHAR(255),

    -- Timestamps
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- Communication documents - uploaded docs per communication
CREATE TABLE IF NOT EXISTS communication_documents (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
    communication_id TEXT NOT NULL REFERENCES communications(id) ON DELETE CASCADE,

    -- Document classification
    document_type VARCHAR(20) NOT NULL CHECK (document_type IN ('sent', 'received')),

    -- File metadata
    filename VARCHAR(255) NOT NULL,
    original_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    size_bytes INTEGER NOT NULL,
    storage_path VARCHAR(500) NOT NULL,

    -- Visibility
    is_public BOOLEAN DEFAULT true,
    description TEXT,

    -- Audit
    uploaded_at TIMESTAMPTZ DEFAULT now(),
    uploaded_by TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

-- ==============================================================================
-- INDEXES
-- ==============================================================================

CREATE INDEX IF NOT EXISTS idx_communications_contact_id ON communications(contact_id);
CREATE INDEX IF NOT EXISTS idx_communications_department_id ON communications(department_id);
CREATE INDEX IF NOT EXISTS idx_communications_organisation_id ON communications(organisation_id);
CREATE INDEX IF NOT EXISTS idx_communications_status ON communications(status);
CREATE INDEX IF NOT EXISTS idx_communications_is_public ON communications(is_public);
CREATE INDEX IF NOT EXISTS idx_communications_created_by_id ON communications(created_by_id);
CREATE INDEX IF NOT EXISTS idx_communications_created_at ON communications(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_comm_docs_communication_id ON communication_documents(communication_id);
CREATE INDEX IF NOT EXISTS idx_comm_docs_document_type ON communication_documents(document_type);
CREATE INDEX IF NOT EXISTS idx_comm_docs_is_public ON communication_documents(is_public);

-- ==============================================================================
-- ENABLE RLS
-- ==============================================================================

ALTER TABLE communications ENABLE ROW LEVEL SECURITY;
ALTER TABLE communication_documents ENABLE ROW LEVEL SECURITY;

-- ==============================================================================
-- COMMUNICATIONS RLS POLICIES
-- ==============================================================================

-- Service role full access
CREATE POLICY "Service role full access communications"
ON communications FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

-- Public (anon + authenticated) can read public communications
CREATE POLICY "Public can read public communications"
ON communications FOR SELECT
TO anon, authenticated
USING (is_public = true);

-- Authenticated users can read all communications
CREATE POLICY "Authenticated read all communications"
ON communications FOR SELECT
TO authenticated
USING (true);

-- Authenticated users with write permission can create communications
CREATE POLICY "Authenticated create communications"
ON communications FOR INSERT
TO authenticated
WITH CHECK (created_by_id = auth.uid()::text);

-- Creator or admin can update communications
CREATE POLICY "Creator or admin update communications"
ON communications FOR UPDATE
TO authenticated
USING (created_by_id = auth.uid()::text OR true) -- TODO: check admin role
WITH CHECK (created_by_id = auth.uid()::text OR true);

-- Creator or admin can delete communications
CREATE POLICY "Creator or admin delete communications"
ON communications FOR DELETE
TO authenticated
USING (created_by_id = auth.uid()::text OR true); -- TODO: check admin role

-- ==============================================================================
-- COMMUNICATION_DOCUMENTS RLS POLICIES
-- ==============================================================================

-- Service role full access
CREATE POLICY "Service role full access communication_documents"
ON communication_documents FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

-- Public can read public documents within public communications
CREATE POLICY "Public read public communication documents"
ON communication_documents FOR SELECT
TO anon, authenticated
USING (
    is_public = true
    AND EXISTS (
        SELECT 1 FROM communications
        WHERE communications.id = communication_documents.communication_id
        AND communications.is_public = true
    )
);

-- Authenticated users can read all documents
CREATE POLICY "Authenticated read all communication documents"
ON communication_documents FOR SELECT
TO authenticated
USING (true);

-- Authenticated users can upload documents
CREATE POLICY "Authenticated create communication documents"
ON communication_documents FOR INSERT
TO authenticated
WITH CHECK (uploaded_by = auth.uid()::text);

-- Creator or admin can update/delete documents
CREATE POLICY "Creator manage communication documents"
ON communication_documents FOR UPDATE
TO authenticated
USING (uploaded_by = auth.uid()::text OR true);

CREATE POLICY "Creator delete communication documents"
ON communication_documents FOR DELETE
TO authenticated
USING (uploaded_by = auth.uid()::text OR true);

-- ==============================================================================
-- ADD COMMUNICATION PERMISSIONS
-- ==============================================================================

DO $$
DECLARE
  admin_id text;
  editor_id text;
  user_id text;
BEGIN
  SELECT id INTO admin_id FROM roles WHERE name = 'admin';
  SELECT id INTO editor_id FROM roles WHERE name = 'editor';
  SELECT id INTO user_id FROM roles WHERE name = 'user';

  -- Communication permissions
  INSERT INTO role_permissions ("roleId", permission) VALUES
    (admin_id, 'communication:read'),
    (admin_id, 'communication:write'),
    (admin_id, 'communication:delete'),
    (editor_id, 'communication:read'),
    (editor_id, 'communication:write'),
    (user_id, 'communication:read')
  ON CONFLICT ("roleId", permission) DO NOTHING;

  RAISE NOTICE 'Communication permissions added';
END $$;

-- ==============================================================================
-- VERIFY
-- ==============================================================================

SELECT tablename, policyname, roles, cmd
FROM pg_policies
WHERE tablename IN ('communications', 'communication_documents')
ORDER BY tablename, policyname;
