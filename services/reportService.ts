import { supabase } from './supabaseClient';

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
    return {
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
  },
};
