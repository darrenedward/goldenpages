'use client';

import { User, Shield } from 'lucide-react';
import { useAuth } from '@/lib/authContext';

export default function ProfileSection() {
  const { user } = useAuth();

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
      <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4 flex items-center gap-2">
        <User className="w-5 h-5 text-gold-600" />
        Profile
      </h2>
      <div>
        <label className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">Email</label>
        <div className="flex items-center gap-2">
          <input
            type="text"
            value={user?.email || ''}
            disabled
            className="flex-1 px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-sm text-stone-500 dark:text-stone-400"
          />
          <Shield className="w-4 h-4 text-stone-400 dark:text-stone-500" />
        </div>
        <p className="text-xs text-stone-500 dark:text-stone-400 mt-1">
          Email is managed by your authentication provider and cannot be changed here.
        </p>
      </div>
    </div>
  );
}
