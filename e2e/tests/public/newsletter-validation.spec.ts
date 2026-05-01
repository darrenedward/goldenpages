import { test, expect } from '@playwright/test';

test.describe('Newsletter Validation', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('networkidle');
  });

  test('invalid email shows validation error', async ({ page }) => {
    const emailInput = page.getByPlaceholder(/your@email.com/i);
    await emailInput.pressSequentially('not-an-email', { delay: 20 });

    await page.getByRole('button', { name: /subscribe/i }).click();

    await expect(page.getByText('Please enter a valid email address')).toBeVisible();
  });

  test('empty submit shows validation error', async ({ page }) => {
    await page.getByRole('button', { name: /subscribe/i }).click();

    await expect(page.getByText('Please enter a valid email address')).toBeVisible();
  });
});
