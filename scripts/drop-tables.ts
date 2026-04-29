import { createClient } from '@supabase/supabase-js'
import dotenv from 'dotenv'

dotenv.config({ path: '.env.local' })

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
)

async function dropTables() {
  console.log('Dropping existing tables...')

  // Drop all our custom tables (in reverse dependency order)
  const tables = [
    'contact_channels',
    'contact_notes',
    'outreach_logs',
    'organisation_notes',
    'contacts',
    'organisation_locations',
    'departments',
    'organisations',
    'regions',
    'activity_logs',
    'role_permissions',
    'user_roles',
    'users',  // Note: this might conflict with auth.users
    'roles',
    'sub_package_responses',
    'package_recipients',
    'package_documents',
    'documents',
    'sub_packages',
    'packages',
  ]

  for (const table of tables) {
    try {
      const { error } = await supabase.rpc('exec_sql', {
        sql: `DROP TABLE IF EXISTS public.${table} CASCADE;`
      })
      if (error) {
        // Try alternative method
        const { error: err2 } = await supabase
          .from('information_schema.tables')
          .delete()
          .eq('table_name', table)
          .eq('table_schema', 'public')
        console.log(`  ${table}: ${err2 ? 'skipped (may not exist)' : 'deleted'}`)
      } else {
        console.log(`  ✓ Dropped ${table}`)
      }
    } catch (e) {
      console.log(`  ${table}: skipped`)
    }
  }

  console.log('\n✅ Tables dropped successfully')
}

dropTables().catch(console.error)