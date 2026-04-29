'use client';

import { ChevronRight } from 'lucide-react';

interface BreadcrumbItem {
  label: string;
  onClick?: () => void;
}

interface BreadcrumbNavProps {
  items: BreadcrumbItem[];
}

export default function BreadcrumbNav({ items }: BreadcrumbNavProps) {
  return (
    <nav className="flex items-center space-x-2 text-sm mb-6">
      {items.map((item, index) => (
        <div key={index} className="flex items-center">
          {index > 0 && <ChevronRight className="w-4 h-4 text-stone-400 mx-1" />}
          {item.onClick ? (
            <button
              onClick={item.onClick}
              className="text-gold-600 hover:text-gold-700 font-medium transition-colors"
            >
              {item.label}
            </button>
          ) : (
            <span className="text-stone-600 dark:text-stone-400">{item.label}</span>
          )}
        </div>
      ))}
    </nav>
  );
}
