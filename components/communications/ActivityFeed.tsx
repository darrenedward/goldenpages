'use client';

import { useState, useEffect, useCallback } from 'react';
import {
  FileUp, UserPlus, UserMinus, RefreshCw, Edit3, Plus, Clock
} from 'lucide-react';
import { activityLogService } from '@/services/activityLogService';
import type { ActivityLogEntry } from '@/types';

interface ActivityFeedProps {
  communicationId: string;
}

const ACTION_ICONS: Record<string, React.ReactNode> = {
  'communication:created': <Plus className="w-4 h-4" />,
  'communication:status_changed': <RefreshCw className="w-4 h-4" />,
  'communication:document_uploaded': <FileUp className="w-4 h-4" />,
  'communication:member_added': <UserPlus className="w-4 h-4" />,
  'communication:member_removed': <UserMinus className="w-4 h-4" />,
  'communication:updated': <Edit3 className="w-4 h-4" />,
};

const ACTION_COLORS: Record<string, string> = {
  'communication:created': 'bg-emerald-100 text-emerald-600',
  'communication:status_changed': 'bg-blue-100 text-blue-600',
  'communication:document_uploaded': 'bg-amber-100 text-amber-600',
  'communication:member_added': 'bg-violet-100 text-violet-600',
  'communication:member_removed': 'bg-red-100 text-red-600',
  'communication:updated': 'bg-stone-100 text-stone-600',
};

function formatRelativeTime(dateStr: string): string {
  const now = Date.now();
  const then = new Date(dateStr).getTime();
  const diffMs = now - then;

  if (diffMs < 60_000) return 'just now';
  if (diffMs < 3_600_000) return `${Math.floor(diffMs / 60_000)}m ago`;
  if (diffMs < 86_400_000) return `${Math.floor(diffMs / 3_600_000)}h ago`;
  if (diffMs < 604_800_000) return `${Math.floor(diffMs / 86_400_000)}d ago`;
  return new Date(dateStr).toLocaleDateString();
}

function getInitials(name: string | null | undefined, email: string): string {
  if (name) {
    const parts = name.trim().split(/\s+/);
    return parts.length >= 2
      ? (parts[0][0] + parts[parts.length - 1][0]).toUpperCase()
      : parts[0][0].toUpperCase();
  }
  return email[0].toUpperCase();
}

export default function ActivityFeed({ communicationId }: ActivityFeedProps) {
  const [entries, setEntries] = useState<ActivityLogEntry[]>([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(0);
  const [totalCount, setTotalCount] = useState(0);
  const pageSize = 20;

  const fetchEntries = useCallback(async () => {
    try {
      const result = await activityLogService.getActivityForCommunication(
        communicationId,
        page,
        pageSize
      );
      setEntries(result.data);
      setTotalCount(result.totalCount);
    } catch (err) {
      console.error('[ActivityFeed] Failed to fetch:', err);
    } finally {
      setLoading(false);
    }
  }, [communicationId, page]);

  useEffect(() => {
    fetchEntries();
  }, [fetchEntries]);

  if (loading) {
    return (
      <div className="flex items-center justify-center py-8 text-stone-400">
        <div className="w-6 h-6 border-2 border-gold-200 border-t-gold-600 rounded-full animate-spin mr-2" />
        Loading activity...
      </div>
    );
  }

  if (entries.length === 0) {
    return (
      <div className="text-center py-8 text-stone-400 text-sm">
        No activity recorded yet.
      </div>
    );
  }

  const totalPages = Math.ceil(totalCount / pageSize);

  return (
    <div>
      <div className="space-y-1">
        {entries.map((entry) => {
          const icon = ACTION_ICONS[entry.action] || <Clock className="w-4 h-4" />;
          const color = ACTION_COLORS[entry.action] || 'bg-stone-100 text-stone-600';
          const userName = entry.user?.displayName || entry.user?.email || 'Unknown';
          const initials = getInitials(entry.user?.displayName, entry.user?.email || '');
          const label = activityLogService.getActionLabel(entry.action);

          return (
            <div key={entry.id} className="flex items-start gap-3 py-2.5 px-2 rounded-xl hover:bg-stone-50 dark:hover:bg-stone-800/50 transition-colors">
              {/* Avatar */}
              <div className="flex-shrink-0 w-8 h-8 rounded-full bg-gold-100 dark:bg-gold-900/30 flex items-center justify-center text-gold-700 dark:text-gold-400 text-xs font-bold">
                {initials}
              </div>

              {/* Content */}
              <div className="flex-1 min-w-0">
                <p className="text-sm text-stone-700 dark:text-stone-300">
                  <span className="font-semibold">{userName}</span>{' '}
                  <span className="text-stone-500 dark:text-stone-400">{label}</span>
                </p>
                {entry.changes && Object.keys(entry.changes).length > 0 && (
                  <div className="mt-1 flex flex-wrap gap-1">
                    {Object.entries(entry.changes).map(([key, val]) => (
                      <span key={key} className="text-xs bg-stone-100 dark:bg-stone-800 text-stone-500 dark:text-stone-400 px-2 py-0.5 rounded-md">
                        {key}: {String(val)}
                      </span>
                    ))}
                  </div>
                )}
              </div>

              {/* Icon + time */}
              <div className="flex items-center gap-2 flex-shrink-0">
                <div className={`w-7 h-7 rounded-lg flex items-center justify-center ${color}`}>
                  {icon}
                </div>
                <span className="text-xs text-stone-400 whitespace-nowrap">
                  {formatRelativeTime(entry.createdAt)}
                </span>
              </div>
            </div>
          );
        })}
      </div>

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="flex items-center justify-center gap-2 mt-4 pt-4 border-t border-stone-100 dark:border-stone-800">
          <button
            onClick={() => setPage(p => Math.max(0, p - 1))}
            disabled={page === 0}
            className="px-3 py-1.5 text-sm bg-stone-100 dark:bg-stone-800 rounded-lg hover:bg-stone-200 dark:hover:bg-stone-700 disabled:opacity-40 transition-colors"
          >
            Previous
          </button>
          <span className="text-xs text-stone-400">
            Page {page + 1} of {totalPages}
          </span>
          <button
            onClick={() => setPage(p => Math.min(totalPages - 1, p + 1))}
            disabled={page >= totalPages - 1}
            className="px-3 py-1.5 text-sm bg-stone-100 dark:bg-stone-800 rounded-lg hover:bg-stone-200 dark:hover:bg-stone-700 disabled:opacity-40 transition-colors"
          >
            Next
          </button>
        </div>
      )}
    </div>
  );
}
