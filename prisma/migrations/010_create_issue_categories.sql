-- Issue Categories for the Report an Issue feature
-- Admins can manage these categories through the admin panel

CREATE TABLE IF NOT EXISTS issue_categories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  icon VARCHAR(50), -- lucide-react icon name
  sort_order INT NOT NULL DEFAULT 0,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Seed default categories
INSERT INTO issue_categories (name, slug, description, icon, sort_order) VALUES
  ('Food Security & Safety', 'food_safety', 'Pesticides, GMO practices, food contamination, agricultural policy', 'Wheat', 1),
  ('Clean Water & Sanitation', 'water', 'Water contamination, privatisation, pollution, access denial', 'Droplets', 2),
  ('Public Health', 'public_health', 'Pharmaceutical harm, healthcare access, drug safety, public health failures', 'Heart', 3),
  ('Environmental Justice', 'environment', 'Pollution, deforestation, climate negligence, toxic waste', 'Globe2', 4),
  ('Workers'' Rights', 'workers_rights', 'Unsafe conditions, child labour, forced labour, wage theft', 'Users', 5),
  ('Indigenous Rights', 'indigenous', 'Land displacement, cultural destruction, consent violations', 'ShieldCheck', 6),
  ('Justice & Due Process', 'justice', 'Police brutality, arbitrary detention, fair trial violations', 'Gavel', 7),
  ('Right to Information', 'transparency', 'Government secrecy, censorship, whistleblower retaliation', 'Eye', 8),
  ('Other Human Rights Issue', 'other', 'Any other issue affecting human dignity and rights', 'AlertTriangle', 9)
ON CONFLICT (slug) DO NOTHING;

-- Enable RLS
ALTER TABLE issue_categories ENABLE ROW LEVEL SECURITY;

-- Anyone can read active categories (needed for public report form)
CREATE POLICY "Issue categories are publicly readable"
  ON issue_categories FOR SELECT
  USING (true);

-- Only admins can modify categories
CREATE POLICY "Only admins can insert issue categories"
  ON issue_categories FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON r.id = ur.role_id
      JOIN users u ON u.id = ur.user_id
      WHERE r.name = 'admin'
    )
  );

CREATE POLICY "Only admins can update issue categories"
  ON issue_categories FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON r.id = ur.role_id
      WHERE r.name = 'admin'
    )
  );

CREATE POLICY "Only admins can delete issue categories"
  ON issue_categories FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON r.id = ur.role_id
      WHERE r.name = 'admin'
    )
  );

-- Updated_at trigger
CREATE OR REPLACE FUNCTION update_issue_categories_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER issue_categories_updated_at
  BEFORE UPDATE ON issue_categories
  FOR EACH ROW
  EXECUTE FUNCTION update_issue_categories_updated_at();
