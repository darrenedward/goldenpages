'use client';

import React, { useState, useEffect } from 'react';
import { Search, Filter, Plus, MessageSquare, Calendar, X } from 'lucide-react';
import { communicationService } from '@/services/communicationService';
import { communicationMemberService } from '@/services/communicationMemberService';
import { usePermissions } from '@/lib/hooks/usePermissions';
import { useAuth } from '@/lib/authContext';
import type { CommunicationWithDetails, CommunicationStatus } from '@/types';
import CommunicationCard from './CommunicationCard';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import EmptyState from '@/components/shared/EmptyState';

interface CommunicationListProps {
  contactId?: string;
  departmentId?: string;
  organisationId?: string;
  isPublicView?: boolean;
  myOnly?: boolean;
  onSelectCommunication: (id: string) => void;
  onStartCommunication?: (contactId: string) => void;
  onChangeView?: (view: string) => void;
}

const statusFilters: { label: string; value: CommunicationStatus | 'ALL' }[] = [
  { label: 'All', value: 'ALL' },
  { label: 'Sent', value: 'SENT' },
  { label: 'Awaiting', value: 'AWAITING_RESPONSE' },
  { label: 'Responded', value: 'RESPONDED' },
  { label: 'Closed', value: 'CLOSED' },
];

export default function CommunicationList({
  contactId,
  departmentId,
  organisationId,
  isPublicView,
  myOnly,
  onSelectCommunication,
  onStartCommunication,
}: CommunicationListProps) {
  const [communications, setCommunications] = useState<CommunicationWithDetails[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<CommunicationStatus | 'ALL'>('ALL');
  const [dateFrom, setDateFrom] = useState('');
  const [dateTo, setDateTo] = useState('');
  const [showDateFilter, setShowDateFilter] = useState(false);
  const { canWriteCommunications } = usePermissions();
  const { user } = useAuth();

  useEffect(() => {
    void fetchCommunications();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [contactId, departmentId, organisationId, myOnly, user?.id]);

  const fetchCommunications = async () => {
    setLoading(true);
    try {
      if (myOnly && user?.id) {
        const { data: commIds } = await communicationMemberService.getCommunicationsForUser(user.id);
        const allComms = await communicationService.getCommunications({});
        const memberSet = new Set(commIds);
        setCommunications(allComms.filter(c => memberSet.has(c.id)));
      } else {
        const filters: Record<string, unknown> = {};
        if (contactId) filters.contactId = contactId;
        if (departmentId) filters.departmentId = departmentId;
        if (organisationId) filters.organisationId = organisationId;
        if (isPublicView) filters.isPublic = true;

        const result = isPublicView
          ? await communicationService.getPublicCommunications(filters as { organisationId?: string; departmentId?: string })
          : await communicationService.getCommunications(filters as Parameters<typeof communicationService.getCommunications>[0]);

        setCommunications(Array.isArray(result) ? result : result.data);
      }
    } catch (err) {
      console.error('Failed to fetch communications:', err);
    } finally {
      setLoading(false);
    }
  };

  const filtered = communications.filter(comm => {
    const q = searchQuery.toLowerCase();

    // Search by title, description, category, or contact name (minister)
    const matchesSearch = !q ||
      comm.title.toLowerCase().includes(q) ||
      (comm.description && comm.description.toLowerCase().includes(q)) ||
      (comm.category && comm.category.toLowerCase().includes(q)) ||
      (comm.contact?.fullName && comm.contact.fullName.toLowerCase().includes(q)) ||
      (comm.contact?.roleTitle && comm.contact.roleTitle.toLowerCase().includes(q)) ||
      (comm.organisation?.name && comm.organisation.name.toLowerCase().includes(q)) ||
      (comm.department?.name && comm.department.name.toLowerCase().includes(q));

    const matchesStatus = statusFilter === 'ALL' || comm.status === statusFilter;

    // Date range filter
    let matchesDate = true;
    if (dateFrom) {
      const from = new Date(dateFrom);
      const created = new Date(comm.createdAt);
      if (created < from) matchesDate = false;
    }
    if (dateTo) {
      const to = new Date(dateTo);
      to.setHours(23, 59, 59, 999); // End of day
      const created = new Date(comm.createdAt);
      if (created > to) matchesDate = false;
    }

    return matchesSearch && matchesStatus && matchesDate;
  });

  const clearFilters = () => {
    setSearchQuery('');
    setStatusFilter('ALL');
    setDateFrom('');
    setDateTo('');
  };

  const hasActiveFilters = searchQuery || statusFilter !== 'ALL' || dateFrom || dateTo;

  if (loading) return <LoadingSpinner message="Loading communications..." />;

  return (
    <div className="space-y-6">
      {/* Search & Filters */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
        <div className="flex items-center gap-4 mb-4">
          <div className="flex-1 relative">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
            <input
              type="text"
              placeholder="Search by title, minister name, issue, department..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-12 pr-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
          </div>
          <button
            onClick={() => setShowDateFilter(!showDateFilter)}
            className={`flex items-center gap-2 px-4 py-3 rounded-2xl font-bold transition-all ${showDateFilter ? 'bg-gold-600 text-white' : 'bg-stone-100 dark:bg-stone-800 text-stone-500 hover:bg-stone-200'}`}
          >
            <Calendar className="w-4 h-4" />
            Date
          </button>
          {!isPublicView && canWriteCommunications && contactId && onStartCommunication && (
            <button
              onClick={() => onStartCommunication(contactId)}
              className="flex items-center gap-2 px-4 py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all"
            >
              <MessageSquare className="w-4 h-4" />
              Start Communication
            </button>
          )}
        </div>

        {/* Date range filter */}
        {showDateFilter && (
          <div className="flex items-center gap-3 mb-4 p-3 bg-stone-50 dark:bg-stone-800 rounded-2xl">
            <span className="text-sm text-stone-500 font-medium">From:</span>
            <input
              type="date"
              value={dateFrom}
              onChange={(e) => setDateFrom(e.target.value)}
              className="px-3 py-1.5 bg-white dark:bg-slate-900 border border-stone-200 dark:border-white/10 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
            <span className="text-sm text-stone-500 font-medium">To:</span>
            <input
              type="date"
              value={dateTo}
              onChange={(e) => setDateTo(e.target.value)}
              className="px-3 py-1.5 bg-white dark:bg-slate-900 border border-stone-200 dark:border-white/10 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
            {(dateFrom || dateTo) && (
              <button onClick={() => { setDateFrom(''); setDateTo(''); }} className="text-stone-400 hover:text-stone-600">
                <X className="w-4 h-4" />
              </button>
            )}
          </div>
        )}

        {/* Status filters */}
        <div className="flex items-center gap-2">
          <Filter className="w-4 h-4 text-stone-400" />
          {statusFilters.map(filter => (
            <button
              key={filter.value}
              onClick={() => setStatusFilter(filter.value)}
              className={`px-3 py-1 rounded-full text-xs font-bold transition-all ${
                statusFilter === filter.value
                  ? 'bg-gold-600 text-white'
                  : 'bg-stone-100 dark:bg-stone-800 text-stone-500 hover:bg-stone-200'
              }`}
            >
              {filter.label}
            </button>
          ))}
          {hasActiveFilters && (
            <button
              onClick={clearFilters}
              className="flex items-center gap-1 px-3 py-1 text-xs font-bold text-stone-400 hover:text-stone-600 transition-colors"
            >
              <X className="w-3 h-3" />
              Clear all
            </button>
          )}
          <span className="ml-auto text-sm text-stone-400">
            {filtered.length} communication{filtered.length !== 1 ? 's' : ''}
          </span>
        </div>
      </div>

      {/* List */}
      {filtered.length === 0 ? (
        <EmptyState
          title={searchQuery ? 'No communications found' : 'No communications yet'}
          description={
            searchQuery
              ? 'Try a different search term or clear filters'
              : isPublicView
                ? 'No public communications have been published yet'
                : 'Start a communication with a contact to begin tracking correspondence'
          }
        />
      ) : (
        <div className="space-y-3">
          {filtered.map(comm => (
            <CommunicationCard
              key={comm.id}
              communication={comm}
              onClick={onSelectCommunication}
              isPublicView={isPublicView}
            />
          ))}
        </div>
      )}
    </div>
  );
}
