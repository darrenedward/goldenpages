import { test, expect } from '@playwright/test';
import { DashboardPage } from '../../pages/dashboard.page';

test.describe('Dashboard Sidebar Navigation', () => {
  test.use({ storageState: 'e2e/.auth/admin.json' });

  let dashboardPage: DashboardPage;

  test.beforeEach(async ({ page }) => {
    dashboardPage = new DashboardPage(page);
    await dashboardPage.goto();
  });

  test('admin sees Main, Transparency, and System sections', async ({ page }) => {
    const sidebar = page.locator('aside');
    await expect(sidebar).toBeVisible();

    // Section headings
    await expect(sidebar.getByText('Main')).toBeVisible();
    await expect(sidebar.getByText('Transparency')).toBeVisible();
    await expect(sidebar.getByText('System')).toBeVisible();

    // Main section items
    await expect(sidebar.getByRole('button', { name: 'Dashboard' })).toBeVisible();
    await expect(sidebar.getByRole('button', { name: 'Organizations' })).toBeVisible();
    await expect(sidebar.getByRole('button', { name: 'New Communication' })).toBeVisible();

    // System section items (admin only)
    await expect(sidebar.getByRole('button', { name: 'User Management' })).toBeVisible();
    await expect(sidebar.getByRole('button', { name: 'Issue Categories' })).toBeVisible();
    await expect(sidebar.getByRole('button', { name: 'Settings' })).toBeVisible();
  });

  test('clicking sidebar items switches view', async ({ page }) => {
    // Switch to Organizations view
    await dashboardPage.switchView('Organizations');
    // Should render the organizations list (sidebar still visible)
    await expect(page.locator('aside')).toBeVisible();

    // Switch to Communications view
    await dashboardPage.switchView('Communications');
    await expect(page.locator('aside')).toBeVisible();
  });

  test('dashboard view shows stats cards', async ({ page }) => {
    // Dashboard is the default view — wait for stats to load
    await expect(page.getByText('Total Organizations')).toBeVisible({ timeout: 15000 });
    await expect(page.getByText('Total Contacts')).toBeVisible();
    await expect(page.getByText('Active Communications')).toBeVisible();
  });

  test('sign out button is visible', async ({ page }) => {
    const sidebar = page.locator('aside');
    await expect(sidebar.getByRole('button', { name: /sign out/i })).toBeVisible();
  });
});
