'use client';

import { FolderOpen } from 'lucide-react';

interface EmptyStateProps {
  title: string;
  description?: string;
  action?: {
    label: string;
    onClick: () => void;
  };
}

export default function EmptyState({ title, description, action }: EmptyStateProps) {
  return (
    <div className="flex flex-col items-center justify-center h-64 text-center">
      <div className="w-16 h-16 bg-stone-100 dark:bg-stone-800 rounded-full flex items-center justify-center mb-4">
        <FolderOpen className="w-8 h-8 text-stone-400" />
      </div>
      <h3 className="text-lg font-serif font-bold text-slate-800 dark:text-white">{title}</h3>
      {description && <p className="text-stone-500 dark:text-stone-400 mt-1 max-w-sm">{description}</p>}
      {action && (
        <button
          onClick={action.onClick}
          className="mt-4 px-6 py-2 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all"
        >
          {action.label}
        </button>
      )}
    </div>
  );
}
