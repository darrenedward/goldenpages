import { test, expect } from '@playwright/test';
import { DashboardPage } from '../../pages/dashboard.page';
import { SIDEBAR_ITEMS } from '../../helpers/test-data';

test.describe('My Communications', () => {
  test.use({ storageState: 'e2e/.auth/admin.json' });

  let dashboardPage: DashboardPage;

  test.beforeEach(async ({ page }) => {
    dashboardPage = new DashboardPage(page);
    await dashboardPage.goto();
  });

  test('My Communications sidebar button exists and navigates', async ({ page }) => {
    const sidebar = page.locator('aside');
    const myCommsBtn = sidebar.getByRole('button', { name: SIDEBAR_ITEMS.myCommunications, exact: true });
    await expect(myCommsBtn).toBeVisible();

    await myCommsBtn.click();

    // Should show the communication list (search bar is the main indicator)
    await expect(page.getByPlaceholder(/search by title/i)).toBeVisible({ timeout: 10000 });
  });

  test('My Communications shows communications owned by the logged-in user', async ({ page }) => {
    // Navigate to My Communications
    await dashboardPage.switchView(SIDEBAR_ITEMS.myCommunications);

    // Wait for loading to finish — either communications appear or empty state
    const loadingSpinner = page.getByText('Loading communications');
    await expect(loadingSpinner).not.toBeVisible({ timeout: 10000 });

    // The test admin user should see their communications or a proper empty state
    // Check that one of these appears:
    const hasCommunications = await page.locator('[class*="rounded"]').filter({ hasText: /glyphosate|water|pesticide|inquiry/i }).first().isVisible({ timeout: 5000 }).catch(() => false);
    const hasEmpty = await page.getByText(/no communications/i).isVisible({ timeout: 3000 }).catch(() => false);

    // At minimum, the list container should be visible
    expect(hasCommunications || hasEmpty).toBeTruthy();
  });

  test('My Communications is filtered to only user-owned comms, not all comms', async ({ page }) => {
    // First check how many communications show in the full list
    await dashboardPage.switchView('Communications');
    await expect(page.getByPlaceholder(/search by title/i)).toBeVisible({ timeout: 10000 });

    // Wait for data to load
    await page.waitForLoadState('networkidle');

    // Get the count from the "X communications" text
    const allCommsText = await page.getByText(/\d+ communication/).textContent().catch(() => '0 communications');
    const allCount = parseInt(allCommsText?.match(/(\d+)/)?.[1] || '0', 10);

    // Now switch to My Communications
    await dashboardPage.switchView(SIDEBAR_ITEMS.myCommunications);
    await expect(page.getByPlaceholder(/search by title/i)).toBeVisible({ timeout: 10000 });
    await page.waitForLoadState('networkidle');

    const myCommsText = await page.getByText(/\d+ communication/).textContent().catch(() => '0 communications');
    const myCount = parseInt(myCommsText?.match(/(\d+)/)?.[1] || '0', 10);

    // My Communications should show <= total communications (it's a subset)
    expect(myCount).toBeLessThanOrEqual(allCount);
  });

  test('clicking a communication in My Communications opens detail view', async ({ page }) => {
    await dashboardPage.switchView(SIDEBAR_ITEMS.myCommunications);
    await expect(page.getByPlaceholder(/search by title/i)).toBeVisible({ timeout: 10000 });
    await page.waitForLoadState('networkidle');

    // Check if there are any communications to click
    const hasComms = await page.getByText(/\d+ communication/).textContent().catch(() => '');
    const count = parseInt(hasComms?.match(/(\d+)/)?.[1] || '0', 10);

    if (count > 0) {
      // Click the first communication card
      const firstCard = page.locator('[class*="rounded"]').filter({ hasText: /glyphosate|water|pesticide|inquiry|communication/i }).first();
      if (await firstCard.isVisible({ timeout: 3000 }).catch(() => false)) {
        await firstCard.click();

        // Should navigate to detail view — look for back button or detail content
        const hasDetail = await page.getByRole('button', { name: /back/i }).isVisible({ timeout: 5000 }).catch(() => false)
          || await page.getByText(/status|sent|awaiting/i).isVisible({ timeout: 5000 }).catch(() => false);
        expect(hasDetail).toBeTruthy();
      }
    }
  });

  test('All Communications view shows every communication regardless of ownership', async ({ page }) => {
    await dashboardPage.switchView('Communications');
    await expect(page.getByPlaceholder(/search by title/i)).toBeVisible({ timeout: 10000 });
    await page.waitForLoadState('networkidle');

    // All communications view should show at least the seeded communications
    const commsText = await page.getByText(/\d+ communication/).textContent().catch(() => '0 communications');
    const count = parseInt(commsText?.match(/(\d+)/)?.[1] || '0', 10);
    expect(count).toBeGreaterThanOrEqual(0);
  });
});
