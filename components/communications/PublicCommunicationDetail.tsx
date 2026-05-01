'use client';

import React, { useState, useEffect } from 'react';
import {
  ArrowLeft, FileText, Clock, CheckCircle2, AlertCircle, Calendar,
  Download, Users, Mail, ChevronRight,
} from 'lucide-react';
import { Crown, Shield, UserCircle } from 'lucide-react';
import { communicationService } from '@/services/communicationService';
import { communicationMemberService } from '@/services/communicationMemberService';
import StatusBadge from '@/components/shared/StatusBadge';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import type { CommunicationWithDetails, CommunicationMember } from '@/types';

interface PublicCommunicationDetailProps {
  communicationId: string;
  onBack: () => void;
}

export default function PublicCommunicationDetail({ communicationId, onBack }: PublicCommunicationDetailProps) {
  const [communication, setCommunication] = useState<CommunicationWithDetails | null>(null);
  const [members, setMembers] = useState<CommunicationMember[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    void fetchData();
  }, [communicationId]);

  const fetchData = async () => {
    setLoading(true);
    try {
      const [data, memberData] = await Promise.all([
        communicationService.getCommunication(communicationId),
        communicationMemberService.getMembers(communicationId),
      ]);
      setCommunication(data);
      setMembers(memberData);
    } catch (err) {
      console.error('Failed to fetch communication:', err);
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateStr: string) => {
    return new Date(dateStr).toLocaleDateString('en-US', {
      year: 'numeric', month: 'long', day: 'numeric',
    });
  };

  const handleDownload = async (storagePath: string) => {
    try {
      const url = await communicationService.getDocumentUrl(storagePath);
      if (url) window.open(url, '_blank');
    } catch {
      // Silent fail for public
    }
  };

  if (loading) return <LoadingSpinner message="Loading communication..." />;
  if (!communication) return <div className="p-6 text-center text-stone-400">Communication not found</div>;

  const recipients = communication.recipients || [];
  const documents = communication.documents || [];
  const sentDocs = documents.filter(d => d.documentType === 'sent');
  const receivedDocs = documents.filter(d => d.documentType === 'received');

  const isOverdue = communication.expectedResponseDate &&
    communication.status !== 'CLOSED' && communication.status !== 'CANCELLED' && communication.status !== 'RESPONDED' &&
    new Date(communication.expectedResponseDate) < new Date();

  return (
    <div className="space-y-6 animate-fade-in pb-12">
      {/* Back button */}
      <button
        onClick={onBack}
        className="flex items-center gap-2 text-sm text-stone-500 hover:text-gold-600 transition-colors"
      >
        <ArrowLeft className="w-4 h-4" />
        Back to register
      </button>

      {/* Header */}
      <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-8">
        <div className="flex items-center gap-3 mb-3">
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
              <AlertCircle className="w-3 h-3" />
              Overdue
            </span>
          )}
        </div>

        <h1 className="font-serif text-3xl text-slate-800 dark:text-white mb-3">
          {communication.title}
        </h1>

        <div className="flex flex-wrap items-center gap-4 text-sm text-stone-500 mb-4">
          <span className="flex items-center gap-1">
            <Clock className="w-3 h-3" />
            {formatDate(communication.createdAt)}
          </span>
          {communication.senderOrganisation && (
            <span>From: {communication.senderOrganisation}</span>
          )}
        </div>

        {communication.description && (
          <p className="text-stone-600 dark:text-stone-400 max-w-2xl">{communication.description}</p>
        )}

        {communication.expectedResponseDate && (
          <div className={`flex items-center gap-2 mt-3 text-xs ${isOverdue ? 'text-red-600 font-bold' : 'text-stone-400'}`}>
            <Calendar className="w-3 h-3" />
            Expected response by {formatDate(new Date(communication.expectedResponseDate).toISOString())}
            {isOverdue && ' (OVERDUE)'}
          </div>
        )}

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

      {/* Two-column layout: Recipients + Documents */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Recipients */}
        <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h2 className="flex items-center gap-2 font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">
            <Users className="w-5 h-5 text-gold-600" />
            Recipients ({recipients.length})
          </h2>
          {recipients.length === 0 ? (
            <p className="text-sm text-stone-400 py-4 text-center">No recipients listed</p>
          ) : (
            <div className="space-y-3">
              {recipients.map(r => (
                <div
                  key={r.id}
                  className="flex items-center gap-3 p-3 rounded-xl bg-stone-50 dark:bg-stone-800/50"
                >
                  <div className="w-8 h-8 bg-gold-50 dark:bg-gold-900/20 rounded-lg flex items-center justify-center text-gold-600">
                    <Mail className="w-4 h-4" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-bold text-slate-800 dark:text-white truncate">
                      {r.department?.name || 'Unknown Department'}
                    </p>
                    {r.contact && (
                      <p className="text-xs text-stone-400">{r.contact.fullName}</p>
                    )}
                  </div>
                  <StatusBadge status={r.deliveryStatus || 'PENDING'} size="sm" />
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Documents */}
        <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h2 className="flex items-center gap-2 font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">
            <FileText className="w-5 h-5 text-gold-600" />
            Documents ({documents.length})
          </h2>
          {documents.length === 0 ? (
            <p className="text-sm text-stone-400 py-4 text-center">No documents yet</p>
          ) : (
            <div className="space-y-2">
              {sentDocs.length > 0 && (
                <>
                  <p className="text-xs font-bold text-stone-400 uppercase tracking-wider mb-2">Sent ({sentDocs.length})</p>
                  {sentDocs.map(doc => (
                    <div
                      key={doc.id}
                      className="flex items-center gap-3 p-3 rounded-xl bg-stone-50 dark:bg-stone-800/50 group"
                    >
                      <div className="w-8 h-8 bg-blue-50 dark:bg-blue-900/20 rounded-lg flex items-center justify-center text-blue-600">
                        <FileText className="w-4 h-4" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium text-slate-800 dark:text-white truncate">
                          {doc.originalName || doc.filename}
                        </p>
                        <p className="text-xs text-stone-400">
                          {formatDate(doc.uploadedAt)} &middot; {(doc.sizeBytes / 1024).toFixed(1)} KB
                        </p>
                      </div>
                      <button
                        onClick={() => void handleDownload(doc.storagePath)}
                        className="opacity-0 group-hover:opacity-100 transition-opacity p-1.5 rounded-lg hover:bg-stone-200 dark:hover:bg-stone-700"
                        title="Download"
                      >
                        <Download className="w-4 h-4 text-stone-500" />
                      </button>
                    </div>
                  ))}
                </>
              )}
              {receivedDocs.length > 0 && (
                <>
                  <p className="text-xs font-bold text-stone-400 uppercase tracking-wider mt-4 mb-2">Received ({receivedDocs.length})</p>
                  {receivedDocs.map(doc => (
                    <div
                      key={doc.id}
                      className="flex items-center gap-3 p-3 rounded-xl bg-stone-50 dark:bg-stone-800/50 group"
                    >
                      <div className="w-8 h-8 bg-emerald-50 dark:bg-emerald-900/20 rounded-lg flex items-center justify-center text-emerald-600">
                        <FileText className="w-4 h-4" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium text-slate-800 dark:text-white truncate">
                          {doc.originalName || doc.filename}
                        </p>
                        <p className="text-xs text-stone-400">
                          {formatDate(doc.uploadedAt)} &middot; {(doc.sizeBytes / 1024).toFixed(1)} KB
                        </p>
                      </div>
                      <button
                        onClick={() => void handleDownload(doc.storagePath)}
                        className="opacity-0 group-hover:opacity-100 transition-opacity p-1.5 rounded-lg hover:bg-stone-200 dark:hover:bg-stone-700"
                        title="Download"
                      >
                        <Download className="w-4 h-4 text-stone-500" />
                      </button>
                    </div>
                  ))}
                </>
              )}
            </div>
          )}
        </div>
      </div>

      {/* Team */}
      <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-6">
        <h2 className="flex items-center gap-2 font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">
          <Users className="w-5 h-5 text-gold-600" />
          Team ({members.length})
        </h2>
        {members.length === 0 ? (
          <p className="text-sm text-stone-400 py-4 text-center">No team members listed</p>
        ) : (
          <div className="space-y-2">
            {members.map(member => {
              const name = member.user?.displayName || member.user?.email || 'Unknown';
              const initials = name[0].toUpperCase();
              const roleConfig: Record<string, { label: string; icon: React.ReactNode; color: string }> = {
                owner: { label: 'Author', icon: <Crown className="w-3.5 h-3.5" />, color: 'bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400' },
                assignee: { label: 'Assignee', icon: <Shield className="w-3.5 h-3.5" />, color: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400' },
                collaborator: { label: 'Contributor', icon: <UserCircle className="w-3.5 h-3.5" />, color: 'bg-stone-100 text-stone-600 dark:bg-stone-800 dark:text-stone-400' },
              };
              const config = roleConfig[member.role] || roleConfig.collaborator;

              return (
                <div
                  key={member.id}
                  className="flex items-center gap-3 p-3 rounded-xl bg-stone-50 dark:bg-stone-800/50"
                >
                  <div className="w-8 h-8 bg-gold-100 dark:bg-gold-900/30 rounded-full flex items-center justify-center text-gold-700 dark:text-gold-400 text-sm font-bold">
                    {initials}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-bold text-slate-800 dark:text-white truncate">{name}</p>
                  </div>
                  <span className={`flex items-center gap-1 px-2 py-0.5 rounded-md text-xs font-semibold ${config.color}`}>
                    {config.icon}
                    {config.label}
                  </span>
                </div>
              );
            })}
          </div>
        )}
      </div>

      {/* Sender info */}
      {communication.organisation && (
        <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h2 className="flex items-center gap-2 font-serif text-lg font-bold text-slate-800 dark:text-white mb-3">
            <ChevronRight className="w-5 h-5 text-gold-600" />
            Organisation
          </h2>
          <p className="text-stone-600 dark:text-stone-400">{communication.organisation.name}</p>
        </div>
      )}
    </div>
  );
}
