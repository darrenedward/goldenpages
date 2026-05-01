import { test, expect } from '@playwright/test';
import { DashboardPage } from '../../pages/dashboard.page';

test.describe('Password Validation', () => {
  test.use({ storageState: 'e2e/.auth/admin.json' });

  let dashboardPage: DashboardPage;

  test.beforeEach(async ({ page }) => {
    dashboardPage = new DashboardPage(page);
    await dashboardPage.goto();
    await dashboardPage.switchView('Settings');
  });

  test('short password shows validation error', async ({ page }) => {
    const newPasswordInput = page.locator('#newPassword');
    const confirmInput = page.locator('#confirmPassword');

    await newPasswordInput.pressSequentially('short', { delay: 20 });
    await confirmInput.pressSequentially('short', { delay: 20 });
    await page.getByRole('button', { name: /update password/i }).click();

    await expect(page.getByText('Password must be at least 8 characters')).toBeVisible();
  });

  test('mismatched passwords show validation error', async ({ page }) => {
    const newPasswordInput = page.locator('#newPassword');
    const confirmInput = page.locator('#confirmPassword');

    await newPasswordInput.pressSequentially('LongPassword123!', { delay: 20 });
    await confirmInput.pressSequentially('DifferentPass456!', { delay: 20 });
    await page.getByRole('button', { name: /update password/i }).click();

    await expect(page.getByText('Passwords do not match')).toBeVisible();
  });
});
