'use client';

/**
 * ProtectedRoute Component
 *
 * Wrapper component that protects routes requiring authentication.
 * Can also require specific roles or permissions.
 *
 * @example
 * <ProtectedRoute>
 *   <Dashboard />
 * </ProtectedRoute>
 *
 * @example
 * <ProtectedRoute requirePermission="org:write">
 *   <OrgEditor />
 * </ProtectedRoute>
 *
 * @example
 * <ProtectedRoute requireRole="admin">
 *   <AdminPanel />
 * </ProtectedRoute>
 */

import React from 'react';
import { useAuth } from '@/lib/authContext';
import type { Permission, UserRole } from '@/services/permissionsService';

// ============================================================================
// TYPES
// ============================================================================

interface ProtectedRouteProps {
  children: React.ReactNode;
  requirePermission?: Permission;
  requireRole?: UserRole;
  requireAllPermissions?: Permission[];
  requireAnyPermission?: Permission[];
  fallback?: React.ReactNode;
  redirectTo?: string;
}

// ============================================================================
// COMPONENT
// ============================================================================

export function ProtectedRoute({
  children,
  requirePermission,
  requireRole,
  requireAllPermissions,
  requireAnyPermission,
  fallback,
  redirectTo = '/login',
}: ProtectedRouteProps) {
  const { isAuthenticated, loading, permissions, roles, isAdmin, hasPermission, hasRole } = useAuth();

  // Show loading spinner while checking auth
  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          <p className="mt-2 text-sm text-gray-600">Loading...</p>
        </div>
      </div>
    );
  }

  // Redirect to login if not authenticated
  if (!isAuthenticated) {
    if (fallback) {
      return <>{fallback}</>;
    }

    // Redirect logic would go here if using a router
    // For now, show a message
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center p-8 bg-white rounded-lg shadow-md">
          <svg
            className="mx-auto h-12 w-12 text-gray-400"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
            />
          </svg>
          <h2 className="mt-4 text-xl font-semibold text-gray-900">Authentication Required</h2>
          <p className="mt-2 text-sm text-gray-600">Please sign in to access this page.</p>
          <a
            href={redirectTo}
            className="mt-4 inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700"
          >
            Go to Login
          </a>
        </div>
      </div>
    );
  }

  // Check role requirement
  if (requireRole && !roles.includes(requireRole) && !isAdmin) {
    if (fallback) return <>{fallback}</>;
    return <AccessDenied message={`Requires ${requireRole} role`} />;
  }

  // Check single permission requirement
  if (requirePermission && !permissions.includes('*') && !permissions.includes(requirePermission)) {
    if (fallback) return <>{fallback}</>;
    return <AccessDenied message={`Requires permission: ${requirePermission}`} />;
  }

  // Check all permissions requirement
  if (requireAllPermissions && requireAllPermissions.length > 0) {
    const hasAll = requireAllPermissions.every(p => permissions.includes('*') || permissions.includes(p));
    if (!hasAll) {
      if (fallback) return <>{fallback}</>;
      return <AccessDenied message={`Requires permissions: ${requireAllPermissions.join(', ')}`} />;
    }
  }

  // Check any permission requirement
  if (requireAnyPermission && requireAnyPermission.length > 0) {
    const hasAny = requireAnyPermission.some(p => permissions.includes('*') || permissions.includes(p));
    if (!hasAny) {
      if (fallback) return <>{fallback}</>;
      return <AccessDenied message={`Requires one of: ${requireAnyPermission.join(', ')}`} />;
    }
  }

  // All checks passed, render children
  return <>{children}</>;
}

// ============================================================================
// HELPER COMPONENTS
// ============================================================================

function AccessDenied({ message }: { message?: string }) {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="text-center p-8 bg-white rounded-lg shadow-md">
        <svg
          className="mx-auto h-12 w-12 text-red-400"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"
          />
        </svg>
        <h2 className="mt-4 text-xl font-semibold text-gray-900">Access Denied</h2>
        <p className="mt-2 text-sm text-gray-600">{message || "You don't have permission to access this page."}</p>
      </div>
    </div>
  );
}

// ============================================================================
// HELPER HOOK
// ============================================================================

/**
 * Hook to check if current user has access to a protected resource
 * Use this to conditionally render elements within components
 *
 * @example
 * const { hasAccess } = useProtectedRoute({ requirePermission: 'org:write' });
 *
 * {hasAccess && <EditButton />}
 */
export function useProtectedRoute(props: Omit<ProtectedRouteProps, 'children' | 'fallback' | 'redirectTo'>) {
  const { isAuthenticated, loading, permissions, roles, isAdmin } = useAuth();

  if (loading || !isAuthenticated) {
    return { hasAccess: false, loading: true };
  }

  if (isAdmin) {
    return { hasAccess: true, loading: false };
  }

  // Check role requirement
  if (props.requireRole && !roles.includes(props.requireRole)) {
    return { hasAccess: false, loading: false };
  }

  // Check single permission requirement
  if (props.requirePermission && !permissions.includes('*') && !permissions.includes(props.requirePermission)) {
    return { hasAccess: false, loading: false };
  }

  // Check all permissions requirement
  if (props.requireAllPermissions && props.requireAllPermissions.length > 0) {
    const hasAll = props.requireAllPermissions.every(p => permissions.includes('*') || permissions.includes(p));
    if (!hasAll) {
      return { hasAccess: false, loading: false };
    }
  }

  // Check any permission requirement
  if (props.requireAnyPermission && props.requireAnyPermission.length > 0) {
    const hasAny = props.requireAnyPermission.some(p => permissions.includes('*') || permissions.includes(p));
    if (!hasAny) {
      return { hasAccess: false, loading: false };
    }
  }

  return { hasAccess: true, loading: false };
}
