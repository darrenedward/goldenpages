import { supabase } from './supabaseClient';

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
    return {
      id: data.id,
      name: data.name,
      email: data.email,
      subject: data.subject,
      message: data.message,
      createdAt: data.created_at,
    };
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
