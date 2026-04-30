import { test, expect } from '@playwright/test';
import { ROUTES, TEST_USERS } from '../../helpers/test-data';

test.describe('Auth Guard', () => {
  test('unauthenticated visit to dashboard redirects away', async ({ page }) => {
    await page.goto(ROUTES.dashboard);
    // Should redirect to either / or /login — both mean auth guard works
    await page.waitForURL(/\/(login|$)/, { timeout: 10000 });
    const url = page.url();
    expect(url).not.toContain('/dashboard');
  });

  test('after login, lands on dashboard', async ({ page }) => {
    // Go directly to login page
    await page.goto('/login');
    await page.waitForLoadState('networkidle');

    // Login
    await page.getByLabel(/email/i).fill(TEST_USERS.admin.email);
    await page.getByLabel(/password/i).fill(TEST_USERS.admin.password);
    await page.getByRole('button', { name: /sign in/i }).click();

    // Should redirect to dashboard
    await page.waitForURL('**/dashboard', { timeout: 15000 });
    await expect(page.locator('aside')).toBeVisible();
  });
});
