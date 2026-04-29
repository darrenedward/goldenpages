-- ==============================================================================
-- FIX PERMISSIVE COMMUNICATIONS RLS POLICIES
-- ==============================================================================
-- The original UPDATE/DELETE policies used "OR true" which allows any
-- authenticated user to modify any communication. This replaces them with
-- proper creator-or-admin checks.

-- Drop the permissive policies
DROP POLICY IF EXISTS "Creators can update their communications" ON communications;
DROP POLICY IF EXISTS "Creators can delete their communications" ON communications;

-- UPDATE: Only creator or admin can update
CREATE POLICY "Creator or admin can update communications" ON communications
  FOR UPDATE TO authenticated
  USING (
    created_by_id = auth.uid()::text
    OR EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON r.id = ur.role_id
      WHERE ur.user_id = auth.uid() AND r.name = 'admin'
    )
  );

-- DELETE: Only creator or admin can delete
CREATE POLICY "Creator or admin can delete communications" ON communications
  FOR DELETE TO authenticated
  USING (
    created_by_id = auth.uid()::text
    OR EXISTS (
      SELECT 1 FROM user_roles ur
      JOIN roles r ON r.id = ur.role_id
      WHERE ur.user_id = auth.uid() AND r.name = 'admin'
    )
  );
