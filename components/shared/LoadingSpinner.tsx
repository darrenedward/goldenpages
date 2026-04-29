'use client';

import { Loader2 } from 'lucide-react';

interface LoadingSpinnerProps {
  size?: 'sm' | 'md' | 'lg';
  message?: string;
}

export default function LoadingSpinner({ size = 'md', message }: LoadingSpinnerProps) {
  const sizeClasses = {
    sm: 'w-5 h-5',
    md: 'w-8 h-8',
    lg: 'w-12 h-12',
  };

  return (
    <div className="flex flex-col items-center justify-center text-stone-400">
      <Loader2 className={`${sizeClasses[size]} border-2 border-gold-200 border-t-gold-600 rounded-full animate-spin`} />
      {message && <p className="mt-3 text-sm font-serif">{message}</p>}
    </div>
  );
}
