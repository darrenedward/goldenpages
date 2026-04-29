#!/usr/bin/env node
/**
 * JSON Data Seeder
 * Specialized for importing cleaned contact data from JSON files.
 * 
 * Usage: npx tsx scripts/seed-json.ts
 */

import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';
import { resolve } from 'path';

// Load environment variables
config({ path: resolve(process.cwd(), '.env.local') });

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || '';


if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    console.error('❌ Supabase credentials not found in env');
    process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

async function seedJson() {
    console.log('🌱 Starting JSON data import...\n');

    try {
        // 1. Import Contacts
        console.log('📄 Loading contacts_fixed.json...');
        const contactsData = JSON.parse(readFileSync(resolve(process.cwd(), 'prisma/seeds/contacts_fixed.json'), 'utf-8'));

        console.log(`📊 Found ${contactsData.length} contacts. Importing in batches...`);

        // Batch processing to avoid payload limits
        const batchSize = 100;
        for (let i = 0; i < contactsData.length; i += batchSize) {
            const batch = contactsData.slice(i, i + batchSize).map((c: any) => ({
                id: c.id,
                fullName: c.fullName,
                roleTitle: c.roleTitle,
                organisationId: c.organisation_id,
                departmentId: c.department_id,
                isHeadOfficeBased: c.is_head_office_based || false,
                departmentLegacy: c.department_legacy
            }));

            const { error } = await supabase.from('contacts').upsert(batch);
            if (error) {
                console.error(`❌ Batch ${i / batchSize + 1} failed:`, error.message);
            } else {
                process.stdout.write(`✅ Batch ${i / batchSize + 1} imported\r`);
            }
        }
        console.log('\n✨ Contacts import complete.\n');

        // 2. Import Contact Channels
        console.log('📄 Loading contact_channels_fixed.json...');
        const channelsData = JSON.parse(readFileSync(resolve(process.cwd(), 'prisma/seeds/contact_channels_fixed.json'), 'utf-8'));

        console.log(`📊 Found ${channelsData.length} channels. Importing in batches...`);

        for (let i = 0; i < channelsData.length; i += batchSize) {
            const batch = channelsData.slice(i, i + batchSize).map((c: any) => ({
                id: c.id,
                contactId: c.contact_id,
                channelType: c.channel_type.toUpperCase(),
                value: c.value,
                displayValue: c.display_value || c.value,
                phoneNormalized: c.phone_normalized,
                addressLine1: c.address_line_1,
                city: c.city,
                isCurrent: true
            }));

            const { error } = await supabase.from('contact_channels').upsert(batch);
            if (error) {
                console.error(`❌ Channel Batch ${i / batchSize + 1} failed:`, error.message);
            } else {
                process.stdout.write(`✅ Channel Batch ${i / batchSize + 1} imported\r`);
            }
        }
        console.log('\n✨ Channels import complete.\n');

        console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        console.log('✅ JSON Data Seeding Finished Successfully');
        console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

    } catch (err: any) {
        console.error('❌ Fatal error during JSON seed:', err.message);
        process.exit(1);
    }
}

seedJson();
