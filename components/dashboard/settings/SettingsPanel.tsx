'use client';

import { useState, useEffect } from 'react';
import { Loader2 } from 'lucide-react';
import { settingsService } from '@/services/settingsService';
import { usePermissions } from '@/lib/hooks/usePermissions';
import ProfileSection from './ProfileSection';
import DepartmentSection from './DepartmentSection';
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
    <div className="space-y-6 animate-fade-in pb-12">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-3xl font-serif font-bold text-slate-800 dark:text-white">Settings</h2>
          <p className="text-sm text-stone-500 dark:text-stone-400 mt-1">Manage your account and site configuration</p>
        </div>
      </div>

      <div className="space-y-6 max-w-2xl">
        {/* Always visible */}
        <ProfileSection />
        <DepartmentSection />
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
