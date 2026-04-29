-- ============================================================================
-- 015: Collaboration Schema — Members, Notifications, Activity Tracking
-- ============================================================================

-- 1A. Add display_name to users table
ALTER TABLE users ADD COLUMN IF NOT EXISTS display_name VARCHAR(255);

-- Backfill from auth metadata (auth.users.id is uuid, users.id is text)
UPDATE users u
SET display_name = au.raw_user_meta_data->>'full_name'
FROM auth.users au
WHERE u.id = au.id::text
  AND au.raw_user_meta_data->>'full_name' IS NOT NULL
  AND u.display_name IS NULL;

-- 1B. Communication member roles
DO $$ BEGIN
  CREATE TYPE communication_member_role AS ENUM ('owner', 'assignee', 'collaborator');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

CREATE TABLE IF NOT EXISTS communication_members (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid()::text,
  communication_id TEXT NOT NULL REFERENCES communications(id) ON DELETE CASCADE,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  role communication_member_role NOT NULL DEFAULT 'collaborator',
  invited_by TEXT NOT NULL REFERENCES users(id),
  joined_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(communication_id, user_id)
);

CREATE INDEX IF NOT EXISTS idx_comm_members_comm ON communication_members(communication_id);
CREATE INDEX IF NOT EXISTS idx_comm_members_user ON communication_members(user_id);

-- RLS for communication_members
ALTER TABLE communication_members ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Members can view communication members"
  ON communication_members FOR SELECT
  TO authenticated
  USING (
    -- User is a member of this communication
    user_id = auth.uid()::text
    OR communication_id IN (
      SELECT cm.communication_id FROM communication_members cm WHERE cm.user_id = auth.uid()::text
    )
    OR EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON r.id = ur."roleId"
      WHERE ur."userId" = auth.uid()::text AND r.name = 'admin'
    )
  );

CREATE POLICY "Members can insert into communication members"
  ON communication_members FOR INSERT
  TO authenticated
  WITH CHECK (
    -- Inviter must be a member (owner or assignee) of the communication
    invited_by = auth.uid()::text
    AND invited_by IN (
      SELECT cm.user_id FROM communication_members cm
      WHERE cm.communication_id = communication_members.communication_id
      AND cm.role IN ('owner', 'assignee')
    )
  );

CREATE POLICY "Owner can delete communication members"
  ON communication_members FOR DELETE
  TO authenticated
  USING (
    -- Owner can remove anyone, or user can remove themselves
    user_id = auth.uid()::text
    OR EXISTS (
      SELECT 1 FROM communication_members cm
      WHERE cm.communication_id = communication_members.communication_id
      AND cm.user_id = auth.uid()::text AND cm.role = 'owner'
    )
    OR EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON r.id = ur."roleId"
      WHERE ur."userId" = auth.uid()::text AND r.name = 'admin'
    )
  );

-- 1C. Notification types
DO $$ BEGIN
  CREATE TYPE notification_type AS ENUM (
    'communication_assigned',
    'communication_invited',
    'communication_status_changed',
    'communication_document_uploaded',
    'communication_updated',
    'communication_member_added',
    'communication_member_removed'
  );
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

CREATE TABLE IF NOT EXISTS notifications (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid()::text,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  type notification_type NOT NULL,
  title VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  is_read BOOLEAN NOT NULL DEFAULT false,
  read_at TIMESTAMPTZ,
  resource_id TEXT,
  metadata JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_notifications_user ON notifications(user_id);
CREATE INDEX IF NOT EXISTS idx_notifications_unread ON notifications(user_id, is_read) WHERE is_read = false;
CREATE INDEX IF NOT EXISTS idx_notifications_created ON notifications(created_at DESC);

-- RLS for notifications
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own notifications"
  ON notifications FOR SELECT
  TO authenticated
  USING (user_id = auth.uid()::text);

CREATE POLICY "System can insert notifications"
  ON notifications FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Users can update own notifications"
  ON notifications FOR UPDATE
  TO authenticated
  USING (user_id = auth.uid()::text)
  WITH CHECK (user_id = auth.uid()::text);

CREATE POLICY "Users can delete own notifications"
  ON notifications FOR DELETE
  TO authenticated
  USING (user_id = auth.uid()::text);

-- 1D. Backfill existing communications with owner members
INSERT INTO communication_members (communication_id, user_id, role, invited_by, joined_at)
SELECT c.id, c.created_by_id, 'owner', c.created_by_id, c.created_at
FROM communications c
WHERE NOT EXISTS (
  SELECT 1 FROM communication_members cm
  WHERE cm.communication_id = c.id AND cm.user_id = c.created_by_id
);

-- 1E. Enable Realtime for notifications
ALTER PUBLICATION supabase_realtime ADD TABLE notifications;

-- 1F. Fix activity_logs RLS — allow authenticated inserts
DROP POLICY IF EXISTS "Activity logs are inserted by system" ON activity_logs;
DROP POLICY IF EXISTS "Authenticated can insert activity logs" ON activity_logs;

CREATE POLICY "Authenticated can insert activity logs"
  ON activity_logs FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Allow users to read their own activity logs + activity for resources they have access to
DROP POLICY IF EXISTS "Users can read relevant activity logs" ON activity_logs;
CREATE POLICY "Users can read relevant activity logs"
  ON activity_logs FOR SELECT
  TO authenticated
  USING (
    "userId" = auth.uid()::text
    OR EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON r.id = ur."roleId"
      WHERE ur."userId" = auth.uid()::text AND r.name = 'admin'
    )
    OR EXISTS (
      SELECT 1 FROM communication_members cm
      WHERE cm.communication_id = activity_logs.resource_id
      AND cm.user_id = auth.uid()::text
    )
  );
