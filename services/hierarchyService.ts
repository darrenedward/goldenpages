/**
 * Hierarchy Service
 * 
 * Handles data fetching for organization hierarchy features:
 * - Organizations with department counts
 * - Organization details with departments
 * - Departments with contact counts
 * - Department contacts with channels
 */

import { supabase } from './supabaseClient';
import type {
  Organization,
  OrganizationWithCounts,
  Department,
  DepartmentWithContacts,
  DepartmentNode,
  Contact,
  ContactWithChannels,
  ContactChannel,
} from '@/types';

class HierarchyService {
  private static instance: HierarchyService;

  private constructor() {}

  static getInstance(): HierarchyService {
    if (!HierarchyService.instance) {
      HierarchyService.instance = new HierarchyService();
    }
    return HierarchyService.instance;
  }

  // ==========================================================================
  // ORGANIZATIONS
  // ==========================================================================

  /**
   * Get all organizations with department and contact counts
   */
  async getOrganizations(): Promise<OrganizationWithCounts[]> {
    const { data, error } = await supabase
      .from('organisations')
      .select(`
        *,
        departments(count),
        contacts(count)
      `)
      .order('name');

    if (error) throw error;

    return (data || []).map((org: any) => ({
      ...org,
      departmentCount: org.departments?.[0]?.count || 0,
      contactCount: org.contacts?.[0]?.count || 0,
    }));
  }

  /**
   * Get organization by ID
   */
  async getOrganization(id: string): Promise<Organization | null> {
    const { data, error } = await supabase
      .from('organisations')
      .select('*')
      .eq('id', id)
      .single();

    if (error) throw error;
    return data;
  }

  /**
   * Search organizations by name
   */
  async searchOrganizations(query: string): Promise<OrganizationWithCounts[]> {
    const { data, error } = await supabase
      .from('organisations')
      .select(`
        *,
        departments(count),
        contacts(count)
      `)
      .ilike('name', `%${query}%`)
      .order('name')
      .limit(50);

    if (error) throw error;

    return (data || []).map((org: any) => ({
      ...org,
      departmentCount: org.departments?.[0]?.count || 0,
      contactCount: org.contacts?.[0]?.count || 0,
    }));
  }

  // ==========================================================================
  // DEPARTMENTS
  // ==========================================================================

  /**
   * Get departments for an organization with contact counts
   */
  async getDepartments(organisationId: string): Promise<DepartmentWithContacts[]> {
    const { data, error } = await supabase
      .from('departments')
      .select(`
        *,
        contacts(count),
        organisation:organisations(*)
      `)
      .eq('organisationId', organisationId)
      .eq('isActive', true)
      .order('name');

    if (error) throw error;

    return (data || []).map((dept: any) => ({
      ...dept,
      contactCount: dept.contacts?.[0]?.count || 0,
      organisation: dept.organisation,
    }));
  }

  /**
   * Get department by ID
   */
  async getDepartment(id: string): Promise<Department | null> {
    const { data, error } = await supabase
      .from('departments')
      .select('*')
      .eq('id', id)
      .single();

    if (error) throw error;
    return data;
  }

  /**
   * Build hierarchical tree from flat department list
   */
  buildDepartmentTree(departments: DepartmentWithContacts[]): DepartmentNode[] {
    const map = new Map<string, DepartmentNode>();
    const roots: DepartmentNode[] = [];

    // First pass: create nodes
    departments.forEach(dept => {
      map.set(dept.id, { ...dept, children: [], level: 0 });
    });

    // Second pass: build hierarchy
    departments.forEach(dept => {
      const node = map.get(dept.id)!;
      if (dept.parentId && map.has(dept.parentId)) {
        const parent = map.get(dept.parentId)!;
        parent.children.push(node);
        node.level = parent.level + 1;
      } else {
        roots.push(node);
      }
    });

    return roots;
  }

  // ==========================================================================
  // CONTACTS
  // ==========================================================================

  /**
   * Get contacts for a department with channels
   */
  async getDepartmentContacts(departmentId: string): Promise<ContactWithChannels[]> {
    const { data, error } = await supabase
      .from('contacts')
      .select(`
        id,
        fullName,
        roleTitle,
        departmentId,
        organisationId,
        isHeadOfficeBased,
        createdAt,
        updatedAt,
        contactChannels:contact_channels(*),
        department:departments!inner(id,name,code,portfolio,organisationId,parentId,isActive,createdAt,updatedAt),
        organisation:organisations(id,name)
      `)
      .eq('departmentId', departmentId)
      .order('fullName', { ascending: true });

    if (error) throw error;
    return (data || []) as unknown as ContactWithChannels[];
  }

  /**
   * Get contacts for an organization
   */
  async getOrganizationContacts(organisationId: string): Promise<ContactWithChannels[]> {
    const { data, error } = await supabase
      .from('contacts')
      .select(`
        id,
        fullName,
        roleTitle,
        departmentId,
        organisationId,
        isHeadOfficeBased,
        createdAt,
        updatedAt,
        contactChannels:contact_channels(*),
        department:departments!inner(id,name,code,portfolio,organisationId,parentId,isActive,createdAt,updatedAt)
      `)
      .eq('organisationId', organisationId)
      .order('fullName', { ascending: true });

    if (error) throw error;
    return (data || []) as unknown as ContactWithChannels[];
  }

  /**
   * Search contacts by name or role
   */
  async searchContacts(query: string, departmentId?: string): Promise<ContactWithChannels[]> {
    let queryBuilder = supabase
      .from('contacts')
      .select(`
        *,
        contactChannels(*),
        department:departments(*)
      `)
      .or(`fullName.ilike.%${query}%,roleTitle.ilike.%${query}%`)
      .order('fullName')
      .limit(50);

    if (departmentId) {
      queryBuilder = queryBuilder.eq('departmentId', departmentId);
    }

    const { data, error } = await queryBuilder;

    if (error) throw error;
    return data || [];
  }

  // ==========================================================================
  // CREATE/UPDATE OPERATIONS
  // ==========================================================================

  /**
   * Create a new department
   */
  async createDepartment(
    department: Omit<Department, 'id' | 'createdAt' | 'updatedAt'>,
    userId: string
  ): Promise<Department> {
    const now = new Date().toISOString();
    const { data, error } = await supabase
      .from('departments')
      .insert({
        ...department,
        createdAt: now,
        updatedAt: now,
        createdBy: userId,
        updatedBy: userId,
      })
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  /**
   * Update a department
   */
  async updateDepartment(
    id: string,
    updates: Partial<Omit<Department, 'id' | 'createdAt' | 'updatedAt'>>,
    userId: string
  ): Promise<Department> {
    const { data, error } = await supabase
      .from('departments')
      .update({
        ...updates,
        updatedAt: new Date().toISOString(),
        updatedBy: userId,
      })
      .eq('id', id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }

  /**
   * Delete a department (soft delete by setting isActive to false)
   */
  async deleteDepartment(id: string, userId: string): Promise<void> {
    const { error } = await supabase
      .from('departments')
      .update({
        isActive: false,
        updatedAt: new Date().toISOString(),
        updatedBy: userId,
      })
      .eq('id', id);

    if (error) throw error;
  }
}

// Export singleton instance
export const hierarchyService = HierarchyService.getInstance();
