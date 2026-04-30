/**
 * Stats Service
 *
 * Fetches real statistics from the database for the Dashboard and public homepage.
 * All counts use efficient head: true queries to avoid transferring data.
 */

import { supabase } from './supabaseClient';
import type { ActivityLogEntry } from '@/types';

export interface DashboardStats {
  orgCount: number;
  contactCount: number;
  deptCount: number;
  channelCount: number;
  activeCommunications: number;
  dataIntegrityPct: number;
  communicationsByMonth: { month: string; count: number }[];
  recentActivity: ActivityLogEntry[];
  overdueCommunications: number;
}

export interface PublicStats {
  countryCount: number;
  contactCount: number;
  deptCount: number;
  channelCount: number;
}

class StatsService {
  private static instance: StatsService;

  private constructor() {}

  static getInstance(): StatsService {
    if (!StatsService.instance) {
      StatsService.instance = new StatsService();
    }
    return StatsService.instance;
  }

  async getDashboardStats(): Promise<DashboardStats> {
    const sixMonthsAgo = new Date();
    sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() - 6);

    const [
      orgsResult,
      contactsResult,
      deptsResult,
      channelsResult,
      activeCommsResult,
      overdueResult,
      commsByMonthResult,
      recentActivityResult,
      contactsWithChannelsResult,
    ] = await Promise.all([
      // Total organizations
      supabase.from('organisations').select('id', { count: 'exact', head: true }),

      // Total contacts
      supabase.from('contacts').select('id', { count: 'exact', head: true }),

      // Total departments
      supabase.from('departments').select('id', { count: 'exact', head: true }),

      // Total contact channels
      supabase.from('contact_channels').select('id', { count: 'exact', head: true }),

      // Active communications (SENT or AWAITING_RESPONSE)
      supabase.from('communications').select('id', { count: 'exact', head: true })
        .in('status', ['SENT', 'AWAITING_RESPONSE']),

      // Overdue communications
      supabase.from('communications').select('id', { count: 'exact', head: true })
        .lt('expected_response_date', new Date().toISOString())
        .not('status', 'in', '("CLOSED","CANCELLED","RESPONDED")'),

      // Communications by month (last 6 months)
      supabase.from('communications')
        .select('created_at')
        .gte('created_at', sixMonthsAgo.toISOString())
        .order('created_at', { ascending: true }),

      // Recent activity logs
      supabase.from('activity_logs')
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
        .order('created_at', { ascending: false })
        .limit(5),

      // Contacts with at least one channel (for data integrity %)
      supabase.from('contacts')
        .select('id')
        .eq('isActive', true),
    ]);

    const orgCount = orgsResult.count ?? 0;
    const contactCount = contactsResult.count ?? 0;
    const deptCount = deptsResult.count ?? 0;
    const channelCount = channelsResult.count ?? 0;
    const activeCommunications = activeCommsResult.count ?? 0;
    const overdueCommunications = overdueResult.count ?? 0;

    // Compute data integrity: contacts that have at least one channel
    const contactIds = (contactsWithChannelsResult.data || []).map(c => c.id);
    let contactsWithChannels = 0;
    if (contactIds.length > 0) {
      const { count: ccCount } = await supabase.from('contact_channels')
        .select('contactId', { count: 'exact', head: false })
        .in('contactId', contactIds);
      // Count distinct contactIds
      const { data: distinctData } = await supabase.from('contact_channels')
        .select('contactId')
        .in('contactId', contactIds);
      const uniqueContactIds = new Set((distinctData || []).map(d => (d as Record<string, unknown>).contactId as string));
      contactsWithChannels = uniqueContactIds.size;
    }
    const dataIntegrityPct = contactCount > 0
      ? Math.round((contactsWithChannels / contactCount) * 100 * 10) / 10
      : 0;

    // Group communications by month
    const monthMap = new Map<string, number>();
    const comms = commsByMonthResult.data || [];
    for (const c of comms) {
      const date = new Date(c.created_at as string);
      const key = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}`;
      monthMap.set(key, (monthMap.get(key) || 0) + 1);
    }

    // Generate last 6 months (fill gaps)
    const communicationsByMonth: { month: string; count: number }[] = [];
    for (let i = 5; i >= 0; i--) {
      const d = new Date();
      d.setMonth(d.getMonth() - i);
      const key = `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`;
      const monthName = d.toLocaleDateString('en-US', { month: 'short' });
      communicationsByMonth.push({
        month: monthName,
        count: monthMap.get(key) || 0,
      });
    }

    // Map activity logs
    const recentActivity: ActivityLogEntry[] = (recentActivityResult.data || []).map(
      (row: Record<string, unknown>) => ({
        id: row.id as string,
        userId: row.userId as string,
        action: row.action as string,
        resourceType: row.resource_type as string,
        resourceId: row.resource_id as string | null,
        changes: row.changes as Record<string, unknown> | null,
        createdAt: row.created_at as string,
        user: row.user as ActivityLogEntry['user'],
      })
    );

    return {
      orgCount,
      contactCount,
      deptCount,
      channelCount,
      activeCommunications,
      dataIntegrityPct,
      communicationsByMonth,
      recentActivity,
      overdueCommunications,
    };
  }

  async getPublicStats(): Promise<PublicStats> {
    const [
      orgsResult,
      contactsResult,
      deptsResult,
      channelsResult,
    ] = await Promise.all([
      // Distinct countries from organisations
      supabase.from('organisations').select('headOfficeCountryId'),

      // Active contacts
      supabase.from('contacts').select('id', { count: 'exact', head: true })
        .eq('isActive', true),

      // Active departments
      supabase.from('departments').select('id', { count: 'exact', head: true })
        .eq('isActive', true),

      // Contact channels
      supabase.from('contact_channels').select('id', { count: 'exact', head: true }),
    ]);

    const countryIds = new Set(
      (orgsResult.data || []).map(o => o.headOfficeCountryId)
    );

    return {
      countryCount: countryIds.size,
      contactCount: contactsResult.count ?? 0,
      deptCount: deptsResult.count ?? 0,
      channelCount: channelsResult.count ?? 0,
    };
  }
}

export const statsService = StatsService.getInstance();
