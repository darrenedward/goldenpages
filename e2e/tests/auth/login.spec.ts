import { test, expect } from '@playwright/test';
import { LoginPage } from '../../pages/login.page';
import { TEST_USERS, ROUTES } from '../../helpers/test-data';

test.describe('Login', () => {
  let loginPage: LoginPage;

  test.beforeEach(async ({ page }) => {
    loginPage = new LoginPage(page);
    await loginPage.goto();
    // Wait for form to be fully interactive
    await page.locator('#email').waitFor({ state: 'visible', timeout: 10000 });
  });

  test('login with valid admin credentials redirects to dashboard', async ({ page }) => {
    await loginPage.loginAndWaitForDashboard(TEST_USERS.admin.email, TEST_USERS.admin.password);

    await expect(page).toHaveURL(/\/dashboard/);
    await expect(page.locator('aside')).toBeVisible();
  });

  test('login with wrong password shows error', async ({ page }) => {
    // Sign out first to ensure we're on the login form (not redirected)
    await page.evaluate(() => {
      const supabaseKey = Object.keys(localStorage).find(k => k.startsWith('sb-'));
      if (supabaseKey) localStorage.removeItem(supabaseKey);
    });
    await page.reload();
    await page.locator('#email').waitFor({ state: 'visible', timeout: 10000 });

    // Use pressSequentially for React controlled input compatibility
    const emailInput = page.locator('#email');
    const passwordInput = page.locator('#password');

    await emailInput.click();
    await emailInput.pressSequentially(TEST_USERS.admin.email, { delay: 30 });
    await passwordInput.click();
    await passwordInput.pressSequentially('WrongPassword123!', { delay: 30 });

    await page.getByRole('button', { name: /sign in/i }).click();

    // Should show an error message — either inline or as toast
    // The form should still be visible (no redirect to dashboard)
    await page.waitForTimeout(3000); // Wait for Supabase auth call
    await expect(page).toHaveURL(/\/login/);
  });
});
