import type { Page, Locator } from '@playwright/test';

export class DashboardPage {
  readonly page: Page;
  readonly sidebar: Locator;

  constructor(page: Page) {
    this.page = page;
    this.sidebar = page.locator('aside');
  }

  async goto() {
    await this.page.goto('/dashboard');
    await this.sidebar.waitFor({ timeout: 15000 });
  }

  async switchView(label: string) {
    // Use exact match to avoid strict mode violations (e.g. "Communications" vs "My Communications")
    const btn = this.sidebar.getByRole('button', { name: label, exact: true });
    await btn.click();
    // Wait for the view to render (networkidle for data fetching)
    await this.page.waitForLoadState('networkidle').catch(() => {
      // Some views don't make network requests, that's fine
    });
  }

  async getStatCards() {
    return this.page.locator('text=Total Organizations').locator('..').locator('..');
  }

  async signOut() {
    await this.sidebar.getByRole('button', { name: /sign out/i }).click();
  }

  async isVisible() {
    return this.sidebar.isVisible();
  }
}
