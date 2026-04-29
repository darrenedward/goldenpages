-- Fix creator-based policies with correct column names

-- PACKAGES table
DROP POLICY IF EXISTS "Creator update packages" ON packages;
CREATE POLICY "Creator update packages"
ON packages FOR ALL
TO authenticated
USING (auth.uid()::text = "created_by")
WITH CHECK (auth.uid()::text = "created_by");

-- SUB_PACKAGES table
DROP POLICY IF EXISTS "Creator update sub_packages" ON sub_packages;
CREATE POLICY "Creator update sub_packages"
ON sub_packages FOR ALL
TO authenticated
USING (auth.uid()::text = "created_by")
WITH CHECK (auth.uid()::text = "created_by");

-- DOCUMENTS table
DROP POLICY IF EXISTS "Creator update documents" ON documents;
CREATE POLICY "Creator update documents"
ON documents FOR ALL
TO authenticated
USING (auth.uid()::text = "created_by")
WITH CHECK (auth.uid()::text = "created_by");

-- PACKAGE_RECIPIENTS table
DROP POLICY IF EXISTS "Creator update package_recipients" ON package_recipients;
CREATE POLICY "Creator update package_recipients"
ON package_recipients FOR ALL
TO authenticated
USING (auth.uid()::text = "created_by")
WITH CHECK (auth.uid()::text = "created_by");

-- Verify all policies
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd
FROM pg_policies
WHERE tablename IN ('departments', 'packages', 'sub_packages', 'documents', 'package_documents', 'package_recipients', 'sub_package_responses')
ORDER BY tablename, policyname;
