/**
 * Test data constants for E2E tests.
 * All data referenced here must exist in the dev Supabase project.
 */

export const TEST_USERS = {
  admin: {
    email: 'admin@test.goldenpages',
    password: 'Test1234!',
    role: 'admin' as const,
  },
  editor: {
    email: 'editor@test.goldenpages',
    password: 'Test1234!',
    role: 'editor' as const,
  },
} as const;

export const ROUTES = {
  home: '/',
  login: '/login',
  dashboard: '/dashboard',
  communications: '/communications',
  report: '/report',
  contact: '/contact',
  about: '/about',
  privacy: '/privacy',
  terms: '/terms',
  getInvolved: '/get-involved',
} as const;

export const SIDEBAR_ITEMS = {
  dashboard: 'Dashboard',
  organizations: 'Organizations',
  communications: 'Communications',
  newCommunication: 'New Communication',
  myCommunications: 'My Communications',
  publicRegister: 'Public Register',
  notifications: 'Notifications',
  userManagement: 'User Management',
  issueCategories: 'Issue Categories',
  settings: 'Settings',
} as const;
