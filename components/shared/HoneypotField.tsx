'use client';

import React, { forwardRef } from 'react';
import { supabase } from '@/services/supabaseClient';

interface HoneypotFieldProps {
  name?: string;
}

const HoneypotField = forwardRef<HTMLInputElement, HoneypotFieldProps>(
  ({ name = 'fax' }, ref) => {
    return (
      <div aria-hidden="true" className="absolute -left-[9999px] opacity-0 h-0 w-0 overflow-hidden">
        <label htmlFor={name}>Do not fill this field</label>
        <input
          ref={ref}
          id={name}
          name={name}
          type="text"
          tabIndex={-1}
          autoComplete="off"
        />
      </div>
    );
  }
);

HoneypotField.displayName = 'HoneypotField';

export default HoneypotField;

/**
 * Check if a honeypot field was filled (indicating a bot).
 * If true, logs the attempt and returns true so the caller can silently reject.
 */
export async function isBot(ref: React.RefObject<HTMLInputElement | null>, formName: string): Promise<boolean> {
  const value = ref.current?.value;
  if (!value) return false;

  // Log the bot attempt
  try {
    await supabase.from('honeypot_logs').insert({
      form_name: formName,
      honeypot_value: value.substring(0, 500),
      user_agent: navigator.userAgent.substring(0, 500),
    });
  } catch {
    // Logging failure is non-blocking
  }

  return true;
}
