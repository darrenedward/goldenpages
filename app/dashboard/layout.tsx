'use client';

import React, { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/lib/authContext';
import Sidebar from '@/components/Sidebar';
import LoadingSpinner from '@/components/shared/LoadingSpinner';

export default function DashboardLayout({ children }: { children: React.ReactNode }) {
  const { isAuthenticated, loading, isAdmin, signOut } = useAuth();
  const router = useRouter();

  const handleSignOut = async () => {
    await signOut();
    router.push('/');
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-stone-50 dark:bg-slate-950 flex items-center justify-center">
        <LoadingSpinner size="lg" message="Loading..." />
      </div>
    );
  }

  if (!isAuthenticated) {
    // Client-side redirect - will show briefly before redirect
    void router.push('/');
    return (
      <div className="min-h-screen bg-stone-50 dark:bg-slate-950 flex items-center justify-center">
        <LoadingSpinner size="lg" message="Redirecting..." />
      </div>
    );
  }

  return (
    <div className="flex min-h-screen bg-stone-50 dark:bg-slate-950 font-sans text-slate-900 transition-colors duration-200">
      {children}
    </div>
  );
}
