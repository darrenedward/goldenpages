#!/usr/bin/env python3
"""
Generate SQL INSERT statements from JSON seed files.
"""
import json
import os

def escape_sql(value):
    """Escape SQL string values."""
    if value is None:
        return 'NULL'
    if isinstance(value, bool):
        return 'TRUE' if value else 'FALSE'
    if isinstance(value, (int, float)):
        return str(value)
    # Escape single quotes and backslashes
    escaped = str(value).replace("\\", "\\\\").replace("'", "''")
    return f"'{escaped}'"

def generate_insert_sql(table_name, data, columns):
    """Generate INSERT SQL statements."""
    sql_lines = []
    # Quote column names to preserve case
    quoted_columns = [f'"{col}"' for col in columns]
    sql_lines.append(f"-- Seed data for {table_name}")
    sql_lines.append(f"INSERT INTO {table_name} ({', '.join(quoted_columns)}) VALUES")

    values_list = []
    for row in data:
        values = []
        for col in columns:
            val = row.get(col)
            # Handle snake_case to camelCase conversion
            if val is None:
                # Try alternative naming
                snake_col = col
                camel_col = ''.join(word.capitalize() for word in col.split('_'))
                camel_col = camel_col[0].lower() + camel_col[1:] if camel_col else col
                val = row.get(camel_col)
            values.append(escape_sql(val))
        values_list.append(f"  ({', '.join(values)})")

    sql_lines.append(',\n'.join(values_list) + ';')
    sql_lines.append('')
    return '\n'.join(sql_lines)

# Generate SQL for each table
with open('prisma/seeds/regions.json', 'r') as f:
    regions = json.load(f)
    columns = ['id', 'name', 'code', 'regionType', 'parentRegionId', 'createdAt', 'updatedAt']
    sql = generate_insert_sql('regions', regions, columns)
    with open('prisma/seeds/01_regions.sql', 'w') as f:
        f.write(sql)
    print(f"Generated 01_regions.sql with {len(regions)} rows")

with open('prisma/seeds/organisations.json', 'r') as f:
    orgs = json.load(f)
    columns = ['id', 'name', 'type', 'headOfficeCountryId', 'headOfficeCity', 'headOfficeAddress', 'headOfficePhone', 'headOfficeEmail', 'headOfficeWebsite', 'description', 'ownerId', 'createdAt', 'updatedAt']
    sql = generate_insert_sql('organisations', orgs, columns)
    with open('prisma/seeds/02_organisations.sql', 'w') as f:
        f.write(sql)
    print(f"Generated 02_organisations.sql with {len(orgs)} rows")

with open('prisma/seeds/departments.json', 'r') as f:
    depts = json.load(f)
    columns = ['id', 'name', 'code', 'description', 'organisationId', 'parentId', 'isActive', 'createdAt', 'updatedAt', 'createdBy', 'updatedBy']
    sql = generate_insert_sql('departments', depts, columns)
    with open('prisma/seeds/03_departments.sql', 'w') as f:
        f.write(sql)
    print(f"Generated 03_departments.sql with {len(depts)} rows")

# Also do contacts and contact_channels
with open('prisma/seeds/contacts.json', 'r') as f:
    contacts = json.load(f)
    columns = ['id', 'fullName', 'roleTitle', 'departmentId', 'department_legacy', 'organisationId', 'primaryLocationId', 'ownerId', 'isHeadOfficeBased', 'createdAt', 'updatedAt']
    sql = generate_insert_sql('contacts', contacts, columns)
    with open('prisma/seeds/04_contacts.sql', 'w') as f:
        f.write(sql)
    print(f"Generated 04_contacts.sql with {len(contacts)} rows")

with open('prisma/seeds/contact_channels.json', 'r') as f:
    channels = json.load(f)
    columns = ['id', 'contactId', 'channelType', 'value', 'displayValue', 'phoneNormalized', 'addressLine1', 'city', 'state', 'postalCode', 'country', 'createdAt', 'updatedAt']
    sql = generate_insert_sql('contact_channels', channels, columns)
    with open('prisma/seeds/05_contact_channels.sql', 'w') as f:
        f.write(sql)
    print(f"Generated 05_contact_channels.sql with {len(channels)} rows")

print("\nSQL files generated in prisma/seeds/")
print("Run them in order: 01, 02, 03, 04, 05")