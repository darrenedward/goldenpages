/**
 * Communication Recipient Service
 *
 * Manages recipients for multi-recipient communications:
 * - Add/remove recipients to a communication
 * - Update delivery and response status per recipient
 * - Query recipients with joined department/contact/org data
 */

import { supabase } from './supabaseClient';
import type {
  CommunicationRecipient,
  DeliveryStatus,
  ResponseStatus,
} from '@/types';

export interface AddRecipientInput {
  departmentId: string;
  contactId?: string;
}

class CommunicationRecipientService {
  private static instance: CommunicationRecipientService;

  private constructor() {}

  static getInstance(): CommunicationRecipientService {
    if (!CommunicationRecipientService.instance) {
      CommunicationRecipientService.instance = new CommunicationRecipientService();
    }
    return CommunicationRecipientService.instance;
  }

  /**
   * Add multiple recipients to a communication
   */
  async addRecipients(
    communicationId: string,
    recipients: AddRecipientInput[],
    userId: string
  ): Promise<CommunicationRecipient[]> {
    const rows = recipients.map(r => ({
      communication_id: communicationId,
      department_id: r.departmentId,
      contact_id: r.contactId || null,
      created_by: userId,
    }));

    const { data, error } = await supabase
      .from('communication_recipients')
      .insert(rows)
      .select(`
        *,
        department:departments(id, name, portfolio, organisationId),
        contact:contacts(id, fullName, roleTitle)
      `)
      .order('created_at', { ascending: true });

    if (error) throw error;

    return (data || []).map(row => this.mapRecipient(row));
  }

  /**
   * Get all recipients for a communication with joined data
   */
  async getRecipients(communicationId: string): Promise<CommunicationRecipient[]> {
    const { data, error } = await supabase
      .from('communication_recipients')
      .select(`
        *,
        department:departments(id, name, portfolio, organisationId),
        contact:contacts(id, fullName, roleTitle)
      `)
      .eq('communication_id', communicationId)
      .order('created_at', { ascending: true });

    if (error) throw error;

    // Enrich with organisation data from department
    return (data || []).map(row => this.mapRecipient(row));
  }

  /**
   * Get a single recipient by ID
   */
  async getRecipient(id: string): Promise<CommunicationRecipient | null> {
    const { data, error } = await supabase
      .from('communication_recipients')
      .select(`
        *,
        department:departments(id, name, portfolio, organisationId),
        contact:contacts(id, fullName, roleTitle)
      `)
      .eq('id', id)
      .single();

    if (error) throw error;
    if (!data) return null;

    return this.mapRecipient(data);
  }

  /**
   * Update delivery status for a recipient
   */
  async updateDeliveryStatus(
    id: string,
    status: DeliveryStatus
  ): Promise<CommunicationRecipient> {
    const updates: Record<string, unknown> = {
      delivery_status: status,
    };

    if (status === 'SENT') {
      updates.sent_at = new Date().toISOString();
    }
    if (status === 'DELIVERED') {
      updates.delivered_at = new Date().toISOString();
    }

    const { data, error } = await supabase
      .from('communication_recipients')
      .update(updates)
      .eq('id', id)
      .select(`
        *,
        department:departments(id, name, portfolio, organisationId),
        contact:contacts(id, fullName, roleTitle)
      `)
      .single();

    if (error) throw error;
    return this.mapRecipient(data);
  }

  /**
   * Update response status for a recipient
   */
  async updateResponseStatus(
    id: string,
    status: ResponseStatus
  ): Promise<CommunicationRecipient> {
    const updates: Record<string, unknown> = {
      response_status: status,
    };

    if (['ACCEPTED', 'REJECTED', 'INCOMPLETE'].includes(status)) {
      updates.response_date = new Date().toISOString();
    }

    const { data, error } = await supabase
      .from('communication_recipients')
      .update(updates)
      .eq('id', id)
      .select(`
        *,
        department:departments(id, name, portfolio, organisationId),
        contact:contacts(id, fullName, roleTitle)
      `)
      .single();

    if (error) throw error;
    return this.mapRecipient(data);
  }

  /**
   * Update notes for a recipient
   */
  async updateNotes(id: string, notes: string): Promise<CommunicationRecipient> {
    const { data, error } = await supabase
      .from('communication_recipients')
      .update({ notes })
      .eq('id', id)
      .select(`
        *,
        department:departments(id, name, portfolio, organisationId),
        contact:contacts(id, fullName, roleTitle)
      `)
      .single();

    if (error) throw error;
    return this.mapRecipient(data);
  }

  /**
   * Remove a recipient from a communication
   */
  async removeRecipient(id: string): Promise<void> {
    const { error } = await supabase
      .from('communication_recipients')
      .delete()
      .eq('id', id);

    if (error) throw error;
  }

  // ==========================================================================
  // MAPPER
  // ==========================================================================

  private mapRecipient(row: Record<string, unknown>): CommunicationRecipient {
    // Get organisation from department's joined data
    const dept = row.department as Record<string, unknown> | null;

    return {
      id: row.id as string,
      communicationId: row.communication_id as string,
      departmentId: row.department_id as string,
      contactId: row.contact_id as string | undefined,
      deliveryStatus: (row.delivery_status as DeliveryStatus) || 'PENDING',
      sentAt: row.sent_at as string | undefined,
      deliveredAt: row.delivered_at as string | undefined,
      responseStatus: (row.response_status as ResponseStatus) || 'RECEIVED',
      responseDate: row.response_date as string | undefined,
      notes: row.notes as string | undefined,
      createdAt: row.created_at as string,
      createdBy: row.created_by as string | undefined,
      department: dept ? {
        id: dept.id as string,
        name: dept.name as string,
        portfolio: dept.portfolio as string,
        organisationId: dept.organisationId as string,
      } : undefined,
      contact: row.contact as CommunicationRecipient['contact'],
    };
  }
}

export const communicationRecipientService = CommunicationRecipientService.getInstance();
