import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './tests',
  fullyParallel: false,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 1 : 0,
  workers: 1,
  reporter: process.env.CI ? 'github' : 'html',
  timeout: 30000,
  expect: { timeout: 10000 },

  use: {
    baseURL: 'http://localhost:3000',
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',
  },

  projects: [
    // Setup: authenticate test users and save storageState
    {
      name: 'setup',
      testDir: './helpers',
      testMatch: /auth\.setup\.ts/,
    },

    // Anonymous (unauthenticated) tests
    {
      name: 'anonymous',
      use: { ...devices['Desktop Chrome'] },
      testDir: './tests/public',
    },

    // Auth tests (login, auth-guard, logout)
    {
      name: 'auth',
      use: { ...devices['Desktop Chrome'] },
      testDir: './tests/auth',
    },

    // Admin authenticated tests (dashboard, hierarchy, communications)
    {
      name: 'admin',
      use: {
        ...devices['Desktop Chrome'],
        storageState: 'e2e/.auth/admin.json',
      },
      dependencies: ['setup'],
      testDir: './tests',
      testIgnore: ['auth/**', 'public/**'],
    },
  ],

  webServer: {
    command: 'npm run dev',
    url: 'http://localhost:3000',
    reuseExistingServer: !process.env.CI,
    timeout: 120000,
  },
});
