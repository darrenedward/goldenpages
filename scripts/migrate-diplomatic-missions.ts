/**
 * Migration Script: Restructure Diplomatic Missions to New Zealand
 *
 * This script restructures the data so that diplomatic missions (High Commissions,
 * Embassies) are departments under their sending country's organization, NOT
 * separate organizations with New Zealand as head office.
 *
 * BEFORE (Incorrect):
 * - Organization: "Diplomatic Missions To NZ" (head_office: NZ)
 *   - Contacts: All ambassadors/high commissioners from various countries
 *
 * AFTER (Correct):
 * - Organization: India (head_office: India)
 *   - Department: High Commission to New Zealand
 *     - Location: Wellington, New Zealand
 *     - Contacts: HE Ms Neeta Bhushan (High Commissioner)
 */

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

// Mapping of ambassadors/high commissioners to their countries
// This maps the diplomat names to their sending countries
const DIPLOMAT_COUNTRY_MAP: Record<string, { country: string; orgId: string; code: string; type: 'high_commission' | 'embassy' }> = {
  // High Commissioners (Commonwealth countries)
  'HE Ms Neeta Bhushan': { country: 'India', orgId: 'org_027_fd25e846', code: 'IN', type: 'high_commission' },
  'HE Hon Fisa Pihigia': { country: 'Fiji', orgId: '', code: 'FJ', type: 'high_commission' },
  'HE Mr Jose Maria De Morais': { country: 'Papua New Guinea', orgId: '', code: 'PG', type: 'high_commission' },
  'HE Major General Lineo Bernard Poopa': { country: 'Lesotho', orgId: '', code: 'LS', type: 'high_commission' },
  'HE Mr Jean de Dieu Uwihanganye': { country: 'Rwanda', orgId: '', code: 'RW', type: 'high_commission' },
  'HE Ms Dorcas Makgato': { country: 'Botswana', orgId: '', code: 'BW', type: 'high_commission' },
  'HE Mr Anderson Nkemakonam Madubike': { country: 'Sierra Leone', orgId: '', code: 'SL', type: 'high_commission' },
  'HE Mr Joe Tapera Mhishi': { country: 'Zimbabwe', orgId: '', code: 'ZW', type: 'high_commission' },
  'HE Mr Mario Farrugia Borg': { country: 'Malta', orgId: '', code: 'MT', type: 'high_commission' },
  'HE Mr Jimmy Nipo': { country: 'Solomon Islands', orgId: '', code: 'SB', type: 'high_commission' },

  // Ambassadors (Non-Commonwealth countries)
  'HE Mr Wang Xiaolong': { country: 'China', orgId: 'org_001_35b9396a', code: 'CN', type: 'embassy' },
  'HE Mr Georgii Zuev': { country: 'Russia', orgId: '', code: 'RU', type: 'embassy' },
  'HE Mr Chris Seed': { country: 'New Zealand', orgId: '', code: 'NZ', type: 'embassy' }, // NZ has ambassadors too
  'HE Mr Darius Degutis': { country: 'Lithuania', orgId: '', code: 'LT', type: 'embassy' },
  'HE Mr Mirlan Arstanbaev': { country: 'Kyrgyzstan', orgId: '', code: 'KG', type: 'embassy' },
  'HE Mr Michel Goffin': { country: 'Belgium', orgId: '', code: 'BE', type: 'embassy' },
  'HE Mr Margers Krams': { country: 'Latvia', orgId: '', code: 'LV', type: 'embassy' },
  'HE Dr Ruslan Esin': { country: 'Turkey', orgId: 'org_035_8aecd207', code: 'TR', type: 'embassy' },
  'HE Mr Radu Gabriel Safta': { country: 'Romania', orgId: '', code: 'RO', type: 'embassy' },
  'HE Dr Mohamed Said Al Busaidi': { country: 'Oman', orgId: '', code: 'OM', type: 'embassy' },
  'HE Mr Rashed Matar Alqemzi': { country: 'United Arab Emirates', orgId: '', code: 'AE', type: 'embassy' },
};

// Countries that need organizations created
const COUNTRIES_NEEDING_ORGS: string[] = [];

async function findDiplomaticContacts() {
  const contacts = await prisma.contact.findMany({
    where: {
      organisation: {
        name: {
          contains: 'Diplomatic Missions To New Zealand',
        },
      },
    },
    include: {
      organisation: true,
    },
  });

  console.log(`Found ${contacts.length} diplomatic contacts to migrate`);
  return contacts;
}

async function getOrCreateDepartment(orgId: string, countryName: string, type: 'high_commission' | 'embassy') {
  const deptName = type === 'high_commission'
    ? `High Commission to New Zealand`
    : `Embassy to New Zealand`;

  const deptCode = type === 'high_commission' ? 'HC-NZ' : 'EMB-NZ';

  // Check if department already exists
  const existing = await prisma.department.findFirst({
    where: {
      organisationId: orgId,
      name: deptName,
    },
  });

  if (existing) {
    return existing.id;
  }

  // Create new department
  const newDept = await prisma.department.create({
    data: {
      name: deptName,
      code: `${deptCode}-${Date.now().toString(36)}`,
      description: `${countryName} ${deptName}`,
      organisationId: orgId,
      isActive: true,
    },
  });

  console.log(`Created department: ${deptName} for ${countryName}`);
  return newDept.id;
}

async function createWellingtonLocation(organisationId: string, deptId: string) {
  // Get New Zealand region
  const nzRegion = await prisma.region.findFirst({
    where: { code: 'NZ', regionType: 'country' },
  });

  if (!nzRegion) {
    throw new Error('New Zealand region not found');
  }

  // Check if location already exists
  const existing = await prisma.organisationLocation.findFirst({
    where: {
      organisationId,
      countryId: nzRegion.id,
      city: 'Wellington',
    },
  });

  if (existing) {
    return existing.id;
  }

  // Create location
  const location = await prisma.organisationLocation.create({
    data: {
      organisationId,
      countryId: nzRegion.id,
      locationName: 'High Commission / Embassy',
      city: 'Wellington',
      address: '125 The Terrace',
      locationType: 'embassy',
    },
  });

  console.log(`Created Wellington location for org ${organisationId}`);
  return location.id;
}

async function migrate() {
  console.log('Starting diplomatic missions migration...\n');

  const contacts = await findDiplomaticContacts();
  let migratedCount = 0;
  let skippedCount = 0;

  for (const contact of contacts) {
    const diplomatInfo = DIPLOMAT_COUNTRY_MAP[contact.fullName];

    if (!diplomatInfo) {
      console.log(`Skipping ${contact.fullName} - no country mapping`);
      skippedCount++;
      continue;
    }

    // For now, if we don't have an orgId for the country, skip
    // In production, we'd need to look up or create the organization
    if (!diplomatInfo.orgId) {
      console.log(`Skipping ${contact.fullName} - country ${diplomatInfo.country} needs org lookup`);
      skippedCount++;
      continue;
    }

    try {
      // Get or create department
      const deptId = await getOrCreateDepartment(
        diplomatInfo.orgId,
        diplomatInfo.country,
        diplomatInfo.type
      );

      // Update contact to link to department
      await prisma.contact.update({
        where: { id: contact.id },
        data: {
          departmentId: deptId,
        },
      });

      // Also update the organisation to point to the sending country
      await prisma.contact.update({
        where: { id: contact.id },
        data: {
          organisationId: diplomatInfo.orgId,
        },
      });

      console.log(`Migrated: ${contact.fullName} -> ${diplomatInfo.country} - ${diplomatInfo.type}`);
      migratedCount++;
    } catch (error) {
      console.error(`Error migrating ${contact.fullName}:`, error);
    }
  }

  console.log(`\nMigration complete:`);
  console.log(`  Migrated: ${migratedCount}`);
  console.log(`  Skipped: ${skippedCount}`);
}

async function main() {
  try {
    await migrate();
  } catch (error) {
    console.error('Migration failed:', error);
    process.exit(1);
  } finally {
    await prisma.$disconnect();
  }
}

main();
