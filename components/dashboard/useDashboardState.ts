'use client';

import { useState, useEffect } from 'react';
import type { Organization, Contact, ContactChannel, OrganizationWithCounts, DepartmentWithContacts } from '@/types';
import { supabase } from '@/services/supabaseClient';

export type LogEntry = { message: string; type: 'info' | 'success' | 'error'; timestamp: Date };

export interface DashboardState {
  activeView: string;
  setActiveView: (view: string) => void;
  selectedOrg: OrganizationWithCounts | Organization | null;
  setSelectedOrg: (org: OrganizationWithCounts | Organization | null) => void;
  selectedDept: DepartmentWithContacts | null;
  setSelectedDept: (dept: DepartmentWithContacts | null) => void;
  selectedPkgId: string | null;
  setSelectedPkgId: (id: string | null) => void;
  selectedSubPkgId: string | null;
  setSelectedSubPkgId: (id: string | null) => void;
  selectedCommunicationId: string | null;
  setSelectedCommunicationId: (id: string | null) => void;
  communicationContext: {
    contactId: string;
    departmentId: string;
    organisationId: string;
  } | null;
  setCommunicationContext: (ctx: DashboardState['communicationContext']) => void;
  orgs: Organization[];
  allContacts: Contact[];
  loading: boolean;
  isProcessing: boolean;
  showStatusModal: boolean;
  setShowStatusModal: (show: boolean) => void;
  processType: 'clear' | 'seed';
  setProcessType: (type: 'clear' | 'seed') => void;
  statusLogs: LogEntry[];
  detailContacts: Contact[];
  detailChannels: ContactChannel[];
  loadingDetail: boolean;
  fetchBaseData: () => Promise<void>;
  fetchOrgDetails: (org: Organization) => Promise<void>;
  executeClearDatabase: () => Promise<void>;
  addLog: (message: string, type: 'info' | 'success' | 'error') => void;
  handleSelectOrg: (org: OrganizationWithCounts | Organization) => void;
  handleSelectDept: (dept: DepartmentWithContacts) => void;
}

export function useDashboardState(): DashboardState {
  const [activeView, setActiveView] = useState('dashboard');
  const [selectedOrg, setSelectedOrg] = useState<OrganizationWithCounts | Organization | null>(null);
  const [selectedDept, setSelectedDept] = useState<DepartmentWithContacts | null>(null);
  const [selectedPkgId, setSelectedPkgId] = useState<string | null>(null);
  const [selectedSubPkgId, setSelectedSubPkgId] = useState<string | null>(null);
  const [selectedCommunicationId, setSelectedCommunicationId] = useState<string | null>(null);
  const [communicationContext, setCommunicationContext] = useState<DashboardState['communicationContext']>(null);
  const [orgs, setOrgs] = useState<Organization[]>([]);
  const [allContacts, setAllContacts] = useState<Contact[]>([]);
  const [loading, setLoading] = useState(true);
  const [isProcessing, setIsProcessing] = useState(false);
  const [showStatusModal, setShowStatusModal] = useState(false);
  const [processType, setProcessType] = useState<'clear' | 'seed'>('clear');
  const [statusLogs, setStatusLogs] = useState<LogEntry[]>([]);
  const [detailContacts, setDetailContacts] = useState<Contact[]>([]);
  const [detailChannels, setDetailChannels] = useState<ContactChannel[]>([]);
  const [loadingDetail, setLoadingDetail] = useState(false);

  useEffect(() => {
    void fetchBaseData();
  }, []);

  const addLog = (message: string, type: 'info' | 'success' | 'error' = 'info') => {
    setStatusLogs(prev => [...prev, { message, type, timestamp: new Date() }]);
  };

  const fetchBaseData = async () => {
    setLoading(true);
    try {
      const { data: orgsData } = await supabase.from('organisations').select('*, contacts(count)').order('name');
      const { data: contactsData } = await supabase.from('contacts').select('*');

      if (orgsData) {
        setOrgs((orgsData as unknown[]).map((item) => {
          const org = item as Organization & { contacts: [{ count: number }] };
          return {
            ...org,
            _count: org.contacts ? org.contacts[0]?.count : 0,
          };
        }));
      }
      if (contactsData) {
        setAllContacts(contactsData as Contact[]);
      }
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const fetchOrgDetails = async (org: Organization) => {
    setLoadingDetail(true);
    try {
      const { data: contactsData } = await supabase.from('contacts').select('*').eq('organisation_id', org.id);
      setDetailContacts((contactsData as Contact[]) || []);

      const contactIds = ((contactsData as Contact[]) || []).map(c => c.id);
      if (contactIds.length > 0) {
        const { data: channelsData } = await supabase.from('contact_channels').select('*').in('contact_id', contactIds);
        setDetailChannels((channelsData as ContactChannel[]) || []);
      } else {
        setDetailChannels([]);
      }
    } catch (error) { console.error(error); } finally { setLoadingDetail(false); }
  };

  const executeClearDatabase = async () => {
    setIsProcessing(true);
    setStatusLogs([]);
    addLog('Starting database wipe...', 'info');
    try {
      await supabase.from('contact_channels').delete().neq('id', '00000000-0000-0000-0000-000000000000');
      await supabase.from('contacts').delete().neq('id', '00000000-0000-0000-0000-000000000000');
      await supabase.from('organisations').delete().neq('id', '00000000-0000-0000-0000-000000000000');
      addLog('Database cleared.', 'success');
      setOrgs([]);
      setAllContacts([]);
      setTimeout(() => setShowStatusModal(false), 1500);
    } catch (error) {
      const msg = error instanceof Error ? error.message : 'Unknown deletion error';
      addLog(msg, 'error');
    } finally { setIsProcessing(false); }
  };

  const handleSelectOrg = (org: OrganizationWithCounts | Organization) => {
    setSelectedOrg(org);
    setActiveView('organization-detail');
  };

  const handleSelectDept = (dept: DepartmentWithContacts) => {
    setSelectedDept(dept);
    setActiveView('department-contacts');
  };

  return {
    activeView, setActiveView,
    selectedOrg, setSelectedOrg,
    selectedDept, setSelectedDept,
    selectedPkgId, setSelectedPkgId,
    selectedSubPkgId, setSelectedSubPkgId,
    selectedCommunicationId, setSelectedCommunicationId,
    communicationContext, setCommunicationContext,
    orgs, allContacts, loading,
    isProcessing, showStatusModal, setShowStatusModal,
    processType, setProcessType,
    statusLogs,
    detailContacts, detailChannels, loadingDetail,
    fetchBaseData, fetchOrgDetails, executeClearDatabase, addLog,
    handleSelectOrg, handleSelectDept,
  };
}
