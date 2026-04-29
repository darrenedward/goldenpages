/**
 * Activity Log Service
 *
 * Tracks all changes on communications for the activity feed.
 * Writes to the existing activity_logs table.
 */

import { supabase } from './supabaseClient';
import type { ActivityLogEntry } from '@/types';

const ACTION_LABELS: Record<string, string> = {
  'communication:created': 'created this communication',
  'communication:status_changed': 'changed the status',
  'communication:document_uploaded': 'uploaded a document',
  'communication:member_added': 'added a team member',
  'communication:member_removed': 'removed a team member',
  'communication:updated': 'updated details',
};

class ActivityLogService {
  private static instance: ActivityLogService;

  private constructor() {}

  static getInstance(): ActivityLogService {
    if (!ActivityLogService.instance) {
      ActivityLogService.instance = new ActivityLogService();
    }
    return ActivityLogService.instance;
  }

  async log(
    communicationId: string,
    userId: string,
    action: string,
    changes?: Record<string, unknown>
  ): Promise<void> {
    const { error } = await supabase.from('activity_logs').insert({
      "userId": userId,
      action,
      resource_type: 'communication',
      resource_id: communicationId,
      changes: changes ?? null,
    });

    if (error) {
      console.error('[ActivityLogService] Failed to log:', error);
    }
  }

  async getActivityForCommunication(
    communicationId: string,
    page = 0,
    pageSize = 20
  ): Promise<{ data: ActivityLogEntry[]; totalCount: number }> {
    // Count
    const { count, error: countError } = await supabase
      .from('activity_logs')
      .select('id', { count: 'exact', head: true })
      .eq('resource_type', 'communication')
      .eq('resource_id', communicationId);

    if (countError) throw countError;

    // Data with user info
    const { data, error } = await supabase
      .from('activity_logs')
      .select(`
        id,
        "userId",
        action,
        resource_type,
        resource_id,
        changes,
        created_at,
        user:users!activity_logs_userId_fkey(id, email, display_name)
      `)
      .eq('resource_type', 'communication')
      .eq('resource_id', communicationId)
      .order('created_at', { ascending: false })
      .range(page * pageSize, (page + 1) * pageSize - 1);

    if (error) throw error;

    return {
      data: (data || []).map(this.mapEntry),
      totalCount: count ?? 0,
    };
  }

  getActionLabel(action: string): string {
    return ACTION_LABELS[action] || action;
  }

  private mapEntry(row: Record<string, unknown>): ActivityLogEntry {
    return {
      id: row.id as string,
      userId: row.userId as string,
      action: row.action as string,
      resourceType: row.resource_type as string,
      resourceId: row.resource_id as string | null,
      changes: row.changes as Record<string, unknown> | null,
      createdAt: row.created_at as string,
      user: row.user as ActivityLogEntry['user'],
    };
  }
}

export const activityLogService = ActivityLogService.getInstance();
