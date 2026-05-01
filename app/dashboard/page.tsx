'use client';

import React, { useEffect } from 'react';
import { useRouter, usePathname } from 'next/navigation';
import { useAuth } from '@/lib/authContext';
import Sidebar from '@/components/Sidebar';
import { Toaster } from 'react-hot-toast';
import { useDashboardState } from '@/components/dashboard/useDashboardState';
import ViewRenderer from '@/components/dashboard/ViewRenderer';
import StatusModal from '@/components/dashboard/StatusModal';
import LoadingSpinner from '@/components/shared/LoadingSpinner';

export default function DashboardPage() {
  const state = useDashboardState();
  const { isAdmin, signOut, isAuthenticated, loading, userEmail } = useAuth();
  const router = useRouter();
  const pathname = usePathname();

  // Redirect to login if not authenticated, preserving the return URL
  useEffect(() => {
    if (!loading && !isAuthenticated) {
      router.replace(`/login?redirect=${encodeURIComponent(pathname)}`);
    }
  }, [loading, isAuthenticated, router, pathname]);

  const handleSignOut = async () => {
    await signOut();
    router.push('/');
  };

  // Show loading spinner while checking auth
  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-950">
        <LoadingSpinner message="Checking authentication..." />
      </div>
    );
  }

  // Don't render dashboard content if not authenticated
  if (!isAuthenticated) {
    return null;
  }

  return (
    <>
      <Sidebar
        activeView={state.activeView}
        onChangeView={(view, data) => {
          state.setActiveView(view);
          if (view !== 'detail' && view !== 'organization-detail') state.setSelectedOrg(null);
          state.setSelectedDept(null);
          if (data?.communicationId) {
            state.setSelectedCommunicationId(data.communicationId);
          } else if (view !== 'communication-detail' && view !== 'create-communication' && view !== 'communication-list') {
            state.setSelectedCommunicationId(null);
            state.setCommunicationContext(null);
          }
        }}
        isAdmin={isAdmin}
        onSignOut={handleSignOut}
        userEmail={userEmail}
      />
      <main className="flex-1 ml-64 p-8 h-screen overflow-hidden flex flex-col">
        <div className="flex-1 min-h-0 relative overflow-y-auto pr-2 custom-scrollbar">
          <ViewRenderer state={state} />
        </div>
      </main>

      <StatusModal
        show={state.showStatusModal}
        processType={state.processType}
        isProcessing={state.isProcessing}
        statusLogs={state.statusLogs}
        onClose={() => state.setShowStatusModal(false)}
        onConfirmClear={() => void state.executeClearDatabase()}
      />
      <Toaster position="top-right" />
    </>
  );
}
