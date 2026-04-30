'use client';

import { useState } from 'react';
import { Lock, Save } from 'lucide-react';
import { authService } from '@/services/authService';
import toast from 'react-hot-toast';

export default function PasswordSection() {
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [changingPassword, setChangingPassword] = useState(false);

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
  );
}
