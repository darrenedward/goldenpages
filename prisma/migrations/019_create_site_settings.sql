-- Create site_settings table for configurable site configuration
-- Stores email addresses, social links, notification preferences as key-value pairs

CREATE TABLE IF NOT EXISTS site_settings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  key VARCHAR(100) UNIQUE NOT NULL,
  value TEXT NOT NULL,
  value_type VARCHAR(20) NOT NULL DEFAULT 'string',
  category VARCHAR(50) NOT NULL,
  label VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID
);

CREATE INDEX IF NOT EXISTS idx_site_settings_category ON site_settings(category);
CREATE INDEX IF NOT EXISTS idx_site_settings_key ON site_settings(key);

-- Enable RLS
ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;

-- Authenticated users can read all settings
DO $$ BEGIN
  CREATE POLICY "Authenticated users can read site settings"
    ON site_settings FOR SELECT
    TO authenticated
    USING (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- Admin users can insert/update/delete settings
DO $$ BEGIN
  CREATE POLICY "Admin users can manage site settings"
    ON site_settings FOR ALL
    TO authenticated
    USING (
      EXISTS (
        SELECT 1 FROM user_roles ur
        JOIN roles r ON r.id = ur."roleId"
        WHERE ur."userId" = auth.uid()::text
        AND r.name = 'admin'
      )
    )
    WITH CHECK (
      EXISTS (
        SELECT 1 FROM user_roles ur
        JOIN roles r ON r.id = ur."roleId"
        WHERE ur."userId" = auth.uid()::text
        AND r.name = 'admin'
      )
    );
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- Seed initial settings with current hardcoded values
INSERT INTO site_settings (key, value, value_type, category, label, description) VALUES
  ('report_email', 'reports@mail.goldenpages.newworldalliances.nz', 'string', 'email', 'Report Notification Email', 'Email address that receives report submission notifications'),
  ('contact_email', 'contact@mail.goldenpages.newworldalliances.nz', 'string', 'email', 'Contact Form Email', 'Email address that receives contact form submissions'),
  ('email_domain', 'mail.goldenpages.newworldalliances.nz', 'string', 'email', 'Email Domain', 'Domain used for sending and receiving emails'),
  ('sender_email', 'notifications@mail.goldenpages.newworldalliances.nz', 'string', 'email', 'Default Sender Email', 'Default from address for outgoing emails'),
  ('sender_name', 'Golden Pages', 'string', 'email', 'Default Sender Name', 'Display name for outgoing emails'),
  ('social_links', '[{"platform":"github","url":"https://github.com/darrenedward","label":"GitHub"},{"platform":"x","url":"https://x.com","label":"X (Twitter)"}]', 'json', 'social', 'Social Media Links', 'JSON array of social media links displayed in the footer'),
  ('notify_on_report', 'true', 'boolean', 'notification', 'Notify on Report Submission', 'Send in-app notifications to admins when a report is submitted'),
  ('notify_on_contact', 'true', 'boolean', 'notification', 'Notify on Contact Submission', 'Send in-app notifications to admins when a contact form is submitted')
ON CONFLICT (key) DO NOTHING;
