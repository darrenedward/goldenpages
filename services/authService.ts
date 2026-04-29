/**
 * Authentication Service
 *
 * Handles all authentication operations using Supabase Auth.
 * This service provides methods for sign in, sign up, sign out,
 * and session management.
 */

import { supabase } from './supabaseClient';
import type { AuthError, Session, User, AuthResponse } from '@supabase/supabase-js';

// ============================================================================
// TYPES
// ============================================================================

export interface SignInCredentials {
  email: string;
  password: string;
}

export interface SignUpCredentials extends SignInCredentials {
  metadata?: Record<string, any>;
}

export interface AuthState {
  user: User | null;
  session: Session | null;
  loading: boolean;
}

export interface AuthResult {
  data: { user: User | null; session: Session | null } | null;
  error: AuthError | null;
}

// ============================================================================
// SERVICE
// ============================================================================

class AuthService {
  // ==========================================================================
  // AUTHENTICATION METHODS
  // ==========================================================================

  /**
   * Sign in with email and password
   */
  async signIn({ email, password }: SignInCredentials): Promise<AuthResult> {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    return { data, error };
  }

  /**
   * Sign up new user with email and password
   */
  async signUp({ email, password, metadata }: SignUpCredentials): Promise<AuthResult> {
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: metadata || {},
        emailRedirectTo: `${window.location.origin}/auth/callback`,
      },
    });

    return { data, error };
  }

  /**
   * Sign out current user
   */
  async signOut(): Promise<{ error: AuthError | null }> {
    const { error } = await supabase.auth.signOut();
    return { error };
  }

  // ==========================================================================
  // SESSION METHODS
  // ==========================================================================

  /**
   * Get current session
   */
  async getSession(): Promise<Session | null> {
    const { data: { session } } = await supabase.auth.getSession();
    return session;
  }

  /**
   * Get current user
   */
  async getCurrentUser(): Promise<User | null> {
    const { data: { user } } = await supabase.auth.getUser();
    return user;
  }

  /**
   * Refresh the session
   */
  async refreshSession(): Promise<AuthResult> {
    const { data, error } = await supabase.auth.refreshSession();
    return { data, error };
  }

  /**
   * Update session data
   */
  async updateSession(metadata: Record<string, any>): Promise<AuthResult> {
    const { data, error } = await supabase.auth.updateUser({
      data: metadata,
    });
    // updateUser returns { user: User | null }, but AuthResult expects { user: User | null; session: Session | null } | null
    // We need to transform the response to match the expected type
    const transformedData = data ? { user: data.user, session: null } : null;
    return { data: transformedData, error };
  }

  // ==========================================================================
  // AUTH STATE CHANGES
  // ==========================================================================

  /**
   * Subscribe to auth state changes
   * Returns an unsubscribe function
   */
  onAuthStateChange(
    callback: (event: string, session: Session | null) => void
  ): { data: { subscription: { unsubscribe: () => void } } } {
    return supabase.auth.onAuthStateChange(callback);
  }

  // ==========================================================================
  // PASSWORD RESET
  // ==========================================================================

  /**
   * Send password reset email
   */
  async resetPassword(email: string): Promise<{ error: AuthError | null }> {
    const { error } = await supabase.auth.resetPasswordForEmail(email, {
      redirectTo: `${window.location.origin}/auth/reset-password`,
    });
    return { error };
  }

  /**
   * Update user password
   */
  async updatePassword(newPassword: string): Promise<AuthResult> {
    const { data, error } = await supabase.auth.updateUser({
      password: newPassword,
    });
    // updateUser returns { user: User | null }, but AuthResult expects { user: User | null; session: Session | null } | null
    // We need to transform the response to match the expected type
    const transformedData = data ? { user: data.user, session: null } : null;
    return { data: transformedData, error };
  }

  // ==========================================================================
  // OAUTH PROVIDERS
  // ==========================================================================

  /**
   * Sign in with OAuth provider
   */
  async signInWithOAuth(provider: 'google' | 'github' | 'azure') {
    const { data, error } = await supabase.auth.signInWithOAuth({
      provider,
      options: {
        redirectTo: `${window.location.origin}/auth/callback`,
      },
    });
    return { data, error };
  }

  // ==========================================================================
  // UTILITY METHODS
  // ==========================================================================

  /**
   * Check if user is authenticated
   */
  async isAuthenticated(): Promise<boolean> {
    const session = await this.getSession();
    return !!session;
  }

  /**
   * Get user ID from current session
   */
  async getUserId(): Promise<string | null> {
    const user = await this.getCurrentUser();
    return user?.id || null;
  }

  /**
   * Get user email from current session
   */
  async getUserEmail(): Promise<string | null> {
    const user = await this.getCurrentUser();
    return user?.email || null;
  }

  /**
   * Get user metadata
   */
  async getUserMetadata(): Promise<Record<string, any> | null> {
    const user = await this.getCurrentUser();
    return user?.user_metadata || null;
  }
}

// ============================================================================
// EXPORT SINGLETON INSTANCE
// ============================================================================

export const authService = new AuthService();
