'use client';

import React from 'react';
import { Building2, User, ChevronRight, Clock, CheckCircle2, XCircle, AlertCircle, Truck } from 'lucide-react';
import type { CommunicationRecipient } from '@/types';

interface RecipientsPanelProps {
  recipients: CommunicationRecipient[];
  selectedRecipientId: string | null;
  onSelectRecipient: (id: string) => void;
  onAddRecipient?: () => void;
}

const deliveryStatusConfig: Record<string, { color: string; icon: React.ReactNode; label: string }> = {
  PENDING: { color: 'text-stone-400 bg-stone-100', icon: <Clock className="w-3 h-3" />, label: 'Pending' },
  SENDING: { color: 'text-blue-500 bg-blue-50 dark:bg-blue-900/30', icon: <Truck className="w-3 h-3" />, label: 'Sending' },
  SENT: { color: 'text-blue-600 bg-blue-50 dark:bg-blue-900/30', icon: <CheckCircle2 className="w-3 h-3" />, label: 'Sent' },
  DELIVERED: { color: 'text-emerald-600 bg-emerald-50', icon: <CheckCircle2 className="w-3 h-3" />, label: 'Delivered' },
  FAILED: { color: 'text-red-500 bg-red-50', icon: <XCircle className="w-3 h-3" />, label: 'Failed' },
  BOUNCED: { color: 'text-red-500 bg-red-50', icon: <XCircle className="w-3 h-3" />, label: 'Bounced' },
};

const responseStatusConfig: Record<string, { color: string; label: string }> = {
  RECEIVED: { color: 'text-stone-400', label: 'Received' },
  REVIEWING: { color: 'text-amber-600', label: 'Reviewing' },
  ACCEPTED: { color: 'text-emerald-600', label: 'Accepted' },
  REJECTED: { color: 'text-red-600', label: 'Rejected' },
  INCOMPLETE: { color: 'text-amber-600', label: 'Incomplete' },
};

export default function RecipientsPanel({
  recipients,
  selectedRecipientId,
  onSelectRecipient,
  onAddRecipient,
}: RecipientsPanelProps) {
  // Summary counts
  const summary = {
    total: recipients.length,
    delivered: recipients.filter(r => r.deliveryStatus === 'DELIVERED' || r.deliveryStatus === 'SENT').length,
    pending: recipients.filter(r => r.deliveryStatus === 'PENDING').length,
    failed: recipients.filter(r => r.deliveryStatus === 'FAILED' || r.deliveryStatus === 'BOUNCED').length,
  };

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden">
      {/* Header */}
      <div className="p-4 border-b border-stone-100 dark:border-white/5">
        <div className="flex items-center justify-between mb-2">
          <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white">
            Recipients
          </h3>
          <span className="text-xs font-bold px-2 py-1 bg-gold-100 dark:bg-gold-900/30 text-gold-700 dark:text-gold-400 rounded-full">
            {summary.total}
          </span>
        </div>
        <div className="flex items-center gap-3 text-xs text-stone-500">
          <span className="text-emerald-600">{summary.delivered} delivered</span>
          {summary.pending > 0 && <span className="text-amber-600">{summary.pending} pending</span>}
          {summary.failed > 0 && <span className="text-red-500">{summary.failed} failed</span>}
        </div>
      </div>

      {/* Recipient list */}
      <div className="divide-y divide-stone-50 dark:divide-white/5 max-h-96 overflow-y-auto">
        {recipients.map(recipient => {
          const isSelected = selectedRecipientId === recipient.id;
          const delivery = deliveryStatusConfig[recipient.deliveryStatus] || deliveryStatusConfig.PENDING;
          const response = responseStatusConfig[recipient.responseStatus] || responseStatusConfig.RECEIVED;

          return (
            <button
              key={recipient.id}
              type="button"
              onClick={() => onSelectRecipient(recipient.id)}
              className={`w-full text-left p-4 hover:bg-stone-50 dark:hover:bg-stone-800 transition-colors ${
                isSelected ? 'bg-gold-50/50 dark:bg-gold-900/10 border-l-2 border-gold-500' : ''
              }`}
            >
              <div className="flex items-start gap-3">
                <div className="w-8 h-8 bg-stone-100 dark:bg-stone-800 rounded-lg flex items-center justify-center flex-shrink-0">
                  <Building2 className="w-4 h-4 text-gold-600" />
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-bold text-slate-800 dark:text-white truncate">
                    {recipient.department?.name || 'Unknown Department'}
                  </p>
                  {recipient.contact && (
                    <p className="text-xs text-stone-500 flex items-center gap-1 mt-0.5">
                      <User className="w-3 h-3" />
                      {recipient.contact.fullName}
                    </p>
                  )}
                  <div className="flex items-center gap-2 mt-2">
                    <span className={`inline-flex items-center gap-1 text-[10px] font-bold px-1.5 py-0.5 rounded ${delivery.color}`}>
                      {delivery.icon}
                      {delivery.label}
                    </span>
                    <span className={`text-[10px] font-bold ${response.color}`}>
                      {response.label}
                    </span>
                  </div>
                </div>
                <ChevronRight className="w-4 h-4 text-stone-300 flex-shrink-0 mt-1" />
              </div>
            </button>
          );
        })}
      </div>

      {/* Add recipient button */}
      {onAddRecipient && (
        <div className="p-4 border-t border-stone-100 dark:border-white/5">
          <button
            type="button"
            onClick={onAddRecipient}
            className="w-full flex items-center justify-center gap-2 px-4 py-2 bg-stone-50 dark:bg-stone-800 text-stone-600 dark:text-stone-300 rounded-xl text-sm font-bold hover:bg-stone-100 dark:hover:bg-stone-700 transition-all"
          >
            <AlertCircle className="w-4 h-4" />
            Add Recipient
          </button>
        </div>
      )}
    </div>
  );
}
