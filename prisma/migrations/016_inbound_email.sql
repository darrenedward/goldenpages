-- 016: Inbound Email Handling & Multi-Address Support
-- Creates inbound_emails table for receiving emails via Resend webhooks

-- ============================================================================
-- INBOUND EMAILS TABLE
-- ============================================================================

CREATE TABLE inbound_emails (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid()::text,
  from_email TEXT NOT NULL,
  from_name TEXT,
  to_email TEXT NOT NULL,
  subject TEXT NOT NULL,
  body_text TEXT,
  body_html TEXT,
  headers JSONB,
  message_id TEXT,
  in_reply_to TEXT,
  communication_id TEXT REFERENCES communications(id) ON DELETE SET NULL,
  contact_submission_id UUID REFERENCES contact_submissions(id) ON DELETE SET NULL,
  status TEXT NOT NULL DEFAULT 'received'
    CHECK (status IN ('received', 'linked', 'unlinked', 'error')),
  processed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_inbound_emails_communication ON inbound_emails(communication_id);
CREATE INDEX idx_inbound_emails_status ON inbound_emails(status);
CREATE INDEX idx_inbound_emails_created ON inbound_emails(created_at DESC);

-- ============================================================================
-- RLS POLICIES
-- ============================================================================

ALTER TABLE inbound_emails ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can read inbound emails" ON inbound_emails
  FOR SELECT TO authenticated USING (true);

CREATE POLICY "Service role can manage inbound emails" ON inbound_emails
  FOR ALL TO authenticated USING (true) WITH CHECK (true);

-- ============================================================================
-- CONTACT SUBMISSIONS: Add email_type column
-- ============================================================================

ALTER TABLE contact_submissions ADD COLUMN IF NOT EXISTS email_type TEXT DEFAULT 'form'
  CHECK (email_type IN ('form', 'inbound_enquiry', 'inbound_contact'));

-- ============================================================================
-- NOTIFICATION TYPE: Add inbound email notification types
-- ============================================================================

ALTER TYPE notification_type ADD VALUE IF NOT EXISTS 'inbound_email_received';
ALTER TYPE notification_type ADD VALUE IF NOT EXISTS 'contact_submission_received';
ALTER TYPE notification_type ADD VALUE IF NOT EXISTS 'report_submission_received';
