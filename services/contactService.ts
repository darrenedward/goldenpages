import { supabase } from './supabaseClient';
import { notificationService } from './notificationService';

export interface ContactSubmission {
  id: string;
  name: string;
  email: string;
  subject: string;
  message: string;
  createdAt: string;
}

export const contactService = {
  async submit(input: { name: string; email: string; subject: string; message: string }): Promise<ContactSubmission> {
    const { data, error } = await supabase
      .from('contact_submissions')
      .insert({
        name: input.name.trim(),
        email: input.email.trim().toLowerCase(),
        subject: input.subject.trim(),
        message: input.message.trim(),
      })
      .select()
      .single();

    if (error) throw error;

    const submission: ContactSubmission = {
      id: data.id,
      name: data.name,
      email: data.email,
      subject: data.subject,
      message: data.message,
      createdAt: data.created_at,
    };

    // Fire-and-forget confirmation email to submitter
    notificationService.sendEmail({
      to: submission.email,
      subject: 'We received your message — Golden Pages',
      html: notificationService.buildContactConfirmationHtml(submission.name, submission.subject, submission.message),
      fromEmail: `contact@${EMAIL_DOMAIN}`,
      fromName: 'Golden Pages Contact',
    }).catch(() => {
      // Email failure is non-blocking
    });

    // Fire-and-forget notification to admin users
    notifyAdmins('contact_submission_received', 'New Contact Submission', `${submission.name} (${submission.email}): ${submission.subject}`, submission.id).catch(() => {});

    return submission;
  },

  async subscribeNewsletter(email: string): Promise<void> {
    const { error } = await supabase
      .from('newsletter_subscribers')
      .insert({ email: email.trim().toLowerCase() });

    // Ignore duplicate email errors (unique constraint)
    if (error && !error.message.includes('duplicate') && !error.message.includes('unique')) {
      throw error;
    }
  },
};

const EMAIL_DOMAIN = 'mail.goldenpages.newworldalliances.nz';

async function notifyAdmins(type: string, title: string, message: string, resourceId: string): Promise<void> {
  const { data: adminRole } = await supabase
    .from('roles')
    .select('id')
    .eq('name', 'admin')
    .maybeSingle();

  if (!adminRole) return;

  const { data: admins } = await supabase
    .from('user_roles')
    .select('user_id')
    .eq('"roleId"', adminRole.id);

  if (!admins?.length) return;

  for (const admin of admins) {
    await supabase.from('notifications').insert({
      user_id: admin.user_id,
      type,
      title,
      message,
      resource_id: resourceId,
    });
  }
}
