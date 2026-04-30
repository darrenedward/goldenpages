/**
 * Inbound Email Service
 *
 * Manages inbound emails received via Resend webhooks:
 * - Query inbound emails (by communication, status, etc.)
 * - Manual linking to communications
 * - Stats
 */

import { supabase } from './supabaseClient';
import type { InboundEmail, InboundEmailStatus } from '@/types';

class InboundEmailService {
  private static instance: InboundEmailService;

  private constructor() {}

  static getInstance(): InboundEmailService {
    if (!InboundEmailService.instance) {
      InboundEmailService.instance = new InboundEmailService();
    }
    return InboundEmailService.instance;
  }

  // ==========================================================================
  // READ
  // ==========================================================================

  async getInboundEmails(
    page = 0,
    pageSize = 20,
    statusFilter?: InboundEmailStatus
  ): Promise<{ data: InboundEmail[]; totalCount: number }> {
    let countQuery = supabase
      .from('inbound_emails')
      .select('id', { count: 'exact', head: true });

    let dataQuery = supabase
      .from('inbound_emails')
      .select('*')
      .order('created_at', { ascending: false })
      .range(page * pageSize, (page + 1) * pageSize - 1);

    if (statusFilter) {
      countQuery = countQuery.eq('status', statusFilter);
      dataQuery = dataQuery.eq('status', statusFilter);
    }

    const { count, error: countError } = await countQuery;
    if (countError) throw countError;

    const { data, error } = await dataQuery;
    if (error) throw error;

    return {
      data: (data || []).map((row: Record<string, unknown>) => this.mapEmail(row)),
      totalCount: count ?? 0,
    };
  }

  async getInboundEmailsForCommunication(
    communicationId: string
  ): Promise<InboundEmail[]> {
    const { data, error } = await supabase
      .from('inbound_emails')
      .select('*')
      .eq('communication_id', communicationId)
      .order('created_at', { ascending: true });

    if (error) throw error;
    return (data || []).map((row: Record<string, unknown>) => this.mapEmail(row));
  }

  async getInboundEmail(id: string): Promise<InboundEmail | null> {
    const { data, error } = await supabase
      .from('inbound_emails')
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw error;
    return data ? this.mapEmail(data) : null;
  }

  async getUnlinkedEmails(
    page = 0,
    pageSize = 20
  ): Promise<{ data: InboundEmail[]; totalCount: number }> {
    return this.getInboundEmails(page, pageSize, 'unlinked');
  }

  // ==========================================================================
  // UPDATE
  // ==========================================================================

  async linkToCommunication(
    emailId: string,
    communicationId: string
  ): Promise<void> {
    const { error } = await supabase
      .from('inbound_emails')
      .update({
        communication_id: communicationId,
        status: 'linked',
        processed_at: new Date().toISOString(),
      })
      .eq('id', emailId);

    if (error) throw error;
  }

  async unlinkFromCommunication(emailId: string): Promise<void> {
    const { error } = await supabase
      .from('inbound_emails')
      .update({
        communication_id: null,
        status: 'unlinked',
        processed_at: null,
      })
      .eq('id', emailId);

    if (error) throw error;
  }

  // ==========================================================================
  // STATS
  // ==========================================================================

  async getEmailStats(): Promise<{
    total: number;
    received: number;
    linked: number;
    unlinked: number;
    error: number;
  }> {
    const { data, error } = await supabase
      .from('inbound_emails')
      .select('status');

    if (error) throw error;

    const emails = data || [];
    return {
      total: emails.length,
      received: emails.filter((e: Record<string, unknown>) => e.status === 'received').length,
      linked: emails.filter((e: Record<string, unknown>) => e.status === 'linked').length,
      unlinked: emails.filter((e: Record<string, unknown>) => e.status === 'unlinked').length,
      error: emails.filter((e: Record<string, unknown>) => e.status === 'error').length,
    };
  }

  // ==========================================================================
  // MAPPER
  // ==========================================================================

  private mapEmail(row: Record<string, unknown>): InboundEmail {
    return {
      id: row.id as string,
      fromEmail: row.from_email as string,
      fromName: row.from_name as string | null,
      toEmail: row.to_email as string,
      subject: row.subject as string,
      bodyText: row.body_text as string | null,
      bodyHtml: row.body_html as string | null,
      headers: row.headers as Record<string, unknown> | null,
      messageId: row.message_id as string | null,
      inReplyTo: row.in_reply_to as string | null,
      communicationId: row.communication_id as string | null,
      contactSubmissionId: row.contact_submission_id as string | null,
      status: row.status as InboundEmailStatus,
      processedAt: row.processed_at as string | null,
      createdAt: row.created_at as string,
    };
  }
}

export const inboundEmailService = InboundEmailService.getInstance();
