/**
 * Permissions and Role Service
 *
 * Handles RBAC (Role-Based Access Control) operations including:
 * - Checking user roles
 * - Checking user permissions
 * - Fetching user permissions from database
 */

import { supabase } from './supabaseClient';

// ============================================================================
// TYPES
// ============================================================================

export type UserRole = 'admin' | 'editor' | 'user';

export interface Role {
  id: string;
  name: UserRole;
  description?: string;
}

export interface RolePermission {
  role_id: string;
  permission: string;
}

export interface UserRoleMapping {
  user_id: string;
  role_id: string;
  assigned_at: string;
  assigned_by?: string;
}

export interface UserPermissions {
  roles: UserRole[];
  permissions: string[];
  isAdmin: boolean;
}

// Permission format: 'resource:action'
export type Permission =
  // Organization permissions
  | 'org:read' | 'org:write' | 'org:delete'
  // Contact permissions
  | 'contact:read' | 'contact:write' | 'contact:archive' | 'contact:delete'
  // Channel permissions
  | 'channel:read' | 'channel:write' | 'channel:delete'
  // Note permissions
  | 'note:read' | 'note:write' | 'note:delete'
  // Outreach permissions
  | 'outreach:read' | 'outreach:initiate' | 'outreach:delete'
  // Department permissions (NEW - Phase 0)
  | 'department:read' | 'department:write'
  // Package permissions (NEW - Phase 0)
  | 'package:read' | 'package:write' | 'package:delete' | 'package:send' | 'package:close'
  // Document permissions (NEW - Phase 0)
  | 'document:read' | 'document:write' | 'document:delete'
  // Communication permissions
  | 'communication:read' | 'communication:write' | 'communication:delete'
  // Admin permissions
  | 'admin:access' | 'admin:users' | 'admin:audit'
  // Wildcard
  | '*'
  | '*:*'; // Admin wildcard from database

// ============================================================================
// SERVICE
// ============================================================================

class PermissionsService {
  private permissionsCache: Map<string, UserPermissions> = new Map();
  private cacheExpiry: Map<string, number> = new Map();
  private readonly CACHE_TTL = 5 * 60 * 1000; // 5 minutes

  // ==========================================================================
  // PERMISSION CHECKING
  // ==========================================================================

  /**
   * Check if user has a specific permission
   * Uses client-side cache for performance
   * Supports '*' and '*:*' wildcards
   */
  async hasPermission(userId: string, requiredPermission: Permission): Promise<boolean> {
    const userPermissions = await this.getUserPermissions(userId);
    return userPermissions.permissions.includes('*') ||
           userPermissions.permissions.includes('*:*') ||
           userPermissions.permissions.includes(requiredPermission);
  }

  /**
   * Check if user has any of the specified permissions
   */
  async hasAnyPermission(userId: string, requiredPermissions: Permission[]): Promise<boolean> {
    const userPermissions = await this.getUserPermissions(userId);
    if (userPermissions.permissions.includes('*') || userPermissions.permissions.includes('*:*')) return true;

    return requiredPermissions.some(p => userPermissions.permissions.includes(p));
  }

  /**
   * Check if user has all of the specified permissions
   */
  async hasAllPermissions(userId: string, requiredPermissions: Permission[]): Promise<boolean> {
    const userPermissions = await this.getUserPermissions(userId);
    if (userPermissions.permissions.includes('*') || userPermissions.permissions.includes('*:*')) return true;

    return requiredPermissions.every(p => userPermissions.permissions.includes(p));
  }

  /**
   * Check if user has a specific role
   */
  async hasRole(userId: string, requiredRole: UserRole): Promise<boolean> {
    const userPermissions = await this.getUserPermissions(userId);
    return userPermissions.roles.includes(requiredRole);
  }

  /**
   * Check if user is an admin
   */
  async isAdmin(userId: string): Promise<boolean> {
    const userPermissions = await this.getUserPermissions(userId);
    return userPermissions.isAdmin;
  }

  // ==========================================================================
  // DATA FETCHING
  // ==========================================================================

  /**
   * Get all permissions for a user (with caching)
   */
  async getUserPermissions(userId: string): Promise<UserPermissions> {
    const now = Date.now();
    const cached = this.permissionsCache.get(userId);
    const expiry = this.cacheExpiry.get(userId);

    // Return cached data if still valid
    if (cached && expiry && now < expiry) {
      return cached;
    }

    // Fetch from database
    const { data, error } = await supabase
      .from('user_roles')
      .select('role_id, roles(name, role_permissions(permission))')
      .eq('user_id', userId);

    if (error || !data) {
      console.error('Error fetching user permissions:', error);
      return { roles: [], permissions: [], isAdmin: false };
    }

    const roles: UserRole[] = [];
    const permissions: Set<string> = new Set();
    let isAdmin = false;

    for (const item of data) {
      const role = item.roles as any;
      if (!role) continue;

      roles.push(role.name);

      if (role.name === 'admin') {
        isAdmin = true;
      }

      // Add all permissions for this role
      if (role.role_permissions && Array.isArray(role.role_permissions)) {
        role.role_permissions.forEach((rp: any) => {
          permissions.add(rp.permission);
        });
      }
    }

    const result: UserPermissions = {
      roles,
      permissions: Array.from(permissions),
      isAdmin,
    };

    // Cache the result
    this.permissionsCache.set(userId, result);
    this.cacheExpiry.set(userId, now + this.CACHE_TTL);

    return result;
  }

  /**
   * Get user roles directly from database
   */
  async getUserRoles(userId: string): Promise<UserRole[]> {
    const { data, error } = await supabase
      .from('user_roles')
      .select('roles(name)')
      .eq('user_id', userId);

    if (error || !data) {
      console.error('Error fetching user roles:', error);
      return [];
    }

    // roles is an array, so we need to map over it
    return data
      .flatMap(item => {
        const roles = item.roles as any;
        return roles ? [roles.name] : [];
      })
      .filter(Boolean) as UserRole[];
  }

  /**
   * Get all available roles
   */
  async getAllRoles(): Promise<Role[]> {
    const { data, error } = await supabase
      .from('roles')
      .select('*');

    if (error || !data) {
      console.error('Error fetching roles:', error);
      return [];
    }

    return data;
  }

  /**
   * Get permissions for a specific role
   */
  async getRolePermissions(roleId: string): Promise<string[]> {
    const { data, error } = await supabase
      .from('role_permissions')
      .select('permission')
      .eq('role_id', roleId);

    if (error || !data) {
      console.error('Error fetching role permissions:', error);
      return [];
    }

    return data.map(p => p.permission);
  }

  // ==========================================================================
  // ADMIN FUNCTIONS
  // ==========================================================================

  /**
   * Assign a role to a user (admin only)
   */
  async assignRole(userId: string, role: UserRole, assignedBy?: string): Promise<{ error: any }> {
    // Get role ID
    const { data: roleData } = await supabase
      .from('roles')
      .select('id')
      .eq('name', role)
      .single();

    if (!roleData) {
      return { error: new Error('Role not found') };
    }

    const { error } = await supabase
      .from('user_roles')
      .insert({
        user_id: userId,
        role_id: roleData.id,
        assigned_by: assignedBy,
      });

    // Clear cache for this user
    this.clearCache(userId);

    return { error };
  }

  /**
   * Remove a role from a user (admin only)
   */
  async removeRole(userId: string, role: UserRole): Promise<{ error: any }> {
    const { data: roleData } = await supabase
      .from('roles')
      .select('id')
      .eq('name', role)
      .single();

    if (!roleData) {
      return { error: new Error('Role not found') };
    }

    const { error } = await supabase
      .from('user_roles')
      .delete()
      .eq('user_id', userId)
      .eq('role_id', roleData.id);

    // Clear cache for this user
    this.clearCache(userId);

    return { error };
  }

  // ==========================================================================
  // CACHE MANAGEMENT
  // ==========================================================================

  /**
   * Clear cached permissions for a user
   */
  clearCache(userId: string): void {
    this.permissionsCache.delete(userId);
    this.cacheExpiry.delete(userId);
  }

  /**
   * Clear all cached permissions
   */
  clearAllCache(): void {
    this.permissionsCache.clear();
    this.cacheExpiry.clear();
  }

  // ==========================================================================
  // UTILITY METHODS
  // ==========================================================================

  /**
   * Check if a permission string matches a pattern
   * Supports wildcards, e.g., 'org:*' matches 'org:read', 'org:write'
   */
  matchesPermission(userPermission: string, requiredPermission: Permission): boolean {
    if (userPermission === '*') return true;
    if (userPermission === requiredPermission) return true;

    const [resource, action] = requiredPermission.split(':');
    const userPattern = userPermission.split(':');

    if (userPattern.length === 2) {
      const [userResource, userAction] = userPattern;
      if (userResource === '*' && userAction === '*') return true;
      if (userResource === resource && (userAction === '*' || userAction === action)) return true;
    }

    return false;
  }

  /**
   * Get permission description
   */
  getPermissionDescription(permission: Permission): string {
    const descriptions: Record<Permission, string> = {
      'org:read': 'View organizations',
      'org:write': 'Create and edit organizations',
      'org:delete': 'Delete organizations',
      'contact:read': 'View contacts',
      'contact:write': 'Create and edit contacts',
      'contact:archive': 'Archive contacts',
      'contact:delete': 'Delete contacts',
      'channel:read': 'View contact channels',
      'channel:write': 'Create and edit contact channels',
      'channel:delete': 'Delete contact channels',
      'note:read': 'View notes',
      'note:write': 'Create and edit notes',
      'note:delete': 'Delete notes',
      'outreach:read': 'View outreach logs',
      'outreach:initiate': 'Create outreach activities',
      'outreach:delete': 'Delete outreach logs',
      'department:read': 'View departments',
      'department:write': 'Create and edit departments',
      'package:read': 'View packages',
      'package:write': 'Create and edit packages',
      'package:delete': 'Delete packages',
      'package:send': 'Send packages',
      'package:close': 'Close packages',
      'document:read': 'View documents',
      'document:write': 'Create and edit documents',
      'document:delete': 'Delete documents',
      'communication:read': 'View communications',
      'communication:write': 'Create and manage communications',
      'communication:delete': 'Delete communications',
      'admin:access': 'Access admin panel',
      'admin:users': 'Manage users',
      'admin:audit': 'View audit logs',
      '*': 'All permissions',
      '*:*': 'All permissions (wildcard)',
    };

    return descriptions[permission] || permission;
  }
}

// ============================================================================
// EXPORT SINGLETON INSTANCE
// ============================================================================

export const permissionsService = new PermissionsService();
