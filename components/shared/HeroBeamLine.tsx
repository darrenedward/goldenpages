'use client';

import { useEffect, useRef, useState } from 'react';

interface HeroBeamLineProps {
  delay?: number;
  height?: string;
  className?: string;
}

export function HeroBeamLine({ delay = 0, height = '2px', className = '' }: HeroBeamLineProps) {
  const ref = useRef<HTMLDivElement>(null);
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    if (prefersReduced) {
      setVisible(true);
      return;
    }
    const timer = setTimeout(() => setVisible(true), delay);
    return () => clearTimeout(timer);
  }, [delay]);

  return (
    <div className={`flex items-center justify-center my-6 ${className}`} aria-hidden="true">
      <div
        ref={ref}
        style={{
          height,
          maxWidth: '6rem',
          width: visible ? '100%' : '0%',
          background: 'linear-gradient(90deg, transparent, hsl(45 93% 47%), transparent)',
          borderRadius: '9999px',
          transition: `width 1s ease-out`,
          opacity: visible ? 1 : 0,
        }}
      />
    </div>
  );
}
