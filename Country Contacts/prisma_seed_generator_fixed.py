#!/usr/bin/env python3
"""
Prisma Seed Data Generator
Complete seed data generation for the business directory database
"""

import json
import uuid
from pathlib import Path
from typing import Dict, List, Any, Set
from datetime import datetime
import logging

class PrismaSeedGenerator:
    """Generate comprehensive Prisma seed data."""
    
    def __init__(self, config: Dict[str, Any] = None):
        self.config = config or {}
        self.logger = logging.getLogger(__name__)

    def generate_schema(self, output_dir: Path) -> None:
        """Generate the enhanced Prisma schema file."""
        schema_content = '''// This is your Prisma schema file,
// learn more about it in the docs: https://pris.ly/d/prisma-schema

generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

enum RegionType {
  country
  state
  province
  territory
}

enum OrganisationType {
  government
  corporate
  diplomatic_mission
  international_organization
}

enum LocationType {
  head_office
  branch_office
  regional_office
  department_office
  embassy
  consulate
  mission
}

enum ContactChannelType {
  phone
  email
  website
  office_address
  mobile
  fax
}

model Region {
  id             String      @id @default(cuid())
  name           String
  code           String
  regionType     RegionType
  parentRegion   Region?     @relation("RegionHierarchy", fields: [parentRegionId], references: [id])
  parentRegionId String?
  organisations  Organisation[]
  locations      OrganisationLocation[]
  createdAt      DateTime    @default(now())
  updatedAt      DateTime    @updatedAt

  @@unique([code, regionType])
}

model Organisation {
  id                  String              @id @default(cuid())
  name                String
  type                OrganisationType
  headOfficeCountry   Region              @relation("OrganisationCountry", fields: [headOfficeCountryId], references: [id])
  headOfficeCountryId String
  headOfficeCity      String?
  headOfficeAddress   String?
  headOfficePhone     String?
  headOfficeEmail     String?
  headOfficeWebsite   String?
  description         String?
  contacts            Contact[]
  locations           OrganisationLocation[]
  createdAt           DateTime            @default(now())
  updatedAt           DateTime            @updatedAt
}

model OrganisationLocation {
  id           String        @id @default(cuid())
  organisation Organisation  @relation(fields: [organisationId], references: [id])
  organisationId String
  locationName String?
  country      Region        @relation("LocationCountry", fields: [countryId], references: [id])
  countryId    String
  city         String?
  address      String?
  phone        String?
  email        String?
  locationType LocationType  @default(BRANCH_OFFICE)
  contacts     Contact[]
  createdAt    DateTime      @default(now())
  updatedAt    DateTime      @default(now())
}

model Contact {
  id                  String            @id @default(cuid())
  fullName            String
  roleTitle           String?
  department          String?
  organisation        Organisation      @relation(fields: [organisationId], references: [id])
  organisationId      String
  primaryLocation     OrganisationLocation? @relation(fields: [primaryLocationId], references: [id])
  primaryLocationId   String?
  isHeadOfficeBased   Boolean           @default(false)
  contactChannels     ContactChannel[]
  createdAt           DateTime          @default(now())
  updatedAt           DateTime          @updatedAt
}

model ContactChannel {
  id              String              @id @default(cuid())
  contact         Contact             @relation(fields: [contactId], references: [id])
  contactId       String
  channelType     ContactChannelType
  value           String
  displayValue    String?
  phoneNormalized String?
  addressLine1    String?
  addressLine2    String?
  city            String?
  state           String?
  postalCode      String?
  country         String?
  createdAt       DateTime            @default(now())
  updatedAt       DateTime            @updatedAt

  @@unique([contactId, channelType, value])
}'''

        schema_file = output_dir / "schema.prisma"
        schema_file.write_text(schema_content)
        self.logger.info(f"Generated enhanced Prisma schema: {schema_file}")

    def generate_seed_data(self, processed_data: Dict[str, Any], output_dir: Path) -> None:
        """Generate comprehensive seed data."""
        seeds_dir = output_dir / "seeds"
        seeds_dir.mkdir(exist_ok=True)

        # Generate regions
        self._generate_regions_seed(processed_data, seeds_dir)
        
        # Generate organizations
        self._generate_organizations_seed(processed_data, seeds_dir)
        
        # Generate contacts
        self._generate_contacts_seed(processed_data, seeds_dir)
        
        # Generate contact channels
        self._generate_contact_channels_seed(processed_data, seeds_dir)

        self.logger.info(f"Generated comprehensive seed data in: {seeds_dir}")

    def _generate_regions_seed(self, processed_data: Dict[str, Any], seeds_dir: Path) -> None:
        """Generate regions seed data."""
        regions = set()
        
        # Add countries from processed data
        for contact in processed_data.get('contacts', []):
            if contact.get('country'):
                country_code = self._get_country_code(contact['country'])
                regions.add((contact['country'], country_code, 'country'))
        
        # Sort regions for consistent output
        sorted_regions = sorted(regions, key=lambda x: (x[2], x[0]))

        sql_content = "-- ============================================================================\n"
        sql_content += "-- REGIONS SEED DATA\n"
        sql_content += "-- Countries and regions for geographic filtering\n"
        sql_content += f"-- Generated on: {datetime.now().isoformat()}\n"
        sql_content += "-- ============================================================================\n\n"

        current_type = None
        for name, code, region_type in sorted_regions:
            if region_type != current_type:
                if current_type:
                    sql_content += "ON CONFLICT (code, region_type) DO NOTHING;\n\n"
                
                current_type = region_type
                sql_content += f"-- {region_type.title()}s\n"
                sql_content += "INSERT INTO regions (name, code, region_type) VALUES\n"
            
            escaped_name = name.replace("'", "''")
            sql_content += f"    ('{escaped_name}', '{code}', '{region_type}')"
            
            # Check if this is the last item of this type
            remaining_same_type = [r for r in sorted_regions if r[2] == region_type and r != (name, code, region_type)]
            if remaining_same_type:
                sql_content += ","
            else:
                sql_content += "\nON CONFLICT (code, region_type) DO NOTHING;\n\n"

        seed_file = seeds_dir / "001_regions.sql"
        seed_file.write_text(sql_content)
        self.logger.info(f"Generated regions seed: {seed_file}")

    def _generate_organizations_seed(self, processed_data: Dict[str, Any], seeds_dir: Path) -> None:
        """Generate organizations seed data."""
        sql_content = "-- ============================================================================\n"
        sql_content += "-- ORGANISATIONS SEED DATA\n"
        sql_content += "-- Organizations with head office information\n"
        sql_content += f"-- Generated on: {datetime.now().isoformat()}\n"
        sql_content += "-- ============================================================================\n\n"

        # Group organizations by name to avoid duplicates
        org_map = {}
        for org_data in processed_data.get('organizations', []):
            org_name = org_data['name']
            if org_name not in org_map:
                org_map[org_name] = org_data

        for i, (org_name, org_data) in enumerate(org_map.items()):
            org_id = f"org_{i+1:03d}_{uuid.uuid4().hex[:8]}"
            country_code = self._get_country_code(org_data['country'])
            
            sql_content += f"-- Organization: {org_name}\n"
            sql_content += "INSERT INTO organisations (id, name, type, headOfficeCountryId, headOfficeCity, headOfficeAddress, headOfficePhone, headOfficeEmail, headOfficeWebsite, description) VALUES\n"
            
            head_office = org_data.get('head_office', {})
            escaped_org_name = org_name.replace("'", "''")
            escaped_city = head_office.get('city', '').replace("'", "''") if head_office.get('city') else ''
            escaped_address = head_office.get('address', '').replace("'", "''") if head_office.get('address') else ''
            escaped_description = org_data.get('description', '').replace("'", "''") if org_data.get('description') else ''
            
            values = [
                f"'{org_id}'",
                f"'{escaped_org_name}'",
                f"'{org_data['type']}'::organisation_type",
                f"(SELECT id FROM regions WHERE code = '{country_code}' AND region_type = 'country')",
                f"'{escaped_city}'" if escaped_city else 'NULL',
                f"'{escaped_address}'" if escaped_address else 'NULL',
                f"'{head_office.get('phone', '')}'" if head_office.get('phone') else 'NULL',
                f"'{head_office.get('email', '')}'" if head_office.get('email') else 'NULL',
                f"'{head_office.get('website', '')}'" if head_office.get('website') else 'NULL',
                f"'{escaped_description}'" if escaped_description else 'NULL'
            ]
            
            sql_content += f"    ({', '.join(values)})\n"
            sql_content += "ON CONFLICT DO NOTHING;\n\n"

        seed_file = seeds_dir / "002_organisations.sql"
        seed_file.write_text(sql_content)
        self.logger.info(f"Generated organizations seed: {seed_file}")

    def _generate_contacts_seed(self, processed_data: Dict[str, Any], seeds_dir: Path) -> None:
        """Generate contacts seed data."""
        sql_content = "-- ============================================================================\n"
        sql_content += "-- CONTACTS SEED DATA\n"
        sql_content += "-- Individual contacts within organizations\n"
        sql_content += f"-- Generated on: {datetime.now().isoformat()}\n"
        sql_content += "-- ============================================================================\n\n"

        # Group contacts by organization to avoid duplicates
        org_contacts = {}
        for contact in processed_data.get('contacts', []):
            # Find the organization for this contact
            org_name = self._find_contact_organization(contact, processed_data.get('organizations', []))
            
            if org_name not in org_contacts:
                org_contacts[org_name] = []
            org_contacts[org_name].append(contact)

        contact_counter = 1
        for org_name, contacts in org_contacts.items():
            for contact in contacts:
                contact_id = f"contact_{contact_counter:04d}_{uuid.uuid4().hex[:8]}"
                
                sql_content += f"-- Contact: {contact['full_name']} - {org_name}\n"
                sql_content += "INSERT INTO contacts (id, fullName, roleTitle, department, organisationId, isHeadOfficeBased) VALUES\n"
                
                escaped_name = contact['full_name'].replace("'", "''")
                escaped_role = contact.get('role_title', '').replace("'", "''") if contact.get('role_title') else ''
                escaped_dept = contact.get('department', '').replace("'", "''") if contact.get('department') else ''
                escaped_org = org_name.replace("'", "''")
                
                values = [
                    f"'{contact_id}'",
                    f"'{escaped_name}'",
                    f"'{escaped_role}'" if escaped_role else 'NULL',
                    f"'{escaped_dept}'" if escaped_dept else 'NULL',
                    f"(SELECT id FROM organisations WHERE name = '{escaped_org}')",
                    'true'  # Assume head office based for now
                ]
                
                sql_content += f"    ({', '.join(values)})\n"
                sql_content += "ON CONFLICT DO NOTHING;\n\n"
                
                contact_counter += 1

        seed_file = seeds_dir / "004_contacts.sql"
        seed_file.write_text(sql_content)
        self.logger.info(f"Generated contacts seed: {seed_file}")

    def _generate_contact_channels_seed(self, processed_data: Dict[str, Any], seeds_dir: Path) -> None:
        """Generate contact channels seed data."""
        sql_content = "-- ============================================================================\n"
        sql_content += "-- CONTACT CHANNELS SEED DATA\n"
        sql_content += "-- Phone, email, website, and address information\n"
        sql_content += f"-- Generated on: {datetime.now().isoformat()}\n"
        sql_content += "-- ============================================================================\n\n"

        contact_counter = 1
        for contact in processed_data.get('contacts', []):
            contact_id = f"contact_{contact_counter:04d}"
            
            # Extract all phone numbers
            for key, value in contact.items():
                if key.startswith('phone_') and isinstance(value, dict):
                    phone_data = value
                    escaped_name = contact['full_name'].replace("'", "''")
                    sql_content += f"-- Phone for: {contact['full_name']}\n"
                    sql_content += "INSERT INTO contact_channels (contactId, channelType, value, displayValue, phoneNormalized) VALUES\n"
                    sql_content += f"    ((SELECT id FROM contacts WHERE fullName = '{escaped_name}'), 'phone'::contact_channel_type, '{phone_data['raw']}', '{phone_data['display']}', '{phone_data['normalized']}')\n"
                    sql_content += "ON CONFLICT DO NOTHING;\n\n"
            
            # Extract all emails
            for key, value in contact.items():
                if key.startswith('email_') and value:
                    escaped_name = contact['full_name'].replace("'", "''")
                    sql_content += f"-- Email for: {contact['full_name']}\n"
                    sql_content += "INSERT INTO contact_channels (contactId, channelType, value, displayValue) VALUES\n"
                    sql_content += f"    ((SELECT id FROM contacts WHERE fullName = '{escaped_name}'), 'email'::contact_channel_type, '{value}', '{value}')\n"
                    sql_content += "ON CONFLICT DO NOTHING;\n\n"
            
            # Extract all websites
            for key, value in contact.items():
                if key.startswith('website_') and value:
                    escaped_name = contact['full_name'].replace("'", "''")
                    sql_content += f"-- Website for: {contact['full_name']}\n"
                    sql_content += "INSERT INTO contact_channels (contactId, channelType, value, displayValue) VALUES\n"
                    sql_content += f"    ((SELECT id FROM contacts WHERE fullName = '{escaped_name}'), 'website'::contact_channel_type, '{value}', '{value}')\n"
                    sql_content += "ON CONFLICT DO NOTHING;\n\n"
            
            # Extract all addresses
            for key, value in contact.items():
                if key.startswith('address_') and value:
                    city = contact.get('city', '')
                    escaped_name = contact['full_name'].replace("'", "''")
                    escaped_value = value.replace("'", "''")
                    escaped_city = city.replace("'", "''") if city else ''
                    city_value = f"'{escaped_city}'" if city else "NULL"
                    sql_content += f"-- Address for: {contact['full_name']}\n"
                    sql_content += "INSERT INTO contact_channels (contactId, channelType, value, displayValue, addressLine1, city) VALUES\n"
                    sql_content += f"    ((SELECT id FROM contacts WHERE fullName = '{escaped_name}'), 'office_address'::contact_channel_type, '{escaped_value}', '{escaped_value}', '{escaped_value}', {city_value})\n"
                    sql_content += "ON CONFLICT DO NOTHING;\n\n"
            
            contact_counter += 1

        seed_file = seeds_dir / "005_contact_channels.sql"
        seed_file.write_text(sql_content)
        self.logger.info(f"Generated contact channels seed: {seed_file}")

    def _get_country_code(self, country_name: str) -> str:
        """Get country code from country name."""
        if not country_name:
            return 'XX'
        
        country_mapping = {
            'United States': 'US',
            'United Kingdom': 'GB',
            'Australia': 'AU',
            'Canada': 'CA',
            'Germany': 'DE',
            'France': 'FR',
            'Italy': 'IT',
            'Japan': 'JP',
            'China': 'CN',
            'India': 'IN',
            'Brazil': 'BR',
            'Mexico': 'MX',
            'Russia': 'RU',
            'Turkey': 'TR',
            'Saudi Arabia': 'SA',
            'South Korea': 'KR',
            'Indonesia': 'ID',
            'Argentina': 'AR',
            'South Africa': 'ZA',
            'New Zealand': 'NZ',
            'African Union': 'AU',
            'European Union': 'EU',
            'International': 'XX'
        }
        
        return country_mapping.get(country_name, 'XX')

    def _find_contact_organization(self, contact: Dict[str, Any], organizations: List[Dict[str, Any]]) -> str:
        """Find the organization for a contact."""
        # Try to match by source file or sheet name directly from contact
        contact_file = contact.get('source_file', '')
        contact_sheet = contact.get('sheet_name', '')

        for org in organizations:
            if (org.get('source_file') == contact_file and
                org.get('sheet_name') == contact_sheet):
                return org['name']

        return "Unknown Organization"

def main():
    """Main function for standalone seed generation."""
    import sys
    from excel_to_prisma_enhanced import EnhancedExcelProcessor
    
    if len(sys.argv) != 3:
        print("Usage: python prisma_seed_generator_fixed.py <input_directory> <output_directory>")
        sys.exit(1)
    
    input_dir = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])
    
    # Setup logging
    logging.basicConfig(level=logging.INFO)
    logger = logging.getLogger(__name__)
    
    try:
        # Process Excel files
        processor = EnhancedExcelProcessor()
        processor.process_directory(input_dir)
        
        # Generate seed data
        generator = PrismaSeedGenerator()
        generator.generate_schema(output_dir)
        generator.generate_seed_data(processor.processed_data, output_dir)
        
        logger.info("Seed data generation completed successfully!")
        
    except Exception as e:
        logger.error(f"Seed data generation failed: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
