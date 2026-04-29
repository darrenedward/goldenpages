import { createClient } from '@supabase/supabase-js'
import dotenv from 'dotenv'
import regionsData from '../prisma/seeds/regions.json'
import organisationsData from '../prisma/seeds/organisations.json'
import departmentsData from '../prisma/seeds/departments.json'
import contactsData from '../prisma/seeds/contacts.json'
import contactChannelsData from '../prisma/seeds/contact_channels.json'

// Load environment variables
dotenv.config({ path: '.env.local' })

// Use service_role_key to bypass RLS for seeding
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY!

const supabase = createClient(supabaseUrl, supabaseKey)

async function seedRegions() {
  console.log('Seeding regions...')
  const { error } = await supabase.from('regions').insert(regionsData)
  if (error) console.error('  ✗ Error:', error.message)
  else console.log(`  ✓ Seeded ${regionsData.length} regions`)
}

async function seedOrganisations() {
  console.log('Seeding organisations...')
  const { error } = await supabase.from('organisations').insert(organisationsData)
  if (error) console.error('  ✗ Error:', error.message)
  else console.log(`  ✓ Seeded ${organisationsData.length} organisations`)
}

async function seedDepartments() {
  console.log('Seeding departments...')
  const { error } = await supabase.from('departments').insert(departmentsData)
  if (error) console.error('  ✗ Error:', error.message)
  else console.log(`  ✓ Seeded ${departmentsData.length} departments`)
}

async function seedContacts() {
  console.log('Seeding contacts...')
  const { error } = await supabase.from('contacts').insert(contactsData)
  if (error) console.error('  ✗ Error:', error.message)
  else console.log(`  ✓ Seeded ${contactsData.length} contacts`)
}

async function seedContactChannels() {
  console.log('Seeding contact channels...')
  const { error } = await supabase.from('contact_channels').insert(contactChannelsData)
  if (error) console.error('  ✗ Error:', error.message)
  else console.log(`  ✓ Seeded ${contactChannelsData.length} contact channels`)
}

async function main() {
  console.log('🌱 Starting Supabase seed...\n')

  await seedRegions()
  await seedOrganisations()
  await seedDepartments()
  await seedContacts()
  await seedContactChannels()

  console.log('\n✅ Seed completed!')
}

main().catch(console.error)
