'use client';

import { useState } from 'react';
import { Bell, CheckCheck, Filter } from 'lucide-react';
import { useAuth } from '@/lib/authContext';
import { useNotifications } from '@/lib/hooks/useNotifications';

function formatRelativeTime(dateStr: string): string {
  const diff = Date.now() - new Date(dateStr).getTime();
  if (diff < 60_000) return 'just now';
  if (diff < 3_600_000) return `${Math.floor(diff / 60_000)}m ago`;
  if (diff < 86_400_000) return `${Math.floor(diff / 3_600_000)}h ago`;
  if (diff < 604_800_000) return `${Math.floor(diff / 86_400_000)}d ago`;
  return new Date(dateStr).toLocaleDateString();
}

export default function NotificationList() {
  const { user } = useAuth();
  const { notifications, unreadCount, markAsRead, markAllAsRead } = useNotifications(user?.id);
  const [filter, setFilter] = useState<'all' | 'unread'>('all');

  const filtered = filter === 'unread' ? notifications.filter(n => !n.isRead) : notifications;

  return (
    <div className="space-y-6 animate-fade-in pb-12">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="font-serif text-3xl font-bold text-slate-800 dark:text-white mb-2">
            Notifications
          </h1>
          <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24" />
        </div>
        <div className="flex items-center gap-2">
          {unreadCount > 0 && (
            <button
              type="button"
              onClick={() => markAllAsRead()}
              className="flex items-center gap-1.5 px-3 py-2 bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 rounded-xl text-sm font-semibold hover:bg-gold-100 transition-colors"
            >
              <CheckCheck className="w-4 h-4" />
              Mark all read ({unreadCount})
            </button>
          )}
        </div>
      </div>

      {/* Filter */}
      <div className="flex items-center gap-2 mb-4">
        <Filter className="w-4 h-4 text-stone-400" />
        <button
          type="button"
          onClick={() => setFilter('all')}
          className={`px-3 py-1.5 rounded-lg text-sm font-semibold transition-colors ${
            filter === 'all'
              ? 'bg-gold-100 dark:bg-gold-900/30 text-gold-700 dark:text-gold-400'
              : 'bg-stone-100 dark:bg-stone-800 text-stone-500'
          }`}
        >
          All ({notifications.length})
        </button>
        <button
          type="button"
          onClick={() => setFilter('unread')}
          className={`px-3 py-1.5 rounded-lg text-sm font-semibold transition-colors ${
            filter === 'unread'
              ? 'bg-gold-100 dark:bg-gold-900/30 text-gold-700 dark:text-gold-400'
              : 'bg-stone-100 dark:bg-stone-800 text-stone-500'
          }`}
        >
          Unread ({unreadCount})
        </button>
      </div>

      {/* List */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 divide-y divide-stone-100 dark:divide-stone-800">
        {filtered.length === 0 ? (
          <div className="py-12 text-center">
            <Bell className="w-8 h-8 text-stone-300 mx-auto mb-2" />
            <p className="text-stone-400 text-sm">
              {filter === 'unread' ? 'No unread notifications' : 'No notifications yet'}
            </p>
          </div>
        ) : (
          filtered.map(n => (
            <button
              key={n.id}
              type="button"
              onClick={() => markAsRead(n.id)}
              className={`w-full text-left px-6 py-4 hover:bg-stone-50 dark:hover:bg-stone-800/50 transition-colors ${
                !n.isRead ? 'bg-gold-50/30 dark:bg-gold-900/5' : ''
              }`}
            >
              <div className="flex items-start gap-4">
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2">
                    <p className={`text-sm ${!n.isRead ? 'font-bold text-slate-800 dark:text-white' : 'font-medium text-stone-600 dark:text-stone-400'}`}>
                      {n.title}
                    </p>
                    {!n.isRead && (
                      <span className="w-2 h-2 rounded-full bg-gold-500 flex-shrink-0" />
                    )}
                  </div>
                  <p className="text-sm text-stone-500 dark:text-stone-400 mt-0.5">{n.message}</p>
                </div>
                <span className="text-xs text-stone-400 flex-shrink-0 whitespace-nowrap">
                  {formatRelativeTime(n.createdAt)}
                </span>
              </div>
            </button>
          ))
        )}
      </div>
    </div>
  );
}
