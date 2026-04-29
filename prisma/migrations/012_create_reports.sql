-- ==============================================================================
-- REPORTS TABLE — Public issue reports from the transparency register
-- ==============================================================================

CREATE TABLE IF NOT EXISTS reports (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL,
  category TEXT NOT NULL,
  urgency TEXT NOT NULL CHECK (urgency IN ('informational', 'concern', 'urgent', 'critical')),
  organization_name TEXT,
  country TEXT,
  subject TEXT NOT NULL,
  description TEXT NOT NULL,
  is_anonymous BOOLEAN NOT NULL DEFAULT false,
  status TEXT NOT NULL DEFAULT 'submitted' CHECK (status IN ('submitted', 'reviewing', 'investigating', 'resolved', 'dismissed')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Indexes for common queries
CREATE INDEX idx_reports_status ON reports(status);
CREATE INDEX idx_reports_category ON reports(category);
CREATE INDEX idx_reports_urgency ON reports(urgency);
CREATE INDEX idx_reports_created_at ON reports(created_at DESC);

-- RLS: Anyone can insert (public report form), only authenticated users can read
ALTER TABLE reports ENABLE ROW LEVEL SECURITY;

-- Public insert (no auth required — anonymous reports allowed)
CREATE POLICY "Public can submit reports" ON reports
  FOR INSERT TO anon, authenticated
  WITH CHECK (true);

-- Only authenticated users can read reports (dashboard)
CREATE POLICY "Authenticated can read reports" ON reports
  FOR SELECT TO authenticated
  USING (true);

-- Only admins can update reports
CREATE POLICY "Admins can update reports" ON reports
  FOR UPDATE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON r.id = ur.role_id
      WHERE ur.user_id = auth.uid() AND r.name = 'admin'
    )
  );
