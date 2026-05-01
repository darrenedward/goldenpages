'use client';

import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import { Lock, Save } from 'lucide-react';
import { authService } from '@/services/authService';
import toast from 'react-hot-toast';

const passwordSchema = z.object({
  newPassword: z.string().min(8, 'Password must be at least 8 characters'),
  confirmPassword: z.string(),
}).refine(data => data.newPassword === data.confirmPassword, {
  message: 'Passwords do not match',
  path: ['confirmPassword'],
});
type PasswordFormValues = z.infer<typeof passwordSchema>;

export default function PasswordSection() {
  const [changingPassword, setChangingPassword] = useState(false);

  const { register, handleSubmit, formState: { errors }, reset } = useForm<PasswordFormValues>({
    resolver: zodResolver(passwordSchema),
  });

  const onSubmit = async (data: PasswordFormValues) => {
    setChangingPassword(true);
    try {
      await authService.updatePassword(data.newPassword);
      reset();
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
      <form onSubmit={handleSubmit(onSubmit)} noValidate className="space-y-4">
        <div>
          <label htmlFor="newPassword" className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
            New Password
          </label>
          <input
            id="newPassword"
            type="password"
            {...register('newPassword')}
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
            placeholder="Minimum 8 characters"
          />
          {errors.newPassword && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.newPassword.message}</p>}
        </div>
        <div>
          <label htmlFor="confirmPassword" className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
            Confirm New Password
          </label>
          <input
            id="confirmPassword"
            type="password"
            {...register('confirmPassword')}
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
            placeholder="Repeat new password"
          />
          {errors.confirmPassword && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.confirmPassword.message}</p>}
        </div>
        <button
          type="submit"
          disabled={changingPassword}
          className="flex items-center gap-2 px-4 py-2.5 bg-gold-600 text-white rounded-xl font-bold text-sm hover:bg-gold-700 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
        >
          <Save className="w-4 h-4" />
          {changingPassword ? 'Updating...' : 'Update Password'}
        </button>
      </form>
    </div>
  );
}
