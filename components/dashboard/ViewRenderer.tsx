'use client';

import React from 'react';
import Dashboard from '@/components/Dashboard';
import OrganizationTable from '@/components/OrganizationTable';
import OrgDetail from '@/components/OrgDetail';
import OrganizationsList from '@/components/hierarchy/OrganizationsList';
import OrganizationDetail from '@/components/hierarchy/OrganizationDetail';
import DepartmentContacts from '@/components/hierarchy/DepartmentContacts';
import PackageList from '@/components/packages/PackageList';
import PackageDetail from '@/components/packages/PackageDetail';
import SubPackageDetail from '@/components/packages/SubPackageDetail';
import ResponseTracker from '@/components/packages/ResponseTracker';
import CreatePackageWizard from '@/components/packages/CreatePackageWizard';
import DocumentLibrary from '@/components/documents/DocumentLibrary';
import CommunicationList from '@/components/communications/CommunicationList';
import CommunicationDetail from '@/components/communications/CommunicationDetail';
import CreateCommunicationForm from '@/components/communications/CreateCommunicationForm';
import PublicCommunicationBrowser from '@/components/communications/PublicCommunicationBrowser';
import AdminPanel from './AdminPanel';
import SettingsPanel from './SettingsPanel';
import IssueCategoryManager from '@/components/admin/IssueCategoryManager';
import NotificationList from '@/components/notifications/NotificationList';
import type { DashboardState } from './useDashboardState';

interface ViewRendererProps {
  state: DashboardState;
}

export default function ViewRenderer({ state }: ViewRendererProps) {
  const {
    activeView, setActiveView,
    selectedOrg, setSelectedOrg,
    selectedDept,
    selectedPkgId, setSelectedPkgId,
    selectedSubPkgId, setSelectedSubPkgId,
    selectedCommunicationId, setSelectedCommunicationId,
    communicationContext, setCommunicationContext,
    orgs, allContacts, loading, loadingDetail,
    detailContacts, detailChannels,
    showStatusModal, setShowStatusModal, processType, setProcessType,
    isProcessing, statusLogs,
    fetchBaseData, fetchOrgDetails, executeClearDatabase, addLog,
    handleSelectOrg, handleSelectDept,
  } = state;

  const handleChangeView = (view: string) => {
    setActiveView(view);
    if (view !== 'detail' && view !== 'organization-detail') setSelectedOrg(null);
    state.setSelectedDept(null);
    if (view !== 'communication-detail' && view !== 'create-communication' && view !== 'communication-list') {
      setSelectedCommunicationId(null);
      setCommunicationContext(null);
    }
  };

  if (loading && activeView !== 'admin') {
    return (
      <div className="h-full flex flex-col items-center justify-center text-stone-400">
        <div className="w-12 h-12 border-4 border-gold-200 border-t-gold-600 rounded-full animate-spin mb-4" />
        <p className="font-serif animate-pulse">Syncing Golden Directory...</p>
      </div>
    );
  }

  if (activeView === 'detail' && selectedOrg && 'country_id' in selectedOrg) {
    if (loadingDetail) {
      return (
        <div className="h-full flex flex-col items-center justify-center text-stone-400">
          <div className="w-8 h-8 border-2 border-gold-200 border-t-gold-600 rounded-full animate-spin mb-3" />
          <p className="text-sm font-serif">Loading Organization Details...</p>
        </div>
      );
    }
    return (
      <OrgDetail
        org={selectedOrg as import('@/types').Organization}
        contacts={detailContacts}
        channels={detailChannels}
        onBack={() => setActiveView('directory')}
      />
    );
  }

  switch (activeView) {
    case 'dashboard':
      return <Dashboard orgs={orgs} contacts={allContacts} onNavigate={(v) => setActiveView(v)} />;

    case 'directory':
      return <OrganizationTable data={orgs} onSelectOrg={handleSelectOrg} />;

    case 'organizations':
      return <OrganizationsList onSelectOrg={handleSelectOrg} onChangeView={setActiveView} />;

    case 'organization-detail':
      if (!selectedOrg) return null;
      return (
        <OrganizationDetail
          orgId={selectedOrg.id}
          onSelectDept={handleSelectDept}
          onChangeView={setActiveView}
        />
      );

    case 'department-contacts':
      if (!selectedOrg || !selectedDept) return null;
      return (
        <DepartmentContacts
          orgId={selectedOrg.id}
          deptId={selectedDept.id}
          onChangeView={(view, data) => {
            if (data) {
              setCommunicationContext({
                contactId: data.contactId,
                departmentId: data.departmentId || selectedDept.id,
                organisationId: data.organisationId || selectedOrg.id,
              });
            }
            setActiveView(view);
          }}
        />
      );

    case 'packages':
      return (
        <PackageList
          onSelectPkg={(id) => { setSelectedPkgId(id); setActiveView('package-detail'); }}
          onChangeView={setActiveView}
        />
      );

    case 'create-package':
      return (
        <CreatePackageWizard
          onCancel={() => setActiveView('packages')}
          onComplete={() => { setActiveView('packages'); void fetchBaseData(); }}
        />
      );

    case 'package-detail':
      if (!selectedPkgId) return null;
      return (
        <PackageDetail
          pkgId={selectedPkgId}
          onBack={() => { setSelectedPkgId(null); setActiveView('packages'); }}
          onChangeView={(view, id) => {
            if (id) setSelectedSubPkgId(id);
            setActiveView(view);
          }}
        />
      );

    case 'sub-package-detail':
      if (!selectedSubPkgId) return null;
      return (
        <SubPackageDetail
          subPkgId={selectedSubPkgId}
          onBack={() => { setSelectedSubPkgId(null); setActiveView('package-detail'); }}
        />
      );

    case 'outreach':
      return <ResponseTracker />;

    case 'documents':
      return <DocumentLibrary onChangeView={setActiveView} />;

    case 'communications':
      return (
        <CommunicationList
          onSelectCommunication={(id) => { setSelectedCommunicationId(id); setActiveView('communication-detail'); }}
          onChangeView={setActiveView}
        />
      );

    case 'communication-list':
      if (!communicationContext) return null;
      return (
        <CommunicationList
          contactId={communicationContext.contactId}
          departmentId={communicationContext.departmentId || undefined}
          organisationId={communicationContext.organisationId || undefined}
          onSelectCommunication={(id) => { setSelectedCommunicationId(id); setActiveView('communication-detail'); }}
          onStartCommunication={(contactId) => {
            setCommunicationContext({ ...communicationContext, contactId });
            setActiveView('create-communication');
          }}
          onChangeView={setActiveView}
        />
      );

    case 'communication-detail':
      if (!selectedCommunicationId) return null;
      return (
        <CommunicationDetail
          communicationId={selectedCommunicationId}
          onBack={() => { setSelectedCommunicationId(null); setActiveView('communications'); }}
          onChangeView={setActiveView}
        />
      );

    case 'create-communication':
      if (!communicationContext) return null;
      return (
        <CreateCommunicationForm
          contact={{
            id: communicationContext.contactId,
            fullName: '',
            organisationId: communicationContext.organisationId,
            isHeadOfficeBased: false,
            createdAt: '',
            updatedAt: '',
          }}
          departmentId={communicationContext.departmentId || undefined}
          organisationId={communicationContext.organisationId || undefined}
          onSubmit={(id) => { setSelectedCommunicationId(id); setActiveView('communication-detail'); }}
          onCancel={() => setActiveView('communications')}
        />
      );

    case 'public-register':
      return (
        <PublicCommunicationBrowser
          onSelectCommunication={(id) => { setSelectedCommunicationId(id); setActiveView('communication-detail'); }}
        />
      );

    case 'admin':
      return (
        <AdminPanel
          onClear={() => { setProcessType('clear'); setShowStatusModal(true); }}
          onRefresh={() => void fetchBaseData()}
        />
      );

    case 'admin-categories':
      return <IssueCategoryManager />;

    case 'settings':
      return <SettingsPanel />;

    case 'notifications':
      return <NotificationList />;

    case 'my-communications':
      return (
        <CommunicationList
          myOnly={true}
          onSelectCommunication={(id) => { setSelectedCommunicationId(id); setActiveView('communication-detail'); }}
          onChangeView={setActiveView}
        />
      );

    default:
      return (
        <div className="h-full flex items-center justify-center text-stone-400 italic">
          Access Restricted.
        </div>
      );
  }
}
