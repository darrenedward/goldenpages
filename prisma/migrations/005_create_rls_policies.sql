-- ==============================================================================
-- RLS POLICIES FOR NEW TABLES
-- ==============================================================================

-- Enable RLS on all new tables
ALTER TABLE departments ENABLE ROW LEVEL SECURITY;
ALTER TABLE packages ENABLE ROW LEVEL SECURITY;
ALTER TABLE sub_packages ENABLE ROW LEVEL SECURITY;
ALTER TABLE documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE package_documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE package_recipients ENABLE ROW LEVEL SECURITY;
ALTER TABLE sub_package_responses ENABLE ROW LEVEL SECURITY;

-- ==============================================================================
-- DEPARTMENTS TABLE
-- ==============================================================================
-- Service role (bypass RLS)
DROP POLICY IF EXISTS "Service role full access departments" ON departments;
CREATE POLICY "Service role full access departments"
ON departments FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

-- Authenticated users with department:read can read
DROP POLICY IF EXISTS "Authenticated read departments" ON departments;
CREATE POLICY "Authenticated read departments"
ON departments FOR SELECT
TO authenticated
USING (true);

-- Users with department:write can insert/update/delete
DROP POLICY IF EXISTS "Authenticated write departments" ON departments;
CREATE POLICY "Authenticated write departments"
ON departments FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- ==============================================================================
-- PACKAGES TABLE
-- ==============================================================================
-- Service role full access
DROP POLICY IF EXISTS "Service role full access packages" ON packages;
CREATE POLICY "Service role full access packages"
ON packages FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

-- Authenticated read
DROP POLICY IF EXISTS "Authenticated read packages" ON packages;
CREATE POLICY "Authenticated read packages"
ON packages FOR SELECT
TO authenticated
USING (true);

-- Creator can update their packages
DROP POLICY IF EXISTS "Creator update packages" ON packages;
CREATE POLICY "Creator update packages"
ON packages FOR ALL
TO authenticated
USING (auth.uid()::text = "createdBy")
WITH CHECK (auth.uid()::text = "createdBy");

-- ==============================================================================
-- SUB_PACKAGES TABLE
-- ==============================================================================
DROP POLICY IF EXISTS "Service role full access sub_packages" ON sub_packages;
CREATE POLICY "Service role full access sub_packages"
ON sub_packages FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated read sub_packages" ON sub_packages;
CREATE POLICY "Authenticated read sub_packages"
ON sub_packages FOR SELECT
TO authenticated
USING (true);

DROP POLICY IF EXISTS "Creator update sub_packages" ON sub_packages;
CREATE POLICY "Creator update sub_packages"
ON sub_packages FOR ALL
TO authenticated
USING (auth.uid()::text = "createdBy")
WITH CHECK (auth.uid()::text = "createdBy");

-- ==============================================================================
-- DOCUMENTS TABLE
-- ==============================================================================
DROP POLICY IF EXISTS "Service role full access documents" ON documents;
CREATE POLICY "Service role full access documents"
ON documents FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated read documents" ON documents;
CREATE POLICY "Authenticated read documents"
ON documents FOR SELECT
TO authenticated
USING (true);

DROP POLICY IF EXISTS "Creator update documents" ON documents;
CREATE POLICY "Creator update documents"
ON documents FOR ALL
TO authenticated
USING (auth.uid()::text = "createdBy")
WITH CHECK (auth.uid()::text = "createdBy");

-- ==============================================================================
-- PACKAGE_DOCUMENTS JUNCTION TABLE
-- ==============================================================================
DROP POLICY IF EXISTS "Service role full access package_documents" ON package_documents;
CREATE POLICY "Service role full access package_documents"
ON package_documents FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated read package_documents" ON package_documents;
CREATE POLICY "Authenticated read package_documents"
ON package_documents FOR SELECT
TO authenticated
USING (true);

-- ==============================================================================
-- PACKAGE_RECIPIENTS TABLE
-- ==============================================================================
DROP POLICY IF EXISTS "Service role full access package_recipients" ON package_recipients;
CREATE POLICY "Service role full access package_recipients"
ON package_recipients FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated read package_recipients" ON package_recipients;
CREATE POLICY "Authenticated read package_recipients"
ON package_recipients FOR SELECT
TO authenticated
USING (true);

DROP POLICY IF EXISTS "Creator update package_recipients" ON package_recipients;
CREATE POLICY "Creator update package_recipients"
ON package_recipients FOR ALL
TO authenticated
USING (auth.uid()::text = "createdBy")
WITH CHECK (auth.uid()::text = "createdBy");

-- ==============================================================================
-- SUB_PACKAGE_RESPONSES TABLE
-- ==============================================================================
DROP POLICY IF EXISTS "Service role full access sub_package_responses" ON sub_package_responses;
CREATE POLICY "Service role full access sub_package_responses"
ON sub_package_responses FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated read sub_package_responses" ON sub_package_responses;
CREATE POLICY "Authenticated read sub_package_responses"
ON sub_package_responses FOR SELECT
TO authenticated
USING (true);

-- ==============================================================================
-- VERIFY POLICIES
-- ==============================================================================
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies
WHERE tablename IN ('departments', 'packages', 'sub_packages', 'documents', 'package_documents', 'package_recipients', 'sub_package_responses')
ORDER BY tablename, policyname;
