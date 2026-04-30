'use client';

import React, { useState, useEffect, useCallback } from 'react';
import { Mail, MailOpen, Link2, AlertCircle, Search, ExternalLink } from 'lucide-react';
import { inboundEmailService } from '@/services/inboundEmailService';
import type { InboundEmail, InboundEmailStatus } from '@/types';

interface InboundEmailListProps {
  onSelectEmail?: (id: string) => void;
  onChangeView?: (view: string) => void;
}

const STATUS_CONFIG: Record<InboundEmailStatus, { label: string; color: string; icon: React.ElementType }> = {
  received: { label: 'Received', color: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400', icon: Mail },
  linked: { label: 'Linked', color: 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400', icon: Link2 },
  unlinked: { label: 'Unlinked', color: 'bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400', icon: AlertCircle },
  error: { label: 'Error', color: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400', icon: AlertCircle },
};

type FilterOption = 'all' | InboundEmailStatus;

export default function InboundEmailList({ onSelectEmail, onChangeView }: InboundEmailListProps) {
  const [emails, setEmails] = useState<InboundEmail[]>([]);
  const [totalCount, setTotalCount] = useState(0);
  const [page, setPage] = useState(0);
  const [filter, setFilter] = useState<FilterOption>('all');
  const [search, setSearch] = useState('');
  const [loading, setLoading] = useState(true);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const pageSize = 20;

  const fetchEmails = useCallback(async () => {
    setLoading(true);
    try {
      const statusFilter = filter === 'all' ? undefined : filter;
      const result = await inboundEmailService.getInboundEmails(page, pageSize, statusFilter);
      setEmails(result.data);
      setTotalCount(result.totalCount);
    } catch (error) {
      console.error('[InboundEmailList] Failed to fetch:', error);
    } finally {
      setLoading(false);
    }
  }, [page, filter]);

  useEffect(() => {
    void fetchEmails();
  }, [fetchEmails]);

  const filteredEmails = search
    ? emails.filter((e) =>
        e.subject.toLowerCase().includes(search.toLowerCase()) ||
        e.fromEmail.toLowerCase().includes(search.toLowerCase())
      )
    : emails;

  const totalPages = Math.ceil(totalCount / pageSize);

  const handleSelect = (id: string) => {
    setSelectedId(id);
    onSelectEmail?.(id);
  };

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const now = new Date();
    const diffMs = now.getTime() - date.getTime();
    const diffMins = Math.floor(diffMs / 60000);
    const diffHours = Math.floor(diffMs / 3600000);
    const diffDays = Math.floor(diffMs / 86400000);

    if (diffMins < 1) return 'Just now';
    if (diffMins < 60) return `${diffMins}m ago`;
    if (diffHours < 24) return `${diffHours}h ago`;
    if (diffDays < 7) return `${diffDays}d ago`;
    return date.toLocaleDateString();
  };

  const selectedEmail = selectedId ? emails.find((e) => e.id === selectedId) : null;

  return (
    <div className="h-full flex flex-col">
      {/* Header */}
      <div className="px-6 py-4 border-b border-stone-200 dark:border-white/5 bg-white dark:bg-slate-900">
        <div className="flex items-center justify-between mb-4">
          <div>
            <h2 className="text-xl font-serif font-bold text-slate-800 dark:text-white">Inbound Emails</h2>
            <p className="text-sm text-stone-500 mt-1">{totalCount} emails received</p>
          </div>
          <button
            onClick={() => void fetchEmails()}
            className="text-sm text-gold-600 hover:text-gold-700 font-medium"
          >
            Refresh
          </button>
        </div>

        {/* Filters */}
        <div className="flex items-center gap-3">
          <div className="relative flex-1 max-w-xs">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-stone-400" />
            <input
              type="text"
              placeholder="Search emails..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="w-full pl-9 pr-3 py-2 text-sm border border-stone-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-gold-400"
            />
          </div>
          <div className="flex gap-1">
            {(['all', 'received', 'linked', 'unlinked'] as FilterOption[]).map((f) => (
              <button
                key={f}
                onClick={() => { setFilter(f); setPage(0); }}
                className={`px-3 py-1.5 text-xs font-medium rounded-full transition-colors ${
                  filter === f
                    ? 'bg-gold-100 text-gold-700'
                    : 'text-stone-500 hover:bg-stone-100'
                }`}
              >
                {f === 'all' ? 'All' : f.charAt(0).toUpperCase() + f.slice(1)}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="flex-1 flex overflow-hidden">
        {/* Email list */}
        <div className="w-80 border-r border-stone-200 dark:border-white/5 overflow-y-auto">
          {loading ? (
            <div className="flex items-center justify-center py-12 text-stone-400">
              <div className="w-6 h-6 border-2 border-gold-200 border-t-gold-600 rounded-full animate-spin mr-2" />
              Loading...
            </div>
          ) : filteredEmails.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-12 text-stone-400">
              <Mail className="h-8 w-8 mb-2" />
              <p className="text-sm">No emails found</p>
            </div>
          ) : (
            filteredEmails.map((email) => {
              const statusCfg = STATUS_CONFIG[email.status];
              const StatusIcon = statusCfg.icon;
              return (
                <button
                  key={email.id}
                  onClick={() => handleSelect(email.id)}
                  className={`w-full text-left px-4 py-3 border-b border-stone-100 dark:border-white/5 hover:bg-gold-50/50 dark:hover:bg-white/5 transition-colors ${
                    selectedId === email.id ? 'bg-gold-50 dark:bg-white/10' : ''
                  }`}
                >
                  <div className="flex items-start justify-between gap-2">
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-slate-800 dark:text-white truncate">
                        {email.fromName || email.fromEmail}
                      </p>
                      <p className="text-sm text-slate-700 dark:text-stone-300 truncate mt-0.5">
                        {email.subject}
                      </p>
                      <p className="text-xs text-stone-400 mt-1">{formatDate(email.createdAt)}</p>
                    </div>
                    <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium ${statusCfg.color}`}>
                      <StatusIcon className="h-3 w-3" />
                      {statusCfg.label}
                    </span>
                  </div>
                </button>
              );
            })
          )}
        </div>

        {/* Email detail */}
        <div className="flex-1 overflow-y-auto">
          {selectedEmail ? (
            <EmailDetail email={selectedEmail} onChangeView={onChangeView} />
          ) : (
            <div className="flex flex-col items-center justify-center h-full text-stone-400">
              <MailOpen className="h-12 w-12 mb-3" />
              <p className="text-sm">Select an email to view details</p>
            </div>
          )}
        </div>
      </div>

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="px-6 py-3 border-t border-stone-200 dark:border-white/5 bg-white dark:bg-slate-900 flex items-center justify-between">
          <button
            onClick={() => setPage((p) => Math.max(0, p - 1))}
            disabled={page === 0}
            className="text-sm text-gold-600 disabled:text-stone-300 font-medium"
          >
            Previous
          </button>
          <span className="text-sm text-stone-500">
            Page {page + 1} of {totalPages}
          </span>
          <button
            onClick={() => setPage((p) => Math.min(totalPages - 1, p + 1))}
            disabled={page >= totalPages - 1}
            className="text-sm text-gold-600 disabled:text-stone-300 font-medium"
          >
            Next
          </button>
        </div>
      )}
    </div>
  );
}

// ---------------------------------------------------------------------------
// Email Detail Panel
// ---------------------------------------------------------------------------

function EmailDetail({ email, onChangeView }: { email: InboundEmail; onChangeView?: (view: string) => void }) {
  const [linkingId, setLinkingId] = useState<string | null>(null);

  const handleLink = async () => {
    setLinkingId(email.id);
    // For now, just mark as linked — manual linking UI can be added later
    setLinkingId(null);
  };

  return (
    <div className="p-6">
      {/* Header */}
      <div className="mb-6">
        <h3 className="text-lg font-serif font-bold text-slate-800 mb-2">{email.subject}</h3>
        <div className="space-y-1 text-sm">
          <p><span className="text-stone-500">From:</span> <span className="text-slate-700">{email.fromName ? `${email.fromName} <${email.fromEmail}>` : email.fromEmail}</span></p>
          <p><span className="text-stone-500">To:</span> <span className="text-slate-700">{email.toEmail}</span></p>
          <p><span className="text-stone-500">Date:</span> <span className="text-slate-700">{new Date(email.createdAt).toLocaleString()}</span></p>
        </div>
      </div>

      {/* Linked communication */}
      {email.communicationId && (
        <div className="mb-6 p-3 bg-green-50 border border-green-200 rounded-lg flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Link2 className="h-4 w-4 text-green-600" />
            <span className="text-sm text-green-700">Linked to communication</span>
          </div>
          <button
            onClick={() => {
              onChangeView?.('communication-detail');
            }}
            className="text-xs text-green-600 hover:text-green-700 flex items-center gap-1"
          >
            View <ExternalLink className="h-3 w-3" />
          </button>
        </div>
      )}

      {/* Link button for unlinked */}
      {email.status === 'unlinked' && !email.communicationId && (
        <div className="mb-6">
          <button
            onClick={() => void handleLink()}
            disabled={linkingId !== null}
            className="text-sm px-4 py-2 bg-gold-100 text-gold-700 rounded-lg hover:bg-gold-200 transition-colors disabled:opacity-50"
          >
            Link to Communication
          </button>
        </div>
      )}

      {/* Body */}
      <div className="border border-stone-200 rounded-lg overflow-hidden">
        {email.bodyHtml ? (
          <iframe
            srcDoc={email.bodyHtml}
            className="w-full min-h-[400px] border-0"
            sandbox="allow-same-origin"
            title="Email content"
          />
        ) : email.bodyText ? (
          <pre className="p-4 text-sm text-slate-700 whitespace-pre-wrap font-sans">
            {email.bodyText}
          </pre>
        ) : (
          <p className="p-4 text-sm text-stone-400 italic">No content</p>
        )}
      </div>
    </div>
  );
}
