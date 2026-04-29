# Golden Pages - RBAC Control System

## Philosophy
**Users gain permissions through assigned roles, NOT individually.**  
Access control is enforced at the **Database Level (RLS)** and reflected in the **UI**.

## Permission Format
Permissions follow the pattern: `resource:action`.

| Resource | Actions | Description |
| :--- | :--- | :--- |
| `org` | `read`, `write`, `delete` | Organization records |
| `contact` | `read`, `write`, `archive` | Individual people within orgs |
| `channel` | `read`, `write` | Contact methods (Phone, Email, etc.) |
| `note` | `read`, `write`, `delete` | Internal notes |
| `outreach` | `read`, `initiate` | Logging mail/email campaigns |
| `admin` | `access`, `users`, `audit` | System level controls |

## Role Definitions

### 1. Admin (`role:admin`)
*   **Description**: System superuser.
*   **Permissions**: `*:*` (All permissions).
*   **Capabilities**: Manage users, view audit logs, hard delete records.

### 2. Editor (`role:editor`)
*   **Description**: Operational staff responsible for data quality.
*   **Permissions**:
    *   `org:read`, `org:write`
    *   `contact:read`, `contact:write`, `contact:archive`
    *   `channel:read`, `channel:write`
    *   `note:read`, `note:write`
    *   `outreach:read`, `outreach:initiate`
*   **Restrictions**: Cannot delete Organizations, cannot manage Users.

### 3. User (`role:user`)
*   **Description**: Read-only access for directory browsing.
*   **Permissions**:
    *   `org:read`
    *   `contact:read`
    *   `channel:read`
    *   `note:read` (Only `visibility: public` or `team`)
*   **Restrictions**: No write access.

## Implementation Strategy (Supabase)

### 1. Database Schema
We rely on a `user_roles` table to map `auth.users` to roles.

```sql
-- Conceptual Schema
create table roles (
  id uuid primary key,
  name text unique -- 'admin', 'editor', 'user'
);

create table role_permissions (
  role_id uuid references roles(id),
  permission text -- 'org:write'
);

create table user_roles (
  user_id uuid references auth.users(id),
  role_id uuid references roles(id),
  primary key (user_id, role_id)
);
```

### 2. RLS Policy Pattern
Row Level Security policies must check the user's role.

```sql
-- Example: Organization Write Policy
create policy "Allow editors to update organizations"
on organizations for update
using (
  exists (
    select 1 from user_roles ur
    join roles r on ur.role_id = r.id
    join role_permissions rp on r.id = rp.role_id
    where ur.user_id = auth.uid()
    and rp.permission = 'org:write'
  )
);
```

### 3. Frontend Enforcement
The UI should hide/disable elements based on the loaded permissions.

```typescript
// Pattern for checking permissions in React components
if (!hasPermission('org:write')) {
  return <ReadOnlyView />;
}
return <EditForm />;
```

## Audit Logging
All write operations (`insert`, `update`, `delete`) must be logged to the `activity_logs` table, recording:
*   `user_id`
*   `action` (e.g., `contact:update`)
*   `resource_id`
*   `timestamp`
*   `changes` (JSONB diff)
