import { PrismaClient } from '@prisma/client'
import { PrismaPg } from '@prisma/adapter-pg'
import pg from 'pg'
import { RegionType, OrganisationType, ContactChannelType } from '@prisma/client'
import regionsData from './seeds/regions.json'
import organisationsData from './seeds/organisations.json'
import departmentsData from './seeds/departments.json'
import contactsData from './seeds/contacts.json'
import contactChannelsData from './seeds/contact_channels.json'

const pool = new pg.Pool({ connectionString: process.env.DATABASE_URL })
const adapter = new PrismaPg(pool)
const prisma = new PrismaClient({ adapter })

// Type imports for JSON data
interface Region {
  id: string
  name: string
  code: string
  regionType: RegionType
  parentRegionId: string | null
  createdAt: string
  updatedAt: string
}

interface Organisation {
  id: string
  name: string
  type: OrganisationType
  headOfficeCountryId: string
  headOfficeCity: string | null
  headOfficeAddress: string | null
  headOfficePhone: string | null
  headOfficeEmail: string | null
  headOfficeWebsite: string | null
  description: string | null
  ownerId: string | null
  createdAt: string
  updatedAt: string
}

interface Department {
  id: string
  name: string
  code: string | null
  description: string | null
  organisationId: string
  parentId: string | null
  isActive: boolean
  createdAt: string
  updatedAt: string
  createdBy: string | null
  updatedBy: string | null
}

interface Contact {
  id: string
  fullName: string
  roleTitle: string | null
  departmentId: string | null
  departmentLegacy: string | null
  organisationId: string
  primaryLocationId: string | null
  ownerId: string | null
  isHeadOfficeBased: boolean
  createdAt: string
  updatedAt: string
}

interface ContactChannel {
  id: string
  contactId: string
  channelType: ContactChannelType
  value: string
  displayValue: string | null
  phoneNormalized: string | null
  addressLine1: string | null
  city: string | null
  state: string | null
  postalCode: string | null
  country: string | null
  createdAt: string
  updatedAt: string
}

async function seedRegions() {
  console.log('Seeding regions...')
  const regions = regionsData as Region[]

  for (const region of regions) {
    await prisma.region.upsert({
      where: { code_regionType: { code: region.code, regionType: region.regionType } },
      update: {},
      create: {
        id: region.id,
        name: region.name,
        code: region.code,
        regionType: region.regionType,
        parentRegionId: region.parentRegionId,
      },
    })
  }

  console.log(`  ✓ Seeded ${regions.length} regions`)
}

async function seedOrganisations() {
  console.log('Seeding organisations...')
  const orgs = organisationsData as Organisation[]

  for (const org of orgs) {
    await prisma.organisation.upsert({
      where: { id: org.id },
      update: {},
      create: {
        id: org.id,
        name: org.name,
        type: org.type,
        headOfficeCountry: { connect: { id: org.headOfficeCountryId } },
        headOfficeCity: org.headOfficeCity,
        headOfficeAddress: org.headOfficeAddress,
        headOfficePhone: org.headOfficePhone,
        headOfficeEmail: org.headOfficeEmail,
        headOfficeWebsite: org.headOfficeWebsite,
        description: org.description,
        owner: org.ownerId ? { connect: { id: org.ownerId } } : undefined,
      },
    })
  }

  console.log(`  ✓ Seeded ${orgs.length} organisations`)
}

async function seedDepartments() {
  console.log('Seeding departments...')
  const departments = departmentsData as Department[]

  for (const dept of departments) {
    await prisma.department.upsert({
      where: { id: dept.id },
      update: {},
      create: {
        id: dept.id,
        name: dept.name,
        code: dept.code,
        description: dept.description,
        organisation: { connect: { id: dept.organisationId } },
        parent: dept.parentId ? { connect: { id: dept.parentId } } : undefined,
        isActive: dept.isActive,
      },
    })
  }

  console.log(`  ✓ Seeded ${departments.length} departments`)
}

async function seedContacts() {
  console.log('Seeding contacts...')
  const contacts = contactsData as Contact[]

  let count = 0
  for (const contact of contacts) {
    try {
      await prisma.contact.upsert({
        where: { id: contact.id },
        update: {},
        create: {
          id: contact.id,
          fullName: contact.fullName,
          roleTitle: contact.roleTitle,
          departmentLegacy: contact.departmentLegacy,
          organisation: { connect: { id: contact.organisationId } },
          department: contact.departmentId ? { connect: { id: contact.departmentId } } : undefined,
          primaryLocation: contact.primaryLocationId ? { connect: { id: contact.primaryLocationId } } : undefined,
          owner: contact.ownerId ? { connect: { id: contact.ownerId } } : undefined,
          isHeadOfficeBased: contact.isHeadOfficeBased,
        },
      })
      count++
    } catch (error) {
      console.error(`  ✗ Failed to seed contact ${contact.fullName}: ${error}`)
    }
  }

  console.log(`  ✓ Seeded ${count} contacts`)
}

async function seedContactChannels() {
  console.log('Seeding contact channels...')
  const channels = contactChannelsData as ContactChannel[]

  let count = 0
  for (const channel of channels) {
    try {
      await prisma.contactChannel.upsert({
        where: { id: channel.id },
        update: {},
        create: {
          id: channel.id,
          contact: { connect: { id: channel.contactId } },
          channelType: channel.channelType,
          value: channel.value,
          displayValue: channel.displayValue,
          phoneNormalized: channel.phoneNormalized,
          addressLine1: channel.addressLine1,
          city: channel.city,
          state: channel.state,
          postalCode: channel.postalCode,
          country: channel.country,
        },
      })
      count++
    } catch (error) {
      console.error(`  ✗ Failed to seed contact channel: ${error}`)
    }
  }

  console.log(`  ✓ Seeded ${count} contact channels`)
}

async function main() {
  console.log('🌱 Starting database seed...\n')

  const startTime = Date.now()

  // Seed in order of dependencies
  await seedRegions()
  await seedOrganisations()
  await seedDepartments()
  await seedContacts()
  await seedContactChannels()

  const duration = ((Date.now() - startTime) / 1000).toFixed(2)

  console.log(`\n✅ Seed completed in ${duration}s`)
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
