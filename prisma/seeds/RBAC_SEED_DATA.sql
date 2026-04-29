-- ============================================================================
-- RBAC SEED DATA - Default Roles and Permissions
-- ============================================================================
-- This file sets up the default role-based access control structure
-- Run this after applying the schema and RLS policies
-- ============================================================================

-- ============================================================================
-- STEP 1: CREATE ROLES
-- ============================================================================

-- Admin role - Full system access
INSERT INTO roles (id, name, description) VALUES
  ('00000000-0000-0000-0000-000000000001', 'admin', 'Full system access with all permissions')
ON CONFLICT (name) DO NOTHING;

-- Editor role - Can read/write most data
INSERT INTO roles (id, name, description) VALUES
  ('00000000-0000-0000-0000-000000000002', 'editor', 'Can read and write organizations, contacts, and related data')
ON CONFLICT (name) DO NOTHING;

-- User role - Read-only access
INSERT INTO roles (id, name, description) VALUES
  ('00000000-0000-0000-0000-000000000003', 'user', 'Read-only access to organizations and contacts')
ON CONFLICT (name) DO NOTHING;

-- ============================================================================
-- STEP 2: CREATE PERMISSIONS
-- ============================================================================

-- Admin permissions - Wildcard for full access
INSERT INTO role_permissions (role_id, permission) VALUES
  ('00000000-0000-0000-0000-000000000001', '*')
ON CONFLICT (role_id, permission) DO NOTHING;

-- Editor permissions
INSERT INTO role_permissions (role_id, permission) VALUES
  ('00000000-0000-0000-0000-000000000002', 'org:read'),
  ('00000000-0000-0000-0000-000000000002', 'org:write'),
  ('00000000-0000-0000-0000-000000000002', 'contact:read'),
  ('00000000-0000-0000-0000-000000000002', 'contact:write'),
  ('00000000-0000-0000-0000-000000000002', 'contact:archive'),
  ('00000000-0000-0000-0000-000000000002', 'channel:read'),
  ('00000000-0000-0000-0000-000000000002', 'channel:write'),
  ('00000000-0000-0000-0000-000000000002', 'note:read'),
  ('00000000-0000-0000-0000-000000000002', 'note:write'),
  ('00000000-0000-0000-0000-000000000002', 'outreach:read'),
  ('00000000-0000-0000-0000-000000000002', 'outreach:initiate')
ON CONFLICT (role_id, permission) DO NOTHING;

-- User permissions - Read-only
INSERT INTO role_permissions (role_id, permission) VALUES
  ('00000000-0000-0000-0000-000000000003', 'org:read'),
  ('00000000-0000-0000-0000-000000000003', 'contact:read'),
  ('00000000-0000-0000-0000-000000000003', 'channel:read'),
  ('00000000-0000-0000-0000-000000000003', 'note:read')
ON CONFLICT (role_id, permission) DO NOTHING;

-- ============================================================================
-- STEP 3: CREATE DEFAULT ADMIN USER (Optional)
-- ============================================================================
-- This creates a default admin user that you can use to bootstrap the system
-- IMPORTANT: Change the password immediately after first login!
-- Instructions:
-- 1. Run this SQL to create the auth user
-- 2. The user will have admin role and can then assign roles to other users

-- Note: This is commented out by default. Uncomment and run if needed.
-- You'll need to create the auth user via Supabase Auth first, then assign role:

-- Example: Assign admin role to a specific user ID
-- UPDATE users SET id = 'your-auth-user-id' WHERE email = 'admin@example.com';
-- INSERT INTO user_roles (user_id, role_id) VALUES
--   ('your-auth-user-id', '00000000-0000-0000-0000-000000000001')
-- ON CONFLICT (user_id, role_id) DO NOTHING;

-- ============================================================================
-- STEP 4: HELPER FUNCTION TO ASSIGN ROLE TO USER
-- ============================================================================

-- Function to assign a role to a user
CREATE OR REPLACE FUNCTION assign_role(user_email text, role_name text)
RETURNS boolean AS $$
DECLARE
  v_user_id uuid;
  v_role_id uuid;
BEGIN
  -- Get user ID from users table
  SELECT id INTO v_user_id FROM users WHERE email = user_email;

  IF v_user_id IS NULL THEN
    RAISE EXCEPTION 'User % not found', user_email;
  END IF;

  -- Get role ID
  SELECT id INTO v_role_id FROM roles WHERE name = role_name::user_role;

  IF v_role_id IS NULL THEN
    RAISE EXCEPTION 'Role % not found', role_name;
  END IF;

  -- Assign role
  INSERT INTO user_roles (user_id, role_id)
  VALUES (v_user_id, v_role_id)
  ON CONFLICT (user_id, role_id) DO NOTHING;

  RETURN true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to check user permissions (helper for debugging)
CREATE OR REPLACE FUNCTION user_permissions(p_user_id uuid)
RETURNS table(permission text) AS $$
  SELECT DISTINCT rp.permission
  FROM role_permissions rp
  JOIN user_roles ur ON rp.role_id = ur.role_id
  WHERE ur.user_id = p_user_id
  ORDER BY permission;
$$ LANGUAGE sql SECURITY DEFINER;

-- ============================================================================
-- STEP 5: CREATE FIRST USER ADMIN HELPER
-- ============================================================================

-- Function to make a user an admin (use with caution!)
CREATE OR REPLACE FUNCTION make_admin(user_email text)
RETURNS boolean AS $$
BEGIN
  PERFORM assign_role(user_email, 'admin');
  RETURN true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================================
-- SUCCESS!
-- ============================================================================
-- RBAC system is now seeded with:
-- - 3 roles: admin, editor, user
-- - Admin has wildcard (*) permissions
-- - Editor has read/write permissions
-- - User has read-only permissions
--
-- To assign roles to users:
--   SELECT assign_role('user@example.com', 'editor');
--   SELECT make_admin('admin@example.com');
--
-- To check user permissions:
--   SELECT * FROM user_permissions('user-uuid');
-- ============================================================================
