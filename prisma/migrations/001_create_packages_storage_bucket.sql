-- Create packages-storage bucket
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'packages-storage',
  'packages-storage',
  false, -- Private bucket
  52428800, -- 50 MB limit
  ARRAY[
    'application/pdf',
    'image/png',
    'image/jpeg',
    'image/jpg',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  ]
)
ON CONFLICT (id) DO NOTHING;

-- Create folder structure (these are virtual folders, created via uploads)
-- documents/{year}/{month}/
-- thumbnails/
-- exports/

-- Enable RLS
ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

-- Policy: Authenticated users can upload
CREATE POLICY "Authenticated can upload to packages-storage"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'packages-storage');

-- Policy: Authenticated users can view their own uploads
CREATE POLICY "Authenticated can view own packages"
ON storage.objects FOR SELECT
TO authenticated
USING (bucket_id = 'packages-storage' AND auth.uid()::text = (storage.foldername(name))[1]);

-- Policy: Service role can do everything
CREATE POLICY "Service role full access packages-storage"
ON storage.objects ALL
TO service_role
USING (bucket_id = 'packages-storage')
WITH CHECK (bucket_id = 'packages-storage');
