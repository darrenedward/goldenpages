'use client';

import { useState } from 'react';
import { User, Shield, Briefcase, Loader2 } from 'lucide-react';
import { useAuth } from '@/lib/authContext';

function toTitleCase(str: string): string {
  const minors = new Set([
    'a', 'an', 'and', 'as', 'at', 'but', 'by', 'for', 'in', 'nor', 'of', 'on', 'or', 'the', 'to', 'via',
  ]);
  return str.replace(/\w\S*/g, (word, index: number) => {
    if (index !== 0 && minors.has(word.toLowerCase())) return word.toLowerCase();
    return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
  });
}

export default function ProfileSection() {
  const { user, userTitle, refreshPermissions } = useAuth();
  const [title, setTitle] = useState(userTitle || '');
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  const handleSave = async () => {
    setSaving(true);
    setSaved(false);
    try {
      const formatted = title ? toTitleCase(title) : '';
      const res = await fetch('/api/user/profile', {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ title: formatted || null }),
      });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to save');
      }
      setTitle(formatted);
      await refreshPermissions();
      setSaved(true);
      setTimeout(() => setSaved(false), 2000);
    } catch (err) {
      console.error('Failed to save title:', err);
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6 space-y-5">
      <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-0 flex items-center gap-2">
        <User className="w-5 h-5 text-gold-600" />
        Profile
      </h2>

      {/* Email */}
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

      {/* Title / Position */}
      <div>
        <label className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
          <Briefcase className="w-3.5 h-3.5 inline mr-1.5 -mt-0.5" />
          Title / Position
        </label>
        <div className="flex gap-2">
          <input
            type="text"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            onBlur={() => title && setTitle(toTitleCase(title))}
            placeholder="e.g. Harbour Master for Aotearoa & Pacifica"
            className="flex-1 px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          />
          <button
            type="button"
            onClick={handleSave}
            disabled={saving}
            className="px-4 py-2 text-sm font-medium text-white bg-gradient-to-r from-gold-600 to-gold-500 rounded-xl hover:from-gold-700 hover:to-gold-600 disabled:opacity-50 transition-colors flex items-center gap-1.5"
          >
            {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : saved ? 'Saved!' : 'Save'}
          </button>
        </div>
        <p className="text-xs text-stone-500 dark:text-stone-400 mt-1">
          Your professional title appears on communications you send. Automatically formatted to Title Case.
        </p>
      </div>
    </div>
  );
}
