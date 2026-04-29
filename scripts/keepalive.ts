#!/usr/bin/env node
/**
 * Direct Postgres Keepalive Script
 * 
 * Uses the 'pg' driver to directly query the database, ensuring it stays active.
 * Bypasses Supabase REST API limits and Prisma configuration complexity.
 */

import { Client } from 'pg';
import { config } from 'dotenv';
import { resolve } from 'path';
import dns from 'dns';

// Force IPv4 because some environments have unreachable IPv6 routes
dns.setDefaultResultOrder('ipv4first');

// Load environment variables (prefer .env.local, fallback to .env)
config({ path: resolve(process.cwd(), '.env.local') });
config({ path: resolve(process.cwd(), '.env') });

const DATABASE_URL = process.env.DATABASE_URL?.replace(/[?&]sslmode=[^&]+/, '');

if (!DATABASE_URL) {
  console.error('❌ Missing DATABASE_URL in environment');
  process.exit(1);
}

async function keepalive() {
  const timestamp = new Date().toISOString();
  console.log(`[${timestamp}] Pinging database via direct Postgres connection...`);

  // Create a new client
  const client = new Client({
    connectionString: DATABASE_URL,
    ssl: {
      rejectUnauthorized: false, // Allow self-signed certs for keepalive pings
    }
  });

  try {
    await client.connect();

    // Simplest possible query to keep it alive
    const res = await client.query('SELECT 1 as keepalive');

    console.log('✅ Database alive — Ping successful:', res.rows[0]);
  } catch (err) {
    const message = err instanceof Error ? err.message : 'Unknown error';
    console.error(`❌ Connection failed: ${message}`);
    process.exit(1);
  } finally {
    await client.end();
  }
}

keepalive();
