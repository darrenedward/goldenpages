import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;

/**
 * Admin Supabase client using service role key.
 * ONLY use in server-side code (API routes, server components).
 * Bypasses Row Level Security.
 */
export function getAdminClient() {
  return createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);
}
