/**
 * useUser Hook
 *
 * Provides convenient access to current user data.
 * Wraps the auth context for easy user information access.
 */

import { useAuth } from '@/lib/authContext';

// ============================================================================
// TYPES
// ============================================================================

export interface UserData {
  id: string | null;
  email: string | null;
  name: string | null;
  avatarUrl: string | null;
  metadata: Record<string, any>;
  isAuthenticated: boolean;
  isLoading: boolean;
}

// ============================================================================
// HOOK
// ============================================================================

/**
 * Hook for accessing current user data
 *
 * @example
 * const { user, isAuthenticated, isLoading } = useUser();
 */
export function useUser(): UserData {
  const { user, session, loading, isAuthenticated } = useAuth();

  // Extract user metadata
  const metadata = user?.user_metadata || {};
  const name = metadata?.name || metadata?.full_name || null;
  const avatarUrl = metadata?.avatar_url || null;

  return {
    id: user?.id || null,
    email: user?.email || null,
    name,
    avatarUrl,
    metadata,
    isAuthenticated,
    isLoading: loading,
  };
}
