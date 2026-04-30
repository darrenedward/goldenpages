import { test as setup, expect } from '@playwright/test';
import { TEST_USERS } from './test-data';

const authFile = (role: string) => `e2e/.auth/${role}.json`;

/**
 * Global setup: authenticate each test user and save storageState.
 * Supabase stores session in localStorage, so storageState captures the full auth session.
 */
for (const [role, credentials] of Object.entries(TEST_USERS)) {
  setup(`authenticate as ${role}`, async ({ page }) => {
    await page.goto('/login');

    // Wait for the page to fully load
    await page.waitForLoadState('networkidle');

    // Fill login form
    await page.getByLabel(/email/i).fill(credentials.email);
    await page.getByLabel(/password/i).fill(credentials.password);

    // Submit
    await page.getByRole('button', { name: /sign in|log in/i }).click();

    // Wait for redirect to dashboard
    await page.waitForURL('**/dashboard', { timeout: 15000 });

    // Verify we're authenticated — sidebar should be visible
    await expect(page.locator('aside')).toBeVisible();

    // Save storage state (includes Supabase session in localStorage)
    await page.context().storageState({ path: authFile(role) });
  });
}
