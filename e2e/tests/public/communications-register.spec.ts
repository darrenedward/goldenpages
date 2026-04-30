import { test, expect } from '@playwright/test';
import { ROUTES } from '../../helpers/test-data';

test.describe('Public Communications Register', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(ROUTES.communications);
    await page.waitForLoadState('networkidle');
  });

  test('page loads with heading', async ({ page }) => {
    await expect(page.getByRole('heading', { level: 1, name: 'Public Communications Register' })).toBeVisible();
  });

  test('shows communications or empty state', async ({ page }) => {
    // Either shows communications list or empty state message
    const hasResults = await page.getByText(/Showing \d/).isVisible({ timeout: 5000 }).catch(() => false);
    const hasEmpty = await page.getByRole('heading', { name: /No communications/i }).isVisible({ timeout: 5000 }).catch(() => false);

    expect(hasResults || hasEmpty).toBeTruthy();
  });
});
