'use client';

import { useState, useEffect, useRef, useCallback } from 'react';
import { Search, X, Loader2 } from 'lucide-react';
import { supabase } from '@/services/supabaseClient';

interface UserResult {
  id: string;
  email: string;
  displayName: string | null;
}

interface UserSearchInputProps {
  selectedUsers: UserResult[];
  onAdd: (user: UserResult) => void;
  onRemove: (userId: string) => void;
  placeholder?: string;
}

export default function UserSearchInput({
  selectedUsers,
  onAdd,
  onRemove,
  placeholder = 'Search users by name or email...',
}: UserSearchInputProps) {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<UserResult[]>([]);
  const [searching, setSearching] = useState(false);
  const [showDropdown, setShowDropdown] = useState(false);
  const debounceRef = useRef<ReturnType<typeof setTimeout>>();
  const containerRef = useRef<HTMLDivElement>(null);

  const searchUsers = useCallback(async (searchQuery: string) => {
    if (!searchQuery.trim() || searchQuery.length < 2) {
      setResults([]);
      return;
    }

    setSearching(true);
    try {
      const { data, error } = await supabase
        .from('users')
        .select('id, email, display_name')
        .or(`email.ilike.%${searchQuery}%,display_name.ilike.%${searchQuery}%`)
        .limit(10);

      if (error) throw error;
      setResults((data || []).map((u: Record<string, unknown>) => ({
        id: u.id as string,
        email: u.email as string,
        displayName: u.display_name as string | null,
      })));
    } catch {
      setResults([]);
    } finally {
      setSearching(false);
    }
  }, []);

  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => searchUsers(query), 300);
    return () => { if (debounceRef.current) clearTimeout(debounceRef.current); };
  }, [query, searchUsers]);

  // Close dropdown on outside click
  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (containerRef.current && !containerRef.current.contains(e.target as Node)) {
        setShowDropdown(false);
      }
    };
    document.addEventListener('mousedown', handler);
    return () => document.removeEventListener('mousedown', handler);
  }, []);

  const selectedIds = new Set(selectedUsers.map(u => u.id));
  const filteredResults = results.filter(u => !selectedIds.has(u.id));

  return (
    <div ref={containerRef} className="relative">
      {/* Selected users chips */}
      {selectedUsers.length > 0 && (
        <div className="flex flex-wrap gap-1.5 mb-2">
          {selectedUsers.map(user => (
            <span
              key={user.id}
              className="inline-flex items-center gap-1 px-2.5 py-1 bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 rounded-lg text-xs font-semibold"
            >
              {user.displayName || user.email}
              <button
                type="button"
                onClick={() => onRemove(user.id)}
                className="hover:text-gold-900 dark:hover:text-gold-200"
              >
                <X className="w-3 h-3" />
              </button>
            </span>
          ))}
        </div>
      )}

      {/* Search input */}
      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
        <input
          type="text"
          value={query}
          onChange={(e) => {
            setQuery(e.target.value);
            setShowDropdown(true);
          }}
          onFocus={() => setShowDropdown(true)}
          placeholder={placeholder}
          className="w-full pl-10 pr-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-gold-500"
        />
        {searching && (
          <Loader2 className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400 animate-spin" />
        )}
      </div>

      {/* Dropdown */}
      {showDropdown && (filteredResults.length > 0 || (query.length >= 2 && !searching && filteredResults.length === 0)) && (
        <div className="absolute z-50 w-full mt-1 bg-white dark:bg-slate-900 border border-stone-200 dark:border-white/5 rounded-xl shadow-lg max-h-48 overflow-y-auto">
          {filteredResults.length === 0 && query.length >= 2 && !searching ? (
            <div className="px-4 py-3 text-sm text-stone-400">No users found</div>
          ) : (
            filteredResults.map(user => (
              <button
                key={user.id}
                type="button"
                onClick={() => {
                  onAdd(user);
                  setQuery('');
                  setShowDropdown(false);
                }}
                className="w-full text-left px-4 py-2.5 hover:bg-stone-50 dark:hover:bg-stone-800 transition-colors flex items-center gap-3"
              >
                <div className="w-7 h-7 rounded-full bg-gold-100 dark:bg-gold-900/30 flex items-center justify-center text-gold-700 dark:text-gold-400 text-xs font-bold">
                  {(user.displayName || user.email)[0].toUpperCase()}
                </div>
                <div>
                  <p className="text-sm font-medium text-stone-800 dark:text-white">
                    {user.displayName || 'Unnamed'}
                  </p>
                  <p className="text-xs text-stone-400">{user.email}</p>
                </div>
              </button>
            ))
          )}
        </div>
      )}
    </div>
  );
}
