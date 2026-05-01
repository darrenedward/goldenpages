/**
 * Dashboard Navigation Utilities
 *
 * Maps old view IDs to URL paths for the new file-based routing.
 * Used by page wrappers to translate component callbacks into router.push() calls.
 */

export function viewToPath(view: string, data?: Record<string, string>): string {
  switch (view) {
    case 'dashboard':
      return '/dashboard';
    case 'organizations':
      return '/dashboard/organizations';
    case 'organization-detail':
      return data?.orgId ? `/dashboard/organizations/${data.orgId}` : '/dashboard/organizations';
    case 'department-contacts':
      if (data?.orgId && data?.deptId) {
        return `/dashboard/organizations/${data.orgId}/departments/${data.deptId}`;
      }
      return '/dashboard/organizations';
    case 'communications':
      return '/dashboard/communications';
    case 'communication-detail':
      return data?.communicationId
        ? `/dashboard/communications/${data.communicationId}`
        : '/dashboard/communications';
    case 'communication-list':
      return '/dashboard/communications';
    case 'create-communication':
      return '/dashboard/communications/new';
    case 'my-communications':
      return '/dashboard/my-communications';
    case 'public-register':
      return '/dashboard/public-register';
    case 'inbound-emails':
      return '/dashboard/inbound-emails';
    case 'notifications':
      return '/dashboard/notifications';
    case 'admin':
      return '/dashboard/admin/users';
    case 'admin-categories':
      return '/dashboard/admin/categories';
    case 'admin-honeypot':
      return '/dashboard/admin/honeypot';
    case 'settings':
      return '/dashboard/settings';
    case 'help':
      return '/dashboard/help';
    default:
      return '/dashboard';
  }
}

/** Check if a sidebar path matches the current pathname */
export function isPathActive(path: string, pathname: string): boolean {
  if (path === '/dashboard') return pathname === '/dashboard';
  return pathname.startsWith(path);
}
