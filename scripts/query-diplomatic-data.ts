/**
 * Script to query current diplomatic missions data
 */

import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';

dotenv.config();

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL || '',
  process.env.SUPABASE_SERVICE_ROLE_KEY || ''
);

async function main() {
  console.log('🔍 Querying current data...\n');

  // Get all organisations
  const { data: orgs } = await supabase
    .from('organisations')
    .select('id, name, type')
    .order('name');

  console.log('All organisations:');
  orgs?.forEach(o => console.log(`  ${o.name} (${o.type})`));

  // Get sample contacts
  const { data: contacts } = await supabase
    .from('contacts')
    .select('id, fullName, roleTitle, organisationId')
    .limit(10);

  console.log('\nSample contacts:');
  console.log(JSON.stringify(contacts, null, 2));
}

main()
  .catch(console.error)
  .finally(() => process.exit());
