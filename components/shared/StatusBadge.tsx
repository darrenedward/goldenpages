'use client';

interface StatusBadgeProps {
  status: string;
  className?: string;
  size?: 'sm' | 'md';
}

export default function StatusBadge({ status, className = '', size = 'md' }: StatusBadgeProps) {
  const getStatusConfig = (status: string) => {
    const s = status.toLowerCase();
    if (s === 'active' || s === 'sent' || s === 'delivered' || s === 'completed') {
      return 'bg-emerald-100 text-emerald-700 border-emerald-200 dark:bg-emerald-900/30 dark:text-emerald-400 dark:border-emerald-800';
    }
    if (s === 'pending' || s === 'draft' || s === 'partial') {
      return 'bg-gold-100 text-gold-700 border-gold-200 dark:bg-gold-900/30 dark:text-gold-400 dark:border-gold-800';
    }
    if (s === 'inactive' || s === 'cancelled' || s === 'failed' || s === 'bounced') {
      return 'bg-red-100 text-red-700 border-red-200 dark:bg-red-900/30 dark:text-red-400 dark:border-red-800';
    }
    if (s === 'overdue') {
      return 'bg-orange-100 text-orange-700 border-orange-200 dark:bg-orange-900/30 dark:text-orange-400 dark:border-orange-800';
    }
    return 'bg-stone-100 text-stone-700 border-stone-200 dark:bg-stone-800 dark:text-stone-400 dark:border-stone-700';
  };

  const sizeClasses = size === 'sm' ? 'px-1.5 py-0.5 text-[8px]' : 'px-2 py-1 text-[10px]';

  return (
    <span
      className={`${sizeClasses} font-black uppercase tracking-widest rounded-full border ${getStatusConfig(status)} ${className}`}
    >
      {status}
    </span>
  );
}
