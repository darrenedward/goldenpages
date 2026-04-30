'use client';

import React from 'react';
import { Mail, FileText, Clock, CheckCircle2, AlertCircle, XCircle, ArrowRight } from 'lucide-react';
import type { CommunicationWithDetails } from '@/types';
import StatusBadge from '@/components/shared/StatusBadge';

interface CommunicationCardProps {
  communication: CommunicationWithDetails;
  onClick: (id: string) => void;
  isPublicView?: boolean;
}

const typeIcons: Record<string, React.ReactNode> = {
  letter: <Mail className="w-4 h-4" />,
  email: <Mail className="w-4 h-4" />,
  physical_mail: <Mail className="w-4 h-4" />,
  meeting: <FileText className="w-4 h-4" />,
};

const statusConfig: Record<string, { color: string; icon: React.ReactNode }> = {
  SENT: { color: 'text-blue-600', icon: <Clock className="w-4 h-4" /> },
  AWAITING_RESPONSE: { color: 'text-amber-600', icon: <AlertCircle className="w-4 h-4" /> },
  RESPONDED: { color: 'text-emerald-600', icon: <CheckCircle2 className="w-4 h-4" /> },
  CLOSED: { color: 'text-stone-500', icon: <CheckCircle2 className="w-4 h-4" /> },
  CANCELLED: { color: 'text-red-500', icon: <XCircle className="w-4 h-4" /> },
};

export default function CommunicationCard({ communication, onClick, isPublicView }: CommunicationCardProps) {
  const docs = communication.documents || [];
  const sentCount = docs.filter(d => d.documentType === 'sent').length;
  const receivedCount = docs.filter(d => d.documentType === 'received').length;
  const status = statusConfig[communication.status] || statusConfig.SENT;
  const recipients = communication.recipients || [];

  const formatDate = (dateStr: string) => {
    return new Date(dateStr).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
    });
  };

  const recipientLabel = recipients.length > 0
    ? recipients.slice(0, 2).map(r => r.department?.name || 'Unknown').join(', ') +
      (recipients.length > 2 ? ` +${recipients.length - 2}` : '')
    : communication.contact?.fullName || '';

  return (
    <button
      onClick={() => onClick(communication.id)}
      className="w-full text-left bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-6 hover:shadow-md hover:border-gold-300 transition-all group"
    >
      <div className="flex items-start gap-4">
        {/* Type icon */}
        <div className="w-10 h-10 bg-stone-100 dark:bg-stone-800 rounded-xl flex items-center justify-center text-gold-600 flex-shrink-0">
          {typeIcons[communication.communicationType] || <Mail className="w-4 h-4" />}
        </div>

        {/* Content */}
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2 mb-1">
            <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white truncate">
              {communication.title}
            </h3>
          </div>

          <div className="flex items-center gap-3 text-sm text-stone-500 mb-3">
            <span className="capitalize">{communication.communicationType.replace('_', ' ')}</span>
            <span>·</span>
            <span>{formatDate(communication.createdAt)}</span>
            {recipientLabel && (
              <>
                <span>·</span>
                <span>To: {recipientLabel}</span>
              </>
            )}
            {recipients.length > 1 && (
              <span className="px-1.5 py-0.5 bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 rounded text-xs font-bold">
                {recipients.length} recipients
              </span>
            )}
          </div>

          {communication.description && (
            <p className="text-sm text-stone-600 dark:text-stone-400 line-clamp-2 mb-3">
              {communication.description}
            </p>
          )}

          {/* Meta row */}
          <div className="flex items-center gap-4">
            {(communication.issueCategory || communication.category) && (
              <span className="px-2 py-0.5 bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 rounded-full text-xs font-bold">
                {communication.issueCategory?.name || communication.category}
              </span>
            )}
            <StatusBadge status={communication.status} size="sm" />
            <div className="flex items-center gap-3 text-xs text-stone-400">
              <span className="flex items-center gap-1">
                <ArrowRight className="w-3 h-3" />
                {sentCount} sent
              </span>
              <span className="flex items-center gap-1">
                <ArrowRight className="w-3 h-3 rotate-180" />
                {receivedCount} received
              </span>
            </div>
            {communication.senderOrganisation && isPublicView && (
              <span className="text-xs text-stone-400 ml-auto">
                From: {communication.senderOrganisation}
              </span>
            )}
          </div>
        </div>

        {/* Status indicator */}
        <div className={`flex-shrink-0 ${status.color}`}>
          {status.icon}
        </div>
      </div>
    </button>
  );
}
