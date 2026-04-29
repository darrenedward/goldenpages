#!/usr/bin/env python3
"""
Generate Prisma seed files from Excel extraction data.

Creates proper seed files with UUID and FK relationships:
- Region (countries)
- Organisation (with UUID, linked to Region)
- Department (with organization_id FK)
- Contact (with organization_id and department_id FKs)
- ContactChannel (phone, email, website, address)

Author: Generated with Claude Code
License: MIT
"""

import argparse
import json
import logging
import sys
import uuid
from pathlib import Path
from typing import Dict, List, Any, Set, Tuple
from datetime import datetime
import pandas as pd

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)]
)
logger = logging.getLogger(__name__)

# Country code mappings (ISO 3166-1 alpha-2)
COUNTRY_CODES = {
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
    'African Union': 'AU',  # Using AU for African Union (not Australia)
    'European Union': 'EU',
    'International': 'XX',
}

# Organisation type mappings
ORG_TYPE_MAPPING = {
    'government': 'government',
    'diplomatic_mission': 'diplomatic_mission',
    'international_organization': 'international_organization',
}

class SeedGenerator:
    """Generate seed data from extraction report."""

    def __init__(self, extraction_file: Path):
        self.extraction_file = extraction_file
        self.extraction_data: Dict[str, Any] = {}

        # Storage for generated entities
        self.regions: List[Dict[str, Any]] = []
        self.organisations: List[Dict[str, Any]] = []
        self.departments: List[Dict[str, Any]] = []
        self.contacts: List[Dict[str, Any]] = []
        self.contact_channels: List[Dict[str, Any]] = []

        # Tracking maps for FK relationships
        self.region_map: Dict[str, str] = {}  # country_name -> region_id
        self.org_map: Dict[str, str] = {}  # org_name -> org_id
        self.dept_map: Dict[Tuple[str, str], str] = {}  # (org_id, dept_name) -> dept_id
        self.contact_map: Dict[str, str] = {}  # contact_key -> contact_id
        self.org_country_map: Dict[str, str] = {}  # org_name -> country_name (from file details)

    def load_extraction_data(self) -> None:
        """Load the extraction report JSON."""
        logger.info(f"Loading extraction data from {self.extraction_file}")
        with open(self.extraction_file, 'r') as f:
            self.extraction_data = json.load(f)
        logger.info(f"Loaded data for {self.extraction_data['summary']['total_contacts_extracted']} contacts")

        # Build org -> country mapping from file details
        for file_detail in self.extraction_data.get('file_details', []):
            countries = file_detail.get('countries', [])
            organizations = file_detail.get('organizations', [])
            if countries and organizations:
                for org_name in organizations:
                    self.org_country_map[org_name] = countries[0]

    def generate_regions(self) -> None:
        """Generate Region records for all countries found."""
        logger.info("Generating Region records...")

        for country_name in self.extraction_data.get('countries', []):
            region_id = str(uuid.uuid4())
            country_code = COUNTRY_CODES.get(country_name, 'XX')

            region = {
                'id': region_id,
                'name': country_name,
                'code': country_code,
                'regionType': 'country',
                'parentRegionId': None,
                'createdAt': datetime.now().isoformat(),
                'updatedAt': datetime.now().isoformat(),
            }

            self.regions.append(region)
            self.region_map[country_name] = region_id

        logger.info(f"Generated {len(self.regions)} Region records")

    def generate_organisations(self) -> None:
        """Generate Organisation records with proper FKs to Region."""
        logger.info("Generating Organisation records...")

        # Generate organizations from the extraction data
        for org_name in self.extraction_data.get('organizations', []):
            # Extract country from org name (e.g., "China - Politburo" -> "China")
            country_name = self._extract_country_from_org_name(org_name)

            # Fix malformed org names (missing country prefix)
            fixed_org_name = self._fix_org_name(org_name, country_name)

            region_id = self.region_map.get(country_name)

            if not region_id:
                logger.warning(f"No region found for country: {country_name}")
                continue

            org_id = str(uuid.uuid4())
            org_type = self._determine_org_type(fixed_org_name)

            organisation = {
                'id': org_id,
                'name': fixed_org_name,
                'type': org_type,
                'headOfficeCountryId': region_id,
                'headOfficeCity': None,
                'headOfficeAddress': None,
                'headOfficePhone': None,
                'headOfficeEmail': None,
                'headOfficeWebsite': None,
                'description': f"{fixed_org_name} - {country_name}",
                'ownerId': None,
                'createdAt': datetime.now().isoformat(),
                'updatedAt': datetime.now().isoformat(),
            }

            self.organisations.append(organisation)
            # Map both the original and fixed names for lookup
            self.org_map[org_name] = org_id
            self.org_map[fixed_org_name] = org_id

        logger.info(f"Generated {len(self.organisations)} Organisation records")

    def _fix_org_name(self, org_name: str, country_name: str) -> str:
        """Fix malformed organization names by adding country prefix if missing."""
        if not org_name:
            return f"{country_name} Government"

        # If org name already starts with country name (case-insensitive), return as-is
        if org_name.lower().startswith(country_name.lower()):
            return org_name

        # If org name starts with " - " it's malformed - add country prefix
        if org_name.startswith(' - '):
            return f"{country_name}{org_name}"

        # If org name doesn't have country prefix, add it
        if ' - ' not in org_name:
            return f"{country_name} - {org_name}"

        # Otherwise, replace the first part with country name
        parts = org_name.split(' - ', 1)
        if len(parts) == 2 and parts[0].strip() == '':
            return f"{country_name} - {parts[1]}"

        return org_name

    def generate_departments(self) -> None:
        """Generate Department records with organisation_id FK."""
        logger.info("Generating Department records...")

        # Group departments by organization from file details
        org_departments: Dict[str, Set[str]] = {}

        for file_detail in self.extraction_data.get('file_details', []):
            org_name = file_detail.get('organizations', [None])[0] if file_detail.get('organizations') else None
            if org_name:
                if org_name not in org_departments:
                    org_departments[org_name] = set()
                for dept in file_detail.get('departments', []):
                    if dept:
                        org_departments[org_name].add(dept)

        # Also add all unique departments from the global list
        for dept_name in self.extraction_data.get('departments', []):
            # Assign to a default organization if none exists
            found = False
            for org_name, depts in org_departments.items():
                if dept_name in depts:
                    found = True
                    break
            if not found:
                # Find first organization or create default
                first_org = next(iter(org_departments.keys()), None)
                if first_org:
                    org_departments[first_org].add(dept_name)

        # Generate department records
        for org_name, dept_names in org_departments.items():
            org_id = self.org_map.get(org_name)
            if not org_id:
                logger.warning(f"No organization found for: {org_name}")
                continue

            for dept_name in dept_names:
                dept_id = str(uuid.uuid4())
                dept_code = self._generate_dept_code(dept_name)

                department = {
                    'id': dept_id,
                    'name': dept_name,
                    'code': dept_code,
                    'description': f"{dept_name} department",
                    'organisationId': org_id,
                    'parentId': None,
                    'isActive': True,
                    'createdAt': datetime.now().isoformat(),
                    'updatedAt': datetime.now().isoformat(),
                    'createdBy': None,
                    'updatedBy': None,
                }

                self.departments.append(department)
                self.dept_map[(org_id, dept_name)] = dept_id

        logger.info(f"Generated {len(self.departments)} Department records")

    def process_excel_files_for_contacts(self, excel_dir: Path) -> None:
        """
        Process Excel files to extract full contact details.
        This reads the actual Excel files to get phone, email, address data.
        """
        logger.info("Processing Excel files for contact details...")

        excel_files = list(excel_dir.glob("*.xlsx"))
        for excel_file in excel_files:
            try:
                country = self._detect_country_from_filename(excel_file.name)
                region_id = self.region_map.get(country)

                if not region_id:
                    logger.warning(f"No region found for country: {country}")
                    continue

                excel_data = pd.ExcelFile(excel_file)
                for sheet_name in excel_data.sheet_names:
                    df = pd.read_excel(excel_file, sheet_name=sheet_name)
                    self._extract_contacts_from_df(df, sheet_name, country, region_id, excel_file.name)

            except Exception as e:
                logger.error(f"Error processing {excel_file.name}: {e}")

        logger.info(f"Generated {len(self.contacts)} Contact records")
        logger.info(f"Generated {len(self.contact_channels)} ContactChannel records")

    def _extract_contacts_from_df(self, df: pd.DataFrame, sheet_name: str,
                                  country: str, region_id: str, filename: str) -> None:
        """Extract contacts from a DataFrame."""
        # Find column mappings
        columns = df.columns.tolist()
        col_map = self._analyze_columns(columns)

        name_col = self._find_best_column(col_map['name_columns'], df)
        if not name_col:
            return

        # Determine organization for this sheet
        org_name = self._get_org_for_sheet(sheet_name, country, filename)
        org_id = self.org_map.get(org_name)

        if not org_id:
            logger.warning(f"No organization found for sheet: {sheet_name}")
            return

        for idx, row in df.iterrows():
            if pd.isna(row[name_col]) or str(row[name_col]).strip() == '':
                continue

            name = str(row[name_col]).strip()
            if name.lower() in ['nan', 'tbd', 'to be determined', 'none', '']:
                continue

            contact_id = str(uuid.uuid4())

            # Extract role/title
            role_title = None
            title_col = self._find_best_column(col_map['title_columns'], df)
            if title_col and pd.notna(row[title_col]):
                role_title = str(row[title_col]).strip()

            # Determine department
            department_id = None
            dept_col = self._find_best_column(col_map['department_columns'], df)
            if dept_col and pd.notna(row[dept_col]):
                dept_name = str(row[dept_col]).strip()
                dept_key = (org_id, dept_name)
                if dept_key in self.dept_map:
                    department_id = self.dept_map[dept_key]

            # If no department from column, try to infer from position or sheet
            if not department_id and role_title:
                dept_inferred = self._infer_department_from_position(role_title, sheet_name)
                if dept_inferred:
                    dept_key = (org_id, dept_inferred)
                    if dept_key in self.dept_map:
                        department_id = self.dept_map[dept_key]

            if not department_id:
                # Try sheet name inference
                dept_inferred = self._infer_department_from_sheet(sheet_name)
                if dept_inferred:
                    dept_key = (org_id, dept_inferred)
                    if dept_key in self.dept_map:
                        department_id = self.dept_map[dept_key]

            # Create contact record
            contact = {
                'id': contact_id,
                'fullName': name,
                'roleTitle': role_title,
                'departmentId': department_id,
                'departmentLegacy': None,
                'organisationId': org_id,
                'primaryLocationId': None,
                'ownerId': None,
                'isHeadOfficeBased': False,
                'createdAt': datetime.now().isoformat(),
                'updatedAt': datetime.now().isoformat(),
            }

            self.contacts.append(contact)

            # Extract contact channels
            self._extract_contact_channels(row, col_map, contact_id, df)

    def _extract_contact_channels(self, row: pd.Series, col_map: Dict[str, List[str]],
                                  contact_id: str, df: pd.DataFrame) -> None:
        """Extract phone, email, website, address contact channels."""
        # Phone channels
        for phone_col in col_map['phone_columns']:
            if pd.notna(row[phone_col]):
                phone = str(row[phone_col]).strip()
                if phone and phone.lower() not in ['nan', 'none', '']:
                    self.contact_channels.append({
                        'id': str(uuid.uuid4()),
                        'contactId': contact_id,
                        'channelType': 'phone',
                        'value': phone,
                        'displayValue': phone,
                        'phoneNormalized': None,
                        'createdAt': datetime.now().isoformat(),
                        'updatedAt': datetime.now().isoformat(),
                    })

        # Email channels
        for email_col in col_map['email_columns']:
            if pd.notna(row[email_col]):
                email = str(row[email_col]).strip()
                if email and '@' in email:
                    self.contact_channels.append({
                        'id': str(uuid.uuid4()),
                        'contactId': contact_id,
                        'channelType': 'email',
                        'value': email,
                        'displayValue': email,
                        'phoneNormalized': None,
                        'createdAt': datetime.now().isoformat(),
                        'updatedAt': datetime.now().isoformat(),
                    })

        # Website channels
        for web_col in col_map['website_columns']:
            if pd.notna(row[web_col]):
                website = str(row[web_col]).strip()
                if website and website.lower() not in ['nan', 'none', '']:
                    self.contact_channels.append({
                        'id': str(uuid.uuid4()),
                        'contactId': contact_id,
                        'channelType': 'website',
                        'value': website,
                        'displayValue': website,
                        'phoneNormalized': None,
                        'createdAt': datetime.now().isoformat(),
                        'updatedAt': datetime.now().isoformat(),
                    })

        # Address channels
        for addr_col in col_map['address_columns']:
            if pd.notna(row[addr_col]):
                address = str(row[addr_col]).strip()
                if address and address.lower() not in ['nan', 'none', '']:
                    self.contact_channels.append({
                        'id': str(uuid.uuid4()),
                        'contactId': contact_id,
                        'channelType': 'office_address',
                        'value': address,
                        'displayValue': address,
                        'phoneNormalized': None,
                        'addressLine1': address,
                        'city': None,
                        'state': None,
                        'postalCode': None,
                        'country': None,
                        'createdAt': datetime.now().isoformat(),
                        'updatedAt': datetime.now().isoformat(),
                    })

    def _analyze_columns(self, columns: List[str]) -> Dict[str, List[str]]:
        """Analyze and categorize columns."""
        analysis = {
            'name_columns': [],
            'title_columns': [],
            'department_columns': [],
            'phone_columns': [],
            'email_columns': [],
            'website_columns': [],
            'address_columns': [],
            'city_columns': [],
        }

        for col in columns:
            col_lower = col.lower()
            if any(keyword in col_lower for keyword in ['name', 'full name', 'contact', 'person', 'official']):
                analysis['name_columns'].append(col)
            elif any(keyword in col_lower for keyword in ['title', 'role', 'position', 'job']):
                analysis['title_columns'].append(col)
            elif any(keyword in col_lower for keyword in ['department', 'ministry', 'division', 'agency']):
                analysis['department_columns'].append(col)
            elif any(keyword in col_lower for keyword in ['phone', 'telephone', 'tel', 'mobile']):
                analysis['phone_columns'].append(col)
            elif 'email' in col_lower:
                analysis['email_columns'].append(col)
            elif any(keyword in col_lower for keyword in ['website', 'web', 'url', 'link']):
                analysis['website_columns'].append(col)
            elif any(keyword in col_lower for keyword in ['address', 'location', 'office']):
                analysis['address_columns'].append(col)
            elif 'city' in col_lower:
                analysis['city_columns'].append(col)

        return analysis

    def _find_best_column(self, columns: List[str], df: pd.DataFrame) -> str:
        """Find the best column from a list of candidates."""
        if not columns:
            return None

        best_col = None
        max_non_null = 0

        for col in columns:
            non_null_count = df[col].notna().sum()
            if non_null_count > max_non_null:
                max_non_null = non_null_count
                best_col = col

        return best_col

    def _extract_country_from_org_name(self, org_name: str) -> str:
        """Extract country name from organization name."""
        # First, check if we have a mapping from file details
        if org_name in self.org_country_map:
            return self.org_country_map[org_name]

        # Try to find country name directly in org name
        for country in COUNTRY_CODES.keys():
            if country.lower() in org_name.lower():
                return country

        # For malformed org names (starting with " - "), try to infer from known patterns
        if org_name.startswith(' - '):
            # Known parliamentary/government terms that map to countries
            country_indicators = {
                'bundestag': 'Germany',
                'bundesrat': 'Germany',
                'shura council': 'Saudi Arabia',
                'diet': 'Japan',
                'duma': 'Russia',
                'grand national assembly': 'Turkey',
                'knesset': 'Israel',
                'national assembly': 'France',  # Also others, but France is common
                'folketing': 'Denmark',
                'riksdag': 'Sweden',
                'storting': 'Norway',
                'eduskunta': 'Finland',
                'saeima': 'Latvia',
                'seimas': 'Lithuania',
                'parliament': 'International',  # Generic, could be any country
                'congress': 'United States',  # Most likely
                'senate': 'United States',  # Most likely
                'cabinet': 'International',  # Generic
                'government': 'International',  # Generic
            }

            org_lower = org_name.lower()
            for indicator, country in country_indicators.items():
                if indicator in org_lower:
                    return country

        return 'International'

    def _determine_org_type(self, org_name: str) -> str:
        """Determine organization type from name."""
        name_lower = org_name.lower()
        if any(keyword in name_lower for keyword in ['diplomatic', 'embassy', 'consulate', 'mission']):
            return 'diplomatic_mission'
        elif any(keyword in name_lower for keyword in ['union', 'european', 'african', 'international']):
            return 'international_organization'
        return 'government'

    def _generate_dept_code(self, dept_name: str) -> str:
        """Generate a department code from name."""
        # Simple abbreviation: first 3 letters uppercase, or custom mapping
        code_map = {
            'Senate': 'SEN',
            'House of Representatives': 'HOUSE',
            'Executive Office': 'EXEC',
            'Parliament': 'PARL',
            'Foreign Affairs': 'FA',
            'Defense': 'DEF',
            'Finance': 'FIN',
            'Health': 'HLTH',
            'Justice': 'JUST',
            'Interior': 'INT',
            'Commerce': 'COMM',
            'Education': 'EDU',
            'Energy': 'ENGY',
            'Environment': 'ENV',
            'Transportation': 'TRANS',
            'Labor': 'LABOR',
            'Agriculture': 'AGRI',
            'Trade': 'TRADE',
            'Industry': 'IND',
            'Politburo': 'POLIT',
            'Standing Committee': 'STND',
            'Central Committee': 'CNTRL',
            'Commission': 'COMM',
            'Executive Leadership': 'EXEC-L',
            'Diplomatic Service': 'DIPLO',
        }
        return code_map.get(dept_name, dept_name[:3].upper())

    def _get_org_for_sheet(self, sheet_name: str, country: str, filename: str) -> str:
        """Get organization name for a sheet."""
        # Try to find existing org that matches sheet name
        for org_name in self.org_map.keys():
            # Check if sheet name is contained in org name (case-insensitive)
            if sheet_name.lower() in org_name.lower() and country.lower() in org_name.lower():
                return org_name
            # Check if org name ends with the sheet name
            if org_name.lower().endswith(sheet_name.lower()):
                return org_name

        # Try to find org by country and check if sheet matches org suffix
        for org_name in self.org_map.keys():
            if country.lower() in org_name.lower():
                # Check if this org has the right suffix for the sheet
                org_suffix = org_name.split(' - ')[-1] if ' - ' in org_name else org_name
                if sheet_name.lower() == org_suffix.lower():
                    return org_name

        # Create org name from sheet/country
        if sheet_name and sheet_name.lower() not in ['sheet1', 'sheet2', 'sheet3', 'contact methods']:
            return f"{country} - {sheet_name}"

        # Fallback: use filename to create org name
        clean_name = filename.replace('.xlsx', '').replace('Directory', '').replace('Contact', '')
        clean_name = clean_name.replace('Leadership', '').replace('Officials', '').replace('Government', '')
        clean_name = clean_name.replace('Parliament', '').replace('Senate', '').replace('Congress', '')

        for cn in COUNTRY_CODES.keys():
            clean_name = clean_name.replace(cn, '').strip()

        if clean_name:
            return f"{country} - {clean_name.strip()}"

        return f"{country} Government"

    def _infer_department_from_position(self, position: str, sheet_name: str) -> str:
        """Infer department from position/title."""
        position_lower = position.lower()

        patterns = {
            'senator': 'Senate',
            'senate': 'Senate',
            'representative': 'House of Representatives',
            'congressman': 'House of Representatives',
            'congresswoman': 'House of Representatives',
            'president': 'Executive Office',
            'vice president': 'Executive Office',
            'prime minister': 'Executive Office',
            'premier': 'Executive Office',
            'chancellor': 'Executive Office',
            'member of parliament': 'Parliament',
            'parliament': 'Parliament',
        }

        for pattern, dept in patterns.items():
            if pattern in position_lower:
                return dept

        return self._infer_department_from_sheet(sheet_name)

    def _infer_department_from_sheet(self, sheet_name: str) -> str:
        """Infer department from sheet name."""
        sheet_lower = sheet_name.lower()

        patterns = {
            'senator': 'Senate',
            'senate': 'Senate',
            'representative': 'House of Representatives',
            'congress': 'Congress',
            'parliament': 'Parliament',
            'president': 'Executive Office',
            'prime minister': 'Executive Office',
            'premier': 'Executive Office',
            'politburo': 'Politburo',
        }

        for pattern, dept in patterns.items():
            if pattern in sheet_lower:
                return dept

        return None

    def _detect_country_from_filename(self, filename: str) -> str:
        """Detect country from filename."""
        filename_patterns = {
            'US Government Officials.xlsx': 'United States',
            'UK Parliament Contact Directory.xlsx': 'United Kingdom',
            'Australian Parliament Contact Directory.xlsx': 'Australia',
            'Canada Parliament Contact Directory.xlsx': 'Canada',
            'German Government Officials.xlsx': 'Germany',
            'France Parliament Contact Directory.xlsx': 'France',
            'Italian Government Officials Directory.xlsx': 'Italy',
            'Japanese Government Officials Directory.xlsx': 'Japan',
            'China Parliament Contact Directory.xlsx': 'China',
            'India Parliament Contact Directory.xlsx': 'India',
            'Brazilian Government Officials Directory.xlsx': 'Brazil',
            'Mexican Government Officials Directory.xlsx': 'Mexico',
            'Russian Government Officials Directory.xlsx': 'Russia',
            'Turkish Government Officials Directory.xlsx': 'Turkey',
            'Saudi Arabian Government Officials Directory.xlsx': 'Saudi Arabia',
            'South Korean Government Officials Directory.xlsx': 'South Korea',
            'Indonesian Government Officials Directory.xlsx': 'Indonesia',
            'Argentine Government Officials Directory.xlsx': 'Argentina',
            'South African Government Officials Directory.xlsx': 'South Africa',
            'Diplomatic Missions To New Zealand.xlsx': 'New Zealand',
            'African Union Leadership Directory.xlsx': 'African Union',
            'European Union Leadership Directory.xlsx': 'European Union',
            'Government Leaders Contact Database.xlsx': 'International',
        }

        return filename_patterns.get(filename, 'International')

    def write_seed_files(self, output_dir: Path) -> None:
        """Write seed data to JSON files."""
        logger.info(f"Writing seed files to {output_dir}...")

        output_dir.mkdir(parents=True, exist_ok=True)

        # Write regions
        regions_file = output_dir / 'regions.json'
        with open(regions_file, 'w') as f:
            json.dump(self.regions, f, indent=2)
        logger.info(f"  Wrote {len(self.regions)} regions to {regions_file}")

        # Write organisations
        orgs_file = output_dir / 'organisations.json'
        with open(orgs_file, 'w') as f:
            json.dump(self.organisations, f, indent=2)
        logger.info(f"  Wrote {len(self.organisations)} organisations to {orgs_file}")

        # Write departments
        depts_file = output_dir / 'departments.json'
        with open(depts_file, 'w') as f:
            json.dump(self.departments, f, indent=2)
        logger.info(f"  Wrote {len(self.departments)} departments to {depts_file}")

        # Write contacts
        contacts_file = output_dir / 'contacts.json'
        with open(contacts_file, 'w') as f:
            json.dump(self.contacts, f, indent=2)
        logger.info(f"  Wrote {len(self.contacts)} contacts to {contacts_file}")

        # Write contact channels
        channels_file = output_dir / 'contact_channels.json'
        with open(channels_file, 'w') as f:
            json.dump(self.contact_channels, f, indent=2)
        logger.info(f"  Wrote {len(self.contact_channels)} contact channels to {channels_file}")

        # Write summary
        summary = {
            'regions': len(self.regions),
            'organisations': len(self.organisations),
            'departments': len(self.departments),
            'contacts': len(self.contacts),
            'contact_channels': len(self.contact_channels),
        }
        summary_file = output_dir / 'seed_summary.json'
        with open(summary_file, 'w') as f:
            json.dump(summary, f, indent=2)
        logger.info(f"  Wrote summary to {summary_file}")


def parse_arguments() -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description="Generate Prisma seed files from Excel extraction data",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--extraction", "-e", required=True,
                       help="Path to extraction_report.json")
    parser.add_argument("--excel-dir", "-i", required=True,
                       help="Directory containing Excel files")
    parser.add_argument("--output", "-o", default="./prisma/seeds",
                       help="Output directory for seed files (default: ./prisma/seeds)")

    return parser.parse_args()


def main() -> int:
    """Main script execution."""
    args = parse_arguments()

    extraction_file = Path(args.extraction)
    excel_dir = Path(args.excel_dir)
    output_dir = Path(args.output)

    if not extraction_file.exists():
        logger.error(f"Extraction file not found: {extraction_file}")
        return 1

    if not excel_dir.exists():
        logger.error(f"Excel directory not found: {excel_dir}")
        return 1

    generator = SeedGenerator(extraction_file)
    generator.load_extraction_data()
    generator.generate_regions()
    generator.generate_organisations()
    generator.generate_departments()
    generator.process_excel_files_for_contacts(excel_dir)
    generator.write_seed_files(output_dir)

    logger.info("Seed generation complete!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
