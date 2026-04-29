'use client';

/**
 * Hook to check user permissions
 * Reads real permissions from the auth context
 */

import { useMemo } from 'react';
import { useAuth } from '@/lib/authContext';
import type { Permission } from '@/types';

interface UsePermissionsReturn {
  hasPermission: (permission: Permission) => boolean;
  isLoading: boolean;
  canReadDepartments: boolean;
  canWriteDepartments: boolean;
  canReadContacts: boolean;
  canWriteContacts: boolean;
  canReadPackages: boolean;
  canWritePackages: boolean;
  canReadDocuments: boolean;
  canWriteDocuments: boolean;
  canReadCommunications: boolean;
  canWriteCommunications: boolean;
}

export function usePermissions(): UsePermissionsReturn {
  const { permissions, isAdmin, isAuthenticated, loading } = useAuth();

  const userPermissions = useMemo(() => {
    if (!isAuthenticated) return new Set<Permission>();
    return new Set(permissions as Permission[]);
  }, [permissions, isAuthenticated]);

  const isLoading = loading;

  const hasPermission = (permission: Permission): boolean => {
    if (isAdmin) return true;
    if (userPermissions.has('*:*') || userPermissions.has('*')) return true;
    return userPermissions.has(permission);
  };

  return {
    hasPermission,
    isLoading,
    canReadDepartments: hasPermission('org:read'),
    canWriteDepartments: hasPermission('org:write'),
    canReadContacts: hasPermission('contact:read'),
    canWriteContacts: hasPermission('contact:write'),
    canReadPackages: hasPermission('package:read'),
    canWritePackages: hasPermission('package:write'),
    canReadDocuments: hasPermission('document:read'),
    canWriteDocuments: hasPermission('document:write'),
    canReadCommunications: hasPermission('communication:read'),
    canWriteCommunications: hasPermission('communication:write'),
  };
}
