'use client';

import React from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/lib/authContext';
import Sidebar from '@/components/Sidebar';
import { Toaster } from 'react-hot-toast';
import { useDashboardState } from '@/components/dashboard/useDashboardState';
import ViewRenderer from '@/components/dashboard/ViewRenderer';
import StatusModal from '@/components/dashboard/StatusModal';

export default function DashboardPage() {
  const state = useDashboardState();
  const { isAdmin, signOut } = useAuth();
  const router = useRouter();

  const handleSignOut = async () => {
    await signOut();
    router.push('/');
  };

  return (
    <>
      <Sidebar
        activeView={state.activeView}
        onChangeView={(view) => {
          state.setActiveView(view);
          if (view !== 'detail' && view !== 'organization-detail') state.setSelectedOrg(null);
          state.setSelectedDept(null);
          if (view !== 'communication-detail' && view !== 'create-communication' && view !== 'communication-list') {
            state.setSelectedCommunicationId(null);
            state.setCommunicationContext(null);
          }
        }}
        isAdmin={isAdmin}
        onSignOut={handleSignOut}
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
