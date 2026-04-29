#!/usr/bin/env tsx
/**
 * Test Package Storage Upload
 * 
 * Tests uploading files to the packages-storage bucket and verifying public URLs.
 * 
 * Usage:
 *   npm tsx scripts/test-storage-upload.ts
 */

import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('ERROR: Missing Supabase environment variables');
  console.error('Required: NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: { persistSession: false },
});

async function testStorageUpload() {
  console.log('╔═══════════════════════════════════════════════════════════════╗');
  console.log('║           PACKAGE STORAGE UPLOAD TEST                         ║');
  console.log('╚═══════════════════════════════════════════════════════════════╝');
  console.log('');

  // Test 1: List buckets
  console.log('Test 1: Listing storage buckets...');
  const { data: buckets, error: bucketsError } = await supabase.storage.listBuckets();
  
  if (bucketsError) {
    console.error('❌ Failed to list buckets:', bucketsError);
    return;
  }
  
  console.log('✅ Buckets found:', buckets.map(b => b.name).join(', '));
  
  const packagesBucket = buckets?.find(b => b.name === 'packages-storage');
  if (!packagesBucket) {
    console.error('❌ packages-storage bucket not found!');
    return;
  }
  
  console.log(`✅ packages-storage bucket found (public: ${packagesBucket.public})`);
  console.log('');

  // Test 2: Create a test file
  console.log('Test 2: Creating test file...');
  const testFileName = `test/test-${Date.now()}.txt`;
  const testContent = 'This is a test file for package storage upload.\nTimestamp: ' + new Date().toISOString();
  const testFile = new File([testContent], 'test.txt', { type: 'text/plain' });
  console.log(`✅ Test file created: ${testFileName}`);
  console.log('');

  // Test 3: Upload file
  console.log('Test 3: Uploading file to packages-storage...');
  const { data: uploadData, error: uploadError } = await supabase.storage
    .from('packages-storage')
    .upload(testFileName, testFile);
  
  if (uploadError) {
    console.error('❌ Upload failed:', uploadError);
    return;
  }
  
  console.log(`✅ File uploaded successfully`);
  console.log(`   Path: ${uploadData.path}`);
  console.log(`   ID: ${uploadData.id}`);
  console.log('');

  // Test 4: Get public URL
  console.log('Test 4: Generating public URL...');
  const { data: urlData } = supabase.storage
    .from('packages-storage')
    .getPublicUrl(testFileName);
  
  console.log(`✅ Public URL generated: ${urlData.publicUrl}`);
  console.log('');

  // Test 5: List files in bucket
  console.log('Test 5: Listing files in packages-storage/test/...');
  const { data: files, error: listError } = await supabase.storage
    .from('packages-storage')
    .list('test');
  
  if (listError) {
    console.error('❌ Failed to list files:', listError);
  } else {
    console.log(`✅ Found ${files?.length || 0} files in test/ folder:`);
    files?.forEach(f => {
      console.log(`   - ${f.name} (${f.metadata?.size || 0} bytes)`);
    });
  }
  console.log('');

  // Test 6: Download and verify
  console.log('Test 6: Downloading and verifying file...');
  const { data: downloadData, error: downloadError } = await supabase.storage
    .from('packages-storage')
    .download(testFileName);
  
  if (downloadError) {
    console.error('❌ Download failed:', downloadError);
  } else {
    const downloadedText = await downloadData.text();
    if (downloadedText === testContent) {
      console.log('✅ File content verified successfully');
    } else {
      console.error('❌ File content mismatch!');
    }
  }
  console.log('');

  // Test 7: Clean up (optional)
  console.log('Test 7: Cleaning up test file...');
  const { error: deleteError } = await supabase.storage
    .from('packages-storage')
    .remove([testFileName]);
  
  if (deleteError) {
    console.error('❌ Cleanup failed:', deleteError);
  } else {
    console.log('✅ Test file deleted successfully');
  }
  console.log('');

  console.log('╔═══════════════════════════════════════════════════════════════╗');
  console.log('║           ALL TESTS PASSED ✅                                ║');
  console.log('╚═══════════════════════════════════════════════════════════════╝');
}

testStorageUpload().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});
