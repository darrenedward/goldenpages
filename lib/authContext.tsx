'use client';

/**
 * Authentication Context Provider
 *
 * Provides authentication state and methods throughout the app.
 * Wraps Supabase Auth and provides easy access to:
 * - User authentication state
 * - User data
 * - Auth methods (signIn, signUp, signOut)
 * - Loading states
 */

import React, { createContext, useContext, useEffect, useState, ReactNode } from 'react';
import { User, Session, AuthError } from '@supabase/supabase-js';
import { authService, type SignInCredentials, type SignUpCredentials } from '../services/authService';
import { permissionsService, type UserRole, type Permission } from '../services/permissionsService';

// ============================================================================
// TYPES
// ============================================================================

export interface AuthContextValue {
  // User & Session
  user: User | null;
  session: Session | null;
  userId: string | null;
  userEmail: string | null;

  // State
  loading: boolean;
  isAuthenticated: boolean;

  // Roles & Permissions
  roles: UserRole[];
  permissions: string[];
  isAdmin: boolean;

  // Auth Methods
  signIn: (credentials: SignInCredentials) => Promise<{ error: AuthError | null }>;
  signUp: (credentials: SignUpCredentials) => Promise<{ error: AuthError | null }>;
  signOut: () => Promise<{ error: AuthError | null }>;

  // Permission Methods
  hasPermission: (permission: Permission) => Promise<boolean>;
  hasRole: (role: UserRole) => Promise<boolean>;
  refreshPermissions: () => Promise<void>;
}

const AuthContext = createContext<AuthContextValue | undefined>(undefined);

// ============================================================================
// PROVIDER
// ============================================================================

interface AuthProviderProps {
  children: ReactNode;
}

export function AuthProvider({ children }: AuthProviderProps) {
  const [user, setUser] = useState<User | null>(null);
  const [session, setSession] = useState<Session | null>(null);
  const [loading, setLoading] = useState(true);
  const [roles, setRoles] = useState<UserRole[]>([]);
  const [permissions, setPermissions] = useState<string[]>([]);

  // Derived state
  const userId = user?.id || null;
  const userEmail = user?.email || null;
  const isAuthenticated = !!session && !!user;
  const isAdmin = roles.includes('admin');

  // ==========================================================================
  // INITIALIZE - Load session on mount
  // ==========================================================================

  useEffect(() => {
    let mounted = true;

    async function loadSession() {
      try {
        const session = await authService.getSession();
        if (mounted) {
          setSession(session);
          setUser(session?.user || null);

          if (session?.user) {
            await loadUserPermissions(session.user.id);
          }
        }
      } catch (error) {
        console.error('Error loading session:', error);
      } finally {
        if (mounted) setLoading(false);
      }
    }

    loadSession();

    // Subscribe to auth changes
    const { data: { subscription } } = authService.onAuthStateChange(
      async (_event, session) => {
        if (mounted) {
          setSession(session);
          setUser(session?.user || null);

          if (session?.user) {
            await loadUserPermissions(session.user.id);
          } else {
            setRoles([]);
            setPermissions([]);
          }
          setLoading(false);
        }
      }
    );

    return () => {
      mounted = false;
      subscription.unsubscribe();
    };
  }, []);

  // ==========================================================================
  // PERMISSIONS LOADING
  // ==========================================================================

  async function loadUserPermissions(userId: string) {
    try {
      const userPerms = await permissionsService.getUserPermissions(userId);
      setRoles(userPerms.roles);
      setPermissions(userPerms.permissions);
    } catch (error) {
      console.error('Error loading user permissions:', error);
      setRoles([]);
      setPermissions([]);
    }
  }

  async function refreshPermissions() {
    if (userId) {
      permissionsService.clearCache(userId);
      await loadUserPermissions(userId);
    }
  }

  // ==========================================================================
  // AUTH METHODS
  // ==========================================================================

  async function signIn(credentials: SignInCredentials) {
    setLoading(true);
    const { data, error } = await authService.signIn(credentials);
    setLoading(false);
    return { error };
  }

  async function signUp(credentials: SignUpCredentials) {
    setLoading(true);
    const { data, error } = await authService.signUp(credentials);
    setLoading(false);
    return { error };
  }

  async function signOut() {
    setLoading(true);
    const { error } = await authService.signOut();
    if (!error) {
      setRoles([]);
      setPermissions([]);
    }
    setLoading(false);
    return { error };
  }

  // ==========================================================================
  // PERMISSION METHODS
  // ==========================================================================

  async function hasPermission(permission: Permission): Promise<boolean> {
    if (!userId) return false;
    if (isAdmin) return true;
    return permissions.includes('*') || permissions.includes(permission);
  }

  async function hasRole(role: UserRole): Promise<boolean> {
    return roles.includes(role);
  }

  // ==========================================================================
  // CONTEXT VALUE
  // ==========================================================================

  const value: AuthContextValue = {
    // User & Session
    user,
    session,
    userId,
    userEmail,

    // State
    loading,
    isAuthenticated,

    // Roles & Permissions
    roles,
    permissions,
    isAdmin,

    // Auth Methods
    signIn,
    signUp,
    signOut,

    // Permission Methods
    hasPermission,
    hasRole,
    refreshPermissions,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

// ============================================================================
// HOOK
// ============================================================================

/**
 * useAuth hook to access authentication context
 *
 * @example
 * const { user, signIn, signOut, hasPermission } = useAuth();
 */
export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}
