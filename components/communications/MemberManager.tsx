'use client';

import { useState, useEffect, useCallback } from 'react';
import { Users, UserPlus, X, Crown, Shield, User } from 'lucide-react';
import { communicationMemberService } from '@/services/communicationMemberService';
import { useAuth } from '@/lib/authContext';
import UserSearchInput from '@/components/shared/UserSearchInput';
import toast from 'react-hot-toast';
import type { CommunicationMember, CommunicationMemberRole, UserResult } from '@/types';

interface MemberManagerProps {
  communicationId: string;
}

const ROLE_CONFIG: Record<CommunicationMemberRole, { label: string; icon: React.ReactNode; color: string }> = {
  owner: { label: 'Owner', icon: <Crown className="w-3.5 h-3.5" />, color: 'bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400' },
  assignee: { label: 'Assignee', icon: <Shield className="w-3.5 h-3.5" />, color: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400' },
  collaborator: { label: 'Collaborator', icon: <User className="w-3.5 h-3.5" />, color: 'bg-stone-100 text-stone-600 dark:bg-stone-800 dark:text-stone-400' },
};

export default function MemberManager({ communicationId }: MemberManagerProps) {
  const { user } = useAuth();
  const [members, setMembers] = useState<CommunicationMember[]>([]);
  const [loading, setLoading] = useState(true);
  const [showAdd, setShowAdd] = useState(false);
  const [addRole, setAddRole] = useState<CommunicationMemberRole>('collaborator');
  const [selectedUsers, setSelectedUsers] = useState<UserResult[]>([]);
  const [adding, setAdding] = useState(false);

  const fetchMembers = useCallback(async () => {
    try {
      const data = await communicationMemberService.getMembers(communicationId);
      setMembers(data);
    } catch (err) {
      console.error('[MemberManager] Failed to fetch members:', err);
    } finally {
      setLoading(false);
    }
  }, [communicationId]);

  useEffect(() => {
    fetchMembers();
  }, [fetchMembers]);

  const currentRole = members.find(m => m.userId === user?.id)?.role ?? null;
  const canManage = currentRole === 'owner' || currentRole === 'assignee';
  const isOwner = currentRole === 'owner';

  const handleAddMembers = async () => {
    if (selectedUsers.length === 0) return;
    setAdding(true);
    try {
      for (const u of selectedUsers) {
        await communicationMemberService.addMember(
          communicationId,
          u.id,
          addRole,
          user?.id || ''
        );
      }
      toast.success(`Added ${selectedUsers.length} member(s)`);
      setSelectedUsers([]);
      setShowAdd(false);
      fetchMembers();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to add member');
    } finally {
      setAdding(false);
    }
  };

  const handleRemoveMember = async (member: CommunicationMember) => {
    if (member.role === 'owner') {
      toast.error('Cannot remove the owner');
      return;
    }
    try {
      await communicationMemberService.removeMember(
        communicationId,
        member.userId,
        user?.id || ''
      );
      toast.success('Member removed');
      fetchMembers();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to remove member');
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center py-6 text-stone-400">
        <div className="w-5 h-5 border-2 border-gold-200 border-t-gold-600 rounded-full animate-spin mr-2" />
        Loading members...
      </div>
    );
  }

  return (
    <div>
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-2">
          <Users className="w-5 h-5 text-gold-600" />
          <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white">
            Team ({members.length})
          </h3>
        </div>
        {canManage && (
          <button
            type="button"
            onClick={() => setShowAdd(!showAdd)}
            className="flex items-center gap-1.5 px-3 py-1.5 bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 rounded-xl text-sm font-semibold hover:bg-gold-100 dark:hover:bg-gold-900/30 transition-colors"
          >
            <UserPlus className="w-4 h-4" />
            Add Member
          </button>
        )}
      </div>

      {/* Add member panel */}
      {showAdd && (
        <div className="mb-4 p-4 bg-stone-50 dark:bg-stone-800/50 rounded-xl border border-stone-200 dark:border-white/5 space-y-3">
          <UserSearchInput
            selectedUsers={selectedUsers}
            onAdd={(u) => setSelectedUsers(prev => [...prev, u])}
            onRemove={(id) => setSelectedUsers(prev => prev.filter(u => u.id !== id))}
          />

          <div className="flex items-center gap-3">
            <label className="text-sm font-bold text-stone-600 dark:text-stone-400">Role:</label>
            <div className="flex gap-1.5">
              {(['assignee', 'collaborator'] as CommunicationMemberRole[]).filter(r => isOwner || r === 'collaborator').map(role => {
                const config = ROLE_CONFIG[role];
                return (
                  <button
                    key={role}
                    type="button"
                    onClick={() => setAddRole(role)}
                    className={`flex items-center gap-1 px-3 py-1.5 rounded-lg text-xs font-semibold transition-all ${
                      addRole === role
                        ? config.color + ' ring-2 ring-offset-1 ring-gold-400'
                        : 'bg-stone-100 dark:bg-stone-800 text-stone-500'
                    }`}
                  >
                    {config.icon}
                    {config.label}
                  </button>
                );
              })}
            </div>
          </div>

          <div className="flex gap-2">
            <button
              type="button"
              onClick={handleAddMembers}
              disabled={adding || selectedUsers.length === 0}
              className="px-4 py-2 bg-gold-600 text-white rounded-xl text-sm font-bold hover:bg-gold-700 disabled:opacity-50 transition-all"
            >
              {adding ? 'Adding...' : `Add ${selectedUsers.length} Member${selectedUsers.length !== 1 ? 's' : ''}`}
            </button>
            <button
              type="button"
              onClick={() => { setShowAdd(false); setSelectedUsers([]); }}
              className="px-4 py-2 bg-stone-100 dark:bg-stone-800 text-stone-600 rounded-xl text-sm font-bold hover:bg-stone-200 transition-all"
            >
              Cancel
            </button>
          </div>
        </div>
      )}

      {/* Members list */}
      <div className="space-y-1">
        {members.map(member => {
          const config = ROLE_CONFIG[member.role];
          const name = member.user?.displayName || member.user?.email || 'Unknown';
          const initials = (member.user?.displayName || member.user?.email || '?')[0].toUpperCase();

          return (
            <div
              key={member.id}
              className="flex items-center gap-3 py-2.5 px-3 rounded-xl hover:bg-stone-50 dark:hover:bg-stone-800/50 transition-colors"
            >
              <div className="w-8 h-8 rounded-full bg-gold-100 dark:bg-gold-900/30 flex items-center justify-center text-gold-700 dark:text-gold-400 text-sm font-bold">
                {initials}
              </div>
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium text-slate-800 dark:text-white truncate">{name}</p>
                {member.user?.email && member.user.displayName && (
                  <p className="text-xs text-stone-400 truncate">{member.user.email}</p>
                )}
              </div>
              <span className={`flex items-center gap-1 px-2 py-0.5 rounded-md text-xs font-semibold ${config.color}`}>
                {config.icon}
                {config.label}
              </span>
              {member.role !== 'owner' && canManage && (
                <button
                  type="button"
                  onClick={() => handleRemoveMember(member)}
                  className="p-1 text-stone-400 hover:text-red-500 transition-colors"
                  title="Remove member"
                >
                  <X className="w-4 h-4" />
                </button>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}
