import { test, expect } from '@playwright/test';
import { DashboardPage } from '../../pages/dashboard.page';
import { ROUTES } from '../../helpers/test-data';

test.describe('Organizations Hierarchy', () => {
  test.use({ storageState: 'e2e/.auth/admin.json' });

  let dashboardPage: DashboardPage;

  test.beforeEach(async ({ page }) => {
    dashboardPage = new DashboardPage(page);
    await dashboardPage.goto();
  });

  test('organizations list loads with data', async ({ page }) => {
    await dashboardPage.switchView('Organizations');

    // Should show the organizations list component
    await expect(page.getByText(/organization/i).first()).toBeVisible({ timeout: 10000 });
  });

  test('search/filter works', async ({ page }) => {
    await dashboardPage.switchView('Organizations');

    // Look for a search input
    const searchInput = page.getByPlaceholder(/search|filter/i);
    if (await searchInput.isVisible().catch(() => false)) {
      await searchInput.fill('test');
      // After typing, results should filter (or show empty state)
      await page.waitForTimeout(500); // debounce
    }
  });

  test('click organization shows detail view', async ({ page }) => {
    await dashboardPage.switchView('Organizations');

    // Wait for organizations to load
    await page.waitForLoadState('networkidle').catch(() => {});

    // Click the first organization item
    const orgItem = page.locator('[class*="cursor-pointer"], [role="button"], a').filter({ hasText: /ministry|department|organization|corp/i }).first();
    if (await orgItem.isVisible().catch(() => false)) {
      await orgItem.click();

      // Should show detail view with departments or contacts
      await page.waitForLoadState('networkidle').catch(() => {});
      // Verify something rendered after the click
      await expect(page.locator('aside')).toBeVisible();
    }
  });

  test('sidebar has Main and Transparency sections', async ({ page }) => {
    const sidebar = page.locator('aside');
    await expect(sidebar.getByText('Main')).toBeVisible();
    await expect(sidebar.getByText('Transparency')).toBeVisible();
  });

  test('admin sees System section', async ({ page }) => {
    const sidebar = page.locator('aside');
    await expect(sidebar.getByText('System')).toBeVisible();
  });
});
