-- Add department, package, and document permissions
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

  -- Department permissions
  INSERT INTO role_permissions ("roleId", permission) VALUES
    (admin_id, 'department:read'),
    (admin_id, 'department:write'),
    (editor_id, 'department:read'),
    (editor_id, 'department:write'),
    (user_id, 'department:read')
  ON CONFLICT ("roleId", permission) DO NOTHING;

  -- Package permissions
  INSERT INTO role_permissions ("roleId", permission) VALUES
    (admin_id, 'package:read'),
    (admin_id, 'package:write'),
    (admin_id, 'package:delete'),
    (admin_id, 'package:send'),
    (admin_id, 'package:close'),
    (editor_id, 'package:read'),
    (editor_id, 'package:write'),
    (editor_id, 'package:send'),
    (user_id, 'package:read')
  ON CONFLICT ("roleId", permission) DO NOTHING;

  -- Document permissions
  INSERT INTO role_permissions ("roleId", permission) VALUES
    (admin_id, 'document:read'),
    (admin_id, 'document:write'),
    (admin_id, 'document:delete'),
    (editor_id, 'document:read'),
    (editor_id, 'document:write'),
    (user_id, 'document:read')
  ON CONFLICT ("roleId", permission) DO NOTHING;

  RAISE NOTICE 'New permissions added for departments, packages, and documents';
END $$;

-- Display all permissions
SELECT 
  r.name as role_name,
  rp.permission
FROM roles r
JOIN role_permissions rp ON r.id = rp."roleId"
ORDER BY r.name, rp.permission;
