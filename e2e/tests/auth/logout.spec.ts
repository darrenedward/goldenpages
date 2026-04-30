import { test, expect } from '@playwright/test';
import { DashboardPage } from '../../pages/dashboard.page';
import { LoginPage } from '../../pages/login.page';
import { TEST_USERS, ROUTES } from '../../helpers/test-data';

test.describe('Logout', () => {
  test.use({ storageState: 'e2e/.auth/admin.json' });

  let dashboardPage: DashboardPage;

  test.beforeEach(async ({ page }) => {
    dashboardPage = new DashboardPage(page);
    await dashboardPage.goto();
  });

  test('sign out redirects to home page', async ({ page }) => {
    await dashboardPage.signOut();
    await page.waitForURL('**/', { timeout: 10000 });
    await expect(page).toHaveURL(ROUTES.home);
  });

  test('after sign out, dashboard redirects away', async ({ page }) => {
    await dashboardPage.signOut();
    await page.waitForURL('**/', { timeout: 10000 });

    // Now try to visit dashboard — should redirect to home or login
    await page.goto(ROUTES.dashboard);
    await page.waitForURL(/\/(login|$)/, { timeout: 10000 });
    const url = page.url();
    expect(url).not.toContain('/dashboard');
  });
});
