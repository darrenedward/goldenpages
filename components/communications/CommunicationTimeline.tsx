'use client';

import React from 'react';
import { FileText, ArrowRight, Download, Eye, EyeOff, Trash2 } from 'lucide-react';
import type { CommunicationWithDetails, CommunicationDocument } from '@/types';

interface CommunicationTimelineProps {
  communication: CommunicationWithDetails;
  onDownload?: (doc: CommunicationDocument) => void;
  onDelete?: (docId: string) => void;
  isPublicView?: boolean;
}

export default function CommunicationTimeline({
  communication,
  onDownload,
  onDelete,
  isPublicView,
}: CommunicationTimelineProps) {
  const documents = communication.documents || [];
  const sentDocs = documents.filter(d => d.documentType === 'sent');
  const receivedDocs = documents.filter(d => d.documentType === 'received');

  const formatSize = (bytes: number) => {
    if (bytes < 1024) return `${bytes} B`;
    if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`;
    return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
  };

  const formatDate = (dateStr: string) => {
    return new Date(dateStr).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
    });
  };

  const renderDocument = (doc: CommunicationDocument, type: 'sent' | 'received') => (
    <div
      key={doc.id}
      className="relative flex items-start gap-4 group"
    >
      {/* Timeline dot */}
      <div className="absolute left-5 top-4 w-3 h-3 rounded-full border-2 border-white dark:border-slate-900 z-10" style={{
        backgroundColor: type === 'sent' ? '#b8860b' : '#059669'
      }} />

      {/* Timeline line */}
      <div className="absolute left-[1.3rem] top-7 bottom-0 w-px bg-stone-200 dark:bg-white/5" />

      {/* Document card */}
      <div className="ml-12 flex-1 bg-stone-50 dark:bg-stone-800 rounded-xl p-4 border border-stone-200 dark:border-white/5">
        <div className="flex items-start gap-3">
          <div className={`w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0 ${
            type === 'sent'
              ? 'bg-gold-100 dark:bg-gold-900/30 text-gold-600'
              : 'bg-emerald-100 dark:bg-emerald-900/30 text-emerald-600'
          }`}>
            <FileText className="w-4 h-4" />
          </div>

          <div className="flex-1 min-w-0">
            <p className="font-medium text-slate-800 dark:text-white text-sm truncate">
              {doc.originalName}
            </p>
            <div className="flex items-center gap-2 mt-1 text-xs text-stone-400">
              <span>{formatSize(doc.sizeBytes)}</span>
              <span>·</span>
              <span>{formatDate(doc.uploadedAt)}</span>
              <span>·</span>
              <span className={`flex items-center gap-1 ${doc.isPublic ? 'text-emerald-500' : 'text-stone-400'}`}>
                {doc.isPublic ? <Eye className="w-3 h-3" /> : <EyeOff className="w-3 h-3" />}
                {doc.isPublic ? 'Public' : 'Private'}
              </span>
            </div>
            {doc.description && (
              <p className="text-xs text-stone-500 mt-1">{doc.description}</p>
            )}
          </div>

          {/* Actions */}
          {!isPublicView && (
            <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
              {onDownload && (
                <button
                  onClick={() => onDownload(doc)}
                  className="p-1.5 hover:bg-stone-200 dark:hover:bg-stone-700 rounded-lg text-stone-400 hover:text-gold-600"
                  title="Download"
                >
                  <Download className="w-4 h-4" />
                </button>
              )}
              {onDelete && (
                <button
                  onClick={() => onDelete(doc.id)}
                  className="p-1.5 hover:bg-red-100 dark:hover:bg-red-900/30 rounded-lg text-stone-400 hover:text-red-500"
                  title="Delete"
                >
                  <Trash2 className="w-4 h-4" />
                </button>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );

  // Build timeline events in chronological order
  const timelineEvents: { date: string; label: string; type: 'sent' | 'received' | 'status' }[] = [];

  // Add sent documents
  sentDocs.forEach(doc => {
    timelineEvents.push({ date: doc.uploadedAt, label: 'Document Sent', type: 'sent' });
  });

  // Add status changes
  timelineEvents.push({ date: communication.createdAt, label: 'Communication Created', type: 'status' });
  if (communication.respondedAt) {
    timelineEvents.push({ date: communication.respondedAt, label: 'Response Received', type: 'status' });
  }
  if (communication.closedAt) {
    timelineEvents.push({ date: communication.closedAt, label: 'Communication Closed', type: 'status' });
  }

  // Add received documents
  receivedDocs.forEach(doc => {
    timelineEvents.push({ date: doc.uploadedAt, label: 'Response Document', type: 'received' });
  });

  return (
    <div className="space-y-6">
      {/* Sent documents */}
      {sentDocs.length > 0 && (
        <div>
          <h3 className="text-sm font-bold text-stone-500 uppercase tracking-wider mb-3 flex items-center gap-2">
            <ArrowRight className="w-4 h-4 text-gold-600" />
            Sent ({sentDocs.length})
          </h3>
          <div className="space-y-0">
            {sentDocs.map(doc => renderDocument(doc, 'sent'))}
          </div>
        </div>
      )}

      {/* Received documents */}
      {receivedDocs.length > 0 && (
        <div>
          <h3 className="text-sm font-bold text-stone-500 uppercase tracking-wider mb-3 flex items-center gap-2">
            <ArrowRight className="w-4 h-4 rotate-180 text-emerald-600" />
            Received ({receivedDocs.length})
          </h3>
          <div className="space-y-0">
            {receivedDocs.map(doc => renderDocument(doc, 'received'))}
          </div>
        </div>
      )}

      {documents.length === 0 && (
        <p className="text-center text-stone-400 italic py-8">No documents uploaded yet</p>
      )}
    </div>
  );
}
