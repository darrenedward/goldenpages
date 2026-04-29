'use client';

import { useState, useEffect, useRef, useCallback } from 'react';
import { issueCategoryService, type IssueCategory } from '@/services/issueCategoryService';

interface CategoryAutocompleteProps {
  value: string;
  onChange: (categoryId: string, categoryName: string) => void;
  placeholder?: string;
}

export function CategoryAutocomplete({
  value,
  onChange,
  placeholder = 'Search or create a category...',
}: CategoryAutocompleteProps) {
  const [input, setInput] = useState('');
  const [categories, setCategories] = useState<IssueCategory[]>([]);
  const [isOpen, setIsOpen] = useState(false);
  const [activeIndex, setActiveIndex] = useState(0);
  const [loading, setLoading] = useState(false);
  const containerRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  // Load categories on mount
  useEffect(() => {
    void (async () => {
      try {
        const cats = await issueCategoryService.getActive();
        setCategories(cats);
      } catch {
        // Keep empty state
      }
    })();
  }, []);

  // Sync display value when external value changes
  useEffect(() => {
    if (value) {
      const matched = categories.find((c) => c.id === value);
      if (matched) {
        setInput(matched.name);
      }
    } else {
      setInput('');
    }
  }, [value, categories]);

  // Close dropdown on click outside
  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (
        containerRef.current &&
        !containerRef.current.contains(event.target as Node)
      ) {
        setIsOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const filteredCategories = categories.filter((cat) =>
    cat.name.toLowerCase().includes(input.toLowerCase())
  );

  const hasExactMatch = categories.some(
    (cat) => cat.name.toLowerCase() === input.toLowerCase().trim()
  );

  const titleCasedInput = issueCategoryService.titleCase(input.trim());

  const totalItems = filteredCategories.length + (input.trim() && !hasExactMatch ? 1 : 0);

  const handleSelect = useCallback(
    (cat: IssueCategory) => {
      setInput(cat.name);
      setIsOpen(false);
      setActiveIndex(0);
      onChange(cat.id, cat.name);
    },
    [onChange]
  );

  const handleCreateNew = useCallback(async () => {
    if (!input.trim()) return;
    setLoading(true);
    try {
      const cat = await issueCategoryService.getOrCreate(input.trim());
      setCategories((prev) => {
        if (prev.some((c) => c.id === cat.id)) return prev;
        return [...prev, cat];
      });
      setInput(cat.name);
      setIsOpen(false);
      setActiveIndex(0);
      onChange(cat.id, cat.name);
    } catch {
      // Keep current state on error
    } finally {
      setLoading(false);
    }
  }, [input, onChange]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInput(e.target.value);
    setIsOpen(true);
    setActiveIndex(0);
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (!isOpen) {
      if (e.key === 'ArrowDown' || e.key === 'Enter') {
        setIsOpen(true);
      }
      return;
    }

    switch (e.key) {
      case 'ArrowDown':
        e.preventDefault();
        setActiveIndex((prev) => (prev + 1) % totalItems);
        break;
      case 'ArrowUp':
        e.preventDefault();
        setActiveIndex((prev) => (prev - 1 + totalItems) % totalItems);
        break;
      case 'Enter':
        e.preventDefault();
        if (activeIndex < filteredCategories.length) {
          handleSelect(filteredCategories[activeIndex]);
        } else if (input.trim() && !hasExactMatch) {
          void handleCreateNew();
        }
        break;
      case 'Escape':
        setIsOpen(false);
        setActiveIndex(0);
        break;
    }
  };

  return (
    <div ref={containerRef} className="relative">
      <input
        ref={inputRef}
        type="text"
        value={input}
        onChange={handleInputChange}
        onFocus={() => {
          if (input.length > 0) setIsOpen(true);
        }}
        onKeyDown={handleKeyDown}
        placeholder={placeholder}
        className="w-full px-4 py-2.5 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl text-sm text-stone-800 dark:text-stone-200 placeholder-stone-400 dark:placeholder-stone-500 focus:outline-none focus:ring-2 focus:ring-gold-500 transition-all"
        role="combobox"
        aria-expanded={isOpen}
        aria-autocomplete="list"
        aria-haspopup="listbox"
      />

      {isOpen && totalItems > 0 && (
        <div
          className="absolute z-50 mt-1 w-full bg-white dark:bg-slate-900 border border-stone-200 dark:border-white/10 rounded-xl shadow-lg max-h-60 overflow-y-auto"
          role="listbox"
        >
          {filteredCategories.map((cat, index) => (
            <button
              key={cat.id}
              onClick={() => handleSelect(cat)}
              className={`w-full text-left px-4 py-2.5 text-sm transition-colors ${
                activeIndex === index
                  ? 'bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400'
                  : 'text-stone-700 dark:text-stone-300 hover:bg-gold-50 dark:hover:bg-gold-900/10'
              }`}
              role="option"
              aria-selected={activeIndex === index}
            >
              {cat.name}
            </button>
          ))}

          {input.trim() && !hasExactMatch && (
            <button
              onClick={() => void handleCreateNew()}
              disabled={loading}
              className={`w-full text-left px-4 py-2.5 text-sm transition-colors border-t border-stone-100 dark:border-white/5 ${
                activeIndex === filteredCategories.length
                  ? 'bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400'
                  : 'text-gold-600 dark:text-gold-500 hover:bg-gold-50 dark:hover:bg-gold-900/10'
              } ${loading ? 'opacity-50 cursor-not-allowed' : ''}`}
              role="option"
              aria-selected={activeIndex === filteredCategories.length}
            >
              {loading ? 'Creating...' : `Create new: ${titleCasedInput}`}
            </button>
          )}
        </div>
      )}
    </div>
  );
}
