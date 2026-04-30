'use client';

import React, { useState } from 'react';
import { Upload, Download, Trash2, FileText, Eye, EyeOff, Clock, CheckCircle2, XCircle } from 'lucide-react';
import { communicationService } from '@/services/communicationService';
import { communicationRecipientService } from '@/services/communicationRecipientService';
import { useAuth } from '@/lib/authContext';
import type { CommunicationWithDetails, CommunicationRecipient, CommunicationDocumentType, DeliveryStatus, ResponseStatus } from '@/types';
import { toast } from 'react-hot-toast';

interface RecipientThreadProps {
  communication: CommunicationWithDetails;
  recipient: CommunicationRecipient;
  onRefresh: () => void;
  canWrite: boolean;
}

const DELIVERY_OPTIONS: { value: DeliveryStatus; label: string }[] = [
  { value: 'PENDING', label: 'Pending' },
  { value: 'SENDING', label: 'Sending' },
  { value: 'SENT', label: 'Sent' },
  { value: 'DELIVERED', label: 'Delivered' },
  { value: 'FAILED', label: 'Failed' },
  { value: 'BOUNCED', label: 'Bounced' },
];

const RESPONSE_OPTIONS: { value: ResponseStatus; label: string }[] = [
  { value: 'RECEIVED', label: 'Received' },
  { value: 'REVIEWING', label: 'Reviewing' },
  { value: 'ACCEPTED', label: 'Accepted' },
  { value: 'REJECTED', label: 'Rejected' },
  { value: 'INCOMPLETE', label: 'Incomplete' },
];

export default function RecipientThread({
  communication,
  recipient,
  onRefresh,
  canWrite,
}: RecipientThreadProps) {
  const { user } = useAuth();
  const [uploading, setUploading] = useState(false);
  const [uploadType, setUploadType] = useState<CommunicationDocumentType>('received');
  const [uploadPublic, setUploadPublic] = useState(true);

  const recipientDocs = (communication.documents || []).filter(
    d => d.recipientId === recipient.id
  );
  const generalDocs = (communication.documents || []).filter(
    d => !d.recipientId
  );

  const handleUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !user?.id) return;

    setUploading(true);
    try {
      await communicationService.uploadDocument(
        communication.id,
        file,
        uploadType,
        uploadPublic,
        user.id,
        undefined,
        recipient.id
      );
      toast.success('Document uploaded');
      onRefresh();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Upload failed');
    } finally {
      setUploading(false);
    }
  };

  const handleStatusUpdate = async (type: 'delivery' | 'response', value: string) => {
    try {
      if (type === 'delivery') {
        await communicationRecipientService.updateDeliveryStatus(recipient.id, value as DeliveryStatus);
      } else {
        await communicationRecipientService.updateResponseStatus(recipient.id, value as ResponseStatus);
      }
      onRefresh();
    } catch {
      toast.error('Failed to update status');
    }
  };

  const handleDownload = async (storagePath: string) => {
    try {
      const url = await communicationService.getDocumentUrl(storagePath);
      if (url) window.open(url, '_blank');
    } catch {
      toast.error('Failed to get download link');
    }
  };

  const handleDelete = async (docId: string) => {
    if (!confirm('Delete this document?')) return;
    try {
      await communicationService.deleteDocument(docId);
      toast.success('Document deleted');
      onRefresh();
    } catch {
      toast.error('Failed to delete document');
    }
  };

  const formatDate = (dateStr: string) => {
    return new Date(dateStr).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
    });
  };

  const docTypeIcon = (type: string) => {
    return type === 'sent'
      ? <Clock className="w-4 h-4 text-blue-500" />
      : <CheckCircle2 className="w-4 h-4 text-emerald-500" />;
  };

  return (
    <div className="space-y-6">
      {/* Recipient header */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
        <div className="flex items-start justify-between gap-4">
          <div>
            <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white">
              {recipient.department?.name || 'Unknown Department'}
            </h3>
            {recipient.contact && (
              <p className="text-sm text-stone-500 mt-1">
                Contact: {recipient.contact.fullName}
                {recipient.contact.roleTitle && ` (${recipient.contact.roleTitle})`}
              </p>
            )}
          </div>
        </div>

        {/* Status controls */}
        {canWrite && (
          <div className="flex items-center gap-4 mt-4 pt-4 border-t border-stone-100 dark:border-white/5">
            <div>
              <label className="block text-[10px] font-bold text-stone-400 uppercase tracking-wider mb-1">
                Delivery Status
              </label>
              <select
                value={recipient.deliveryStatus}
                onChange={(e) => void handleStatusUpdate('delivery', e.target.value)}
                className="px-3 py-1.5 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-lg text-sm text-slate-800 dark:text-white"
                aria-label="Delivery status"
              >
                {DELIVERY_OPTIONS.map(o => (
                  <option key={o.value} value={o.value}>{o.label}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-[10px] font-bold text-stone-400 uppercase tracking-wider mb-1">
                Response Status
              </label>
              <select
                value={recipient.responseStatus}
                onChange={(e) => void handleStatusUpdate('response', e.target.value)}
                className="px-3 py-1.5 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-lg text-sm text-slate-800 dark:text-white"
                aria-label="Response status"
              >
                {RESPONSE_OPTIONS.map(o => (
                  <option key={o.value} value={o.value}>{o.label}</option>
                ))}
              </select>
            </div>
          </div>
        )}
      </div>

      {/* General docs (shared/initial) */}
      {generalDocs.length > 0 && (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h4 className="text-sm font-bold text-stone-400 uppercase tracking-wider mb-4">
            Initial Correspondence
          </h4>
          <div className="space-y-3">
            {generalDocs.map(doc => (
              <div key={doc.id} className="flex items-center gap-3 p-3 bg-stone-50 dark:bg-stone-800 rounded-xl">
                {docTypeIcon(doc.documentType)}
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-slate-700 dark:text-stone-300 truncate">
                    {doc.originalName}
                  </p>
                  <p className="text-xs text-stone-400">{formatDate(doc.uploadedAt)}</p>
                </div>
                <span className={`text-xs ${doc.isPublic ? 'text-emerald-500' : 'text-stone-400'}`}>
                  {doc.isPublic ? 'Public' : 'Private'}
                </span>
                <button
                  type="button"
                  onClick={() => void handleDownload(doc.storagePath)}
                  className="p-1.5 text-stone-400 hover:text-gold-600 transition-colors"
                  title="Download"
                >
                  <Download className="w-4 h-4" />
                </button>
                {canWrite && (
                  <button
                    type="button"
                    onClick={() => void handleDelete(doc.id)}
                    className="p-1.5 text-stone-400 hover:text-red-500 transition-colors"
                    title="Delete"
                  >
                    <Trash2 className="w-4 h-4" />
                  </button>
                )}
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Recipient-specific docs (replies, follow-ups) */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
        <div className="flex items-center justify-between mb-4">
          <h4 className="text-sm font-bold text-stone-400 uppercase tracking-wider">
            Recipient Correspondence ({recipientDocs.length})
          </h4>
          {canWrite && (
            <div className="flex items-center gap-2">
              <select
                value={uploadType}
                onChange={(e) => setUploadType(e.target.value as CommunicationDocumentType)}
                className="px-2 py-1 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-lg text-xs text-slate-800 dark:text-white"
                aria-label="Document type"
              >
                <option value="sent">Sent</option>
                <option value="received">Received</option>
              </select>
              <button
                type="button"
                onClick={() => setUploadPublic(!uploadPublic)}
                className={`p-1.5 rounded-lg ${uploadPublic ? 'text-emerald-500' : 'text-stone-400'}`}
                title={uploadPublic ? 'Public' : 'Private'}
              >
                {uploadPublic ? <Eye className="w-3.5 h-3.5" /> : <EyeOff className="w-3.5 h-3.5" />}
              </button>
              <label className="flex items-center gap-1 px-3 py-1.5 bg-gold-600 text-white rounded-lg text-xs font-bold cursor-pointer hover:bg-gold-700 transition-all">
                <Upload className="w-3.5 h-3.5" />
                {uploading ? 'Uploading...' : 'Upload'}
                <input
                  type="file"
                  accept=".pdf,.doc,.docx,.png,.jpg,.jpeg"
                  onChange={(e) => void handleUpload(e)}
                  className="hidden"
                  disabled={uploading}
                />
              </label>
            </div>
          )}
        </div>

        {recipientDocs.length === 0 ? (
          <div className="flex flex-col items-center py-8 text-stone-400">
            <FileText className="w-8 h-8 mb-2 opacity-30" />
            <p className="text-sm">No correspondence yet for this recipient</p>
            {canWrite && (
              <p className="text-xs mt-1">Upload a document above to start the thread</p>
            )}
          </div>
        ) : (
          <div className="space-y-3">
            {recipientDocs.map(doc => (
              <div key={doc.id} className="flex items-center gap-3 p-3 bg-stone-50 dark:bg-stone-800 rounded-xl">
                {docTypeIcon(doc.documentType)}
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-slate-700 dark:text-stone-300 truncate">
                    {doc.originalName}
                  </p>
                  <div className="flex items-center gap-2 text-xs text-stone-400">
                    <span className="capitalize">{doc.documentType}</span>
                    <span>·</span>
                    <span>{formatDate(doc.uploadedAt)}</span>
                  </div>
                </div>
                <span className={`text-xs ${doc.isPublic ? 'text-emerald-500' : 'text-stone-400'}`}>
                  {doc.isPublic ? 'Public' : 'Private'}
                </span>
                <button
                  type="button"
                  onClick={() => void handleDownload(doc.storagePath)}
                  className="p-1.5 text-stone-400 hover:text-gold-600 transition-colors"
                  title="Download"
                >
                  <Download className="w-4 h-4" />
                </button>
                {canWrite && (
                  <button
                    type="button"
                    onClick={() => void handleDelete(doc.id)}
                    className="p-1.5 text-stone-400 hover:text-red-500 transition-colors"
                    title="Delete"
                  >
                    <Trash2 className="w-4 h-4" />
                  </button>
                )}
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
