/**
 * NZ Missing Ministers Seed
 *
 * Adds 11 NZ ministers/MPs from the April 2026 CC MP Address List that are
 * not yet in the database, plus updates existing contacts with the parliament
 * email addresses from the PDF.
 *
 * Run: npx tsx prisma/seeds/mp-import/nz-missing-ministers.ts
 */

import 'dotenv/config';
import pg from 'pg';

const connectionString = process.env.DATABASE_URL!;
const NZ_ORG_ID = 'nz-govt-001';
const NOW = new Date().toISOString();

// ── New ministers to add (not yet in DB) ──────────────────────────────────

interface NewNZMinister {
  id: string;
  fullName: string;
  roleTitle: string;
  departmentId: string;
  email: string;
  address: string;
}

const NZ_DEPT_OTHER = 'nz-dept-other'; // we'll create this if missing

const newMinisters: NewNZMinister[] = [
  {
    id: 'nz-ct-simpson',
    fullName: 'Scott Simpson',
    roleTitle: 'Minister for ACC, Minister of Statistics, Deputy Leader of the House',
    departmentId: NZ_DEPT_OTHER,
    email: 'Andrew.Bayly@parliament.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-patterson',
    fullName: 'Mark Patterson',
    roleTitle: 'Minister for Rural Communities, Associate Minister of Agriculture, Associate Minister for Regional Development',
    departmentId: 'nz-dept-agriculture',
    email: 'Mark.Patterson@parliament.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-brewer',
    fullName: 'Cameron Brewer',
    roleTitle: 'Minister of Commerce & Consumer Affairs, Minister for Small Business & Manufacturing, Associate Minister of Immigration',
    departmentId: NZ_DEPT_OTHER,
    email: 'c.brewer@ministers.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-reti',
    fullName: 'Shane Reti',
    roleTitle: 'Minister for Pacific Peoples, Science, Innovation & Technology, Universities, Statistics',
    departmentId: 'nz-dept-education',
    email: 'S.Reti@ministers.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-meager',
    fullName: 'James Meager',
    roleTitle: 'Minister for South Island, Youth, Hunting & Fishing, Associate Minister of Transport',
    departmentId: NZ_DEPT_OTHER,
    email: 'J.Meager@ministers.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-butterick',
    fullName: 'Mike Butterick',
    roleTitle: 'Minister for Land Information, Associate Minister for Agriculture',
    departmentId: NZ_DEPT_OTHER,
    email: 'mike.butterickmp@parliament.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-court',
    fullName: 'Simon Court',
    roleTitle: 'Parliamentary Under-Secretary to the Minister for Infrastructure, Minister Responsible for RMA Reform',
    departmentId: NZ_DEPT_OTHER,
    email: 'simon.court@parliament.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-marcroft',
    fullName: 'Jenny Marcroft',
    roleTitle: 'Parliamentary Under-Secretary to the Minister for Media & Communications, Minister for Oceans & Fisheries',
    departmentId: NZ_DEPT_OTHER,
    email: 'jenny.marcroft@parliament.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-maipiclark',
    fullName: 'Hana-Rawhiti Maipi-Clarke',
    roleTitle: 'Te Pāti Māori MP',
    departmentId: NZ_DEPT_OTHER,
    email: 'hana-rawhiti.maipiclarke@parliament.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-swarbrick',
    fullName: 'Chlöe Swarbrick',
    roleTitle: 'Green Party Co-Leader',
    departmentId: NZ_DEPT_OTHER,
    email: 'chloe.swarbrick@parliament.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
  {
    id: 'nz-ct-davidson',
    fullName: 'Marama Davidson',
    roleTitle: 'Green Party Co-Leader',
    departmentId: NZ_DEPT_OTHER,
    email: 'marama.davidson@parliament.govt.nz',
    address: 'Parliament Buildings, 1 Museum Street, Wellington 6160',
  },
];

// ── Existing contacts to update with parliament emails ────────────────────

interface EmailUpdate {
  contactId: string;
  oldEmail: string;
  newEmail: string;
}

const emailUpdates: EmailUpdate[] = [
  { contactId: 'nz-ct-luxon', oldEmail: 'C.Luxon@ministers.govt.nz', newEmail: 'Christopher.Luxon@parliament.govt.nz' },
  { contactId: 'nz-ct-peters', oldEmail: 'W.Peters@ministers.govt.nz', newEmail: 'Winston.Peters@parliament.govt.nz' },
  { contactId: 'nz-ct-willis', oldEmail: 'N.Willis@ministers.govt.nz', newEmail: 'Nicola.Willis@parliament.govt.nz' },
  { contactId: 'nz-ct-seymour', oldEmail: 'D.Seymour@ministers.govt.nz', newEmail: 'David.Seymour@parliament.govt.nz' },
  { contactId: 'nz-ct-stanford', oldEmail: 'E.Stanford@ministers.govt.nz', newEmail: 'Erica.Stanford@parliament.govt.nz' },
  { contactId: 'nz-ct-potaka', oldEmail: 'T.Potaka@ministers.govt.nz', newEmail: 'Tama.Potaka@parliament.govt.nz' },
  { contactId: 'nz-ct-penk', oldEmail: 'C.Penk@ministers.govt.nz', newEmail: 'chris.penk@parliament.govt.nz' },
  { contactId: 'nz-ct-brown', oldEmail: 'S.Brown@ministers.govt.nz', newEmail: 'Simeon.Brown@parliament.govt.nz' },
  { contactId: 'nz-ct-costello', oldEmail: '', newEmail: 'Casey.Costello@parliament.govt.nz' },
  { contactId: 'nz-ct-vanvelden', oldEmail: 'B.VanVelden@ministers.govt.nz', newEmail: 'Brooke.Vanvelden@parliament.govt.nz' },
  { contactId: 'nz-ct-goldsmith', oldEmail: 'P.Goldsmith@ministers.govt.nz', newEmail: 'Paul.Goldsmith@parliament.govt.nz' },
  { contactId: 'nz-ct-mcclay', oldEmail: 'T.McClay@ministers.govt.nz', newEmail: 'Todd.McClay@parliament.govt.nz' },
  { contactId: 'nz-ct-mitchell', oldEmail: 'M.Mitchell@ministers.govt.nz', newEmail: 'Mark.Mitchell@parliament.govt.nz' },
  { contactId: 'nz-ct-simmonds', oldEmail: '', newEmail: 'Penny.Simmonds@parliament.govt.nz' },
  { contactId: 'nz-ct-mckee', oldEmail: 'N.McKee@ministers.govt.nz', newEmail: 'Nicole.McKee@parliament.govt.nz' },
  { contactId: 'nz-ct-chhour', oldEmail: '', newEmail: 'Karen.Chhour@parliament.govt.nz' },
  { contactId: 'nz-ct-hoggard', oldEmail: '', newEmail: 'Andrew.Hoggard@parliament.govt.nz' },
  { contactId: 'nz-ct-doocey', oldEmail: 'M.Doocey@ministers.govt.nz', newEmail: 'Matt.Doocey@parliament.govt.nz' },
  { contactId: 'nz-ct-jones', oldEmail: 'S.Jones@ministers.govt.nz', newEmail: 'Shane.Jones@parliament.govt.nz' },
  { contactId: 'nz-ct-grigg', oldEmail: '', newEmail: 'Nicola.Grigg@parliament.govt.nz' },
  { contactId: 'nz-ct-bishop', oldEmail: 'C.Bishop@ministers.govt.nz', newEmail: 'Chris.Bishop@parliament.govt.nz' },
  { contactId: 'nz-ct-watts', oldEmail: 'S.Watts@ministers.govt.nz', newEmail: 'Simon.Watts@parliament.govt.nz' },
  { contactId: 'nz-ct-upston', oldEmail: 'L.Upston@ministers.govt.nz', newEmail: 'Louise.Upston@parliament.govt.nz' },
];

async function main() {
  const url = new URL(connectionString);
  const pool = new pg.Pool({
    host: url.hostname,
    port: parseInt(url.port),
    database: url.pathname.slice(1),
    user: url.username,
    password: decodeURIComponent(url.password),
    ssl: { rejectUnauthorized: false },
  });

  const client = await pool.connect();

  try {
    await client.query('BEGIN');

    // 1. Ensure "Other Ministries & Parliamentary" department exists
    const deptCheck = await client.query(
      `SELECT id FROM departments WHERE id = $1`,
      [NZ_DEPT_OTHER]
    );

    if (deptCheck.rowCount === 0) {
      console.log('Creating department: Other Ministries & Parliamentary');
      await client.query(
        `INSERT INTO departments (id, name, code, description, "organisationId", "parentId", "isActive", portfolio, "createdAt", "updatedAt")
         VALUES ($1, $2, $3, $4, $5, NULL, true, $6, $7, $7)`,
        [NZ_DEPT_OTHER, 'Other Ministries & Parliamentary', 'nz-other', 'Other NZ ministers, under-secretaries, and party leaders', NZ_ORG_ID, 'other', NOW]
      );
    }

    // 2. Insert new ministers (skip if already exists)
    let inserted = 0;
    for (const m of newMinisters) {
      const exists = await client.query(`SELECT id FROM contacts WHERE id = $1`, [m.id]);
      if (exists.rowCount && exists.rowCount > 0) {
        console.log(`  SKIP (exists): ${m.fullName}`);
        continue;
      }

      await client.query(
        `INSERT INTO contacts (id, "fullName", "roleTitle", "departmentId", "organisationId", "primaryLocationId", "ownerId", "isHeadOfficeBased", "isActive", "createdAt", "updatedAt")
         VALUES ($1, $2, $3, $4, $5, NULL, NULL, true, true, $6, $6)`,
        [m.id, m.fullName, m.roleTitle, m.departmentId, NZ_ORG_ID, NOW]
      );

      // Insert email channel
      await client.query(
        `INSERT INTO contact_channels (id, "contactId", "channelType", value, "displayValue", "phoneNormalized", "addressLine1", city, state, "postalCode", country, "createdAt", "updatedAt")
         VALUES ($1, $2, 'email', $3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, $4, $4)`,
        [`${m.id}-email`, m.id, m.email, NOW]
      );

      // Insert address channel
      await client.query(
        `INSERT INTO contact_channels (id, "contactId", "channelType", value, "displayValue", "phoneNormalized", "addressLine1", city, state, "postalCode", country, "createdAt", "updatedAt")
         VALUES ($1, $2, 'office_address', $3, NULL, NULL, 'Parliament Buildings', 'Wellington', NULL, '6160', 'New Zealand', $4, $4)`,
        [`${m.id}-address`, m.id, m.address, NOW]
      );

      console.log(`  INSERTED: ${m.fullName} (${m.roleTitle.split(',')[0]}...)`);
      inserted++;
    }
    console.log(`\nNZ new ministers: ${inserted} inserted, ${newMinisters.length - inserted} skipped`);

    // 3. Update existing contact emails to parliament.govt.nz addresses
    let emailsUpdated = 0;
    for (const u of emailUpdates) {
      if (!u.newEmail) continue;

      // Check if the contact exists
      const contact = await client.query(`SELECT id FROM contacts WHERE id = $1`, [u.contactId]);
      if (!contact.rowCount || contact.rowCount === 0) continue;

      // Check if there's an existing email channel
      const existing = await client.query(
        `SELECT id FROM contact_channels WHERE "contactId" = $1 AND "channelType" = 'email'`,
        [u.contactId]
      );

      if (existing.rowCount && existing.rowCount > 0) {
        // Update existing email
        await client.query(
          `UPDATE contact_channels SET value = $1, "updatedAt" = $2 WHERE "contactId" = $3 AND "channelType" = 'email'`,
          [u.newEmail, NOW, u.contactId]
        );
      } else {
        // Insert new email channel
        await client.query(
          `INSERT INTO contact_channels (id, "contactId", "channelType", value, "displayValue", "phoneNormalized", "addressLine1", city, state, "postalCode", country, "createdAt", "updatedAt")
           VALUES ($1, $2, 'email', $3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, $4, $4)`,
          [`${u.contactId}-parliament-email`, u.contactId, u.newEmail, NOW]
        );
      }
      console.log(`  UPDATED EMAIL: ${u.contactId} → ${u.newEmail}`);
      emailsUpdated++;
    }
    console.log(`\nNZ email updates: ${emailsUpdated} updated`);

    await client.query('COMMIT');
    console.log('\nNZ seed complete!');
  } catch (e) {
    await client.query('ROLLBACK');
    console.error('Error:', e);
    throw e;
  } finally {
    client.release();
    await pool.end();
  }
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
