# Enhanced Excel to Prisma Business Directory Generator

Complete data preservation solution for converting Excel spreadsheets into a comprehensive Prisma business directory with accurate country, department, and organization mapping.

## 🚀 Features

✅ **100% Data Preservation** - All Excel data is preserved and accurately mapped  
✅ **Comprehensive Country Mapping** - Automatic country detection from filenames  
✅ **Department Classification** - Intelligent department/ministry categorization  
✅ **Organization Hierarchy** - Proper organizational structure mapping  
✅ **Phone Number Normalization** - E.164 format phone number standardization  
✅ **Complete Contact Extraction** - All contact details preserved  
✅ **Enhanced Reporting** - Detailed extraction and validation reports  
✅ **Head Office Support** - Every organization has proper head office details  

## 📋 Requirements

- Python 3.8+
- Dependencies listed in `requirements.txt`

## 🛠️ Installation

```bash
# Install dependencies
pip install -r requirements.txt

# Or install individually
pip install pandas openpyxl phonenumbers pyyaml
```

## 🎯 Quick Start

```bash
# Process all Excel files in current directory
python excel_to_prisma_enhanced.py --input . --output ./output

# With debug logging
python excel_to_prisma_enhanced.py --input . --output ./output --log-level DEBUG

# Dry run to see what would be processed
python excel_to_prisma_enhanced.py --input . --output ./output --dry-run
```

## 📁 Input Files Expected

The script processes these Excel files:
- `US Government Officials.xlsx`
- `UK Parliament Contact Directory.xlsx`
- `Australian Parliament Contact Directory.xlsx`
- `Canada Parliament Contact Directory.xlsx`
- `German Government Officials.xlsx`
- `France Parliament Contact Directory.xlsx`
- `Italian Government Officials Directory.xlsx`
- `Japanese Government Officials Directory.xlsx`
- `China Parliament Contact Directory.xlsx`
- `India Parliament Contact Directory.xlsx`
- `Brazilian Government Officials Directory.xlsx`
- `Mexican Government Officials Directory.xlsx`
- `Russian Government Officials Directory.xlsx`
- `Turkish Government Officials Directory.xlsx`
- `Saudi Arabian Government Officials Directory.xlsx`
- `South Korean Government Officials Directory.xlsx`
- `Indonesian Government Officials Directory.xlsx`
- `Argentine Government Officials Directory.xlsx`
- `South African Government Officials Directory.xlsx`
- `Diplomatic Missions To New Zealand.xlsx`
- `African Union Leadership Directory.xlsx`
- `European Union Leadership Directory.xlsx`
- `Government Leaders Contact Database.xlsx`

## 📊 Output Structure

```
output/
├── extraction_report.json          # Comprehensive extraction report
├── excel_to_prisma_enhanced.log    # Processing log
└── seeds/
    ├── 001_regions.sql             # Countries and regions
    ├── 002_organisations.sql       # Organizations with head offices
    ├── 004_contacts.sql            # All contacts
    └── 005_contact_channels.sql    # Phone, email, website, address data
```

## 🗺️ Data Structure

### Regions
- Countries with ISO codes
- Geographic hierarchy support

### Organizations  
- Government bodies, diplomatic missions, international organizations
- Head office details (address, phone, email, website)
- Organization type classification

### Contacts
- Individual people within organizations
- Role titles and departments
- Location assignments

### Contact Channels
- Multiple phone numbers (normalized to E.164)
- Email addresses
- Websites
- Office addresses

## 📈 Extraction Report

The script generates a comprehensive `extraction_report.json` with:

```json
{
  "summary": {
    "total_files_processed": 23,
    "total_contacts_extracted": 1500,
    "total_countries_found": 25,
    "total_departments_found": 50,
    "total_organizations_found": 100,
    "total_errors": 0
  },
  "countries": ["United States", "United Kingdom", "Australia", ...],
  "departments": ["Executive Office", "Foreign Affairs", "Defense", ...],
  "organizations": ["US Government", "UK Parliament", ...],
  "file_details": [...]
}
```

## 🔍 Data Processing Features

### Country Detection
- Filename pattern matching
- Content analysis
- ISO code mapping
- Special entity handling (EU, AU, etc.)

### Department Classification
- Executive offices (President, Prime Minister)
- Ministries (Foreign Affairs, Defense, Health, etc.)
- Legislative bodies (Parliament, Senate, Congress)
- Diplomatic services (Embassy, Consulate, Mission)

### Organization Types
- `government` - National and sub-national government bodies
- `diplomatic_mission` - Embassies, consulates, diplomatic missions
- `international_organization` - EU, AU, UN, etc.

### Phone Number Processing
- International format normalization
- E.164 standard formatting
- Display format preservation
- Invalid number handling

## 🐛 Troubleshooting

### Common Issues

1. **Missing Excel files**
   ```
   FileNotFoundError: Input directory not found
   ```
   - Ensure the input directory path is correct
   - Check that Excel files have .xlsx extension

2. **Missing dependencies**
   ```
   ModuleNotFoundError: No module named 'pandas'
   ```
   - Install dependencies: `pip install -r requirements.txt`

3. **Permission errors**
   ```
   PermissionError: [Errno 13] Permission denied
   ```
   - Check write permissions for output directory
   - Run with appropriate permissions

4. **Empty Excel files**
   ```
   Warning: No valid contacts found in...
   ```
   - Check Excel file content
   - Ensure data is in expected format

### Debug Mode

Enable debug logging for detailed processing information:

```bash
python excel_to_prisma_enhanced.py --input . --output ./output --log-level DEBUG
```

### Validation

After processing, review the `extraction_report.json` to verify:

- All expected files were processed
- Contact counts match expectations
- Countries, departments, and organizations are correctly identified
- No extraction errors

## 📝 Data Mapping Examples

### Government Officials
```
File: US Government Officials.xlsx
Country: United States (US)
Organization: US Government - President
Contact: Donald J. Trump
Role: President
Department: Executive Office
Phone: +12024561111
```

### Diplomatic Missions
```
File: Diplomatic Missions To New Zealand.xlsx
Country: New Zealand (NZ)
Organization: US Embassy
Contact: Ambassador Name
Role: Ambassador
Department: Diplomatic Service
Address: 33 Fitzherbert Terrace, Wellington
```

### International Organizations
```
File: African Union Leadership Directory.xlsx
Country: African Union (AU)
Organization: African Union - Office of the Chairperson
Contact: Mahmoud Ali Youssouf
Role: Chairperson
Department: Executive Leadership
```

## 🔧 Customization

### Adding New Countries
Edit `CountryMappingManager` in the script to add new country mappings:

```python
self.country_mappings['New Country'] = {'code': 'NC', 'region': 'Region'}
```

### Adding Department Patterns
Edit `DepartmentClassifier` to add new department patterns:

```python
self.department_patterns['new_pattern'] = 'New Department Type'
```

### Custom File Patterns
Add new filename patterns in `CountryMappingManager.filename_patterns`.

## 📞 Support

For issues or questions:

1. Check the extraction report for processing details
2. Review the log file for error messages  
3. Verify Excel file format and content
4. Ensure all dependencies are installed

## 📄 License

MIT License - Generated with Claude Code
