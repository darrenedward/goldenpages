import type { Page, Locator } from '@playwright/test';

export class ReportPage {
  readonly page: Page;
  readonly firstNameInput: Locator;
  readonly lastNameInput: Locator;
  readonly emailInput: Locator;
  readonly subjectInput: Locator;
  readonly descriptionInput: Locator;
  readonly submitButton: Locator;

  constructor(page: Page) {
    this.page = page;
    this.firstNameInput = page.getByLabel(/first name/i);
    this.lastNameInput = page.getByLabel(/last name/i);
    this.emailInput = page.getByLabel(/email/i).first();
    this.subjectInput = page.getByLabel(/subject/i);
    this.descriptionInput = page.getByLabel(/description/i);
    this.submitButton = page.getByRole('button', { name: /submit|send/i });
  }

  async goto() {
    await this.page.goto('/report');
    await this.page.waitForLoadState('networkidle');
  }

  async fillForm(data: {
    firstName: string;
    lastName: string;
    email: string;
    subject: string;
    description: string;
  }) {
    await this.firstNameInput.fill(data.firstName);
    await this.lastNameInput.fill(data.lastName);
    await this.emailInput.fill(data.email);
    await this.subjectInput.fill(data.subject);
    await this.descriptionInput.fill(data.description);
  }

  async selectCategory(name: string) {
    const btn = this.page.getByRole('button', { name: new RegExp(name, 'i') }).first();
    await btn.scrollIntoViewIfNeeded();
    await btn.click();
  }

  async selectUrgency(level: string) {
    const btn = this.page.getByRole('button', { name: new RegExp(level, 'i') }).first();
    await btn.scrollIntoViewIfNeeded();
    await btn.click();
  }

  async submit() {
    await this.submitButton.click();
  }
}
