import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local' });
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL!, process.env.SUPABASE_SERVICE_ROLE_KEY!);

async function main() {
  const { data } = await supabase
    .from('contacts')
    .select('id, full_name, department')
    .in('department', ['NULL', '78', '91', '50', '92'])
    .limit(10);

  console.table(data);
}

main();
