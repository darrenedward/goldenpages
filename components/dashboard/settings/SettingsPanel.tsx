'use client';

import { useState, useEffect } from 'react';
import { Settings, Loader2 } from 'lucide-react';
import { settingsService } from '@/services/settingsService';
import { usePermissions } from '@/lib/hooks/usePermissions';
import ProfileSection from './ProfileSection';
import PasswordSection from './PasswordSection';
import EmailSettingsSection from './EmailSettingsSection';
import NotificationSettingsSection from './NotificationSettingsSection';
import SocialLinksSection from './SocialLinksSection';
import type { SiteSetting } from '@/types';

export default function SettingsPanel() {
  const [settings, setSettings] = useState<SiteSetting[]>([]);
  const [loading, setLoading] = useState(true);
  const { canWriteContacts } = usePermissions();

  // Admin check: reuse editor+ permission as proxy for admin access to site settings
  const isAdmin = canWriteContacts;

  useEffect(() => {
    if (isAdmin) {
      void loadSettings();
    } else {
      setLoading(false);
    }
  }, [isAdmin]);

  const loadSettings = async () => {
    try {
      const data = await settingsService.getAll();
      setSettings(data);
    } catch (err) {
      console.error('Failed to load settings:', err);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="p-6 bg-stone-50 min-h-screen">
      <div className="mb-8">
        <h1 className="font-serif text-3xl font-bold text-slate-800 dark:text-white mb-2">Settings</h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24" />
      </div>

      <div className="space-y-6 max-w-2xl">
        {/* Always visible */}
        <ProfileSection />
        <PasswordSection />

        {/* Admin-only sections */}
        {isAdmin && (
          <>
            {loading ? (
              <div className="flex items-center justify-center py-12 text-stone-400">
                <Loader2 className="w-5 h-5 animate-spin mr-2" />
                Loading site settings...
              </div>
            ) : (
              <>
                <EmailSettingsSection settings={settings} />
                <NotificationSettingsSection settings={settings} />
                <SocialLinksSection />
              </>
            )}
          </>
        )}
      </div>
    </div>
  );
}
