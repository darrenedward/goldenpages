import { supabase } from './supabaseClient';
import { notificationService } from './notificationService';
import { settingsService } from './settingsService';

export interface ReportSubmission {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
  category: string;
  urgency: string;
  organizationName: string | null;
  country: string | null;
  subject: string;
  description: string;
  isAnonymous: boolean;
  status: string;
  createdAt: string;
}

export interface CreateReportInput {
  firstName: string;
  lastName: string;
  email: string;
  category: string;
  urgency: string;
  organizationName?: string;
  country?: string;
  subject: string;
  description: string;
  anonymous?: boolean;
}

export const reportService = {
  async submitReport(input: CreateReportInput): Promise<ReportSubmission> {
    const { data, error } = await supabase
      .from('reports')
      .insert({
        first_name: input.firstName.trim(),
        last_name: input.lastName.trim(),
        email: input.email.trim().toLowerCase(),
        category: input.category,
        urgency: input.urgency,
        organization_name: input.organizationName?.trim() || null,
        country: input.country?.trim() || null,
        subject: input.subject.trim(),
        description: input.description.trim(),
        is_anonymous: input.anonymous || false,
        status: 'submitted',
      })
      .select()
      .single();

    if (error) throw error;

    const submission: ReportSubmission = {
      id: data.id,
      firstName: data.first_name,
      lastName: data.last_name,
      email: data.email,
      category: data.category,
      urgency: data.urgency,
      organizationName: data.organization_name,
      country: data.country,
      subject: data.subject,
      description: data.description,
      isAnonymous: data.is_anonymous,
      status: data.status,
      createdAt: data.created_at,
    };

    // Generate short reference ID from submission ID
    const shortRef = `GP-${submission.id.substring(0, 8).toUpperCase()}`;

    // Fire-and-forget confirmation email to reporter
    if (!submission.isAnonymous) {
      (async () => {
        try {
          const senderName = await settingsService.getSenderName();
          await notificationService.sendEmail({
            to: submission.email,
            subject: `Your report has been received [${shortRef}]`,
            html: notificationService.buildReportConfirmationHtml(
              `${submission.firstName} ${submission.lastName}`,
              shortRef,
              submission.subject
            ),
            fromName: senderName,
          });
        } catch {
          // Email failure is non-blocking
        }
      })();
    }

    // Fire-and-forget notification to admin users
    notifyAdmins(
      'report_submission_received',
      'New Report Submitted',
      `${submission.firstName} ${submission.lastName}: ${submission.subject} [${submission.urgency}]`,
      submission.id
    ).catch(() => {});

    return submission;
  },
};

async function notifyAdmins(type: string, title: string, message: string, resourceId: string): Promise<void> {
  const { data: adminRole } = await supabase
    .from('roles')
    .select('id')
    .eq('name', 'admin')
    .maybeSingle();

  if (!adminRole) return;

  const { data: admins } = await supabase
    .from('user_roles')
    .select('userId')
    .eq('roleId', adminRole.id);

  if (!admins?.length) return;

  for (const admin of admins) {
    await supabase.from('notifications').insert({
      user_id: admin.userId,
      type,
      title,
      message,
      resource_id: resourceId,
    });
  }
}
