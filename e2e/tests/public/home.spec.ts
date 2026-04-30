import { test, expect } from '@playwright/test';
import { ROUTES } from '../../helpers/test-data';

test.describe('Home Page', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(ROUTES.home);
    await page.waitForLoadState('networkidle');
  });

  test('loads with hero heading', async ({ page }) => {
    await expect(page.getByRole('heading', { name: 'Where Truth' })).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Meets Accountability' })).toBeVisible();
  });

  test('stats counters are visible', async ({ page }) => {
    await expect(page.getByText('Countries Monitored')).toBeVisible();
    await expect(page.getByText('Decision-Makers Tracked')).toBeVisible();
    await expect(page.getByText('Government Departments')).toBeVisible();
    await expect(page.getByText('Contact Channels')).toBeVisible();
  });

  test('nav links are present', async ({ page }) => {
    const nav = page.locator('nav');
    await expect(nav.getByRole('link', { name: 'Home' })).toBeVisible();
    await expect(nav.getByRole('link', { name: 'Communications' })).toBeVisible();
    await expect(nav.getByRole('link', { name: 'Report' })).toBeVisible();
    await expect(nav.getByRole('link', { name: 'About' })).toBeVisible();
    await expect(nav.getByRole('link', { name: 'Contact' })).toBeVisible();
  });

  test('CTA buttons work', async ({ page }) => {
    const publicRegisterLink = page.getByRole('link', { name: 'Public Register' }).first();
    await expect(publicRegisterLink).toBeVisible();
    await expect(publicRegisterLink).toHaveAttribute('href', '/communications');

    // Sign In link exists on the page (may be in nav or hero section)
    const signInLink = page.getByRole('link', { name: 'Sign In' }).first();
    await expect(signInLink).toBeVisible();
  });
});
