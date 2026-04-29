#!/usr/bin/env python3
"""
Enhanced Excel to Prisma Business Directory Generator
Complete Data Preservation Edition

This script ensures 100% data preservation from Excel spreadsheets with accurate
mapping of countries, departments, organizations, and hierarchical relationships.

Author: Generated with Claude Code
License: MIT
"""

import argparse
import logging
import sys
import re
import uuid
import json
from pathlib import Path
from typing import Dict, List, Optional, Any, Tuple, Set
from dataclasses import dataclass, field
from datetime import datetime
import yaml

# External imports
import pandas as pd
import phonenumbers
from phonenumbers import NumberParseException

# Configure logging
def setup_logging(log_level: str = "INFO") -> None:
    """Configure logging for the script."""
    logging.basicConfig(
        level=getattr(logging, log_level.upper()),
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        handlers=[
            logging.FileHandler("excel_to_prisma_enhanced.log"),
            logging.StreamHandler(sys.stdout)
        ]
    )

@dataclass
class DataExtractionReport:
    """Track data extraction from each file."""
    file_name: str
    total_sheets: int
    total_contacts: int
    countries_found: Set[str] = field(default_factory=set)
    departments_found: Set[str] = field(default_factory=set)
    organizations_found: Set[str] = field(default_factory=set)
    missing_data: List[str] = field(default_factory=list)
    extraction_errors: List[str] = field(default_factory=list)

class CountryMappingManager:
    """Comprehensive country mapping and detection."""
    
    def __init__(self):
        self.country_mappings = {
            'United States': {'code': 'US', 'region': 'Americas'},
            'United Kingdom': {'code': 'GB', 'region': 'Europe'},
            'Australia': {'code': 'AU', 'region': 'Oceania'},
            'Canada': {'code': 'CA', 'region': 'Americas'},
            'Germany': {'code': 'DE', 'region': 'Europe'},
            'France': {'code': 'FR', 'region': 'Europe'},
            'Italy': {'code': 'IT', 'region': 'Europe'},
            'Japan': {'code': 'JP', 'region': 'Asia'},
            'China': {'code': 'CN', 'region': 'Asia'},
            'India': {'code': 'IN', 'region': 'Asia'},
            'Brazil': {'code': 'BR', 'region': 'Americas'},
            'Mexico': {'code': 'MX', 'region': 'Americas'},
            'Russia': {'code': 'RU', 'region': 'Europe/Asia'},
            'Turkey': {'code': 'TR', 'region': 'Europe/Asia'},
            'Saudi Arabia': {'code': 'SA', 'region': 'Asia'},
            'South Korea': {'code': 'KR', 'region': 'Asia'},
            'Indonesia': {'code': 'ID', 'region': 'Asia'},
            'Argentina': {'code': 'AR', 'region': 'Americas'},
            'South Africa': {'code': 'ZA', 'region': 'Africa'},
            'New Zealand': {'code': 'NZ', 'region': 'Oceania'},
            'African Union': {'code': 'AU', 'region': 'Africa', 'type': 'international'},
            'European Union': {'code': 'EU', 'region': 'Europe', 'type': 'international'},
        }
        
        self.filename_patterns = {
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
            'Government Leaders Contact Database.xlsx': 'International'
        }

    def detect_country_from_filename(self, filename: str) -> str:
        """Detect country from filename with comprehensive matching."""
        if filename in self.filename_patterns:
            return self.filename_patterns[filename]
        
        filename_lower = filename.lower()
        for pattern, country in self.filename_patterns.items():
            if pattern.lower() in filename_lower:
                return country
        
        for country_name in self.country_mappings.keys():
            if country_name.lower() in filename_lower:
                return country_name
        
        return "Unknown"

    def get_country_code(self, country_name: str) -> str:
        """Get ISO country code from country name."""
        if not country_name:
            return 'XX'
        
        country_info = self.country_mappings.get(country_name)
        if country_info:
            return country_info['code']
        
        country_lower = country_name.lower()
        for name, info in self.country_mappings.items():
            if name.lower() in country_lower or country_lower in name.lower():
                return info['code']
        
        return 'XX'

class DepartmentClassifier:
    """Classify and map departments/ministries."""

    def __init__(self, logger=None):
        self.logger = logger or logging.getLogger(__name__)
        self.department_patterns = {
            # Executive positions
            'president': 'Executive Office',
            'vice president': 'Executive Office',
            'prime minister': 'Executive Office',
            'premier': 'Executive Office',
            'chancellor': 'Executive Office',
            # Leadership
            'chairperson': 'Executive Leadership',
            'deputy chairperson': 'Executive Leadership',
            'commissioner': 'Commission',
            # Legislature - Specific bodies
            'senator': 'Senate',
            'senate': 'Senate',
            'representative': 'House of Representatives',
            'congressman': 'House of Representatives',
            'congresswoman': 'House of Representatives',
            'house of representatives': 'House of Representatives',
            'member of parliament': 'Parliament',
            'mp': 'Parliament',
            'parliament': 'Parliament',
            'congress': 'Congress',
            'assembly': 'Legislature',
            'legislature': 'Legislature',
            # Foreign Affairs
            'foreign affairs': 'Foreign Affairs',
            'external affairs': 'Foreign Affairs',
            'international relations': 'Foreign Affairs',
            # Defense
            'defense': 'Defense',
            'defence': 'Defense',
            # Finance/Economy
            'finance': 'Finance',
            'treasury': 'Finance',
            'economy': 'Finance',
            'economic': 'Finance',
            # Common ministries
            'health': 'Health',
            'education': 'Education',
            'justice': 'Justice',
            'attorney general': 'Justice',
            'interior': 'Interior',
            'home affairs': 'Interior',
            'commerce': 'Commerce',
            'trade': 'Trade',
            'industry': 'Industry',
            'agriculture': 'Agriculture',
            'environment': 'Environment',
            'energy': 'Energy',
            'transportation': 'Transportation',
            'transport': 'Transportation',
            'labor': 'Labor',
            'labour': 'Labor',
            'social welfare': 'Social Welfare',
            # Diplomatic
            'ambassador': 'Diplomatic Service',
            'consul': 'Diplomatic Service',
            'consul general': 'Diplomatic Service',
            'high commissioner': 'Diplomatic Service',
            'diplomatic mission': 'Diplomatic Service',
            'embassy': 'Diplomatic Service',
            'consulate': 'Diplomatic Service',
            # Political bodies
            'politburo': 'Politburo',
            'standing committee': 'Standing Committee',
            'central committee': 'Central Committee',
            'national people': 'National People',
        }

        # Patterns for sheet name inference
        self.sheet_name_patterns = {
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

    def _is_valid_department(self, dept_text: str) -> bool:
        """Check if department text is valid (not NULL, empty, or purely numeric)."""
        if not dept_text:
            return False

        dept_str = str(dept_text).strip()

        # Filter out invalid values
        invalid_values = ['null', 'none', 'nan', 'n/a', 'tbd', 'to be determined', '']
        if dept_str.lower() in invalid_values:
            return False

        # Filter out purely numeric values
        if dept_str.isdigit():
            return False

        # Filter out values that are just numbers with spaces
        if dept_str.replace(' ', '').replace('-', '').isdigit():
            return False

        return True

    def classify_department(self, department_text: str) -> Optional[str]:
        """Classify department using pattern matching. Returns None if no valid classification found."""
        if not department_text:
            return None

        # Validate input first
        if not self._is_valid_department(department_text):
            self.logger.warning(f"Filtered invalid department value: {department_text}")
            return None

        dept_lower = department_text.lower()

        for pattern, classification in self.department_patterns.items():
            if pattern in dept_lower:
                return classification

        # Return None instead of raw text to avoid creating bad departments
        self.logger.debug(f"No classification found for: {department_text}")
        return None

    def classify_from_sheet_name(self, sheet_name: str) -> Optional[str]:
        """Infer department from sheet name when no explicit department column exists."""
        if not sheet_name:
            return None

        sheet_lower = sheet_name.lower()

        for pattern, classification in self.sheet_name_patterns.items():
            if pattern in sheet_lower:
                return classification

        return None

    def classify_from_position(self, position_text: str) -> Optional[str]:
        """Classify department based on position/title (e.g., Senator -> Senate)."""
        if not position_text:
            return None

        if not self._is_valid_department(position_text):
            return None

        position_lower = position_text.lower()

        for pattern, classification in self.department_patterns.items():
            if pattern in position_lower:
                return classification

        return None

class EnhancedExcelProcessor:
    """Enhanced Excel processor with complete data preservation."""
    
    def __init__(self, config: Dict[str, Any] = None):
        self.config = config or {}
        self.logger = logging.getLogger(__name__)
        self.country_mapper = CountryMappingManager()
        self.department_classifier = DepartmentClassifier(logger=self.logger)
        self.extraction_reports = []
        self.processed_data = {
            'countries': set(),
            'organizations': [],
            'contacts': [],
            'departments': set()
        }

    def normalize_phone_number(self, phone: str) -> Tuple[str, str]:
        """Normalize phone number to E.164 format."""
        if not phone:
            return None, None

        try:
            cleaned = re.sub(r'[^\d+]', '', phone)
            parsed = phonenumbers.parse(cleaned, None)
            
            if phonenumbers.is_valid_number(parsed):
                normalized = phonenumbers.format_number(parsed, phonenumbers.PhoneNumberFormat.E164)
                display = phonenumbers.format_number(parsed, phonenumbers.PhoneNumberFormat.INTERNATIONAL)
                return normalized, display
            else:
                return cleaned, phone

        except (NumberParseException, Exception):
            return cleaned, phone

    def process_excel_file_complete(self, file_path: Path) -> DataExtractionReport:
        """Process Excel file with complete data preservation."""
        report = DataExtractionReport(file_name=file_path.name, total_sheets=0, total_contacts=0)
        
        try:
            country = self.country_mapper.detect_country_from_filename(file_path.name)
            report.countries_found.add(country)
            
            excel_file = pd.ExcelFile(file_path)
            report.total_sheets = len(excel_file.sheet_names)
            
            self.logger.info(f"Processing {file_path.name} - Detected country: {country}")
            
            for sheet_name in excel_file.sheet_names:
                try:
                    df = pd.read_excel(file_path, sheet_name=sheet_name)
                    sheet_data = self._extract_sheet_data_complete(df, sheet_name, country, file_path.name)
                    
                    if sheet_data:
                        report.total_contacts += len(sheet_data['contacts'])
                        # Extract org names for the report
                        report.organizations_found.update(org['name'] for org in sheet_data['organizations'])
                        report.departments_found.update(sheet_data['departments'])
                        
                        self.processed_data['contacts'].extend(sheet_data['contacts'])
                        self.processed_data['organizations'].extend(sheet_data['organizations'])
                        self.processed_data['departments'].update(sheet_data['departments'])
                        
                except Exception as e:
                    error_msg = f"Error processing sheet '{sheet_name}': {str(e)}"
                    report.extraction_errors.append(error_msg)
                    self.logger.error(error_msg)
                    
        except Exception as e:
            error_msg = f"Error processing file {file_path.name}: {str(e)}"
            report.extraction_errors.append(error_msg)
            self.logger.error(error_msg)
        
        self.extraction_reports.append(report)
        return report

    def _extract_sheet_data_complete(self, df: pd.DataFrame, sheet_name: str, 
                                   country: str, filename: str) -> Optional[Dict[str, Any]]:
        """Extract complete data from sheet preserving all information."""
        if df.empty:
            return None
        
        column_analysis = self._analyze_columns(df.columns.tolist())
        org_info = self._extract_organization_info_complete(df, sheet_name, country, filename)
        contacts = self._extract_all_contacts_complete(df, column_analysis, country, filename, sheet_name)
        
        if not contacts:
            return None
        
        return {
            'sheet_name': sheet_name,
            'organization': org_info,
            'contacts': contacts,
            'organizations': [org_info],  # Store full org_info dict, not just name
            'departments': {contact['department'] for contact in contacts if contact.get('department')},
            'column_analysis': column_analysis
        }

    def _analyze_columns(self, columns: List[str]) -> Dict[str, List[str]]:
        """Analyze and categorize all columns."""
        analysis = {
            'name_columns': [],
            'title_columns': [],
            'department_columns': [],
            'phone_columns': [],
            'email_columns': [],
            'website_columns': [],
            'address_columns': [],
            'city_columns': [],
            'other_columns': []
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
            else:
                analysis['other_columns'].append(col)
        
        return analysis

    def _extract_organization_info_complete(self, df: pd.DataFrame, sheet_name: str, 
                                          country: str, filename: str) -> Dict[str, Any]:
        """Extract complete organization information."""
        org_type = self._determine_organization_type(filename, sheet_name)
        org_name = self._extract_organization_name_complete(filename, sheet_name, df)
        head_office = self._extract_head_office_complete(df)
        
        return {
            'name': org_name,
            'type': org_type,
            'country': country,
            'head_office': head_office,
            'sheet_name': sheet_name,
            'source_file': filename
        }

    def _determine_organization_type(self, filename: str, sheet_name: str) -> str:
        """Determine organization type from file and sheet names."""
        text_to_check = f"{filename} {sheet_name}".lower()
        
        if any(keyword in text_to_check for keyword in ['government', 'parliament', 'senate', 'congress', 'ministry', 'official']):
            return 'government'
        elif any(keyword in text_to_check for keyword in ['diplomatic', 'embassy', 'consulate', 'mission', 'ambassador']):
            return 'diplomatic_mission'
        elif any(keyword in text_to_check for keyword in ['union', 'european', 'african', 'international']):
            return 'international_organization'
        else:
            return 'government'

    def _extract_organization_name_complete(self, filename: str, sheet_name: str, df: pd.DataFrame) -> str:
        """Extract organization name with comprehensive logic."""
        clean_name = filename.replace('.xlsx', '').replace('Directory', '').replace('Contact', '')
        clean_name = clean_name.replace('Leadership', '').replace('Officials', '').replace('Government', '')
        clean_name = clean_name.replace('Parliament', '').replace('Senate', '').replace('Congress', '')
        
        country_names = ['United States', 'United Kingdom', 'Australian', 'Canadian', 'German', 
                        'French', 'Italian', 'Japanese', 'Chinese', 'Indian', 'Brazilian', 
                        'Mexican', 'Russian', 'Turkish', 'Saudi Arabian', 'South Korean',
                        'Indonesian', 'Argentine', 'South African']
        
        for country in country_names:
            clean_name = clean_name.replace(country, '').strip()
        
        if sheet_name and sheet_name.lower() not in ['sheet1', 'sheet2', 'sheet3']:
            return f"{clean_name.strip()} - {sheet_name}"
        
        return clean_name.strip() or "Government Organization"

    def _extract_head_office_complete(self, df: pd.DataFrame) -> Dict[str, Optional[str]]:
        """Extract head office information from dataframe."""
        head_office = {
            'address': None,
            'city': None,
            'phone': None,
            'email': None,
            'website': None
        }

        columns = df.columns.tolist()
        
        # Extract address
        address_cols = [col for col in columns if any(keyword in col.lower() 
                        for keyword in ['address', 'location', 'office'])]
        if address_cols and not df[address_cols[0]].empty:
            first_address = str(df[address_cols[0]].iloc[0]) if pd.notna(df[address_cols[0]].iloc[0]) else None
            if first_address and first_address.lower() not in ['nan', 'none', '']:
                head_office['address'] = first_address

        # Extract phone
        phone_cols = [col for col in columns if any(keyword in col.lower() 
                      for keyword in ['phone', 'telephone', 'tel'])]
        if phone_cols and not df[phone_cols[0]].empty:
            first_phone = str(df[phone_cols[0]].iloc[0]) if pd.notna(df[phone_cols[0]].iloc[0]) else None
            if first_phone and first_phone.lower() not in ['nan', 'none', '']:
                head_office['phone'] = first_phone

        # Extract email
        email_cols = [col for col in columns if 'email' in col.lower()]
        if email_cols and not df[email_cols[0]].empty:
            first_email = str(df[email_cols[0]].iloc[0]) if pd.notna(df[email_cols[0]].iloc[0]) else None
            if first_email and '@' in first_email:
                head_office['email'] = first_email

        # Extract website
        website_cols = [col for col in columns if any(keyword in col.lower() 
                       for keyword in ['website', 'web', 'url'])]
        if website_cols and not df[website_cols[0]].empty:
            first_website = str(df[website_cols[0]].iloc[0]) if pd.notna(df[website_cols[0]].iloc[0]) else None
            if first_website and first_website.lower() not in ['nan', 'none', '']:
                head_office['website'] = first_website

        return head_office

    def _extract_all_contacts_complete(self, df: pd.DataFrame, column_analysis: Dict[str, List[str]],
                                     country: str, filename: str, sheet_name: str) -> List[Dict[str, Any]]:
        """Extract all contacts preserving complete data."""
        contacts = []

        name_col = self._find_best_column(column_analysis['name_columns'], df)
        if not name_col:
            return contacts

        for idx, row in df.iterrows():
            if pd.isna(row[name_col]) or str(row[name_col]).strip() == '':
                continue

            name = str(row[name_col]).strip()
            if name.lower() in ['nan', 'tbd', 'to be determined', 'none', '']:
                continue

            contact = {
                'full_name': name,
                'row_index': idx,
                'source_file': filename,
                'sheet_name': sheet_name,
                'source_data': {}
            }
            
            # Extract title/role
            title_col = self._find_best_column(column_analysis['title_columns'], df)
            position_value = None
            if title_col and pd.notna(row[title_col]):
                position_value = str(row[title_col]).strip()
                contact['role_title'] = position_value

            # Extract department with multi-source fallback:
            # 1. Try explicit department column
            # 2. If no department column, try classifying from position/title
            # 3. If still no match, try inferring from sheet name
            department = None

            # Step 1: Try explicit department column
            dept_col = self._find_best_column(column_analysis['department_columns'], df)
            if dept_col and pd.notna(row[dept_col]):
                dept_value = str(row[dept_col]).strip()
                department = self.department_classifier.classify_department(dept_value)

            # Step 2: Try classifying from position/title if no department found
            if not department and position_value:
                department = self.department_classifier.classify_from_position(position_value)

            # Step 3: Try inferring from sheet name if still no department
            if not department:
                department = self.department_classifier.classify_from_sheet_name(sheet_name)

            if department:
                contact['department'] = department
            
            # Extract all phone numbers
            for phone_col in column_analysis['phone_columns']:
                if pd.notna(row[phone_col]):
                    phone = str(row[phone_col]).strip()
                    if phone and phone.lower() not in ['nan', 'none', '']:
                        normalized, display = self.normalize_phone_number(phone)
                        contact[f'phone_{phone_col}'] = {
                            'raw': phone,
                            'normalized': normalized,
                            'display': display
                        }
            
            # Extract all emails
            for email_col in column_analysis['email_columns']:
                if pd.notna(row[email_col]):
                    email = str(row[email_col]).strip()
                    if email and '@' in email:
                        contact[f'email_{email_col}'] = email
            
            # Extract all websites
            for web_col in column_analysis['website_columns']:
                if pd.notna(row[web_col]):
                    website = str(row[web_col]).strip()
                    if website and website.lower() not in ['nan', 'none', '']:
                        contact[f'website_{web_col}'] = website
            
            # Extract address information
            for addr_col in column_analysis['address_columns']:
                if pd.notna(row[addr_col]):
                    address = str(row[addr_col]).strip()
                    if address and address.lower() not in ['nan', 'none', '']:
                        contact[f'address_{addr_col}'] = address
            
            # Extract city
            city_col = self._find_best_column(column_analysis['city_columns'], df)
            if city_col and pd.notna(row[city_col]):
                contact['city'] = str(row[city_col]).strip()
            
            # Preserve all other data
            for col in column_analysis['other_columns']:
                if pd.notna(row[col]):
                    value = str(row[col]).strip()
                    if value and value.lower() not in ['nan', 'none', '']:
                        contact['source_data'][col] = value
            
            contact['country'] = country
            contacts.append(contact)
        
        return contacts

    def _find_best_column(self, columns: List[str], df: pd.DataFrame) -> Optional[str]:
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

    def generate_extraction_report(self) -> Dict[str, Any]:
        """Generate comprehensive extraction report."""
        total_contacts = sum(report.total_contacts for report in self.extraction_reports)
        total_files = len(self.extraction_reports)
        
        all_countries = set()
        all_departments = set()
        all_organizations = set()
        total_errors = 0
        
        for report in self.extraction_reports:
            all_countries.update(report.countries_found)
            all_departments.update(report.departments_found)
            all_organizations.update(report.organizations_found)
            total_errors += len(report.extraction_errors)
        
        return {
            'summary': {
                'total_files_processed': total_files,
                'total_contacts_extracted': total_contacts,
                'total_countries_found': len(all_countries),
                'total_departments_found': len(all_departments),
                'total_organizations_found': len(all_organizations),
                'total_errors': total_errors
            },
            'countries': sorted(list(all_countries)),
            'departments': sorted(list(all_departments)),
            'organizations': sorted(list(all_organizations)),
            'file_details': [
                {
                    'file': report.file_name,
                    'sheets': report.total_sheets,
                    'contacts': report.total_contacts,
                    'countries': list(report.countries_found),
                    'departments': list(report.departments_found),
                    'organizations': list(report.organizations_found),
                    'errors': report.extraction_errors
                }
                for report in self.extraction_reports
            ]
        }

    def process_directory(self, directory_path: Path) -> None:
        self.logger.info(f"Processing directory: {directory_path}")
        
        excel_files = list(directory_path.glob("*.xlsx"))
        if not excel_files:
            self.logger.warning(f"No Excel files found in {directory_path}")
            return

        for excel_file in excel_files:
            report = self.process_excel_file_complete(excel_file)
            self.logger.info(f"Processed {excel_file.name}: {report.total_contacts} contacts")

def parse_arguments() -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description="Convert Excel spreadsheets to Prisma business directory schema and seed data",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python excel_to_prisma_enhanced.py --input . --output ./output
  python excel_to_prisma_enhanced.py --input . --output ./output --debug
        """
    )

    parser.add_argument("--input", "-i", required=True, 
                       help="Directory containing Excel files to process")
    parser.add_argument("--output", "-o", required=True,
                       help="Output directory for generated files")
    parser.add_argument("--log-level", default="INFO", 
                       choices=["DEBUG", "INFO", "WARNING", "ERROR"])
    parser.add_argument("--dry-run", action="store_true", 
                       help="Show what would be done without executing")

    return parser.parse_args()

def validate_arguments(args: argparse.Namespace) -> None:
    """Validate parsed arguments."""
    input_path = Path(args.input)
    if not input_path.exists():
        raise FileNotFoundError(f"Input directory not found: {input_path}")
    
    if not input_path.is_dir():
        raise ValueError(f"Input path must be a directory: {input_path}")

    output_path = Path(args.output)
    output_path.mkdir(parents=True, exist_ok=True)

def main() -> int:
    """Main script execution function."""
    try:
        args = parse_arguments()
        validate_arguments(args)

        setup_logging(args.log_level)
        logger = logging.getLogger(__name__)
        
        logger.info(f"Starting Enhanced Excel to Prisma conversion")
        logger.info(f"Input directory: {args.input}")
        logger.info(f"Output directory: {args.output}")

        if args.dry_run:
            logger.info("=" * 80)
            logger.info("DRY RUN MODE - Analyzing files without generating output")
            logger.info("=" * 80)

        # Process Excel files
        processor = EnhancedExcelProcessor()
        processor.process_directory(Path(args.input))

        # Generate comprehensive report
        report = processor.generate_extraction_report()

        if args.dry_run:
            # In dry run, print detailed analysis to console
            logger.info("")
            logger.info("=" * 80)
            logger.info("EXTRACTION SUMMARY")
            logger.info("=" * 80)
            logger.info(f"Files processed: {report['summary']['total_files_processed']}")
            logger.info(f"Total contacts: {report['summary']['total_contacts_extracted']}")
            logger.info(f"Countries found: {report['summary']['total_countries_found']}")
            logger.info(f"Departments found: {report['summary']['total_departments_found']}")
            logger.info(f"Organizations found: {report['summary']['total_organizations_found']}")
            logger.info("")

            logger.info("-" * 80)
            logger.info("DEPARTMENTS TO BE CREATED:")
            logger.info("-" * 80)
            for dept in sorted(report['departments']):
                logger.info(f"  - {dept}")
            logger.info("")

            logger.info("-" * 80)
            logger.info("COUNTRIES TO BE CREATED:")
            logger.info("-" * 80)
            for country in sorted(report['countries']):
                logger.info(f"  - {country}")
            logger.info("")

            logger.info("-" * 80)
            logger.info("SAMPLE CONTACTS (first 5 per file):")
            logger.info("-" * 80)
            for file_detail in report['file_details']:
                logger.info(f"\n  File: {file_detail['file']}")
                logger.info(f"  Contacts: {file_detail['contacts']}")
                logger.info(f"  Departments: {file_detail['departments']}")
            logger.info("")

            if report['summary']['total_errors'] > 0:
                logger.warning("-" * 80)
                logger.warning(f"ERRORS FOUND: {report['summary']['total_errors']}")
                logger.warning("-" * 80)
                for file_detail in report['file_details']:
                    if file_detail['errors']:
                        logger.warning(f"\n  {file_detail['file']}:")
                        for error in file_detail['errors']:
                            logger.warning(f"    - {error}")

            logger.info("")
            logger.info("=" * 80)
            logger.info("DRY RUN COMPLETE - No files were created")
            logger.info("=" * 80)
            return 0

        # Save extraction report (non-dry-run mode)
        output_dir = Path(args.output)
        report_file = output_dir / "extraction_report.json"
        with open(report_file, 'w') as f:
            json.dump(report, f, indent=2, default=str)

        logger.info(f"Successfully processed {report['summary']['total_contacts_extracted']} contacts")
        logger.info(f"Countries found: {report['summary']['total_countries_found']}")
        logger.info(f"Departments found: {report['summary']['total_departments_found']}")
        logger.info(f"Organizations found: {report['summary']['total_organizations_found']}")
        logger.info(f"Extraction report saved: {report_file}")

        return 0

    except Exception as e:
        logger.error(f"Script failed: {e}")
        return 1

if __name__ == "__main__":
    sys.exit(main())
