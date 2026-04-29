import { createClient, SupabaseClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';

// Regex to find region subqueries: (SELECT id FROM regions WHERE code = 'US' ...)
const REGION_SUBQUERY = /\(\s*SELECT\s+id\s+FROM\s+regions\s+WHERE\s+code\s*=\s*'([A-Z]{2,3})'(?:.*?)\)/gi;

export class SeedHelper {
  client: SupabaseClient;
  regionMap: Map<string, string> = new Map(); // Code -> UUID

  constructor(supabaseUrl: string, supabaseKey: string) {
    this.client = createClient(supabaseUrl, supabaseKey, {
      auth: { persistSession: false }
    });
  }

  async loadRegions() {
    console.log('🌍 Loading regions map...');
    const { data, error } = await this.client.from('regions').select('id, code, region_type');
    if (error) {
      console.error('Failed to load regions:', error);
      return;
    }
    if (data) {
      data.forEach(r => {
        this.regionMap.set(r.code, r.id);
      });
    }
    console.log(`✅ Loaded ${this.regionMap.size} regions.`);
  }

  resolveSubqueries(sql: string): string {
    // Replace Region lookups with actual UUIDs
    let resolved = sql.replace(REGION_SUBQUERY, (match, code) => {
      const id = this.regionMap.get(code);
      // If region not found, return NULL or handle error. For now NULL.
      return id ? `'${id}'` : 'NULL';
    });
    
    return resolved;
  }

  parseValue(val: string): any {
    val = val.trim();
    if (val.toUpperCase() === 'NULL') return null;
    if (val.toUpperCase() === 'TRUE') return true;
    if (val.toUpperCase() === 'FALSE') return false;
    if (val.startsWith("'") && val.endsWith("'")) {
      // Remove quotes and handle escaped single quotes if any (simple replacement)
      return val.slice(1, -1).replace(/''/g, "'");
    }
    if (!isNaN(Number(val))) return Number(val);
    return val;
  }

  async processFile(filename: string) {
    // Cast process to any to avoid TS lib issues with fs/path in seed scripts
    const filePath = path.join((process as any).cwd(), 'prisma', 'seeds', filename);
    console.log(`📂 Processing ${filename}...`);
    
    if (!fs.existsSync(filePath)) {
        console.warn(`⚠️ File not found: ${filename}`);
        return;
    }

    let content = fs.readFileSync(filePath, 'utf-8');
    
    // 1. Resolve Foreign Keys
    content = this.resolveSubqueries(content);

    // 2. Split into statements
    const statements = content
      .split(';')
      .map(s => s.trim())
      .filter(s => s.length > 0 && !s.startsWith('--'));

    for (const stmt of statements) {
      if (stmt.toUpperCase().startsWith('INSERT INTO')) {
        await this.executeInsert(stmt);
      }
    }
  }

  async executeInsert(sql: string) {
    // Basic Regex to parse: INSERT INTO table (cols) VALUES (vals) ...
    const match = sql.match(/INSERT INTO\s+(\w+)\s*\(([^)]+)\)\s*VALUES\s*(.*)/is);
    if (!match) return;

    const table = match[1];
    const columns = match[2].split(',').map(c => c.trim());
    const valuesPart = match[3];

    // Remove "ON CONFLICT..." suffix
    const cleanValuesPart = valuesPart.split(/ON\s+CONFLICT/i)[0].trim();

    // Split rows: (val1, val2), (val3, val4)
    const rowsRaw = cleanValuesPart.split(/\)\s*,\s*\(/);
    
    const rowsToInsert: any[] = [];

    for (let r of rowsRaw) {
      r = r.replace(/^\s*\(|\)\s*$/g, '');
      
      const values: string[] = [];
      let current = '';
      let inQuote = false;
      for (let i = 0; i < r.length; i++) {
        const char = r[i];
        if (char === "'" && r[i-1] !== '\\') {
          inQuote = !inQuote;
          current += char;
        } else if (char === ',' && !inQuote) {
          values.push(current);
          current = '';
        } else {
          current += char;
        }
      }
      values.push(current);

      const rowObj: any = {};
      columns.forEach((col, idx) => {
        if (idx < values.length) {
          rowObj[col] = this.parseValue(values[idx]);
        }
      });
      rowsToInsert.push(rowObj);
    }

    if (rowsToInsert.length > 0) {
      const { error } = await this.client.from(table).upsert(rowsToInsert, { ignoreDuplicates: true });
      if (error) {
        console.error(`❌ Error inserting into ${table}:`, error.message);
      }
    }
  }
}