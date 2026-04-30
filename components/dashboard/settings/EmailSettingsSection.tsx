'use client';

import { useState } from 'react';
import { Mail, Save, Loader2 } from 'lucide-react';
import { settingsService } from '@/services/settingsService';
import toast from 'react-hot-toast';
import type { SiteSetting } from '@/types';

interface EmailSettingsSectionProps {
  settings: SiteSetting[];
}

export default function EmailSettingsSection({ settings }: EmailSettingsSectionProps) {
  const emailSettings = settings.filter(s => s.category === 'email');
  const [values, setValues] = useState<Record<string, string>>(() => {
    const init: Record<string, string> = {};
    emailSettings.forEach(s => { init[s.key] = s.value; });
    return init;
  });
  const [saving, setSaving] = useState(false);

  const handleSave = async () => {
    setSaving(true);
    try {
      await settingsService.bulkUpsert(
        Object.entries(values).map(([key, value]) => ({ key, value }))
      );
      toast.success('Email settings saved');
    } catch (err) {
      toast.error('Failed to save email settings');
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
      <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4 flex items-center gap-2">
        <Mail className="w-5 h-5 text-gold-600" />
        Email Configuration
      </h2>
      <p className="text-sm text-stone-500 dark:text-stone-400 mb-6">
        Configure email addresses used for sending and receiving communications.
      </p>

      <div className="space-y-4">
        {emailSettings.map(setting => (
          <div key={setting.key}>
            <label htmlFor={setting.key} className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
              {setting.label}
            </label>
            <input
              id={setting.key}
              type="text"
              value={values[setting.key] ?? setting.value}
              onChange={(e) => setValues(prev => ({ ...prev, [setting.key]: e.target.value }))}
              className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
              placeholder={setting.label}
            />
            {setting.description && (
              <p className="text-xs text-stone-500 dark:text-stone-400 mt-1">{setting.description}</p>
            )}
          </div>
        ))}
      </div>

      <button
        onClick={() => void handleSave()}
        disabled={saving}
        className="flex items-center gap-2 px-4 py-2.5 bg-gold-600 text-white rounded-xl font-bold text-sm hover:bg-gold-700 transition-all disabled:opacity-50 mt-6"
      >
        {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
        {saving ? 'Saving...' : 'Save Email Settings'}
      </button>
    </div>
  );
}
