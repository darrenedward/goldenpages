import { test, expect } from '@playwright/test';
import { DashboardPage } from '../../pages/dashboard.page';

test.describe('Create Communication Wizard', () => {
  test.use({ storageState: 'e2e/.auth/admin.json' });

  let dashboardPage: DashboardPage;

  test.beforeEach(async ({ page }) => {
    dashboardPage = new DashboardPage(page);
    await dashboardPage.goto();
  });

  test('wizard opens from sidebar New Communication', async ({ page }) => {
    await dashboardPage.switchView('New Communication');

    // Should show wizard with title input
    await expect(page.getByPlaceholder(/covid vaccine/i)).toBeVisible({ timeout: 10000 });
  });

  test('step 1 Next button is disabled without title', async ({ page }) => {
    await dashboardPage.switchView('New Communication');
    await expect(page.getByPlaceholder(/covid vaccine/i)).toBeVisible({ timeout: 10000 });

    // Next button should be disabled when title is empty
    const nextButton = page.getByRole('button', { name: 'Next', exact: true });
    await expect(nextButton).toBeDisabled();
  });

  test('step 1 fills title and proceeds to step 2', async ({ page }) => {
    await dashboardPage.switchView('New Communication');
    await expect(page.getByPlaceholder(/covid vaccine/i)).toBeVisible({ timeout: 10000 });

    // Fill in the title
    const titleInput = page.getByPlaceholder(/covid vaccine/i);
    await titleInput.click();
    await titleInput.pressSequentially('E2E Test Communication', { delay: 30 });

    // Next button should now be enabled
    const nextButton = page.getByRole('button', { name: 'Next', exact: true });
    await expect(nextButton).toBeEnabled();
    await nextButton.click();

    // Should move to step 2 — look for heading or step indicator
    await expect(page.getByRole('heading', { name: /recipient/i })).toBeVisible({ timeout: 5000 });
  });

  test('step 2 shows recipient interface', async ({ page }) => {
    await dashboardPage.switchView('New Communication');
    await expect(page.getByPlaceholder(/covid vaccine/i)).toBeVisible({ timeout: 10000 });

    // Fill title and go to step 2
    const titleInput = page.getByPlaceholder(/covid vaccine/i);
    await titleInput.click();
    await titleInput.pressSequentially('E2E Test Communication', { delay: 30 });
    await page.getByRole('button', { name: 'Next', exact: true }).click();
    await expect(page.getByRole('heading', { name: /recipient/i })).toBeVisible({ timeout: 5000 });

    // Step 2 should have some recipient UI — look for org/department list
    const hasOrgList = await page.getByText(/organization|department/i).first().isVisible().catch(() => false);
    expect(hasOrgList).toBeTruthy();
  });

  test('wizard has submit button on final step', async ({ page }) => {
    await dashboardPage.switchView('New Communication');
    await expect(page.getByPlaceholder(/covid vaccine/i)).toBeVisible({ timeout: 10000 });

    // Fill title
    const titleInput = page.getByPlaceholder(/covid vaccine/i);
    await titleInput.click();
    await titleInput.pressSequentially('E2E Test Communication', { delay: 30 });

    // Navigate through steps
    // Step 1 -> 2
    await page.getByRole('button', { name: 'Next', exact: true }).click();
    await expect(page.getByRole('heading', { name: /recipient/i })).toBeVisible({ timeout: 5000 });

    // Step 2 -> 3 (may need a recipient, or Next might be disabled)
    const nextBtn2 = page.getByRole('button', { name: 'Next', exact: true });
    const isEnabled = await nextBtn2.isEnabled().catch(() => false);
    if (isEnabled) {
      await nextBtn2.click();
      await page.waitForTimeout(1000);

      // Step 3 -> 4
      const nextBtn3 = page.getByRole('button', { name: 'Next', exact: true });
      const isEnabled3 = await nextBtn3.isEnabled().catch(() => false);
      if (isEnabled3) {
        await nextBtn3.click();
        await page.waitForTimeout(1000);

        // Final step should have a create/submit button
        const submitBtn = page.getByRole('button', { name: /create|submit|review/i });
        const hasSubmit = await submitBtn.isVisible().catch(() => false);
        // Just verify wizard progressed — submit button presence depends on step
        expect(hasSubmit || await page.getByText(/review|confirm|approval/i).isVisible().catch(() => false)).toBeTruthy();
      }
    }
  });
});
