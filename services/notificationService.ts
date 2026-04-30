/**
 * Notification Service
 *
 * Manages in-app notifications:
 * - Create notifications (triggers email via Edge Function)
 * - Get/mark notifications for a user
 * - Realtime subscription support
 * - Custom from addresses and reply-to for email threading
 */

import { supabase } from './supabaseClient';
import { settingsService } from './settingsService';
import type { AppNotification, NotificationType } from '@/types';

interface SendEmailOptions {
  to: string;
  subject: string;
  html: string;
  replyTo?: string;
  fromEmail?: string;
  fromName?: string;
}

class NotificationService {
  private static instance: NotificationService;

  private constructor() {}

  static getInstance(): NotificationService {
    if (!NotificationService.instance) {
      NotificationService.instance = new NotificationService();
    }
    return NotificationService.instance;
  }

  // ==========================================================================
  // CREATE
  // ==========================================================================

  async createNotification(
    userId: string,
    type: NotificationType,
    title: string,
    message: string,
    resourceId?: string | null,
    metadata?: Record<string, unknown> | null
  ): Promise<AppNotification> {
    const { data, error } = await supabase
      .from('notifications')
      .insert({
        user_id: userId,
        type,
        title,
        message,
        resource_id: resourceId ?? null,
        metadata: metadata ?? null,
      })
      .select()
      .single();

    if (error) {
      console.error('[NotificationService] Failed to create notification:', error);
      throw error;
    }

    // Fire-and-forget email attempt
    const emailDomain = await settingsService.getEmailDomain();
    this.sendEmailNotification(userId, title, message, {
      replyTo: metadata?.communicationId
        ? `reply+${metadata.communicationId}@${emailDomain}`
        : undefined,
    }).catch(() => {
      // Email failure is non-blocking
    });

    return this.mapNotification(data);
  }

  // ==========================================================================
  // READ
  // ==========================================================================

  async getNotificationsForUser(
    userId: string,
    page = 0,
    pageSize = 20
  ): Promise<{ data: AppNotification[]; totalCount: number }> {
    const { count, error: countError } = await supabase
      .from('notifications')
      .select('id', { count: 'exact', head: true })
      .eq('user_id', userId);

    if (countError) throw countError;

    const { data, error } = await supabase
      .from('notifications')
      .select('*')
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
      .range(page * pageSize, (page + 1) * pageSize - 1);

    if (error) throw error;

    return {
      data: (data || []).map((row: Record<string, unknown>) => this.mapNotification(row)),
      totalCount: count ?? 0,
    };
  }

  async getUnreadCount(userId: string): Promise<number> {
    const { count, error } = await supabase
      .from('notifications')
      .select('id', { count: 'exact', head: true })
      .eq('user_id', userId)
      .eq('is_read', false);

    if (error) throw error;
    return count ?? 0;
  }

  // ==========================================================================
  // UPDATE
  // ==========================================================================

  async markAsRead(id: string, userId: string): Promise<void> {
    const { error } = await supabase
      .from('notifications')
      .update({ is_read: true, read_at: new Date().toISOString() })
      .eq('id', id)
      .eq('user_id', userId);

    if (error) throw error;
  }

  async markAllAsRead(userId: string): Promise<void> {
    const { error } = await supabase
      .from('notifications')
      .update({ is_read: true, read_at: new Date().toISOString() })
      .eq('user_id', userId)
      .eq('is_read', false);

    if (error) throw error;
  }

  // ==========================================================================
  // EMAIL (Edge Function)
  // ==========================================================================

  /**
   * Send an email directly via the Edge Function.
   * Used for confirmation emails and custom email sending.
   */
  async sendEmail(options: SendEmailOptions): Promise<boolean> {
    try {
      const { error } = await supabase.functions.invoke('send-notification', {
        body: {
          to: options.to,
          subject: options.subject,
          html: options.html,
          replyTo: options.replyTo,
          fromEmail: options.fromEmail,
          fromName: options.fromName,
        },
      });

      if (error) {
        console.warn('[NotificationService] Edge function error:', error);
        return false;
      }
      return true;
    } catch {
      return false;
    }
  }

  private async sendEmailNotification(
    userId: string,
    title: string,
    message: string,
    options?: { replyTo?: string }
  ): Promise<void> {
    const { data: user } = await supabase
      .from('users')
      .select('email, display_name')
      .eq('id', userId)
      .maybeSingle();

    if (!user?.email) return;

    try {
      const { error } = await supabase.functions.invoke('send-notification', {
        body: {
          to: user.email,
          subject: title,
          html: this.buildEmailHtml(user.display_name || user.email, title, message),
          replyTo: options?.replyTo,
        },
      });

      if (error) {
        console.warn('[NotificationService] Edge function error:', error);
      }
    } catch {
      // Edge function not deployed yet — silent fail
    }
  }

  // ==========================================================================
  // EMAIL TEMPLATES
  // ==========================================================================

  private buildEmailHtml(name: string, title: string, message: string): string {
    return `
      <div style="font-family: 'Inter', sans-serif; max-width: 600px; margin: 0 auto; padding: 24px;">
        <h2 style="color: #1e293b; font-size: 18px; margin-bottom: 8px;">Golden Pages Notification</h2>
        <p style="color: #64748b; font-size: 14px; margin-bottom: 16px;">Hello ${name},</p>
        <div style="background: #f8f7f4; border-radius: 12px; padding: 16px; border: 1px solid #e7e5e4;">
          <h3 style="color: #1e293b; font-size: 16px; margin: 0 0 8px;">${title}</h3>
          <p style="color: #57534e; font-size: 14px; margin: 0;">${message}</p>
        </div>
        <p style="color: #a8a29e; font-size: 12px; margin-top: 24px;">
          New World Alliances Foundation — Golden Pages
        </p>
      </div>
    `;
  }

  buildContactConfirmationHtml(name: string, subject: string, message: string): string {
    return `
      <div style="font-family: 'Inter', sans-serif; max-width: 600px; margin: 0 auto; padding: 24px;">
        <h2 style="color: #1e293b; font-size: 18px; margin-bottom: 8px;">Thank you for contacting us</h2>
        <p style="color: #64748b; font-size: 14px; margin-bottom: 16px;">Hello ${name},</p>
        <p style="color: #57534e; font-size: 14px; margin-bottom: 16px;">
          We have received your message and will get back to you as soon as possible.
        </p>
        <div style="background: #f8f7f4; border-radius: 12px; padding: 16px; border: 1px solid #e7e5e4;">
          <p style="color: #a8a29e; font-size: 12px; margin: 0 0 4px;">Your message:</p>
          <h3 style="color: #1e293b; font-size: 16px; margin: 0 0 8px;">${subject}</h3>
          <p style="color: #57534e; font-size: 14px; margin: 0; white-space: pre-wrap;">${message}</p>
        </div>
        <p style="color: #a8a29e; font-size: 12px; margin-top: 24px;">
          New World Alliances Foundation — Golden Pages
        </p>
      </div>
    `;
  }

  buildReportConfirmationHtml(name: string, referenceId: string, subject: string): string {
    return `
      <div style="font-family: 'Inter', sans-serif; max-width: 600px; margin: 0 auto; padding: 24px;">
        <h2 style="color: #1e293b; font-size: 18px; margin-bottom: 8px;">Your report has been received</h2>
        <p style="color: #64748b; font-size: 14px; margin-bottom: 16px;">Hello ${name},</p>
        <p style="color: #57534e; font-size: 14px; margin-bottom: 16px;">
          Thank you for your submission. Our team will review your report and take appropriate action.
        </p>
        <div style="background: #f8f7f4; border-radius: 12px; padding: 16px; border: 1px solid #e7e5e4;">
          <p style="color: #a8a29e; font-size: 12px; margin: 0 0 4px;">Reference number:</p>
          <h3 style="color: #1e293b; font-size: 16px; margin: 0 0 8px;">${referenceId}</h3>
          <p style="color: #57534e; font-size: 14px; margin: 0;">${subject}</p>
        </div>
        <p style="color: #57534e; font-size: 14px; margin-top: 16px;">
          Please keep this reference number for your records. You can use it to follow up on the status of your report.
        </p>
        <p style="color: #a8a29e; font-size: 12px; margin-top: 24px;">
          New World Alliances Foundation — Golden Pages
        </p>
      </div>
    `;
  }

  // ==========================================================================
  // MAPPER
  // ==========================================================================

  private mapNotification(row: Record<string, unknown>): AppNotification {
    return {
      id: row.id as string,
      userId: row.user_id as string,
      type: row.type as NotificationType,
      title: row.title as string,
      message: row.message as string,
      isRead: row.is_read as boolean,
      readAt: row.read_at as string | null,
      resourceId: row.resource_id as string | null,
      metadata: row.metadata as Record<string, unknown> | null,
      createdAt: row.created_at as string,
    };
  }
}

export const notificationService = NotificationService.getInstance();
