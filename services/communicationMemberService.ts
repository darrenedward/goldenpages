/**
 * Communication Member Service
 *
 * Manages team collaboration on communications:
 * - Add/remove members with roles (owner, assignee, collaborator)
 * - List members for a communication
 * - Find communications for a user ("My Communications")
 */

import { supabase } from './supabaseClient';
import { activityLogService } from './activityLogService';
import { notificationService } from './notificationService';
import type { CommunicationMember, CommunicationMemberRole } from '@/types';

class CommunicationMemberService {
  private static instance: CommunicationMemberService;

  private constructor() {}

  static getInstance(): CommunicationMemberService {
    if (!CommunicationMemberService.instance) {
      CommunicationMemberService.instance = new CommunicationMemberService();
    }
    return CommunicationMemberService.instance;
  }

  async addMember(
    communicationId: string,
    userId: string,
    role: CommunicationMemberRole,
    invitedBy: string
  ): Promise<CommunicationMember> {
    const { data, error } = await supabase
      .from('communication_members')
      .insert({
        communication_id: communicationId,
        user_id: userId,
        role,
        invited_by: invitedBy,
      })
      .select('id, communication_id, user_id, role, invited_by, joined_at, user:users!communication_members_user_id_fkey(id, email, display_name)')
      .single();

    if (error) throw error;

    const member = this.mapMember(data);

    // Log activity
    await activityLogService.log(communicationId, invitedBy, 'communication:member_added', {
      memberId: userId,
      role,
    });

    // Send notification
    const notificationType = role === 'assignee' ? 'communication_assigned' : 'communication_invited';
    await notificationService.createNotification(
      userId,
      notificationType,
      role === 'assignee' ? 'You have been assigned' : 'You have been invited',
      `You have been added as ${role === 'assignee' ? 'an assignee' : 'a collaborator'} to a communication.`,
      communicationId,
      { role, invitedBy }
    );

    return member;
  }

  async removeMember(
    communicationId: string,
    userId: string,
    removedBy: string
  ): Promise<void> {
    const { error } = await supabase
      .from('communication_members')
      .delete()
      .eq('communication_id', communicationId)
      .eq('user_id', userId);

    if (error) throw error;

    // Log activity
    await activityLogService.log(communicationId, removedBy, 'communication:member_removed', {
      memberId: userId,
    });

    // Notify the removed user
    await notificationService.createNotification(
      userId,
      'communication_member_removed',
      'Removed from communication',
      'You have been removed from a communication.',
      communicationId,
      { removedBy }
    );
  }

  async getMembers(communicationId: string): Promise<CommunicationMember[]> {
    const { data, error } = await supabase
      .from('communication_members')
      .select('id, communication_id, user_id, role, invited_by, joined_at, user:users!communication_members_user_id_fkey(id, email, display_name)')
      .eq('communication_id', communicationId)
      .order('joined_at', { ascending: true });

    if (error) throw error;
    return (data || []).map((row: Record<string, unknown>) => this.mapMember(row));
  }

  async getCommunicationsForUser(
    userId: string,
    page = 0,
    pageSize = 20
  ): Promise<{ data: string[]; totalCount: number }> {
    const { count, error: countError } = await supabase
      .from('communication_members')
      .select('id', { count: 'exact', head: true })
      .eq('user_id', userId);

    if (countError) throw countError;

    const { data, error } = await supabase
      .from('communication_members')
      .select('communication_id')
      .eq('user_id', userId)
      .order('joined_at', { ascending: false })
      .range(page * pageSize, (page + 1) * pageSize - 1);

    if (error) throw error;

    return {
      data: (data || []).map((row: Record<string, unknown>) => row.communication_id as string),
      totalCount: count ?? 0,
    };
  }

  async isMember(communicationId: string, userId: string): Promise<boolean> {
    const { data, error } = await supabase
      .from('communication_members')
      .select('id')
      .eq('communication_id', communicationId)
      .eq('user_id', userId)
      .maybeSingle();

    if (error) throw error;
    return !!data;
  }

  async getMemberRole(communicationId: string, userId: string): Promise<CommunicationMemberRole | null> {
    const { data, error } = await supabase
      .from('communication_members')
      .select('role')
      .eq('communication_id', communicationId)
      .eq('user_id', userId)
      .maybeSingle();

    if (error) throw error;
    return (data?.role as CommunicationMemberRole) ?? null;
  }

  private mapMember(row: Record<string, unknown>): CommunicationMember {
    return {
      id: row.id as string,
      communicationId: row.communication_id as string,
      userId: row.user_id as string,
      role: row.role as CommunicationMemberRole,
      invitedBy: row.invited_by as string,
      joinedAt: row.joined_at as string,
      user: row.user as CommunicationMember['user'],
    };
  }
}

export const communicationMemberService = CommunicationMemberService.getInstance();
