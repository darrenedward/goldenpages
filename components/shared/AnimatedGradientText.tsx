import { type ReactNode } from 'react';

interface AnimatedGradientTextProps {
  children: ReactNode;
  className?: string;
}

export function AnimatedGradientText({ children, className = '' }: AnimatedGradientTextProps) {
  return (
    <span
      className={`inline-block bg-clip-text text-transparent bg-[linear-gradient(110deg,#ffd04d,#b88a00,#ffe08a,#b88a00)] bg-[length:200%_100%] animate-shimmer ${className}`}
    >
      {children}
    </span>
  );
}
