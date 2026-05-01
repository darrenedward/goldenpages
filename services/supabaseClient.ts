import { createClient } from '@supabase/supabase-js';

// Use environment variables for Supabase configuration
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://vkdlkkedhbfhcookpius.supabase.co';
const SUPABASE_ANON_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrZGxra2VkaGJmaGNvb2twaXVzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc0ODE4NzYsImV4cCI6MjA5MzA1Nzg3Nn0.Lgi1Ex4Lv_UpnaS7pNLvHPwPkQEdDzFZ_OE4obYzvIY';

// Initialize Supabase client
export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);