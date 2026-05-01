'use client';

import React, { forwardRef } from 'react';

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
 * If true, silently show success and return early from onSubmit.
 */
export function isBot(ref: React.RefObject<HTMLInputElement | null>): boolean {
  return !!ref.current?.value;
}
