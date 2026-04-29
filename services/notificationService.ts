import { supabase } from './supabaseClient';

export interface NotificationPayload {
    recipientId: string;
    recipientEmail: string;
    recipientName: string;
    packageId: string;
    packageName: string;
    documentCount: number;
}

/**
 * Notification Service
 * Handles sending official communications (Email/Digital) for packages.
 * In a production environment, this would call a Supabase Edge Function 
 * or an external provider like Resend/Postmark.
 */
export const notificationService = {
    /**
     * Send a package notification to a department contact
     */
    async sendPackageNotification(payload: NotificationPayload): Promise<{ success: boolean; error?: string }> {
        console.log(`[NotificationService] Sending package "${payload.packageName}" to ${payload.recipientName} (${payload.recipientEmail})...`);

        // Simulate API delay
        await new Promise(resolve => setTimeout(resolve, 800));

        // Log the attempted outreach in Supabase
        const { error: logError } = await supabase
            .from('outreach_logs')
            .insert({
                organisation_id: null, // Would be derived from recipient
                contact_id: payload.recipientId,
                channel_used: 'email',
                status: 'sent',
                sent_date: new Date().toISOString(),
                notes: `Automated notification for package: ${payload.packageName}`
            });

        if (logError) {
            console.error('[NotificationService] Failed to log outreach:', logError);
            return { success: false, error: logError.message };
        }

        // Update package recipient status
        const { error: updateError } = await supabase
            .from('package_recipients')
            .update({
                deliveryStatus: 'SENT',
                sentAt: new Date().toISOString()
            })
            .match({
                package_id: payload.packageId,
                recipient_email: payload.recipientEmail
            });

        if (updateError) {
            console.warn('[NotificationService] Failed to update delivery status:', updateError);
            // We don't fail the whole operation if just the delivery status update fails
        }

        return { success: true };
    },

    /**
     * Batch send notifications for multiple recipients
     */
    async batchSendNotifications(notifications: NotificationPayload[]): Promise<{ successCount: number; failureCount: number }> {
        let successCount = 0;
        let failureCount = 0;

        for (const notification of notifications) {
            const result = await this.sendPackageNotification(notification);
            if (result.success) {
                successCount++;
            } else {
                failureCount++;
            }
        }

        return { successCount, failureCount };
    }
};
