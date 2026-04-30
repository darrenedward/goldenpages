'use client';

import { useState, useRef, useEffect } from 'react';
import { Bell, CheckCheck, FileUp, UserPlus, RefreshCw, Edit3, UserMinus, Mail, MessageSquare, AlertTriangle } from 'lucide-react';
import { useAuth } from '@/lib/authContext';
import { useNotifications } from '@/lib/hooks/useNotifications';
import type { NotificationType } from '@/types';

const TYPE_ICONS: Record<NotificationType, React.ReactNode> = {
  communication_assigned: <UserPlus className="w-4 h-4 text-blue-500" />,
  communication_invited: <UserPlus className="w-4 h-4 text-violet-500" />,
  communication_status_changed: <RefreshCw className="w-4 h-4 text-amber-500" />,
  communication_document_uploaded: <FileUp className="w-4 h-4 text-emerald-500" />,
  communication_updated: <Edit3 className="w-4 h-4 text-stone-500" />,
  communication_member_added: <UserPlus className="w-4 h-4 text-violet-500" />,
  communication_member_removed: <UserMinus className="w-4 h-4 text-red-500" />,
  inbound_email_received: <Mail className="w-4 h-4 text-blue-500" />,
  contact_submission_received: <MessageSquare className="w-4 h-4 text-green-500" />,
  report_submission_received: <AlertTriangle className="w-4 h-4 text-orange-500" />,
};

function formatRelativeTime(dateStr: string): string {
  const diff = Date.now() - new Date(dateStr).getTime();
  if (diff < 60_000) return 'just now';
  if (diff < 3_600_000) return `${Math.floor(diff / 60_000)}m ago`;
  if (diff < 86_400_000) return `${Math.floor(diff / 3_600_000)}h ago`;
  return `${Math.floor(diff / 86_400_000)}d ago`;
}

interface NotificationBellProps {
  onNavigate?: (view: string, data?: Record<string, string>) => void;
}

export default function NotificationBell({ onNavigate }: NotificationBellProps) {
  const { user } = useAuth();
  const { notifications, unreadCount, markAsRead, markAllAsRead } = useNotifications(user?.id);
  const [open, setOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (dropdownRef.current && !dropdownRef.current.contains(e.target as Node)) {
        setOpen(false);
      }
    };
    document.addEventListener('mousedown', handler);
    return () => document.removeEventListener('mousedown', handler);
  }, []);

  const handleClick = async (notifId: string, resourceId: string | null) => {
    await markAsRead(notifId);
    setOpen(false);
    if (resourceId && onNavigate) {
      onNavigate('communication-detail', { communicationId: resourceId });
    }
  };

  const latest = notifications.slice(0, 10);

  return (
    <div ref={dropdownRef} className="relative">
      <button
        type="button"
        onClick={() => setOpen(!open)}
        aria-label={`Notifications${unreadCount > 0 ? `, ${unreadCount} unread` : ''}`}
        className="relative p-2 rounded-xl hover:bg-stone-100 dark:hover:bg-stone-800 transition-colors"
      >
        <Bell className="w-5 h-5 text-stone-500 dark:text-stone-400" />
        {unreadCount > 0 && (
          <span className="absolute -top-0.5 -right-0.5 w-4.5 h-4.5 flex items-center justify-center bg-red-500 text-white text-[10px] font-bold rounded-full min-w-[18px]">
            {unreadCount > 9 ? '9+' : unreadCount}
          </span>
        )}
      </button>

      {open && (
        <div className="absolute right-0 top-full mt-2 w-80 bg-white dark:bg-slate-900 border border-stone-200 dark:border-white/5 rounded-2xl shadow-xl z-50 overflow-hidden">
          <div className="flex items-center justify-between px-4 py-3 border-b border-stone-100 dark:border-stone-800">
            <h3 className="font-serif font-bold text-sm text-slate-800 dark:text-white">Notifications</h3>
            {unreadCount > 0 && (
              <button
                type="button"
                onClick={() => markAllAsRead()}
                className="flex items-center gap-1 text-xs text-gold-600 hover:text-gold-700 font-semibold"
              >
                <CheckCheck className="w-3.5 h-3.5" />
                Mark all read
              </button>
            )}
          </div>

          <div className="max-h-80 overflow-y-auto">
            {latest.length === 0 ? (
              <div className="py-8 text-center text-sm text-stone-500 dark:text-stone-400">No notifications</div>
            ) : (
              latest.map(n => (
                <button
                  key={n.id}
                  type="button"
                  onClick={() => handleClick(n.id, n.resourceId)}
                  className={`w-full text-left px-4 py-3 hover:bg-stone-50 dark:hover:bg-stone-800/50 transition-colors border-b border-stone-50 dark:border-stone-800/50 ${
                    !n.isRead ? 'bg-gold-50/50 dark:bg-gold-900/10' : ''
                  }`}
                >
                  <div className="flex items-start gap-2.5">
                    <div className="mt-0.5 flex-shrink-0">
                      {TYPE_ICONS[n.type] || <Bell className="w-4 h-4 text-stone-400" />}
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className={`text-sm ${!n.isRead ? 'font-semibold text-slate-800 dark:text-white' : 'text-stone-600 dark:text-stone-400'}`}>
                        {n.title}
                      </p>
                      <p className="text-xs text-stone-500 dark:text-stone-400 mt-0.5 truncate">{n.message}</p>
                    </div>
                    <span className="text-[10px] text-stone-400 dark:text-stone-500 flex-shrink-0 whitespace-nowrap">
                      {formatRelativeTime(n.createdAt)}
                    </span>
                  </div>
                </button>
              ))
            )}
          </div>
        </div>
      )}
    </div>
  );
}
