-- Enable RLS on storage.objects (may need owner permissions)
-- ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

-- Policy: Authenticated users can upload
DROP POLICY IF EXISTS "Authenticated can upload to packages-storage" ON storage.objects;
CREATE POLICY "Authenticated can upload to packages-storage"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'packages-storage');

-- Policy: Authenticated users can view their own uploads
DROP POLICY IF EXISTS "Authenticated can view own packages" ON storage.objects;
CREATE POLICY "Authenticated can view own packages"
ON storage.objects FOR SELECT
TO authenticated
USING (bucket_id = 'packages-storage');

-- Policy: Service role full access (individual operations)
DROP POLICY IF EXISTS "Service role select packages-storage" ON storage.objects;
CREATE POLICY "Service role select packages-storage"
ON storage.objects FOR SELECT
TO service_role
USING (bucket_id = 'packages-storage');

DROP POLICY IF EXISTS "Service role insert packages-storage" ON storage.objects;
CREATE POLICY "Service role insert packages-storage"
ON storage.objects FOR INSERT
TO service_role
WITH CHECK (bucket_id = 'packages-storage');

DROP POLICY IF EXISTS "Service role update packages-storage" ON storage.objects;
CREATE POLICY "Service role update packages-storage"
ON storage.objects FOR UPDATE
TO service_role
USING (bucket_id = 'packages-storage')
WITH CHECK (bucket_id = 'packages-storage');

DROP POLICY IF EXISTS "Service role delete packages-storage" ON storage.objects;
CREATE POLICY "Service role delete packages-storage"
ON storage.objects FOR DELETE
TO service_role
USING (bucket_id = 'packages-storage');
