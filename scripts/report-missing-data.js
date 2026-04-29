/*
  Script: report-missing-data.js
  Purpose: Generate reports for
   1) Organisations missing departments
   2) Departments missing contacts

  Output:
   - reports/organisations-missing-departments.md
   - reports/departments-missing-contacts.md
   - reports/organisations-missing-departments.sql
   - reports/departments-missing-contacts.sql

  Usage:
   - Ensure NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY are set (.env.local/.env or shell)
   - node scripts/report-missing-data.js
*/

require('dotenv/config');
const fs = require('node:fs/promises');
const path = require('node:path');

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!SUPABASE_URL || !SUPABASE_KEY) {
  console.error('Missing NEXT_PUBLIC_SUPABASE_URL or NEXT_PUBLIC_SUPABASE_ANON_KEY in environment.');
  process.exit(1);
}

async function getJson(url) {
  const res = await fetch(url, {
    headers: {
      apikey: SUPABASE_KEY,
      Authorization: `Bearer ${SUPABASE_KEY}`,
      Accept: 'application/json',
      'Content-Type': 'application/json',
      Prefer: 'count=exact',
    },
  });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Request failed: ${res.status} ${res.statusText}: ${text}`);
  }
  return res.json();
}

async function fetchOrganisationsWithDeptCounts() {
  // 1) all organisations (id, name, type)
  const orgsUrl = `${SUPABASE_URL}/rest/v1/organisations?select=id,name,type&order=name.asc`;
  const orgs = await getJson(orgsUrl);

  // 2) all active departments (id, organisationId) then aggregate client-side
  const deptsUrl = `${SUPABASE_URL}/rest/v1/departments?select=id,organisationId,isActive&isActive=eq.true`;
  const depts = await getJson(deptsUrl);

  const counts = new Map();
  for (const d of depts) {
    if (d.organisationId) counts.set(d.organisationId, (counts.get(d.organisationId) || 0) + 1);
  }

  return orgs.map((o) => ({ ...o, departmentCount: counts.get(o.id) || 0 }));
}

async function fetchDepartmentsWithContactCounts() {
  const deptsUrl = `${SUPABASE_URL}/rest/v1/departments?select=id,name,code,organisationId,isActive&isActive=eq.true&order=name.asc`;
  const depts = await getJson(deptsUrl);

  const contactsUrl = `${SUPABASE_URL}/rest/v1/contacts?select=id,departmentId`;
  const contacts = await getJson(contactsUrl);

  const counts = new Map();
  for (const c of contacts) {
    if (c.departmentId) counts.set(c.departmentId, (counts.get(c.departmentId) || 0) + 1);
  }

  return depts.map((d) => ({ ...d, contactCount: counts.get(d.id) || 0 }));
}

function toMarkdownTable(headers, rows) {
  const headerLine = `| ${headers.join(' | ')} |`;
  const sepLine = `| ${headers.map(() => '---').join(' | ')} |`;
  const body = rows.map(r => `| ${r.map(v => String(v ?? '').replace(/\n/g, ' ')).join(' | ')} |`).join('\n');
  return `${headerLine}\n${sepLine}\n${body}\n`;
}

async function ensureDir(dir) {
  await fs.mkdir(dir, { recursive: true });
}

async function main() {
  const outDir = path.join(process.cwd(), 'reports');
  await ensureDir(outDir);

  // 1) Organisations missing departments
  const orgs = await fetchOrganisationsWithDeptCounts();
  const orgsMissing = orgs.filter(o => o.departmentCount === 0);
  const orgsMd = [
    '# Organisations Missing Departments',
    '',
    `Total: ${orgsMissing.length}`,
    '',
    toMarkdownTable(
      ['Organisation ID', 'Name', 'Type', 'Department Count'],
      orgsMissing.map(o => [o.id, o.name, o.type, o.departmentCount])
    )
  ].join('\n');
  await fs.writeFile(path.join(outDir, 'organisations-missing-departments.md'), orgsMd, 'utf8');

  // 2) Departments missing contacts
  const depts = await fetchDepartmentsWithContactCounts();
  const deptsMissing = depts.filter(d => d.contactCount === 0);

  // Map org ids to name for convenience
  const orgsLiteUrl = `${SUPABASE_URL}/rest/v1/organisations?select=id,name`;
  const orgsLite = await getJson(orgsLiteUrl);
  const orgNameById = new Map(orgsLite.map(o => [o.id, o.name]));

  const deptsRows = deptsMissing.map(d => [
    d.id,
    d.name,
    d.code ?? '',
    d.organisationId,
    orgNameById.get(d.organisationId) || '',
    d.contactCount,
  ]);

  const deptsMd = [
    '# Departments Missing Contacts',
    '',
    `Total: ${deptsMissing.length}`,
    '',
    toMarkdownTable(
      ['Department ID', 'Department Name', 'Code', 'Organisation ID', 'Organisation Name', 'Contact Count'],
      deptsRows
    )
  ].join('\n');
  await fs.writeFile(path.join(outDir, 'departments-missing-contacts.md'), deptsMd, 'utf8');

  // Canonical SQL files
  const orgsSql = `-- Organisations missing departments (active departments only)\nSELECT o.id, o.name, o.type, COUNT(d.id) AS department_count\nFROM public.organisations o\nLEFT JOIN public.departments d\n  ON d."organisationId" = o.id\n AND d."isActive" = TRUE\nGROUP BY o.id, o.name, o.type\nHAVING COUNT(d.id) = 0\nORDER BY o.name;\n`;

  const deptsSql = `-- Departments missing contacts (active departments only)\nSELECT d.id, d.name, d.code, d."organisationId", o.name AS organisation_name, COUNT(c.id) AS contact_count\nFROM public.departments d\nJOIN public.organisations o\n  ON o.id = d."organisationId"\nLEFT JOIN public.contacts c\n  ON c."departmentId" = d.id\nWHERE d."isActive" = TRUE\nGROUP BY d.id, d.name, d.code, d."organisationId", o.name\nHAVING COUNT(c.id) = 0\nORDER BY o.name, d.name;\n`;

  await fs.writeFile(path.join(outDir, 'organisations-missing-departments.sql'), orgsSql, 'utf8');
  await fs.writeFile(path.join(outDir, 'departments-missing-contacts.sql'), deptsSql, 'utf8');

  console.log('Reports generated in ./reports');
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
