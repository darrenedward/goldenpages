import { createClient } from '@supabase/supabase-js';

// Use environment variables for Supabase configuration
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://ywvdextusnszhbqpexgb.supabase.co';
const SUPABASE_ANON_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'sb_publishable_IFB_60YMcvPIYYDsHV5_Mw_S8Pn9awr';

// Initialize Supabase client
export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);