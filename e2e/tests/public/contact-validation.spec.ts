import { test, expect } from '@playwright/test';

test.describe('Contact Form Validation', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/contact');
    await page.waitForLoadState('networkidle');
  });

  test('submit empty form shows all validation errors', async ({ page }) => {
    await page.getByRole('button', { name: /send message/i }).click();

    await expect(page.getByText('Name is required')).toBeVisible();
    await expect(page.getByText('Please enter a valid email')).toBeVisible();
    await expect(page.getByText('Subject is required')).toBeVisible();
    await expect(page.getByText('Message must be at least 10 characters')).toBeVisible();

    // Form should still be visible
    await expect(page.getByRole('button', { name: /send message/i })).toBeVisible();
  });

  test('invalid email shows validation error', async ({ page }) => {
    const nameInput = page.getByLabel(/name/i);
    const emailInput = page.getByLabel(/email/i);
    const subjectInput = page.getByLabel(/subject/i);
    const messageInput = page.getByLabel(/message/i);

    await nameInput.pressSequentially('Test User', { delay: 20 });
    await emailInput.pressSequentially('not-an-email', { delay: 20 });
    await subjectInput.pressSequentially('Test subject', { delay: 20 });
    await messageInput.pressSequentially('This is a test message with enough characters', { delay: 20 });
    await page.getByRole('button', { name: /send message/i }).click();

    await expect(page.getByText('Please enter a valid email')).toBeVisible();
  });

  test('short message shows validation error', async ({ page }) => {
    const nameInput = page.getByLabel(/name/i);
    const emailInput = page.getByLabel(/email/i);
    const subjectInput = page.getByLabel(/subject/i);
    const messageInput = page.getByLabel(/message/i);

    await nameInput.pressSequentially('Test', { delay: 20 });
    await emailInput.pressSequentially('test@example.com', { delay: 20 });
    await subjectInput.pressSequentially('Test', { delay: 20 });
    await messageInput.pressSequentially('short', { delay: 20 });
    await page.getByRole('button', { name: /send message/i }).click();

    await expect(page.getByText('Message must be at least 10 characters')).toBeVisible();
  });
});
