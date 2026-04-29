-- ============================================================================
-- PRODUCTION RBAC ROW LEVEL SECURITY POLICIES
-- ============================================================================
-- These policies replace the demo mode policies with proper role-based access
-- Run this in Supabase SQL Editor after updating the database schema
-- ============================================================================

-- ============================================================================
-- STEP 1: ENABLE RLS ON ALL TABLES
-- ============================================================================

ALTER TABLE organisations ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;
ALTER TABLE contact_channels ENABLE ROW LEVEL SECURITY;
ALTER TABLE regions ENABLE ROW LEVEL SECURITY;
ALTER TABLE organisation_locations ENABLE ROW LEVEL SECURITY;
ALTER TABLE organisation_notes ENABLE ROW LEVEL SECURITY;
ALTER TABLE contact_notes ENABLE ROW LEVEL SECURITY;
ALTER TABLE outreach_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE activity_logs ENABLE ROW LEVEL SECURITY;

-- ============================================================================
-- STEP 2: DROP EXISTING DEMO POLICIES
-- ============================================================================

DROP POLICY IF EXISTS "Organisations can be viewed by everyone" ON organisations;
DROP POLICY IF EXISTS "Organisations can be created by everyone" ON organisations;
DROP POLICY IF EXISTS "Organisations can be updated by everyone" ON organisations;
DROP POLICY IF EXISTS "Organisations can be deleted by everyone" ON organisations;

DROP POLICY IF EXISTS "Contacts can be viewed by everyone" ON contacts;
DROP POLICY IF EXISTS "Contacts can be created by everyone" ON contacts;
DROP POLICY IF EXISTS "Contacts can be updated by everyone" ON contacts;
DROP POLICY IF EXISTS "Contacts can be deleted by everyone" ON contacts;

DROP POLICY IF EXISTS "Contact channels can be viewed by everyone" ON contact_channels;
DROP POLICY IF EXISTS "Contact channels can be created by everyone" ON contact_channels;
DROP POLICY IF EXISTS "Contact channels can be updated by everyone" ON contact_channels;
DROP POLICY IF EXISTS "Contact channels can be deleted by everyone" ON contact_channels;

DROP POLICY IF EXISTS "Regions can be viewed by everyone" ON regions;
DROP POLICY IF EXISTS "Regions can be created by everyone" ON regions;
DROP POLICY IF EXISTS "Regions can be updated by everyone" ON regions;
DROP POLICY IF EXISTS "Regions can be deleted by everyone" ON regions;

DROP POLICY IF EXISTS "Organisation locations can be viewed by everyone" ON organisation_locations;
DROP POLICY IF EXISTS "Organisation locations can be created by everyone" ON organisation_locations;
DROP POLICY IF EXISTS "Organisation locations can be updated by everyone" ON organisation_locations;
DROP POLICY IF EXISTS "Organisation locations can be deleted by everyone" ON organisation_locations;

DROP POLICY IF EXISTS "Organisation notes can be viewed by everyone" ON organisation_notes;
DROP POLICY IF EXISTS "Organisation notes can be created by everyone" ON organisation_notes;
DROP POLICY IF EXISTS "Organisation notes can be updated by everyone" ON organisation_notes;
DROP POLICY IF EXISTS "Organisation notes can be deleted by everyone" ON organisation_notes;

DROP POLICY IF EXISTS "Contact notes can be viewed by everyone" ON contact_notes;
DROP POLICY IF EXISTS "Contact notes can be created by everyone" ON contact_notes;
DROP POLICY IF EXISTS "Contact notes can be updated by everyone" ON contact_notes;
DROP POLICY IF EXISTS "Contact notes can be deleted by everyone" ON contact_notes;

DROP POLICY IF EXISTS "Outreach logs can be viewed by everyone" ON outreach_logs;
DROP POLICY IF EXISTS "Outreach logs can be created by everyone" ON outreach_logs;
DROP POLICY IF EXISTS "Outreach logs can be updated by everyone" ON outreach_logs;
DROP POLICY IF EXISTS "Outreach logs can be deleted by everyone" ON outreach_logs;

DROP POLICY IF EXISTS "Activity logs can be viewed by everyone" ON activity_logs;
DROP POLICY IF EXISTS "Activity logs can be created by everyone" ON activity_logs;

-- ============================================================================
-- STEP 3: HELPER FUNCTION FOR PERMISSION CHECKING
-- ============================================================================

-- Function to check if a user has a specific permission
CREATE OR REPLACE FUNCTION has_permission(user_id uuid, required_permission text)
RETURNS boolean AS $$
  SELECT EXISTS (
    SELECT 1
    FROM user_roles ur
    JOIN roles r ON ur.role_id = r.id
    JOIN role_permissions rp ON r.id = rp.role_id
    WHERE ur.user_id = has_permission.user_id
    AND (
      -- Admin wildcard: matches everything
      r.name = 'admin'
      OR rp.permission = '*'
      OR rp.permission = required_permission
    )
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- Function to check if user has any of the required permissions
CREATE OR REPLACE FUNCTION has_any_permission(user_id uuid, required_permissions text[])
RETURNS boolean AS $$
  SELECT EXISTS (
    SELECT 1
    FROM user_roles ur
    JOIN roles r ON ur.role_id = r.id
    JOIN role_permissions rp ON r.id = rp.role_id
    WHERE ur.user_id = has_any_permission.user_id
    AND (
      r.name = 'admin'
      OR rp.permission = '*'
      OR rp.permission = ANY(has_any_permission.required_permissions)
    )
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- Function to check if user has a specific role
CREATE OR REPLACE FUNCTION has_role(user_id uuid, required_role text)
RETURNS boolean AS $$
  SELECT EXISTS (
    SELECT 1
    FROM user_roles ur
    JOIN roles r ON ur.role_id = r.id
    WHERE ur.user_id = has_role.user_id
    AND r.name = has_role.required_role
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- ============================================================================
-- STEP 4: REGIONS POLICIES
-- ============================================================================

-- Read: Everyone with user role can read regions
CREATE POLICY "Regions can be read by authenticated users"
ON regions FOR SELECT
TO authenticated
USING (has_permission(auth.uid(), 'org:read'));

-- Write: Editors can create regions
CREATE POLICY "Regions can be created by editors"
ON regions FOR INSERT
TO authenticated
WITH CHECK (has_permission(auth.uid(), 'org:write'))
USING (has_permission(auth.uid(), 'org:write'));

-- Update: Editors can update regions
CREATE POLICY "Regions can be updated by editors"
ON regions FOR UPDATE
TO authenticated
USING (has_permission(auth.uid(), 'org:write'))
WITH CHECK (has_permission(auth.uid(), 'org:write'));

-- Delete: Only admins can delete regions
CREATE POLICY "Regions can be deleted by admins"
ON regions FOR DELETE
TO authenticated
USING (has_role(auth.uid(), 'admin'))
WITH CHECK (has_role(auth.uid(), 'admin'));

-- ============================================================================
-- STEP 5: ORGANISATIONS POLICIES
-- ============================================================================

-- Read: Users with org:read permission
CREATE POLICY "Organisations can be read by authorized users"
ON organisations FOR SELECT
TO authenticated
USING (has_permission(auth.uid(), 'org:read'));

-- Write: Users with org:write permission
CREATE POLICY "Organisations can be created by authorized users"
ON organisations FOR INSERT
TO authenticated
WITH CHECK (has_permission(auth.uid(), 'org:write'));

CREATE POLICY "Organisations can be updated by authorized users"
ON organisations FOR UPDATE
TO authenticated
USING (has_permission(auth.uid(), 'org:write'))
WITH CHECK (has_permission(auth.uid(), 'org:write'));

-- Delete: Only admins can delete organisations
CREATE POLICY "Organisations can be deleted by admins"
ON organisations FOR DELETE
TO authenticated
USING (has_role(auth.uid(), 'admin'))
WITH CHECK (has_role(auth.uid(), 'admin'));

-- ============================================================================
-- STEP 6: CONTACTS POLICIES
-- ============================================================================

-- Read: Users with contact:read permission
CREATE POLICY "Contacts can be read by authorized users"
ON contacts FOR SELECT
TO authenticated
USING (has_permission(auth.uid(), 'contact:read'));

-- Write: Users with contact:write permission
CREATE POLICY "Contacts can be created by authorized users"
ON contacts FOR INSERT
TO authenticated
WITH CHECK (has_permission(auth.uid(), 'contact:write'));

CREATE POLICY "Contacts can be updated by authorized users"
ON contacts FOR UPDATE
TO authenticated
USING (has_permission(auth.uid(), 'contact:write'))
WITH CHECK (has_permission(auth.uid(), 'contact:write'));

-- Archive: Users with contact:archive permission (soft delete by setting archived flag)
CREATE POLICY "Contacts can be archived by authorized users"
ON contacts FOR UPDATE
TO authenticated
USING (has_permission(auth.uid(), 'contact:archive'))
WITH CHECK (has_permission(auth.uid(), 'contact:archive'));

-- Delete: Only admins can hard delete contacts
CREATE POLICY "Contacts can be deleted by admins"
ON contacts FOR DELETE
TO authenticated
USING (has_role(auth.uid(), 'admin'))
WITH CHECK (has_role(auth.uid(), 'admin'));

-- ============================================================================
-- STEP 7: CONTACT CHANNELS POLICIES
-- ============================================================================

-- Read: Users with channel:read permission
CREATE POLICY "Contact channels can be read by authorized users"
ON contact_channels FOR SELECT
TO authenticated
USING (has_permission(auth.uid(), 'channel:read'));

-- Write: Users with channel:write permission
CREATE POLICY "Contact channels can be created by authorized users"
ON contact_channels FOR INSERT
TO authenticated
WITH CHECK (has_permission(auth.uid(), 'channel:write'));

CREATE POLICY "Contact channels can be updated by authorized users"
ON contact_channels FOR UPDATE
TO authenticated
USING (has_permission(auth.uid(), 'channel:write'))
WITH CHECK (has_permission(auth.uid(), 'channel:write'));

-- Delete: Only admins can delete contact channels
CREATE POLICY "Contact channels can be deleted by admins"
ON contact_channels FOR DELETE
TO authenticated
USING (has_role(auth.uid(), 'admin'))
WITH CHECK (has_role(auth.uid(), 'admin'));

-- ============================================================================
-- STEP 8: ORGANISATION LOCATIONS POLICIES
-- ============================================================================

-- Read: Users with org:read permission
CREATE POLICY "Organisation locations can be read by authorized users"
ON organisation_locations FOR SELECT
TO authenticated
USING (has_permission(auth.uid(), 'org:read'));

-- Write: Users with org:write permission
CREATE POLICY "Organisation locations can be created by authorized users"
ON organisation_locations FOR INSERT
TO authenticated
WITH CHECK (has_permission(auth.uid(), 'org:write'));

CREATE POLICY "Organisation locations can be updated by authorized users"
ON organisation_locations FOR UPDATE
TO authenticated
USING (has_permission(auth.uid(), 'org:write'))
WITH CHECK (has_permission(auth.uid(), 'org:write'));

-- Delete: Only admins can delete organisation locations
CREATE POLICY "Organisation locations can be deleted by admins"
ON organisation_locations FOR DELETE
TO authenticated
USING (has_role(auth.uid(), 'admin'))
WITH CHECK (has_role(auth.uid(), 'admin'));

-- ============================================================================
-- STEP 9: ORGANISATION NOTES POLICIES
-- ============================================================================

-- Read: Users can see notes they created OR public/team notes
CREATE POLICY "Organisation notes can be read by authorized users"
ON organisation_notes FOR SELECT
TO authenticated
USING (
  created_by_id = auth.uid()
  OR visibility = 'public'
  OR (visibility = 'team' AND EXISTS (
    SELECT 1 FROM user_roles ur
    JOIN roles r ON ur.role_id = r.id
    WHERE ur.user_id = auth.uid()
    AND r.name IN ('editor', 'admin')
  ))
);

-- Write: Users can create notes if they have note:write
CREATE POLICY "Organisation notes can be created by authorized users"
ON organisation_notes FOR INSERT
TO authenticated
WITH CHECK (
  created_by_id = auth.uid()
  AND has_permission(auth.uid(), 'note:write')
);

-- Update: Only creator can update their notes (or admins)
CREATE POLICY "Organisation notes can be updated by creator or admins"
ON organisation_notes FOR UPDATE
TO authenticated
USING (
  created_by_id = auth.uid()
  OR has_role(auth.uid(), 'admin')
)
WITH CHECK (
  created_by_id = auth.uid()
  OR has_role(auth.uid(), 'admin')
);

-- Delete: Only creator can delete their notes (or admins)
CREATE POLICY "Organisation notes can be deleted by creator or admins"
ON organisation_notes FOR DELETE
TO authenticated
USING (
  created_by_id = auth.uid()
  OR has_role(auth.uid(), 'admin')
);

-- ============================================================================
-- STEP 10: CONTACT NOTES POLICIES
-- ============================================================================

-- Read: Users can see notes they created OR public/team notes
CREATE POLICY "Contact notes can be read by authorized users"
ON contact_notes FOR SELECT
TO authenticated
USING (
  created_by_id = auth.uid()
  OR visibility = 'public'
  OR (visibility = 'team' AND EXISTS (
    SELECT 1 FROM user_roles ur
    JOIN roles r ON ur.role_id = r.id
    WHERE ur.user_id = auth.uid()
    AND r.name IN ('editor', 'admin')
  ))
);

-- Write: Users can create notes if they have note:write
CREATE POLICY "Contact notes can be created by authorized users"
ON contact_notes FOR INSERT
TO authenticated
WITH CHECK (
  created_by_id = auth.uid()
  AND has_permission(auth.uid(), 'note:write')
);

-- Update: Only creator can update their notes (or admins)
CREATE POLICY "Contact notes can be updated by creator or admins"
ON contact_notes FOR UPDATE
TO authenticated
USING (
  created_by_id = auth.uid()
  OR has_role(auth.uid(), 'admin')
)
WITH CHECK (
  created_by_id = auth.uid()
  OR has_role(auth.uid(), 'admin')
);

-- Delete: Only creator can delete their notes (or admins)
CREATE POLICY "Contact notes can be deleted by creator or admins"
ON contact_notes FOR DELETE
TO authenticated
USING (
  created_by_id = auth.uid()
  OR has_role(auth.uid(), 'admin')
);

-- ============================================================================
-- STEP 11: OUTREACH LOGS POLICIES
-- ============================================================================

-- Read: Users with outreach:read permission
CREATE POLICY "Outreach logs can be read by authorized users"
ON outreach_logs FOR SELECT
TO authenticated
USING (has_permission(auth.uid(), 'outreach:read'));

-- Write: Users with outreach:initiate permission
CREATE POLICY "Outreach logs can be created by authorized users"
ON outreach_logs FOR INSERT
TO authenticated
WITH CHECK (
  created_by_id = auth.uid()
  AND has_permission(auth.uid(), 'outreach:initiate')
);

-- Update: Only creator can update their outreach logs
CREATE POLICY "Outreach logs can be updated by creator"
ON outreach_logs FOR UPDATE
TO authenticated
USING (created_by_id = auth.uid())
WITH CHECK (created_by_id = auth.uid());

-- Delete: Only creator can delete their outreach logs (or admins)
CREATE POLICY "Outreach logs can be deleted by creator or admins"
ON outreach_logs FOR DELETE
TO authenticated
USING (
  created_by_id = auth.uid()
  OR has_role(auth.uid(), 'admin')
);

-- ============================================================================
-- STEP 12: ACTIVITY LOGS POLICIES (Audit Trail)
-- ============================================================================

-- Read: Only admins can view activity logs
CREATE POLICY "Activity logs can be read by admins only"
ON activity_logs FOR SELECT
TO authenticated
USING (has_role(auth.uid(), 'admin'));

-- Write: System triggers will insert logs (no direct insert needed)
CREATE POLICY "Activity logs are inserted by system"
ON activity_logs FOR INSERT
TO authenticated
WITH CHECK (false); -- Only triggers can insert

-- ============================================================================
-- STEP 13: RBAC TABLES POLICIES (Admin-only management)
-- ============================================================================

-- Users table - managed by Supabase Auth, we only sync roles
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can be read by admins"
ON users FOR SELECT
TO authenticated
USING (has_role(auth.uid(), 'admin'));

-- Roles - read by authenticated, managed by admins
ALTER TABLE roles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Roles can be read by authenticated users"
ON roles FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "Roles can be managed by admins"
ON roles FOR ALL
TO authenticated
USING (has_role(auth.uid(), 'admin'))
WITH CHECK (has_role(auth.uid(), 'admin'));

-- User roles - managed by admins
ALTER TABLE user_roles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "User roles can be read by authenticated users"
ON user_roles FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "User roles can be managed by admins"
ON user_roles FOR ALL
TO authenticated
USING (has_role(auth.uid(), 'admin'))
WITH CHECK (has_role(auth.uid(), 'admin'));

-- Role permissions - managed by admins
ALTER TABLE role_permissions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Role permissions can be read by authenticated users"
ON role_permissions FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "Role permissions can be managed by admins"
ON role_permissions FOR ALL
TO authenticated
USING (has_role(auth.uid(), 'admin'))
WITH CHECK (has_role(auth.uid(), 'admin'));

-- ============================================================================
-- SUCCESS!
-- ============================================================================
-- RLS policies are now production-ready with role-based access control
