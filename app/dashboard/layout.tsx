'use client';

import React, { useEffect } from 'react';
import { useRouter, usePathname } from 'next/navigation';
import { useAuth } from '@/lib/authContext';
import Sidebar from '@/components/Sidebar';
import { StatusModalProvider } from '@/components/dashboard/StatusModalContext';
import { Toaster } from 'react-hot-toast';
import LoadingSpinner from '@/components/shared/LoadingSpinner';

export default function DashboardLayout({ children }: { children: React.ReactNode }) {
  const { isAuthenticated, loading, signOut, user, isAdmin } = useAuth();
  const router = useRouter();
  const pathname = usePathname();

  // Redirect to login if not authenticated, preserving the return URL
  useEffect(() => {
    if (!loading && !isAuthenticated) {
      router.replace(`/login?redirect=${encodeURIComponent(pathname)}`);
    }
  }, [loading, isAuthenticated, router, pathname]);

  // Force invited users to set a password before accessing dashboard
  useEffect(() => {
    if (!loading && isAuthenticated && user?.user_metadata?.needs_password) {
      router.replace('/set-password');
    }
  }, [loading, isAuthenticated, user, router]);

  const handleSignOut = async () => {
    await signOut();
    router.push('/');
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-950">
        <LoadingSpinner message="Checking authentication..." />
      </div>
    );
  }

  if (!isAuthenticated) {
    return null;
  }

  return (
    <StatusModalProvider>
      <Sidebar
        isAdmin={isAdmin}
        onSignOut={handleSignOut}
        userEmail={user?.email}
      />
      <main className="flex-1 ml-64 p-8 h-screen overflow-hidden flex flex-col">
        <div className="flex-1 min-h-0 relative overflow-y-auto pr-2 custom-scrollbar">
          {children}
        </div>
      </main>
      <Toaster position="top-right" />
    </StatusModalProvider>
  );
}
