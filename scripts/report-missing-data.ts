/*
  Script: report-missing-data.ts
  Purpose: Generate reports for
   1) Organisations missing departments
   2) Departments missing contacts

  Output:
   - reports/organisations-missing-departments.md
   - reports/departments-missing-contacts.md

  Usage:
   - Ensure NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY are set (.env.local)
   - npx ts-node scripts/report-missing-data.ts
*/

import fs from 'node:fs/promises';
import path from 'node:path';
import 'dotenv/config';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!SUPABASE_URL || !SUPABASE_KEY) {
  // eslint-disable-next-line no-console
  console.error('Missing NEXT_PUBLIC_SUPABASE_URL or NEXT_PUBLIC_SUPABASE_ANON_KEY in environment.');
  process.exit(1);
}

// Minimal PostgREST helper
async function getJson<T>(url: string): Promise<T> {
  const res = await fetch(url, {
    headers: {
      apikey: SUPABASE_KEY as string,
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
  return res.json() as Promise<T>;
}

// Fetch all organisations with a derived departments count using RPC-less aggregation (two requests + join in memory)
async function fetchOrganisationsWithDeptCounts() {
  type Org = {
    id: string;
    name: string;
    type: string;
  };

  // 1) all organisations
  const orgsUrl = `${SUPABASE_URL}/rest/v1/organisations?select=id,name,type&order=name.asc`;
  const orgs = await getJson<Org[]>(orgsUrl);

  // 2) department counts per org (grouped)
  // PostgREST aggregate endpoint via eq and select=count(*) is not directly supported per-group,
  // so we fetch departments minimal fields and aggregate client-side
  type Dept = { id: string; organisationId: string; isActive: boolean };
  const deptsUrl = `${SUPABASE_URL}/rest/v1/departments?select=id,organisationId,isActive&eq.isActive=true`;
  const depts = await getJson<Dept[]>(deptsUrl);

  const counts = new Map<string, number>();
  for (const d of depts) {
    if (d.isActive && d.organisationId) {
      counts.set(d.organisationId, (counts.get(d.organisationId) || 0) + 1);
    }
  }

  return orgs.map((o) => ({ ...o, departmentCount: counts.get(o.id) || 0 }));
}

async function fetchDepartmentsWithContactCounts() {
  type Dept = {
    id: string;
    name: string;
    code: string | null;
    organisationId: string;
    isActive: boolean;
  };
  // Active departments
  const deptsUrl = `${SUPABASE_URL}/rest/v1/departments?select=id,name,code,organisationId,isActive&eq.isActive=true&order=name.asc`;
  const depts = await getJson<Dept[]>(deptsUrl);

  type Contact = { id: string; departmentId: string | null };
  const contactsUrl = `${SUPABASE_URL}/rest/v1/contacts?select=id,departmentId`;
  const contacts = await getJson<Contact[]>(contactsUrl);

  const counts = new Map<string, number>();
  for (const c of contacts) {
    if (c.departmentId) {
      counts.set(c.departmentId, (counts.get(c.departmentId) || 0) + 1);
    }
  }

  return depts.map((d) => ({ ...d, contactCount: counts.get(d.id) || 0 }));
}

function toMarkdownTable(headers: string[], rows: (string | number | null | undefined)[][]): string {
  const headerLine = `| ${headers.join(' | ')} |`;
  const sepLine = `| ${headers.map(() => '---').join(' | ')} |`;
  const body = rows.map(r => `| ${r.map(v => (v ?? '').toString().replace(/\n/g, ' ')).join(' | ')} |`).join('\n');
  return `${headerLine}\n${sepLine}\n${body}\n`;
}

async function ensureDir(dir: string) {
  await fs.mkdir(dir, { recursive: true });
}

async function main() {
  const outDir = path.join(process.cwd(), 'reports');
  await ensureDir(outDir);

  // 1) Organisations missing departments
  const orgs = await fetchOrganisationsWithDeptCounts();
  const orgsMissing = orgs.filter(o => (o as any).departmentCount === 0);
  const orgsMd = [
    '# Organisations Missing Departments',
    '',
    `Total: ${orgsMissing.length}`,
    '',
    toMarkdownTable(
      ['Organisation ID', 'Name', 'Type', 'Department Count'],
      orgsMissing.map(o => [o.id, o.name, o.type, (o as any).departmentCount])
    )
  ].join('\n');
  await fs.writeFile(path.join(outDir, 'organisations-missing-departments.md'), orgsMd, 'utf8');

  // 2) Departments missing contacts
  const depts = await fetchDepartmentsWithContactCounts();
  const deptsMissing = depts.filter(d => (d as any).contactCount === 0);

  // Map org ids to name for convenience
  type OrgLite = { id: string; name: string };
  const orgsLiteUrl = `${SUPABASE_URL}/rest/v1/organisations?select=id,name`;
  const orgsLite = await getJson<OrgLite[]>(orgsLiteUrl);
  const orgNameById = new Map(orgsLite.map(o => [o.id, o.name] as const));

  const deptsRows = deptsMissing.map(d => [
    d.id,
    d.name,
    d.code ?? '',
    d.organisationId,
    orgNameById.get(d.organisationId) || '',
    (d as any).contactCount,
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

  // Also output raw SQL files with the canonical queries used for server-side validation
  const orgsSql = `-- Organisations missing departments (active departments only)\nSELECT o.id, o.name, o.type, COUNT(d.id) AS department_count\nFROM public.organisations o\nLEFT JOIN public.departments d\n  ON d."organisationId" = o.id\n AND d."isActive" = TRUE\nGROUP BY o.id, o.name, o.type\nHAVING COUNT(d.id) = 0\nORDER BY o.name;\n`;

  const deptsSql = `-- Departments missing contacts (active departments only)\nSELECT d.id, d.name, d.code, d."organisationId", o.name AS organisation_name, COUNT(c.id) AS contact_count\nFROM public.departments d\nJOIN public.organisations o\n  ON o.id = d."organisationId"\nLEFT JOIN public.contacts c\n  ON c."departmentId" = d.id\nWHERE d."isActive" = TRUE\nGROUP BY d.id, d.name, d.code, d."organisationId", o.name\nHAVING COUNT(c.id) = 0\nORDER BY o.name, d.name;\n`;

  await fs.writeFile(path.join(outDir, 'organisations-missing-departments.sql'), orgsSql, 'utf8');
  await fs.writeFile(path.join(outDir, 'departments-missing-contacts.sql'), deptsSql, 'utf8');

  // eslint-disable-next-line no-console
  console.log('Reports generated in ./reports');
}

main().catch((err) => {
  // eslint-disable-next-line no-console
  console.error(err);
  process.exit(1);
});
