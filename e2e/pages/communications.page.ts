import type { Page, Locator } from '@playwright/test';

export class CommunicationsPage {
  readonly page: Page;

  constructor(page: Page) {
    this.page = page;
  }

  // --- Public register ---

  async gotoPublicRegister() {
    await this.page.goto('/communications');
    await this.page.waitForLoadState('networkidle');
  }

  // --- Dashboard wizard ---

  async openWizard() {
    await this.page.locator('aside').getByRole('button', { name: /new communication/i }).click();
    // Wait for wizard step 1
    await this.page.getByText(/details/i).first().waitFor({ timeout: 10000 });
  }

  async fillDetails(data: { title: string; description?: string }) {
    await this.page.getByLabel(/title/i).fill(data.title);
    if (data.description) {
      await this.page.getByLabel(/description/i).fill(data.description);
    }
  }

  async clickNext() {
    await this.page.getByRole('button', { name: /next/i }).click();
  }

  async addRecipientByDepartment(deptName: string) {
    // Click on the department in the recipient selection
    await this.page.getByRole('button', { name: new RegExp(deptName, 'i') }).first().click();
  }

  async checkApproval() {
    await this.page.getByLabel(/approve|confirm/i).click();
  }

  async submitWizard() {
    await this.page.getByRole('button', { name: /create|submit|send/i }).click();
  }
}
