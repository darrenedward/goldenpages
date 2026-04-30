'use client';

import { useState } from 'react';
import { User, Lock, Bell, Shield, Save, CheckCircle2 } from 'lucide-react';
import { useAuth } from '@/lib/authContext';
import { authService } from '@/services/authService';
import toast from 'react-hot-toast';

export default function SettingsPanel() {
  const { user } = useAuth();
  const [currentPassword, setCurrentPassword] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [changingPassword, setChangingPassword] = useState(false);
  const [emailNotifications, setEmailNotifications] = useState(true);

  const handleChangePassword = async (e: React.FormEvent) => {
    e.preventDefault();
    if (newPassword !== confirmPassword) {
      toast.error('Passwords do not match');
      return;
    }
    if (newPassword.length < 8) {
      toast.error('Password must be at least 8 characters');
      return;
    }
    setChangingPassword(true);
    try {
      await authService.updatePassword(newPassword);
      setCurrentPassword('');
      setNewPassword('');
      setConfirmPassword('');
      toast.success('Password updated successfully');
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to update password');
    } finally {
      setChangingPassword(false);
    }
  };

  return (
    <div className="p-6 bg-stone-50 min-h-screen">
      <div className="mb-8">
        <h1 className="font-serif text-3xl font-bold text-slate-800 dark:text-white mb-2">Settings</h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24" />
      </div>

      <div className="space-y-6 max-w-2xl">
        {/* Profile Info */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4 flex items-center gap-2">
            <User className="w-5 h-5 text-gold-600" />
            Profile
          </h2>
          <div className="space-y-4">
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
              <p className="text-xs text-stone-500 dark:text-stone-400 mt-1">Email is managed by your authentication provider and cannot be changed here.</p>
            </div>
          </div>
        </div>

        {/* Change Password */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4 flex items-center gap-2">
            <Lock className="w-5 h-5 text-gold-600" />
            Change Password
          </h2>
          <form onSubmit={handleChangePassword} className="space-y-4">
            <div>
              <label htmlFor="newPassword" className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
                New Password
              </label>
              <input
                id="newPassword"
                type="password"
                required
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
                placeholder="Minimum 8 characters"
              />
            </div>
            <div>
              <label htmlFor="confirmPassword" className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
                Confirm New Password
              </label>
              <input
                id="confirmPassword"
                type="password"
                required
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
                placeholder="Repeat new password"
              />
            </div>
            <button
              type="submit"
              disabled={changingPassword || !newPassword || !confirmPassword}
              className="flex items-center gap-2 px-4 py-2.5 bg-gold-600 text-white rounded-xl font-bold text-sm hover:bg-gold-700 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <Save className="w-4 h-4" />
              {changingPassword ? 'Updating...' : 'Update Password'}
            </button>
          </form>
        </div>

        {/* Notifications */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4 flex items-center gap-2">
            <Bell className="w-5 h-5 text-gold-600" />
            Notifications
          </h2>
          <div className="flex items-center justify-between py-2">
            <div>
              <p className="text-sm font-bold text-slate-800 dark:text-white">Email Notifications</p>
              <p className="text-xs text-stone-500 dark:text-stone-400">Receive updates about communications and packages</p>
            </div>
            <button
              type="button"
              onClick={() => setEmailNotifications(!emailNotifications)}
              className={`relative w-11 h-6 rounded-full transition-colors ${
                emailNotifications ? 'bg-gold-600' : 'bg-stone-300 dark:bg-stone-700'
              }`}
            >
              <span
                className={`absolute top-0.5 left-0.5 w-5 h-5 bg-white rounded-full shadow transition-transform ${
                  emailNotifications ? 'translate-x-5' : ''
                }`}
              />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
