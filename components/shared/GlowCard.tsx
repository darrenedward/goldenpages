import { type ReactNode } from 'react';

interface GlowCardProps {
  children: ReactNode;
  className?: string;
  glowIntensity?: 'subtle' | 'medium' | 'intense';
}

const glowMap = {
  subtle: 'hover:shadow-lg hover:shadow-gold-500/5',
  medium: 'hover:shadow-xl hover:shadow-gold-500/10',
  intense: 'hover:shadow-2xl hover:shadow-gold-500/20',
};

export function GlowCard({ children, className = '', glowIntensity = 'medium' }: GlowCardProps) {
  return (
    <div
      className={`bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8 transition-all duration-300 hover:border-gold-300 dark:hover:border-gold-500/20 hover:-translate-y-0.5 ${glowMap[glowIntensity]} ${className}`}
    >
      {children}
    </div>
  );
}
