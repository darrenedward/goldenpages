'use client';

import { useState } from 'react';
import { useForm, Controller } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import { X, Mail, Shield, Loader2 } from 'lucide-react';

interface InviteUserModalProps {
  open: boolean;
  onClose: () => void;
  onInvited: () => void;
}

const ROLES = [
  { name: 'admin', label: 'Admin', description: 'Full system access — manage users, settings, and all data' },
  { name: 'editor', label: 'Editor', description: 'Read/write most data — cannot delete or manage users' },
  { name: 'user', label: 'User', description: 'Read-only access to organizations, contacts, and channels' },
];

const inviteSchema = z.object({
  email: z.string().email('Please enter a valid email'),
  roleName: z.enum(['admin', 'editor', 'user']),
});
type InviteFormValues = z.infer<typeof inviteSchema>;

export default function InviteUserModal({ open, onClose, onInvited }: InviteUserModalProps) {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const { register, handleSubmit, control, formState: { errors }, reset } = useForm<InviteFormValues>({
    resolver: zodResolver(inviteSchema),
    defaultValues: { email: '', roleName: 'user' },
  });

  if (!open) return null;

  const onSubmit = async (data: InviteFormValues) => {
    setError('');
    setLoading(true);

    try {
      const res = await fetch('/api/admin/invite', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email: data.email.trim().toLowerCase(), roleName: data.roleName }),
      });
      const result = await res.json();
      if (!res.ok) throw new Error(result.error || 'Failed to invite');

      reset();
      onInvited();
      onClose();
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to invite user');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm">
      <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-xl w-full max-w-md mx-4 overflow-hidden">
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b border-stone-200 dark:border-stone-800">
          <div className="flex items-center gap-2">
            <Mail className="w-5 h-5 text-gold-600" />
            <h2 className="font-serif font-bold text-lg text-slate-800 dark:text-white">Invite New User</h2>
          </div>
          <button type="button" onClick={onClose} className="p-1 hover:bg-stone-100 dark:hover:bg-stone-800 rounded-lg">
            <X className="w-5 h-5 text-stone-400" />
          </button>
        </div>

        <form onSubmit={handleSubmit(onSubmit)} className="p-6 space-y-5">
          {/* Email */}
          <div>
            <label className="block text-sm font-medium text-stone-700 dark:text-stone-300 mb-1.5">
              Email Address
            </label>
            <input
              type="email"
              {...register('email')}
              placeholder="colleague@example.com"
              className="w-full px-3 py-2.5 border border-stone-200 dark:border-stone-700 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-gold-400 bg-white dark:bg-slate-800 dark:text-white"
            />
            {errors.email && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.email.message}</p>}
            <p className="text-xs text-stone-400 mt-1">
              An invite link will be sent to this email. The link is one-time use.
            </p>
          </div>

          {/* Role */}
          <div>
            <label className="block text-sm font-medium text-stone-700 dark:text-stone-300 mb-2">
              Assign Role
            </label>
            <Controller
              control={control}
              name="roleName"
              render={({ field }) => (
                <div className="space-y-2">
                  {ROLES.map((role) => (
                    <label
                      key={role.name}
                      className={`flex items-start gap-3 p-3 rounded-lg border cursor-pointer transition-colors ${
                        field.value === role.name
                          ? 'border-gold-400 bg-gold-50/50 dark:bg-gold-900/10'
                          : 'border-stone-200 dark:border-stone-700 hover:bg-stone-50 dark:hover:bg-stone-800/50'
                      }`}
                    >
                      <input
                        type="radio"
                        name="role"
                        value={role.name}
                        checked={field.value === role.name}
                        onChange={() => field.onChange(role.name)}
                        className="mt-0.5"
                      />
                      <div>
                        <div className="flex items-center gap-2">
                          <Shield className={`w-3.5 h-3.5 ${
                            role.name === 'admin' ? 'text-red-500' :
                            role.name === 'editor' ? 'text-blue-500' : 'text-stone-500'
                          }`} />
                          <span className="text-sm font-medium text-slate-800 dark:text-white">{role.label}</span>
                        </div>
                        <p className="text-xs text-stone-500 mt-0.5">{role.description}</p>
                      </div>
                    </label>
                  ))}
                </div>
              )}
            />
          </div>

          {/* Error */}
          {error && (
            <p className="text-sm text-red-600 bg-red-50 dark:bg-red-900/20 rounded-lg px-3 py-2">{error}</p>
          )}

          {/* Actions */}
          <div className="flex gap-3 pt-2">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 px-4 py-2.5 text-sm font-medium text-stone-600 dark:text-stone-400 border border-stone-200 dark:border-stone-700 rounded-lg hover:bg-stone-50 dark:hover:bg-stone-800 transition-colors"
            >
              Cancel
            </button>
            <button
              type="submit"
              disabled={loading}
              className="flex-1 px-4 py-2.5 text-sm font-medium text-white bg-gradient-to-r from-gold-600 to-gold-500 rounded-lg hover:from-gold-700 hover:to-gold-600 disabled:opacity-50 transition-colors flex items-center justify-center gap-2"
            >
              {loading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Mail className="w-4 h-4" />}
              Send Invite
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
