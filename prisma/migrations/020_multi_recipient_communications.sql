-- ==============================================================================
-- MULTI-RECIPIENT COMMUNICATIONS
-- ==============================================================================
-- Creates communication_recipients junction table, adds recipient_id to
-- communication_documents, makes communications.contact_id nullable,
-- and migrates existing single-recipient data.

-- ==============================================================================
-- 1. Make communications.contact_id nullable
-- ==============================================================================

ALTER TABLE communications
  ALTER COLUMN contact_id DROP NOT NULL;

-- ==============================================================================
-- 2. Add recipient_id to communication_documents (nullable = general/shared doc)
-- ==============================================================================

ALTER TABLE communication_documents
  ADD COLUMN IF NOT EXISTS recipient_id TEXT;

CREATE INDEX IF NOT EXISTS idx_comm_docs_recipient_id
  ON communication_documents(recipient_id);

-- ==============================================================================
-- 3. Create communication_recipients table
-- ==============================================================================

CREATE TABLE IF NOT EXISTS communication_recipients (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
    communication_id TEXT NOT NULL REFERENCES communications(id) ON DELETE CASCADE,
    department_id TEXT NOT NULL REFERENCES departments(id) ON DELETE CASCADE,
    contact_id TEXT REFERENCES contacts(id) ON DELETE SET NULL,

    -- Delivery tracking
    delivery_status VARCHAR(20) NOT NULL DEFAULT 'PENDING'
      CHECK (delivery_status IN ('PENDING', 'SENDING', 'SENT', 'DELIVERED', 'FAILED', 'BOUNCED')),
    sent_at TIMESTAMPTZ,
    delivered_at TIMESTAMPTZ,

    -- Response tracking
    response_status VARCHAR(20) NOT NULL DEFAULT 'RECEIVED'
      CHECK (response_status IN ('RECEIVED', 'REVIEWING', 'ACCEPTED', 'REJECTED', 'INCOMPLETE')),
    response_date TIMESTAMPTZ,

    notes TEXT,

    -- Audit
    created_at TIMESTAMPTZ DEFAULT now(),
    created_by TEXT REFERENCES users(id) ON DELETE SET NULL,

    UNIQUE(communication_id, department_id)
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_comm_recipients_comm_id
  ON communication_recipients(communication_id);
CREATE INDEX IF NOT EXISTS idx_comm_recipients_dept_id
  ON communication_recipients(department_id);
CREATE INDEX IF NOT EXISTS idx_comm_recipients_contact_id
  ON communication_recipients(contact_id);
CREATE INDEX IF NOT EXISTS idx_comm_recipients_delivery_status
  ON communication_recipients(delivery_status);
CREATE INDEX IF NOT EXISTS idx_comm_recipients_response_status
  ON communication_recipients(response_status);

-- ==============================================================================
-- 4. Migrate existing data: create recipient rows from existing communications
-- ==============================================================================

INSERT INTO communication_recipients (communication_id, department_id, contact_id, delivery_status, created_by)
SELECT
    c.id,
    COALESCE(c.department_id, (
        SELECT ct."departmentId" FROM contacts ct WHERE ct.id = c.contact_id
    )),
    c.contact_id,
    CASE
        WHEN c.status IN ('SENT', 'RESPONDED', 'CLOSED') THEN 'SENT'
        ELSE 'PENDING'
    END,
    c.created_by_id
FROM communications c
WHERE c.contact_id IS NOT NULL
ON CONFLICT (communication_id, department_id) DO NOTHING;

-- ==============================================================================
-- 5. Enable RLS on communication_recipients
-- ==============================================================================

ALTER TABLE communication_recipients ENABLE ROW LEVEL SECURITY;

-- Service role full access
CREATE POLICY "Service role full access communication_recipients"
ON communication_recipients FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

-- Authenticated users can read all recipients
CREATE POLICY "Authenticated read all communication_recipients"
ON communication_recipients FOR SELECT
TO authenticated
USING (true);

-- Authenticated users can create recipients (must be communication creator)
CREATE POLICY "Authenticated create communication_recipients"
ON communication_recipients FOR INSERT
TO authenticated
WITH CHECK (
    EXISTS (
        SELECT 1 FROM communications
        WHERE communications.id = communication_recipients.communication_id
        AND communications.created_by_id = auth.uid()::text
    )
);

-- Creator or admin can update recipients
CREATE POLICY "Creator or admin update communication_recipients"
ON communication_recipients FOR UPDATE
TO authenticated
USING (
    EXISTS (
        SELECT 1 FROM communications
        WHERE communications.id = communication_recipients.communication_id
        AND (communications.created_by_id = auth.uid()::text OR true)
    )
);

-- Creator or admin can delete recipients
CREATE POLICY "Creator or admin delete communication_recipients"
ON communication_recipients FOR DELETE
TO authenticated
USING (
    EXISTS (
        SELECT 1 FROM communications
        WHERE communications.id = communication_recipients.communication_id
        AND (communications.created_by_id = auth.uid()::text OR true)
    )
);

-- ==============================================================================
-- 6. Add FK constraint for communication_documents.recipient_id
-- ==============================================================================

ALTER TABLE communication_documents
  ADD CONSTRAINT fk_comm_docs_recipient_id
  FOREIGN KEY (recipient_id) REFERENCES communication_recipients(id) ON DELETE SET NULL;

-- ==============================================================================
-- VERIFY
-- ==============================================================================

SELECT 'communication_recipients' as table_name, count(*) as row_count
FROM communication_recipients
UNION ALL
SELECT 'communications with contact_id' as table_name, count(*) as row_count
FROM communications WHERE contact_id IS NOT NULL;
