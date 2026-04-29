-- Update RLS policies on contacts table for department access

-- Authenticated users can read contacts
DROP POLICY IF EXISTS "Authenticated read contacts" ON contacts;
CREATE POLICY "Authenticated read contacts"
ON contacts FOR SELECT
TO authenticated
USING (true);

-- Users with contact:write permission can insert
DROP POLICY IF EXISTS "Authenticated insert contacts" ON contacts;
CREATE POLICY "Authenticated insert contacts"
ON contacts FOR INSERT
TO authenticated
WITH CHECK (true);

-- Users can update contacts they created or if they own them
DROP POLICY IF EXISTS "Authenticated update own contacts" ON contacts;
CREATE POLICY "Authenticated update own contacts"
ON contacts FOR UPDATE
TO authenticated
USING (auth.uid()::text = "ownerId" OR auth.uid()::text = COALESCE("ownerId", ''))
WITH CHECK (auth.uid()::text = "ownerId" OR auth.uid()::text = COALESCE("ownerId", ''));

-- Service role full access
DROP POLICY IF EXISTS "Service role full access contacts" ON contacts;
CREATE POLICY "Service role full access contacts"
ON contacts FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

-- Verify policies
SELECT 
  schemaname,
  tablename,
  policyname,
  roles,
  cmd
FROM pg_policies
WHERE tablename = 'contacts'
ORDER BY policyname;
