'use client';

import { useState } from 'react';
import { X, Shield, Loader2 } from 'lucide-react';
import type { ManagedUser } from '@/types';

interface EditUserRolesModalProps {
  user: ManagedUser;
  open: boolean;
  onClose: () => void;
  onSaved: () => void;
}

const ROLES = [
  { name: 'admin', label: 'Admin', description: 'Full system access', color: 'text-red-500' },
  { name: 'editor', label: 'Editor', description: 'Read/write most data', color: 'text-blue-500' },
  { name: 'user', label: 'User', description: 'Read-only access', color: 'text-stone-500' },
];

export default function EditUserRolesModal({ user, open, onClose, onSaved }: EditUserRolesModalProps) {
  const [selectedRoles, setSelectedRoles] = useState<string[]>(user.roles || []);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  if (!open) return null;

  const toggleRole = (name: string) => {
    setSelectedRoles((prev) =>
      prev.includes(name) ? prev.filter((r) => r !== name) : [...prev, name]
    );
  };

  const handleSave = async () => {
    setError('');
    setLoading(true);

    try {
      const res = await fetch(`/api/admin/users/${user.id}/roles`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ roles: selectedRoles }),
      });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to update roles');
      }
      onSaved();
      onClose();
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to update roles');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm">
      <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-xl w-full max-w-md mx-4 overflow-hidden">
        <div className="flex items-center justify-between px-6 py-4 border-b border-stone-200 dark:border-stone-800">
          <div className="flex items-center gap-2">
            <Shield className="w-5 h-5 text-gold-600" />
            <h2 className="font-serif font-bold text-lg text-slate-800 dark:text-white">Edit Roles</h2>
          </div>
          <button type="button" onClick={onClose} className="p-1 hover:bg-stone-100 dark:hover:bg-stone-800 rounded-lg">
            <X className="w-5 h-5 text-stone-400" />
          </button>
        </div>

        <div className="p-6 space-y-5">
          {/* User info */}
          <div className="bg-stone-50 dark:bg-slate-800 rounded-lg px-4 py-3">
            <p className="text-sm font-medium text-slate-800 dark:text-white">{user.email}</p>
            {user.displayName && (
              <p className="text-xs text-stone-500 mt-0.5">{user.displayName}</p>
            )}
          </div>

          {/* Role checkboxes */}
          <div className="space-y-2">
            {ROLES.map((role) => (
              <label
                key={role.name}
                className={`flex items-center gap-3 p-3 rounded-lg border cursor-pointer transition-colors ${
                  selectedRoles.includes(role.name)
                    ? 'border-gold-400 bg-gold-50/50 dark:bg-gold-900/10'
                    : 'border-stone-200 dark:border-stone-700 hover:bg-stone-50 dark:hover:bg-stone-800/50'
                }`}
              >
                <input
                  type="checkbox"
                  checked={selectedRoles.includes(role.name)}
                  onChange={() => toggleRole(role.name)}
                  className="rounded"
                />
                <div>
                  <span className={`text-sm font-medium ${role.color}`}>
                    {role.label}
                  </span>
                  <p className="text-xs text-stone-500">{role.description}</p>
                </div>
              </label>
            ))}
          </div>

          {error && (
            <p className="text-sm text-red-600 bg-red-50 dark:bg-red-900/20 rounded-lg px-3 py-2">{error}</p>
          )}

          <div className="flex gap-3 pt-2">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 px-4 py-2.5 text-sm font-medium text-stone-600 dark:text-stone-400 border border-stone-200 dark:border-stone-700 rounded-lg hover:bg-stone-50 dark:hover:bg-stone-800 transition-colors"
            >
              Cancel
            </button>
            <button
              type="button"
              onClick={handleSave}
              disabled={loading || selectedRoles.length === 0}
              className="flex-1 px-4 py-2.5 text-sm font-medium text-white bg-gradient-to-r from-gold-600 to-gold-500 rounded-lg hover:from-gold-700 hover:to-gold-600 disabled:opacity-50 transition-colors flex items-center justify-center gap-2"
            >
              {loading && <Loader2 className="w-4 h-4 animate-spin" />}
              Save Changes
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
