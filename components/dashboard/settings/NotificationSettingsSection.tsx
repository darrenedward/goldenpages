'use client';

import { useState } from 'react';
import { Bell, Save, Loader2 } from 'lucide-react';
import { settingsService } from '@/services/settingsService';
import toast from 'react-hot-toast';
import type { SiteSetting } from '@/types';

interface NotificationSettingsSectionProps {
  settings: SiteSetting[];
}

export default function NotificationSettingsSection({ settings }: NotificationSettingsSectionProps) {
  const notifSettings = settings.filter(s => s.category === 'notification');
  const [values, setValues] = useState<Record<string, boolean>>(() => {
    const init: Record<string, boolean> = {};
    notifSettings.forEach(s => { init[s.key] = s.value === 'true'; });
    return init;
  });
  const [saving, setSaving] = useState(false);

  const toggle = (key: string) => {
    setValues(prev => ({ ...prev, [key]: !prev[key] }));
  };

  const handleSave = async () => {
    setSaving(true);
    try {
      await settingsService.bulkUpsert(
        Object.entries(values).map(([key, value]) => ({ key, value: String(value) }))
      );
      toast.success('Notification settings saved');
    } catch (err) {
      toast.error('Failed to save notification settings');
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
      <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4 flex items-center gap-2">
        <Bell className="w-5 h-5 text-gold-600" />
        Notification Settings
      </h2>
      <p className="text-sm text-stone-500 dark:text-stone-400 mb-6">
        Control which events trigger in-app notifications to admin users.
      </p>

      <div className="space-y-4">
        {notifSettings.map(setting => (
          <div key={setting.key} className="flex items-center justify-between py-2">
            <div>
              <p className="text-sm font-bold text-slate-800 dark:text-white">{setting.label}</p>
              {setting.description && (
                <p className="text-xs text-stone-500 dark:text-stone-400">{setting.description}</p>
              )}
            </div>
            <button
              type="button"
              onClick={() => toggle(setting.key)}
              className={`relative w-11 h-6 rounded-full transition-colors ${
                values[setting.key] ? 'bg-gold-600' : 'bg-stone-300 dark:bg-stone-700'
              }`}
            >
              <span
                className={`absolute top-0.5 left-0.5 w-5 h-5 bg-white rounded-full shadow transition-transform ${
                  values[setting.key] ? 'translate-x-5' : ''
                }`}
              />
            </button>
          </div>
        ))}
      </div>

      <button
        onClick={() => void handleSave()}
        disabled={saving}
        className="flex items-center gap-2 px-4 py-2.5 bg-gold-600 text-white rounded-xl font-bold text-sm hover:bg-gold-700 transition-all disabled:opacity-50 mt-6"
      >
        {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
        {saving ? 'Saving...' : 'Save Notification Settings'}
      </button>
    </div>
  );
}
