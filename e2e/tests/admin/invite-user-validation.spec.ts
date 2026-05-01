import { test, expect } from '@playwright/test';
import { DashboardPage } from '../../pages/dashboard.page';

test.describe('Invite User Validation', () => {
  test.use({ storageState: 'e2e/.auth/admin.json' });

  test.beforeEach(async ({ page }) => {
    const dashboardPage = new DashboardPage(page);
    await dashboardPage.goto();
    await dashboardPage.switchView('User Management');

    // Open invite modal
    await page.getByRole('button', { name: /invite user/i }).click();
    await expect(page.getByText('Invite New User')).toBeVisible();
  });

  test('invalid email shows validation error', async ({ page }) => {
    const emailInput = page.getByPlaceholder(/colleague@example.com/i);
    await emailInput.pressSequentially('not-an-email', { delay: 20 });
    await page.getByRole('button', { name: /send invite/i }).click();

    await expect(page.getByText('Please enter a valid email')).toBeVisible();
  });

  test('empty email shows validation error', async ({ page }) => {
    await page.getByRole('button', { name: /send invite/i }).click();

    await expect(page.getByText('Please enter a valid email')).toBeVisible();
  });
});
