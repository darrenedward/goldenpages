interface SectionDividerProps {
  variant?: 'wave' | 'angle' | 'line';
  className?: string;
}

export function SectionDivider({ variant = 'wave', className = '' }: SectionDividerProps) {
  if (variant === 'wave') {
    return (
      <div className={`relative h-16 w-full overflow-hidden ${className}`} aria-hidden="true">
        <svg
          className="absolute bottom-0 w-full h-full"
          viewBox="0 0 1200 120"
          preserveAspectRatio="none"
          fill="none"
        >
          <path
            d="M0,60 C200,120 400,0 600,60 C800,120 1000,0 1200,60 L1200,120 L0,120 Z"
            className="fill-stone-50 dark:fill-slate-950"
          />
        </svg>
      </div>
    );
  }

  if (variant === 'angle') {
    return (
      <div className={`relative h-12 w-full overflow-hidden ${className}`} aria-hidden="true">
        <div
          className="absolute inset-0 bg-stone-50 dark:bg-slate-950"
          style={{ clipPath: 'polygon(0 100%, 100% 0, 100% 100%)' }}
        />
      </div>
    );
  }

  // line variant
  return (
    <div className={`flex items-center justify-center py-8 ${className}`} aria-hidden="true">
      <div className="h-px w-48 bg-gradient-to-r from-transparent via-gold-500/30 to-transparent" />
    </div>
  );
}
