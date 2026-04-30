'use client';

import { useState, useEffect, useCallback } from 'react';
import { UserPlus, Shield, ShieldCheck, Edit3, Trash2, Search, RefreshCw, Loader2, Users, AlertTriangle } from 'lucide-react';
import { userManagementService } from '@/services/userManagementService';
import { useAuth } from '@/lib/authContext';
import InviteUserModal from './InviteUserModal';
import EditUserRolesModal from './EditUserRolesModal';
import type { ManagedUser } from '@/types';

const ROLE_BADGES: Record<string, { label: string; color: string }> = {
  admin: { label: 'Admin', color: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400' },
  editor: { label: 'Editor', color: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400' },
  user: { label: 'User', color: 'bg-stone-100 text-stone-600 dark:bg-stone-800 dark:text-stone-400' },
};

export default function UserManagementPanel() {
  const { user: currentUser } = useAuth();
  const [users, setUsers] = useState<ManagedUser[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const [showInvite, setShowInvite] = useState(false);
  const [editingUser, setEditingUser] = useState<ManagedUser | null>(null);
  const [removingUser, setRemovingUser] = useState<ManagedUser | null>(null);
  const [removing, setRemoving] = useState(false);

  const fetchUsers = useCallback(async () => {
    setLoading(true);
    try {
      const data = await userManagementService.getAllUsers();
      setUsers(data);
    } catch (err) {
      console.error('Failed to fetch users:', err);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void fetchUsers();
  }, [fetchUsers]);

  const filtered = search
    ? users.filter((u) =>
        u.email.toLowerCase().includes(search.toLowerCase()) ||
        (u.displayName && u.displayName.toLowerCase().includes(search.toLowerCase()))
      )
    : users;

  const handleRemove = async () => {
    if (!removingUser) return;
    setRemoving(true);
    try {
      await userManagementService.removeUser(removingUser.id);
      setRemovingUser(null);
      void fetchUsers();
    } catch (err) {
      console.error('Failed to remove user:', err);
    } finally {
      setRemoving(false);
    }
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const now = new Date();
    const diffMs = now.getTime() - date.getTime();
    const diffDays = Math.floor(diffMs / 86400000);
    if (diffDays < 1) return 'Today';
    if (diffDays < 7) return `${diffDays}d ago`;
    if (diffDays < 30) return `${Math.floor(diffDays / 7)}w ago`;
    return date.toLocaleDateString();
  };

  return (
    <div className="h-full flex flex-col">
      {/* Header */}
      <div className="px-6 py-4 border-b border-stone-200 dark:border-stone-800 bg-white dark:bg-slate-900">
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-gold-100 to-gold-200 dark:from-gold-900/30 dark:to-gold-800/20 flex items-center justify-center">
              <Users className="w-5 h-5 text-gold-600" />
            </div>
            <div>
              <h2 className="text-xl font-serif font-bold text-slate-800 dark:text-white">User Management</h2>
              <p className="text-sm text-stone-500">
                {users.length} user{users.length !== 1 ? 's' : ''} registered
              </p>
            </div>
          </div>
          <div className="flex items-center gap-2">
            <button
              type="button"
              onClick={() => void fetchUsers()}
              className="p-2 text-stone-500 hover:text-stone-700 dark:hover:text-stone-300 hover:bg-stone-100 dark:hover:bg-stone-800 rounded-lg transition-colors"
            >
              <RefreshCw className="w-4 h-4" />
            </button>
            <button
              type="button"
              onClick={() => setShowInvite(true)}
              className="flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-gradient-to-r from-gold-600 to-gold-500 rounded-lg hover:from-gold-700 hover:to-gold-600 transition-colors"
            >
              <UserPlus className="w-4 h-4" />
              Invite User
            </button>
          </div>
        </div>

        {/* Search */}
        <div className="relative max-w-sm">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-stone-400" />
          <input
            type="text"
            placeholder="Search by email or name..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full pl-9 pr-3 py-2 text-sm border border-stone-200 dark:border-stone-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-gold-400 bg-white dark:bg-slate-800 dark:text-white"
          />
        </div>
      </div>

      {/* User list */}
      <div className="flex-1 overflow-y-auto">
        {loading ? (
          <div className="flex items-center justify-center py-16 text-stone-400">
            <Loader2 className="w-6 h-6 animate-spin mr-2" />
            Loading users...
          </div>
        ) : filtered.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-16 text-stone-400">
            <Users className="h-10 w-10 mb-3" />
            <p className="text-sm">{search ? 'No users match your search' : 'No users found'}</p>
          </div>
        ) : (
          <div className="divide-y divide-stone-100 dark:divide-stone-800">
            {filtered.map((u) => {
              const isSelf = u.id === currentUser?.id;
              return (
                <div
                  key={u.id}
                  className="px-6 py-4 flex items-center justify-between hover:bg-stone-50 dark:hover:bg-stone-800/30 transition-colors"
                >
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <p className="text-sm font-medium text-slate-800 dark:text-white truncate">
                        {u.displayName || u.email}
                      </p>
                      {isSelf && (
                        <span className="text-[10px] font-medium text-gold-600 bg-gold-50 dark:bg-gold-900/20 px-1.5 py-0.5 rounded">
                          YOU
                        </span>
                      )}
                    </div>
                    {u.displayName && (
                      <p className="text-xs text-stone-500 truncate">{u.email}</p>
                    )}
                    <div className="flex items-center gap-1.5 mt-1.5">
                      {u.roles.length === 0 ? (
                        <span className="text-xs text-stone-400 italic">No role assigned</span>
                      ) : (
                        u.roles.map((role) => {
                          const badge = ROLE_BADGES[role] || ROLE_BADGES.user;
                          return (
                            <span
                              key={role}
                              className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-semibold ${badge.color}`}
                            >
                              {role === 'admin' ? <ShieldCheck className="w-3 h-3" /> : <Shield className="w-3 h-3" />}
                              {badge.label}
                            </span>
                          );
                        })
                      )}
                      <span className="text-[10px] text-stone-300 ml-1">{formatDate(u.createdAt)}</span>
                    </div>
                  </div>

                  {!isSelf && (
                    <div className="flex items-center gap-1 ml-4">
                      <button
                        type="button"
                        onClick={() => setEditingUser(u)}
                        className="p-2 text-stone-400 hover:text-blue-600 hover:bg-blue-50 dark:hover:bg-blue-900/20 rounded-lg transition-colors"
                        title="Edit roles"
                      >
                        <Edit3 className="w-4 h-4" />
                      </button>
                      <button
                        type="button"
                        onClick={() => setRemovingUser(u)}
                        className="p-2 text-stone-400 hover:text-red-600 hover:bg-red-50 dark:hover:bg-red-900/20 rounded-lg transition-colors"
                        title="Remove user"
                      >
                        <Trash2 className="w-4 h-4" />
                      </button>
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        )}
      </div>

      {/* Modals */}
      <InviteUserModal
        open={showInvite}
        onClose={() => setShowInvite(false)}
        onInvited={() => void fetchUsers()}
      />

      <EditUserRolesModal
        user={editingUser!}
        open={!!editingUser}
        onClose={() => setEditingUser(null)}
        onSaved={() => void fetchUsers()}
      />

      {/* Remove confirmation */}
      {removingUser && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm">
          <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-xl w-full max-w-sm mx-4 overflow-hidden">
            <div className="p-6 text-center">
              <div className="w-12 h-12 rounded-full bg-red-100 dark:bg-red-900/20 flex items-center justify-center mx-auto mb-4">
                <AlertTriangle className="w-6 h-6 text-red-600" />
              </div>
              <h3 className="font-serif font-bold text-lg text-slate-800 dark:text-white mb-2">Remove User</h3>
              <p className="text-sm text-stone-600 dark:text-stone-400">
                Remove <strong>{removingUser.email}</strong>? This will delete their account and all associated data. This cannot be undone.
              </p>
            </div>
            <div className="flex border-t border-stone-200 dark:border-stone-800">
              <button
                type="button"
                onClick={() => setRemovingUser(null)}
                className="flex-1 px-4 py-3 text-sm font-medium text-stone-600 dark:text-stone-400 hover:bg-stone-50 dark:hover:bg-stone-800 transition-colors"
              >
                Cancel
              </button>
              <button
                type="button"
                onClick={() => void handleRemove()}
                disabled={removing}
                className="flex-1 px-4 py-3 text-sm font-medium text-red-600 hover:bg-red-50 dark:hover:bg-red-900/20 transition-colors border-l border-stone-200 dark:border-stone-800"
              >
                {removing ? 'Removing...' : 'Remove'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
