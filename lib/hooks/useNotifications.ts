'use client';

import { useState, useEffect, useCallback, useRef } from 'react';
import { supabase } from '@/services/supabaseClient';
import { notificationService } from '@/services/notificationService';
import type { AppNotification } from '@/types';

export function useNotifications(userId: string | undefined) {
  const [notifications, setNotifications] = useState<AppNotification[]>([]);
  const [unreadCount, setUnreadCount] = useState(0);
  const [loading, setLoading] = useState(true);
  const subscriptionRef = useRef<ReturnType<typeof supabase.channel> | null>(null);

  const fetchNotifications = useCallback(async () => {
    if (!userId) return;
    try {
      const [notifResult, count] = await Promise.all([
        notificationService.getNotificationsForUser(userId, 0, 20),
        notificationService.getUnreadCount(userId),
      ]);
      setNotifications(notifResult.data);
      setUnreadCount(count);
    } catch {
      // Silent fail
    } finally {
      setLoading(false);
    }
  }, [userId]);

  const markAsRead = useCallback(async (id: string) => {
    if (!userId) return;
    await notificationService.markAsRead(id, userId);
    setNotifications(prev =>
      prev.map(n => n.id === id ? { ...n, isRead: true, readAt: new Date().toISOString() } : n)
    );
    setUnreadCount(prev => Math.max(0, prev - 1));
  }, [userId]);

  const markAllAsRead = useCallback(async () => {
    if (!userId) return;
    await notificationService.markAllAsRead(userId);
    setNotifications(prev => prev.map(n => ({ ...n, isRead: true, readAt: new Date().toISOString() })));
    setUnreadCount(0);
  }, [userId]);

  // Realtime subscription
  useEffect(() => {
    if (!userId) return;

    fetchNotifications();

    // Subscribe to new notifications
    const channel = supabase
      .channel(`notifications:${userId}`)
      .on(
        'postgres_changes',
        {
          event: 'INSERT',
          schema: 'public',
          table: 'notifications',
          filter: `user_id=eq.${userId}`,
        },
        (payload) => {
          const newNotif: AppNotification = {
            id: payload.new.id as string,
            userId: payload.new.user_id as string,
            type: payload.new.type as AppNotification['type'],
            title: payload.new.title as string,
            message: payload.new.message as string,
            isRead: payload.new.is_read as boolean,
            readAt: payload.new.read_at as string | null,
            resourceId: payload.new.resource_id as string | null,
            metadata: payload.new.metadata as Record<string, unknown> | null,
            createdAt: payload.new.created_at as string,
          };
          setNotifications(prev => [newNotif, ...prev].slice(0, 50));
          setUnreadCount(prev => prev + 1);
        }
      )
      .subscribe();

    subscriptionRef.current = channel;

    // Fallback polling every 60s
    const interval = setInterval(fetchNotifications, 60_000);

    return () => {
      if (subscriptionRef.current) {
        supabase.removeChannel(subscriptionRef.current);
      }
      clearInterval(interval);
    };
  }, [userId, fetchNotifications]);

  return { notifications, unreadCount, loading, markAsRead, markAllAsRead, refetch: fetchNotifications };
}
