import { test, expect } from '@playwright/test';
import { ROUTES } from '../../helpers/test-data';

const NAV_ROUTES = [
  { name: 'Communications', path: ROUTES.communications, heading: 'Public Register' },
  { name: 'Report', path: ROUTES.report, heading: 'Report an Issue' },
  { name: 'About', path: ROUTES.about, heading: 'About Golden Pages' },
  { name: 'Contact', path: ROUTES.contact, heading: 'Contact Us' },
];

test.describe('Public Navigation', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(ROUTES.home);
    await page.waitForLoadState('networkidle');
  });

  test('each nav link loads correct page', async ({ page }) => {
    for (const route of NAV_ROUTES) {
      await page.goto(ROUTES.home);
      await page.waitForLoadState('networkidle');
      await page.locator('nav').getByRole('link', { name: route.name }).first().click();
      await page.waitForLoadState('networkidle');
      await expect(page.getByRole('heading', { level: 1, name: route.heading })).toBeVisible();
    }
  });

  test('footer links work', async ({ page }) => {
    const footer = page.locator('footer');

    // Quick links in footer
    await expect(footer.getByRole('link', { name: 'Public Register' })).toBeVisible();
    await expect(footer.getByRole('link', { name: 'Report an Issue' })).toBeVisible();
    await expect(footer.getByRole('link', { name: 'About Us' })).toBeVisible();

    // Bottom bar links
    await expect(footer.getByRole('link', { name: 'Privacy Policy' })).toBeVisible();
    await expect(footer.getByRole('link', { name: 'Terms of Service' })).toBeVisible();
  });

  test('back navigation works', async ({ page }) => {
    await page.locator('nav').getByRole('link', { name: 'About' }).first().click();
    await page.waitForLoadState('networkidle');
    await expect(page).toHaveURL(/\/about/);

    await page.goBack();
    await page.waitForLoadState('networkidle');
    await expect(page).toHaveURL(ROUTES.home);
  });
});
