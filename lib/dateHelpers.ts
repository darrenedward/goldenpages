/**
 * Working-day date helpers
 *
 * Calculates dates excluding weekends (Saturday/Sunday).
 * Used for expected response date calculations on communications.
 */

/**
 * Add N working days to a start date, skipping weekends.
 * E.g., addWorkingDays(Monday, 5) → following Monday
 */
export function addWorkingDays(startDate: Date, days: number): Date {
  const result = new Date(startDate);
  let remaining = days;

  while (remaining > 0) {
    result.setDate(result.getDate() + 1);
    const day = result.getDay();
    // Skip Saturday (6) and Sunday (0)
    if (day !== 0 && day !== 6) {
      remaining--;
    }
  }

  return result;
}

/**
 * Calculate working days between two dates (exclusive of start, inclusive of end).
 * Returns 0 if end date is before or same as start date.
 */
export function workingDaysBetween(startDate: Date, endDate: Date): number {
  let count = 0;
  const current = new Date(startDate);

  while (current < endDate) {
    current.setDate(current.getDate() + 1);
    const day = current.getDay();
    if (day !== 0 && day !== 6) {
      count++;
    }
  }

  return count;
}

/**
 * Format a date for display (e.g., "27 May 2026")
 */
export function formatDateDisplay(date: Date): string {
  return date.toLocaleDateString('en-GB', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  });
}
