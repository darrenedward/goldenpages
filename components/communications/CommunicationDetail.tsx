'use client';

import React, { useState, useEffect, useRef } from 'react';
import { ArrowLeft, Upload, CheckCircle2, XCircle, Clock, AlertCircle, FileText, Eye, EyeOff } from 'lucide-react';
import { communicationService } from '@/services/communicationService';
import { usePermissions } from '@/lib/hooks/usePermissions';
import type { CommunicationWithDetails, CommunicationStatus, CommunicationDocumentType } from '@/types';
import CommunicationTimeline from './CommunicationTimeline';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import StatusBadge from '@/components/shared/StatusBadge';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';
import { toast } from 'react-hot-toast';

interface CommunicationDetailProps {
  communicationId: string;
  onBack: () => void;
  onChangeView: (view: string, data?: Record<string, string>) => void;
}

export default function CommunicationDetail({ communicationId, onBack, onChangeView }: CommunicationDetailProps) {
  const [communication, setCommunication] = useState<CommunicationWithDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const [uploadingFile, setUploadingFile] = useState(false);
  const [uploadType, setUploadType] = useState<CommunicationDocumentType>('received');
  const [uploadPublic, setUploadPublic] = useState(true);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const { canWriteCommunications } = usePermissions();

  useEffect(() => {
    void fetchCommunication();
  }, [communicationId]);

  const fetchCommunication = async () => {
    setLoading(true);
    try {
      const data = await communicationService.getCommunication(communicationId);
      setCommunication(data);
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
        communication.createdById
      );
      toast.success(`Communication marked as ${newStatus.replace('_', ' ')}`);
      void fetchCommunication();
    } catch (err) {
      toast.error('Failed to update status');
    }
  };

  const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !communication) return;

    setUploadingFile(true);
    try {
      await communicationService.uploadDocument(
        communicationId,
        file,
        uploadType,
        uploadPublic,
        communication.createdById
      );
      toast.success(`${uploadType === 'sent' ? 'Sent' : 'Received'} document uploaded`);
      void fetchCommunication();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to upload document');
    } finally {
      setUploadingFile(false);
      if (fileInputRef.current) fileInputRef.current.value = '';
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

  const handleDownload = async (doc: { storagePath: string; originalName: string }) => {
    try {
      const url = await communicationService.getDocumentUrl(doc.storagePath);
      if (url) {
        window.open(url, '_blank');
      }
    } catch {
      toast.error('Failed to get download link');
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
    <div className="p-6 bg-stone-50 min-h-screen">
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
            </div>
            <h1 className="font-serif text-3xl text-slate-800 dark:text-white mb-2">
              {communication.title}
            </h1>
            <div className="flex items-center gap-4 text-sm text-stone-500">
              {communication.contact && <span>To: {communication.contact.fullName}</span>}
              {communication.department && <span>· {communication.department.name}</span>}
              {communication.organisation && <span>· {communication.organisation.name}</span>}
              <span>· {formatDate(communication.createdAt)}</span>
            </div>
            {communication.description && (
              <p className="text-stone-600 dark:text-stone-400 mt-3 max-w-2xl">{communication.description}</p>
            )}
            {communication.senderOrganisation && (
              <p className="text-xs text-stone-400 mt-2">Sent by: {communication.senderOrganisation}</p>
            )}
          </div>
        </div>

        {/* Tags & category */}
        {(communication.category || communication.tags.length > 0) && (
          <div className="flex items-center gap-2 mt-4">
            {communication.category && (
              <span className="px-2 py-1 bg-gold-50 text-gold-700 rounded-full text-xs font-bold">
                {communication.category}
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
            {/* Upload document */}
            <div className="flex items-center gap-2 mr-4">
              <select
                value={uploadType}
                onChange={(e) => setUploadType(e.target.value as CommunicationDocumentType)}
                className="px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 rounded-xl text-sm"
              >
                <option value="sent">Sent document</option>
                <option value="received">Received document</option>
              </select>
              <button
                onClick={() => setUploadPublic(!uploadPublic)}
                className={`p-2 rounded-lg text-sm ${uploadPublic ? 'bg-emerald-50 text-emerald-600' : 'bg-stone-100 text-stone-400'}`}
                title={uploadPublic ? 'Public' : 'Private'}
              >
                {uploadPublic ? <Eye className="w-4 h-4" /> : <EyeOff className="w-4 h-4" />}
              </button>
              <input
                ref={fileInputRef}
                type="file"
                accept=".pdf,.doc,.docx,.png,.jpg,.jpeg"
                onChange={handleFileUpload}
                className="hidden"
              />
              <button
                onClick={() => fileInputRef.current?.click()}
                disabled={uploadingFile}
                className="flex items-center gap-2 px-4 py-2 bg-gold-600 text-white rounded-xl font-bold hover:bg-gold-700 transition-all disabled:opacity-50"
              >
                <Upload className="w-4 h-4" />
                {uploadingFile ? 'Uploading...' : 'Upload'}
              </button>
            </div>

            {/* Status actions */}
            <div className="h-8 w-px bg-stone-200" />
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

      {/* Timeline */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
        <h2 className="font-serif text-xl font-bold text-slate-800 dark:text-white mb-6 flex items-center gap-2">
          <FileText className="w-5 h-5 text-gold-600" />
          Correspondence Timeline
        </h2>
        <CommunicationTimeline
          communication={communication}
          onDownload={handleDownload}
          onDelete={canWriteCommunications ? handleDeleteDocument : undefined}
        />
      </div>
    </div>
  );
}
