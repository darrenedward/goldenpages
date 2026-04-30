'use client';

import React, { useState, useEffect, useRef } from 'react';
import { CheckCircle2, XCircle, Clock, AlertCircle, FileText, Eye, EyeOff, Calendar, AlertTriangle } from 'lucide-react';
import { communicationService } from '@/services/communicationService';
import { usePermissions } from '@/lib/hooks/usePermissions';
import { useAuth } from '@/lib/authContext';
import type { CommunicationWithDetails, CommunicationStatus, CommunicationDocumentType, CommunicationRecipient } from '@/types';
import RecipientsPanel from './RecipientsPanel';
import RecipientThread from './RecipientThread';
import CommunicationTimeline from './CommunicationTimeline';
import ActivityFeed from './ActivityFeed';
import MemberManager from './MemberManager';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import StatusBadge from '@/components/shared/StatusBadge';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';
import { formatDateDisplay } from '@/lib/dateHelpers';
import { toast } from 'react-hot-toast';

interface CommunicationDetailProps {
  communicationId: string;
  onBack: () => void;
  onChangeView: (view: string, data?: Record<string, string>) => void;
}

export default function CommunicationDetail({ communicationId, onBack, onChangeView }: CommunicationDetailProps) {
  const [communication, setCommunication] = useState<CommunicationWithDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState<'recipients' | 'documents' | 'activity' | 'team'>('recipients');
  const [selectedRecipientId, setSelectedRecipientId] = useState<string | null>(null);
  const { canWriteCommunications } = usePermissions();
  const { user } = useAuth();

  useEffect(() => {
    void fetchCommunication();
  }, [communicationId]);

  const fetchCommunication = async () => {
    setLoading(true);
    try {
      const data = await communicationService.getCommunication(communicationId);
      setCommunication(data);
      // Auto-select first recipient if none selected
      if (data?.recipients?.length && !selectedRecipientId) {
        setSelectedRecipientId(data.recipients[0].id);
      }
    } catch (err) {
      console.error('Failed to fetch communication:', err);
      toast.error('Failed to load communication');
    } finally {
      setLoading(false);
    }
  };

  const handleStatusChange = async (newStatus: CommunicationStatus) => {
    if (!communication) return;
    try {
      await communicationService.updateCommunicationStatus(
        communicationId,
        newStatus,
        user?.id || communication.createdById
      );
      toast.success(`Communication marked as ${newStatus.replace('_', ' ')}`);
      void fetchCommunication();
    } catch (err) {
      toast.error('Failed to update status');
    }
  };

  const handleDownload = async (doc: { storagePath: string; originalName: string }) => {
    try {
      const url = await communicationService.getDocumentUrl(doc.storagePath);
      if (url) window.open(url, '_blank');
    } catch {
      toast.error('Failed to get download link');
    }
  };

  const handleDeleteDocument = async (docId: string) => {
    if (!confirm('Delete this document?')) return;
    try {
      await communicationService.deleteDocument(docId);
      toast.success('Document deleted');
      void fetchCommunication();
    } catch (err) {
      toast.error('Failed to delete document');
    }
  };

  const formatDate = (dateStr: string) => {
    return new Date(dateStr).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
    });
  };

  if (loading) return <LoadingSpinner message="Loading communication..." />;
  if (!communication) return <div className="p-6 text-center text-stone-400">Communication not found</div>;

  const recipients = communication.recipients || [];
  const selectedRecipient = recipients.find(r => r.id === selectedRecipientId) || null;

  // Check if expected response date is overdue
  const isOverdue = communication.expectedResponseDate &&
    communication.status !== 'CLOSED' &&
    communication.status !== 'CANCELLED' &&
    communication.status !== 'RESPONDED' &&
    new Date(communication.expectedResponseDate) < new Date();

  const statusActions: { status: CommunicationStatus; label: string; icon: React.ReactNode; className: string }[] = [];
  if (communication.status === 'SENT') {
    statusActions.push({ status: 'AWAITING_RESPONSE', label: 'Mark Awaiting Response', icon: <Clock className="w-4 h-4" />, className: 'bg-amber-50 text-amber-700 hover:bg-amber-100' });
  }
  if (communication.status === 'SENT' || communication.status === 'AWAITING_RESPONSE') {
    statusActions.push({ status: 'RESPONDED', label: 'Mark Responded', icon: <CheckCircle2 className="w-4 h-4" />, className: 'bg-emerald-50 text-emerald-700 hover:bg-emerald-100' });
  }
  if (communication.status !== 'CLOSED' && communication.status !== 'CANCELLED') {
    statusActions.push({ status: 'CLOSED', label: 'Close', icon: <CheckCircle2 className="w-4 h-4" />, className: 'bg-stone-100 text-stone-600 hover:bg-stone-200' });
    statusActions.push({ status: 'CANCELLED', label: 'Cancel', icon: <XCircle className="w-4 h-4" />, className: 'bg-red-50 text-red-600 hover:bg-red-100' });
  }

  return (
    <div className="space-y-6 animate-fade-in pb-12">
      {/* Breadcrumb */}
      <BreadcrumbNav
        items={[
          { label: 'Communications', onClick: onBack },
          { label: communication.title },
        ]}
      />

      {/* Header */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8 mb-6">
        <div className="flex items-start justify-between gap-4">
          <div>
            <div className="flex items-center gap-3 mb-2">
              <StatusBadge status={communication.status} size="md" />
              <span className="text-xs font-bold text-stone-400 uppercase tracking-wider">
                {communication.communicationType.replace('_', ' ')}
              </span>
              {communication.isApproved && (
                <span className="flex items-center gap-1 text-xs text-emerald-600">
                  <CheckCircle2 className="w-3 h-3" />
                  Approved
                </span>
              )}
              {isOverdue && (
                <span className="flex items-center gap-1 text-xs text-red-600 font-bold">
                  <AlertTriangle className="w-3 h-3" />
                  Overdue
                </span>
              )}
            </div>
            <h1 className="font-serif text-3xl text-slate-800 dark:text-white mb-2">
              {communication.title}
            </h1>
            <div className="flex items-center gap-4 text-sm text-stone-500">
              {recipients.length > 0 ? (
                <span>
                  To: {recipients.slice(0, 2).map(r => r.department?.name || 'Unknown').join(', ')}
                  {recipients.length > 2 && ` +${recipients.length - 2} others`}
                </span>
              ) : communication.contact ? (
                <span>To: {communication.contact.fullName}</span>
              ) : null}
              <span>{formatDate(communication.createdAt)}</span>
            </div>
            {communication.description && (
              <p className="text-stone-600 dark:text-stone-400 mt-3 max-w-2xl">{communication.description}</p>
            )}
            {communication.senderOrganisation && (
              <p className="text-xs text-stone-400 mt-2">Sent by: {communication.senderOrganisation}</p>
            )}
            {communication.expectedResponseDate && (
              <div className={`flex items-center gap-2 mt-2 text-xs ${isOverdue ? 'text-red-600 font-bold' : 'text-stone-400'}`}>
                <Calendar className="w-3 h-3" />
                Expected response by {formatDate(new Date(communication.expectedResponseDate).toISOString())}
                {isOverdue && ' (OVERDUE)'}
              </div>
            )}
          </div>
        </div>

        {/* Tags & category */}
        {(communication.issueCategory || communication.category || communication.tags.length > 0) && (
          <div className="flex items-center gap-2 mt-4">
            {(communication.issueCategory || communication.category) && (
              <span className="px-2 py-1 bg-gold-50 text-gold-700 rounded-full text-xs font-bold">
                {communication.issueCategory?.name || communication.category}
              </span>
            )}
            {communication.tags.map(tag => (
              <span key={tag} className="px-2 py-1 bg-stone-100 dark:bg-stone-800 text-stone-500 rounded-full text-xs">
                {tag}
              </span>
            ))}
          </div>
        )}
      </div>

      {/* Actions */}
      {canWriteCommunications && (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6 mb-6">
          <div className="flex items-center gap-3 flex-wrap">
            {statusActions.map(action => (
              <button
                key={action.status}
                onClick={() => handleStatusChange(action.status)}
                className={`flex items-center gap-2 px-3 py-2 rounded-xl text-sm font-bold transition-all ${action.className}`}
              >
                {action.icon}
                {action.label}
              </button>
            ))}
          </div>
        </div>
      )}

      {/* Tabs */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden">
        <div className="flex border-b border-stone-100 dark:border-stone-800">
          {[
            { key: 'recipients' as const, label: `Recipients (${recipients.length})`, icon: <AlertCircle className="w-4 h-4" /> },
            { key: 'documents' as const, label: 'All Documents', icon: <FileText className="w-4 h-4" /> },
            { key: 'activity' as const, label: 'Activity', icon: <Clock className="w-4 h-4" /> },
            { key: 'team' as const, label: 'Team', icon: <AlertCircle className="w-4 h-4" /> },
          ].map(tab => (
            <button
              key={tab.key}
              type="button"
              onClick={() => setActiveTab(tab.key)}
              className={`flex items-center gap-2 px-6 py-4 text-sm font-bold transition-colors ${
                activeTab === tab.key
                  ? 'text-gold-600 border-b-2 border-gold-600 bg-gold-50/50 dark:bg-gold-900/10'
                  : 'text-stone-400 hover:text-stone-600'
              }`}
            >
              {tab.icon}
              {tab.label}
            </button>
          ))}
        </div>

        <div className="p-8">
          {activeTab === 'recipients' && (
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
              {/* Left: Recipient list */}
              <div className="lg:col-span-1">
                <RecipientsPanel
                  recipients={recipients}
                  selectedRecipientId={selectedRecipientId}
                  onSelectRecipient={setSelectedRecipientId}
                />
              </div>
              {/* Right: Selected recipient thread */}
              <div className="lg:col-span-2">
                {selectedRecipient ? (
                  <RecipientThread
                    communication={communication}
                    recipient={selectedRecipient}
                    onRefresh={() => void fetchCommunication()}
                    canWrite={canWriteCommunications}
                  />
                ) : (
                  <div className="text-center py-12 text-stone-400">
                    <AlertCircle className="w-8 h-8 mx-auto mb-2 opacity-30" />
                    <p className="text-sm">Select a recipient to view their correspondence thread</p>
                  </div>
                )}
              </div>
            </div>
          )}
          {activeTab === 'documents' && (
            <>
              <h2 className="font-serif text-xl font-bold text-slate-800 dark:text-white mb-6 flex items-center gap-2">
                <FileText className="w-5 h-5 text-gold-600" />
                All Documents
              </h2>
              <CommunicationTimeline
                communication={communication}
                onDownload={handleDownload}
                onDelete={canWriteCommunications ? handleDeleteDocument : undefined}
              />
            </>
          )}
          {activeTab === 'activity' && <ActivityFeed communicationId={communicationId} />}
          {activeTab === 'team' && <MemberManager communicationId={communicationId} />}
        </div>
      </div>
    </div>
  );
}
