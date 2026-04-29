-- Test RLS Policies
-- This script tests that RLS is properly enabled on all Phase 0 tables

DO $$
BEGIN
  RAISE NOTICE '╔═══════════════════════════════════════════════════════════════╗';
  RAISE NOTICE '║           RLS POLICIES TEST                                   ║';
  RAISE NOTICE '╚═══════════════════════════════════════════════════════════════╝';
END $$;

-- Test 1: Check RLS is enabled on all tables
RAISE NOTICE '';
RAISE NOTICE 'Test 1: Checking RLS status on all tables...';
SELECT 
  schemaname || '.' || tablename as table_name,
  rowsecurity as rls_enabled
FROM pg_tables
WHERE tablename IN ('departments', 'packages', 'sub_packages', 'documents', 'package_documents', 'package_recipients', 'sub_package_responses', 'contacts')
ORDER BY tablename;

-- Test 2: Count policies per table
RAISE NOTICE '';
RAISE NOTICE 'Test 2: Counting RLS policies per table...';
SELECT 
  tablename,
  COUNT(*) as policy_count
FROM pg_policies
WHERE tablename IN ('departments', 'packages', 'sub_packages', 'documents', 'package_documents', 'package_recipients', 'sub_package_responses', 'contacts')
GROUP BY tablename
ORDER BY tablename;

-- Test 3: Verify roles and permissions
RAISE NOTICE '';
RAISE NOTICE 'Test 3: Verifying roles exist...';
SELECT name, description FROM roles ORDER BY name;

RAISE NOTICE '';
RAISE NOTICE 'Test 4: Counting permissions per role...';
SELECT 
  r.name as role_name,
  COUNT(rp.permission) as permission_count
FROM roles r
LEFT JOIN role_permissions rp ON r.id = rp."roleId"
GROUP BY r.name
ORDER BY r.name;

-- Test 5: Sample data verification
RAISE NOTICE '';
RAISE NOTICE 'Test 5: Verifying sample data exists...';
SELECT 'regions' as table_name, COUNT(*) as row_count FROM regions
UNION ALL
SELECT 'organisations', COUNT(*) FROM organisations
UNION ALL
SELECT 'departments', COUNT(*) FROM departments
UNION ALL
SELECT 'contacts', COUNT(*) FROM contacts
UNION ALL
SELECT 'contact_channels', COUNT(*) FROM contact_channels
ORDER BY table_name;

RAISE NOTICE '';
RAISE NOTICE '╔═══════════════════════════════════════════════════════════════╗';
RAISE NOTICE '║           RLS POLICIES TEST COMPLETE ✅                       ║';
RAISE NOTICE '╚═══════════════════════════════════════════════════════════════╝';
