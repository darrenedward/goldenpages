-- First, create the roles (admin, editor, user) with proper UUIDs and timestamps
INSERT INTO roles (id, name, description, "createdAt", "updatedAt") VALUES
  (
    gen_random_uuid(),
    'admin',
    'Full system access',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    gen_random_uuid(),
    'editor',
    'Can read/write most data',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  ),
  (
    gen_random_uuid(),
    'user',
    'Read-only access',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  )
ON CONFLICT (name) DO NOTHING;

-- Get role IDs and add permissions
DO $$
DECLARE
  admin_id text;
  editor_id text;
  user_id text;
BEGIN
  -- Get role IDs
  SELECT id INTO admin_id FROM roles WHERE name = 'admin';
  SELECT id INTO editor_id FROM roles WHERE name = 'editor';
  SELECT id INTO user_id FROM roles WHERE name = 'user';

  -- Admin permissions (wildcard: all permissions)
  INSERT INTO role_permissions ("roleId", permission)
  VALUES (admin_id, '*:*')
  ON CONFLICT ("roleId", permission) DO NOTHING;

  -- Editor permissions
  INSERT INTO role_permissions ("roleId", permission) VALUES
    (editor_id, 'org:read'),
    (editor_id, 'org:write'),
    (editor_id, 'contact:read'),
    (editor_id, 'contact:write'),
    (editor_id, 'contact:archive'),
    (editor_id, 'channel:read'),
    (editor_id, 'channel:write'),
    (editor_id, 'note:read'),
    (editor_id, 'note:write'),
    (editor_id, 'outreach:read'),
    (editor_id, 'outreach:initiate')
  ON CONFLICT ("roleId", permission) DO NOTHING;

  -- User permissions (read-only)
  INSERT INTO role_permissions ("roleId", permission) VALUES
    (user_id, 'org:read'),
    (user_id, 'contact:read'),
    (user_id, 'channel:read'),
    (user_id, 'note:read')
  ON CONFLICT ("roleId", permission) DO NOTHING;

  RAISE NOTICE 'Permissions setup complete. Admin ID: %, Editor ID: %, User ID: %', admin_id, editor_id, user_id;
END $$;

-- Display created roles and permissions
SELECT 
  r.id,
  r.name as role_name,
  rp.permission
FROM roles r
LEFT JOIN role_permissions rp ON r.id = rp."roleId"
ORDER BY r.name, rp.permission;
