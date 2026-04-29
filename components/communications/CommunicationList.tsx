'use client';

import React, { useState, useEffect } from 'react';
import { Search, Filter, Plus, MessageSquare } from 'lucide-react';
import { communicationService } from '@/services/communicationService';
import { usePermissions } from '@/lib/hooks/usePermissions';
import type { CommunicationWithDetails, CommunicationStatus } from '@/types';
import CommunicationCard from './CommunicationCard';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import EmptyState from '@/components/shared/EmptyState';

interface CommunicationListProps {
  contactId?: string;
  departmentId?: string;
  organisationId?: string;
  isPublicView?: boolean;
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
  onSelectCommunication,
  onStartCommunication,
}: CommunicationListProps) {
  const [communications, setCommunications] = useState<CommunicationWithDetails[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<CommunicationStatus | 'ALL'>('ALL');
  const { canWriteCommunications } = usePermissions();

  useEffect(() => {
    void fetchCommunications();
  }, [contactId, departmentId, organisationId]);

  const fetchCommunications = async () => {
    setLoading(true);
    try {
      const filters: Record<string, unknown> = {};
      if (contactId) filters.contactId = contactId;
      if (departmentId) filters.departmentId = departmentId;
      if (organisationId) filters.organisationId = organisationId;
      if (isPublicView) filters.isPublic = true;

      const result = isPublicView
        ? await communicationService.getPublicCommunications(filters as { organisationId?: string; departmentId?: string })
        : await communicationService.getCommunications(filters as Parameters<typeof communicationService.getCommunications>[0]);

      // getPublicCommunications returns { data, totalCount }, getCommunications returns array
      setCommunications(Array.isArray(result) ? result : result.data);
    } catch (err) {
      console.error('Failed to fetch communications:', err);
    } finally {
      setLoading(false);
    }
  };

  const filtered = communications.filter(comm => {
    const matchesSearch = !searchQuery ||
      comm.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (comm.description && comm.description.toLowerCase().includes(searchQuery.toLowerCase())) ||
      (comm.category && comm.category.toLowerCase().includes(searchQuery.toLowerCase()));

    const matchesStatus = statusFilter === 'ALL' || comm.status === statusFilter;

    return matchesSearch && matchesStatus;
  });

  if (loading) return <LoadingSpinner message="Loading communications..." />;

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
        <div className="flex items-center gap-4 mb-4">
          <div className="flex-1 relative">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
            <input
              type="text"
              placeholder="Search communications..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-12 pr-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
          </div>
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
              ? 'Try a different search term'
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
