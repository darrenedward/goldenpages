import { supabase } from './supabaseClient';

export interface IssueCategory {
  id: string;
  name: string;
  slug: string;
  description: string | null;
  icon: string | null;
  sortOrder: number;
  isActive: boolean;
  createdAt: string;
  updatedAt: string;
}

export interface CreateIssueCategoryInput {
  name: string;
  slug: string;
  description?: string;
  icon?: string;
  sortOrder?: number;
}

export interface UpdateIssueCategoryInput {
  name?: string;
  slug?: string;
  description?: string | null;
  icon?: string | null;
  sortOrder?: number;
  isActive?: boolean;
}

export const issueCategoryService = {
  async getAll(): Promise<IssueCategory[]> {
    const { data, error } = await supabase
      .from('issue_categories')
      .select('*')
      .order('sort_order', { ascending: true });

    if (error) throw error;
    return (data as IssueCategory[]) || [];
  },

  async getActive(): Promise<IssueCategory[]> {
    const { data, error } = await supabase
      .from('issue_categories')
      .select('*')
      .eq('is_active', true)
      .order('sort_order', { ascending: true });

    if (error) throw error;
    return (data as IssueCategory[]) || [];
  },

  async create(input: CreateIssueCategoryInput): Promise<IssueCategory> {
    const { data, error } = await supabase
      .from('issue_categories')
      .insert({
        name: input.name,
        slug: input.slug,
        description: input.description || null,
        icon: input.icon || null,
        sort_order: input.sortOrder || 0,
      })
      .select()
      .single();

    if (error) throw error;
    return data as IssueCategory;
  },

  async update(id: string, input: UpdateIssueCategoryInput): Promise<IssueCategory> {
    const updateData: Record<string, unknown> = {};
    if (input.name !== undefined) updateData.name = input.name;
    if (input.slug !== undefined) updateData.slug = input.slug;
    if (input.description !== undefined) updateData.description = input.description;
    if (input.icon !== undefined) updateData.icon = input.icon;
    if (input.sortOrder !== undefined) updateData.sort_order = input.sortOrder;
    if (input.isActive !== undefined) updateData.is_active = input.isActive;

    const { data, error } = await supabase
      .from('issue_categories')
      .update(updateData)
      .eq('id', id)
      .select()
      .single();

    if (error) throw error;
    return data as IssueCategory;
  },

  async delete(id: string): Promise<void> {
    const { error } = await supabase
      .from('issue_categories')
      .delete()
      .eq('id', id);

    if (error) throw error;
  },

  slugify(name: string): string {
    return name
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '_')
      .replace(/^_|_$/g, '');
  },
};
