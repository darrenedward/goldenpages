'use client';

import { useState, useEffect } from 'react';
import { issueCategoryService, type IssueCategory } from '@/services/issueCategoryService';
import { supabase } from '@/services/supabaseClient';

interface CategorySidebarProps {
  activeCategoryId: string | null;  // null means "All"
  onSelectCategory: (categoryId: string | null) => void;
}

export function CategorySidebar({ activeCategoryId, onSelectCategory }: CategorySidebarProps) {
  const [categories, setCategories] = useState<IssueCategory[]>([]);
  const [counts, setCounts] = useState<Record<string, number>>({});
  const [totalCount, setTotalCount] = useState(0);

  useEffect(() => {
    void (async () => {
      try {
        const cats = await issueCategoryService.getActive();
        setCategories(cats);
        
        // Get count of approved public communications per category
        const { data } = await supabase
          .from('communications')
          .select('category_id')
          .eq('is_public', true)
          .eq('is_approved', true);
        
        const countMap: Record<string, number> = {};
        let total = 0;
        (data || []).forEach((row: { category_id: string | null }) => {
          total++;
          if (row.category_id) {
            countMap[row.category_id] = (countMap[row.category_id] || 0) + 1;
          }
        });
        setCounts(countMap);
        setTotalCount(total);
      } catch {
        // Keep empty state
      }
    })();
  }, []);

  return (
    <div className="space-y-1">
      <button
        onClick={() => onSelectCategory(null)}
        className={`w-full text-left px-4 py-2.5 rounded-xl text-sm font-medium transition-all ${
          activeCategoryId === null
            ? 'bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 font-bold'
            : 'text-stone-600 dark:text-stone-400 hover:bg-stone-50 dark:hover:bg-white/5'
        }`}
      >
        <span className="flex items-center justify-between">
          <span>All Communications</span>
          <span className="text-xs opacity-60">{totalCount}</span>
        </span>
      </button>
      
      {categories.map((cat) => {
        const count = counts[cat.id] || 0;
        if (count === 0) return null;
        return (
          <button
            key={cat.id}
            onClick={() => onSelectCategory(cat.id)}
            className={`w-full text-left px-4 py-2.5 rounded-xl text-sm font-medium transition-all ${
              activeCategoryId === cat.id
                ? 'bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 font-bold'
                : 'text-stone-600 dark:text-stone-400 hover:bg-stone-50 dark:hover:bg-white/5'
            }`}
          >
            <span className="flex items-center justify-between">
              <span className="truncate">{cat.name}</span>
              <span className="text-xs opacity-60 ml-2">{count}</span>
            </span>
          </button>
        );
      })}
    </div>
  );
}
