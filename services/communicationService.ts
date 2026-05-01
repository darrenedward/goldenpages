/**
 * Communication Service
 *
 * Handles CRUD operations for the Communication Tracker feature:
 * - Create communications (letters, emails sent to contacts)
 * - Upload sent/received documents
 * - Track status transitions
 * - Public transparency queries
 */

import { supabase } from './supabaseClient';
import { activityLogService } from './activityLogService';
import { communicationMemberService } from './communicationMemberService';
import { communicationRecipientService } from './communicationRecipientService';
import { notificationService } from './notificationService';
import { addWorkingDays } from '@/lib/dateHelpers';
import type {
  Communication,
  CommunicationWithDetails,
  CommunicationDocument,
  CommunicationRecipient,
  CommunicationType,
  CommunicationStatus,
  CommunicationDocumentType,
  CreateCommunicationInput,
} from '@/types';

class CommunicationService {
  private static instance: CommunicationService;

  private constructor() {}

  static getInstance(): CommunicationService {
    if (!CommunicationService.instance) {
      CommunicationService.instance = new CommunicationService();
    }
    return CommunicationService.instance;
  }

  // ==========================================================================
  // CREATE
  // ==========================================================================

  async createCommunication(
    input: CreateCommunicationInput,
    userId: string
  ): Promise<Communication> {
    // Calculate expected response date from working days
    let expectedResponseDate = input.expectedResponseDate || null;
    if (!expectedResponseDate && input.expectedResponseDays) {
      const calculated = addWorkingDays(new Date(), input.expectedResponseDays);
      expectedResponseDate = calculated.toISOString();
    }

    const { data, error } = await supabase
      .from('communications')
      .insert({
        title: input.title,
        description: input.description || null,
        communication_type: input.communicationType,
        status: 'SENT',
        contact_id: input.contactId || null,
        department_id: input.departmentId || null,
        organisation_id: input.organisationId || null,
        category: input.category || null,
        category_id: input.categoryId || null,
        tags: input.tags || [],
        expected_response_date: expectedResponseDate,
        is_public: input.isPublic,
        is_approved: input.isApproved,
        created_by_id: userId,
        sender_organisation: input.senderOrganisation || null,
      })
      .select()
      .single();

    if (error) throw error;
    const communication = this.mapCommunication(data);

    // Add recipients if provided
    if (input.recipients && input.recipients.length > 0) {
      await communicationRecipientService.addRecipients(
        communication.id,
        input.recipients,
        userId
      );
    } else if (input.contactId) {
      // Legacy: single contact → single recipient
      await communicationRecipientService.addRecipients(
        communication.id,
        [{ departmentId: input.departmentId || input.contactId, contactId: input.contactId }],
        userId
      ).catch(() => {});
    }

    // Create owner membership
    await communicationMemberService.addMember(
      communication.id,
      userId,
      'owner',
      userId
    ).catch(() => {
      // If membership already exists from trigger, ignore
    });

    // Log creation
    await activityLogService.log(communication.id, userId, 'communication:created');

    return communication;
  }

  // ==========================================================================
  // READ
  // ==========================================================================

  async getCommunications(filters: {
    contactId?: string;
    departmentId?: string;
    organisationId?: string;
    status?: CommunicationStatus;
    isPublic?: boolean;
  }): Promise<CommunicationWithDetails[]> {
    let query = supabase
      .from('communications')
      .select(`
        *,
        contact:contacts(id, fullName, roleTitle),
        department:departments(id, name, portfolio),
        organisation:organisations(id, name),
        documents:communication_documents(*),
        recipients:communication_recipients(
          *,
          department:departments(id, name, portfolio, organisationId),
          contact:contacts(id, fullName, roleTitle)
        )
      `)
      .order('created_at', { ascending: false });

    if (filters.contactId) query = query.eq('contact_id', filters.contactId);
    if (filters.departmentId) query = query.eq('department_id', filters.departmentId);
    if (filters.organisationId) query = query.eq('organisation_id', filters.organisationId);
    if (filters.status) query = query.eq('status', filters.status);
    if (filters.isPublic !== undefined) query = query.eq('is_public', filters.isPublic);

    const { data, error } = await query;
    if (error) throw error;

    return (data || []).map((row: Record<string, unknown>) => this.mapCommunicationWithDetails(row));
  }

  async getCommunication(id: string): Promise<CommunicationWithDetails | null> {
    const { data, error } = await supabase
      .from('communications')
      .select(`
        *,
        contact:contacts(id, fullName, roleTitle, organisationId),
        department:departments(id, name, portfolio, organisationId),
        organisation:organisations(id, name),
        documents:communication_documents(*),
        recipients:communication_recipients(
          *,
          department:departments(id, name, portfolio, organisationId),
          contact:contacts(id, fullName, roleTitle)
        )
      `)
      .eq('id', id)
      .single();

    if (error) throw error;
    if (!data) return null;

    return this.mapCommunicationWithDetails(data);
  }

  async getPublicCommunications(filters: {
    organisationId?: string;
    departmentId?: string;
    categoryId?: string;
    page?: number;
    pageSize?: number;
  }): Promise<{ data: CommunicationWithDetails[]; totalCount: number }> {
    const page = filters.page ?? 0;
    const pageSize = filters.pageSize ?? 20;

    // Count query
    let countQuery = supabase
      .from('communications')
      .select('id', { count: 'exact', head: true })
      .eq('is_public', true)
      .eq('is_approved', true);

    if (filters.organisationId) countQuery = countQuery.eq('organisation_id', filters.organisationId);
    if (filters.departmentId) countQuery = countQuery.eq('department_id', filters.departmentId);
    if (filters.categoryId) countQuery = countQuery.eq('category_id', filters.categoryId);

    const { count, error: countError } = await countQuery;
    if (countError) throw countError;

    // Data query
    let query = supabase
      .from('communications')
      .select(`
        *,
        contact:contacts(id, fullName, roleTitle),
        department:departments(id, name, portfolio),
        organisation:organisations(id, name),
        documents:communication_documents(*),
        recipients:communication_recipients(
          *,
          department:departments(id, name, portfolio, organisationId),
          contact:contacts(id, fullName, roleTitle)
        ),
        issueCategory:issue_categories(id, name, slug, icon)
      `)
      .eq('is_public', true)
      .eq('is_approved', true)
      .order('created_at', { ascending: false })
      .range(page * pageSize, (page + 1) * pageSize - 1);

    if (filters.organisationId) query = query.eq('organisation_id', filters.organisationId);
    if (filters.departmentId) query = query.eq('department_id', filters.departmentId);
    if (filters.categoryId) query = query.eq('category_id', filters.categoryId);

    const { data, error } = await query;
    if (error) throw error;

    const mapped = (data || []).map((row: Record<string, unknown>) => {
      const result = this.mapCommunicationWithDetails(row);
      // Filter out private documents for public view
      result.documents = result.documents?.filter(d => d.isPublic) || [];
      return result;
    });

    return { data: mapped, totalCount: count ?? 0 };
  }

  // ==========================================================================
  // UPDATE
  // ==========================================================================

  async updateCommunicationStatus(
    id: string,
    status: CommunicationStatus,
    userId: string
  ): Promise<Communication> {
    const updates: Record<string, unknown> = {
      status,
      updated_at: new Date().toISOString(),
    };

    if (status === 'RESPONDED') {
      updates.responded_at = new Date().toISOString();
    }
    if (status === 'CLOSED') {
      updates.closed_at = new Date().toISOString();
    }

    const { data, error } = await supabase
      .from('communications')
      .update(updates)
      .eq('id', id)
      .select()
      .single();

    if (error) throw error;
    const communication = this.mapCommunication(data);

    // Log status change
    await activityLogService.log(id, userId, 'communication:status_changed', {
      from: communication.status,
      to: status,
    });

    // Notify all members except the one who changed it
    try {
      const members = await communicationMemberService.getMembers(id);
      const otherMembers = members.filter(m => m.userId !== userId);
      for (const member of otherMembers) {
        await notificationService.createNotification(
          member.userId,
          'communication_status_changed',
          `Status changed to ${status}`,
          `The status of "${communication.title}" was changed to ${status}.`,
          id,
          { status, changedBy: userId }
        );
      }
    } catch {
      // Notification failure is non-blocking
    }

    return communication;
  }

  // ==========================================================================
  // DOCUMENTS
  // ==========================================================================

  async uploadDocument(
    communicationId: string,
    file: File,
    documentType: CommunicationDocumentType,
    isPublic: boolean,
    userId: string,
    description?: string,
    recipientId?: string
  ): Promise<CommunicationDocument> {
    // Validate file size (50MB max)
    if (file.size > 50 * 1024 * 1024) {
      throw new Error('File size exceeds 50MB limit');
    }

    // Generate storage path
    const ext = file.name.split('.').pop() || 'pdf';
    const filename = `${crypto.randomUUID()}.${ext}`;
    const storagePath = `communications/${communicationId}/${filename}`;

    // Upload to Supabase Storage
    const { error: uploadError } = await supabase.storage
      .from('packages-storage')
      .upload(storagePath, file);

    if (uploadError) throw uploadError;

    // Insert metadata (use actual DB column names — documentType is camelCase in production)
    const { data, error } = await supabase
      .from('communication_documents')
      .insert({
        communication_id: communicationId,
        documentType,
        filename,
        original_name: file.name,
        mime_type: file.type,
        size_bytes: file.size,
        storage_path: storagePath,
        is_public: isPublic,
        description: description || null,
        uploaded_by: userId,
        recipient_id: recipientId || null,
      })
      .select()
      .single();

    if (error) throw error;
    const doc = this.mapDocument(data);

    // Log upload
    await activityLogService.log(communicationId, userId, 'communication:document_uploaded', {
      filename: file.name,
      documentType,
      isPublic,
    });

    // Notify members
    try {
      const members = await communicationMemberService.getMembers(communicationId);
      const otherMembers = members.filter(m => m.userId !== userId);
      for (const member of otherMembers) {
        await notificationService.createNotification(
          member.userId,
          'communication_document_uploaded',
          'New document uploaded',
          `A document "${file.name}" was uploaded.`,
          communicationId,
          { filename: file.name, uploadedBy: userId }
        );
      }
    } catch {
      // Notification failure is non-blocking
    }

    return doc;
  }

  async deleteDocument(documentId: string): Promise<void> {
    // Get document to find storage path
    const { data: doc, error: fetchError } = await supabase
      .from('communication_documents')
      .select('storage_path')
      .eq('id', documentId)
      .single();

    if (fetchError) throw fetchError;

    // Delete from storage
    if (doc?.storage_path) {
      await supabase.storage.from('packages-storage').remove([doc.storage_path]);
    }

    // Delete metadata
    const { error } = await supabase
      .from('communication_documents')
      .delete()
      .eq('id', documentId);

    if (error) throw error;
  }

  async getDocumentUrl(storagePath: string): Promise<string> {
    const { data } = supabase.storage
      .from('packages-storage')
      .getPublicUrl(storagePath);

    return data?.publicUrl || '';
  }

  // ==========================================================================
  // DELETE
  // ==========================================================================

  async deleteCommunication(id: string): Promise<void> {
    // Cascade delete handles documents + storage
    const { error } = await supabase
      .from('communications')
      .delete()
      .eq('id', id);

    if (error) throw error;
  }

  // ==========================================================================
  // MAPPERS
  // ==========================================================================

  private mapCommunication(row: Record<string, unknown>): Communication {
    return {
      id: row.id as string,
      title: row.title as string,
      description: row.description as string | undefined,
      communicationType: (row.communication_type ?? row.communicationType) as CommunicationType,
      status: row.status as CommunicationStatus,
      contactId: (row.contact_id ?? row.contactId) as string | undefined,
      departmentId: (row.department_id ?? row.departmentId) as string | undefined,
      organisationId: (row.organisation_id ?? row.organisationId) as string | undefined,
      category: row.category as string | undefined,
      categoryId: (row.category_id ?? row.categoryId) as string | undefined,
      tags: (row.tags as string[]) || [],
      expectedResponseDate: (row.expected_response_date ?? row.expectedResponseDate) as string | undefined,
      respondedAt: (row.responded_at ?? row.respondedAt) as string | undefined,
      closedAt: (row.closed_at ?? row.closedAt) as string | undefined,
      isPublic: (row.is_public ?? row.isPublic) as boolean,
      isApproved: (row.is_approved ?? row.isApproved) as boolean,
      createdById: (row.created_by_id ?? row.createdById) as string,
      senderOrganisation: (row.sender_organisation ?? row.senderOrganisation) as string | undefined,
      createdAt: (row.created_at ?? row.createdAt) as string,
      updatedAt: (row.updated_at ?? row.updatedAt) as string,
    };
  }

  private mapDocument(row: Record<string, unknown>): CommunicationDocument {
    return {
      id: row.id as string,
      communicationId: (row.communication_id ?? row.communicationId) as string,
      documentType: (row.document_type ?? row.documentType) as CommunicationDocumentType,
      filename: row.filename as string,
      originalName: (row.original_name ?? row.originalName) as string,
      mimeType: (row.mime_type ?? row.mimeType) as string,
      sizeBytes: (row.size_bytes ?? row.sizeBytes) as number,
      storagePath: (row.storage_path ?? row.storagePath) as string,
      isPublic: (row.is_public ?? row.isPublic) as boolean,
      description: row.description as string | undefined,
      uploadedAt: (row.uploaded_at ?? row.uploadedAt) as string,
      uploadedBy: (row.uploaded_by ?? row.uploadedBy) as string,
      recipientId: (row.recipient_id ?? row.recipientId) as string | undefined,
    };
  }

  private mapCommunicationWithDetails(row: Record<string, unknown>): CommunicationWithDetails {
    const communication = this.mapCommunication(row);
    const documents = Array.isArray(row.documents)
      ? row.documents.map((d: Record<string, unknown>) => this.mapDocument(d))
      : [];

    const recipients = Array.isArray(row.recipients)
      ? row.recipients.map((r: Record<string, unknown>) => this.mapRecipient(r))
      : [];

    return {
      ...communication,
      contact: row.contact as CommunicationWithDetails['contact'],
      department: row.department as CommunicationWithDetails['department'],
      organisation: row.organisation as CommunicationWithDetails['organisation'],
      documents,
      recipients,
      issueCategory: row.issueCategory as CommunicationWithDetails['issueCategory'],
    };
  }

  private mapRecipient(row: Record<string, unknown>): CommunicationRecipient {
    const dept = row.department as Record<string, unknown> | null;
    return {
      id: row.id as string,
      communicationId: (row.communication_id ?? row.communicationId) as string,
      departmentId: (row.department_id ?? row.departmentId) as string,
      contactId: (row.contact_id ?? row.contactId) as string | undefined,
      deliveryStatus: ((row.delivery_status ?? row.deliveryStatus) as CommunicationRecipient['deliveryStatus']) || 'PENDING',
      sentAt: (row.sent_at ?? row.sentAt) as string | undefined,
      deliveredAt: (row.delivered_at ?? row.deliveredAt) as string | undefined,
      responseStatus: (row.response_status as CommunicationRecipient['responseStatus']) || 'RECEIVED',
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

export const communicationService = CommunicationService.getInstance();
