'use client';

import React from 'react';
import { Trash2, Database } from 'lucide-react';

interface AdminPanelProps {
  onClear: () => void;
  onRefresh: () => void;
}

export default function AdminPanel({ onClear, onRefresh }: AdminPanelProps) {
  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="flex items-center justify-between">
        <h2 className="text-3xl font-serif font-bold text-slate-800 dark:text-white">System Administration</h2>
        <span className="px-3 py-1 bg-gold-100 text-gold-700 text-[10px] font-black uppercase tracking-widest rounded-full border border-gold-200">
          System Status: Operational
        </span>
      </div>
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-10 space-y-8">
        <div>
          <h3 className="text-xl font-serif font-black text-slate-800 dark:text-white mb-2">Database Seeding</h3>
          <p className="text-sm text-stone-500 max-w-lg mb-4">
            The database uses real data extracted from Excel spreadsheets. See <code className="bg-stone-100 px-2 py-1 rounded">SEEDING.md</code> for instructions.
          </p>
          <div className="bg-stone-50 dark:bg-white/5 rounded-xl p-4 text-sm space-y-2">
            <div className="flex items-center justify-between">
              <span className="text-stone-600 dark:text-stone-400">Total Organizations:</span>
              <span className="font-bold text-slate-800 dark:text-white">64</span>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-stone-600 dark:text-stone-400">Total Contacts:</span>
              <span className="font-bold text-slate-800 dark:text-white">1,028</span>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-stone-600 dark:text-stone-400">Contact Channels:</span>
              <span className="font-bold text-slate-800 dark:text-white">2,720</span>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-stone-600 dark:text-stone-400">Departments:</span>
              <span className="font-bold text-slate-800 dark:text-white">127</span>
            </div>
          </div>
        </div>
        <div className="flex flex-wrap gap-4">
          <button onClick={onClear} className="bg-red-50 text-red-600 border border-red-100 px-8 py-3 rounded-2xl font-bold hover:bg-red-100 transition-all flex items-center gap-3">
            <Trash2 size={18} /> Clear All Data
          </button>
          <button onClick={onRefresh} className="bg-emerald-50 text-emerald-600 border border-emerald-100 px-8 py-3 rounded-2xl font-bold hover:bg-emerald-100 transition-all flex items-center gap-3">
            <Database size={18} /> Refresh Data
          </button>
        </div>
      </div>
    </div>
  );
}
