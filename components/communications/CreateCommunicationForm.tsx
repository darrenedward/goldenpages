'use client';

import React, { useState, useRef } from 'react';
import { ArrowLeft, Upload, X, Eye, EyeOff, AlertTriangle } from 'lucide-react';
import { communicationService } from '@/services/communicationService';
import type { CommunicationType, Contact, Department, Organization } from '@/types';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';
import { CategoryAutocomplete } from '@/components/shared/CategoryAutocomplete';
import { toast } from 'react-hot-toast';

interface CreateCommunicationFormProps {
  contact: Contact & { department?: Department; organisation?: Organization };
  departmentId?: string;
  organisationId?: string;
  onSubmit: (communicationId: string) => void;
  onCancel: () => void;
}

const communicationTypes: { value: CommunicationType; label: string }[] = [
  { value: 'letter', label: 'Letter' },
  { value: 'email', label: 'Email' },
  { value: 'physical_mail', label: 'Physical Mail' },
  { value: 'meeting', label: 'Meeting' },
];

export default function CreateCommunicationForm({
  contact,
  departmentId,
  organisationId,
  onSubmit,
  onCancel,
}: CreateCommunicationFormProps) {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [communicationType, setCommunicationType] = useState<CommunicationType>('letter');
  const [category, setCategory] = useState('');
  const [categoryId, setCategoryId] = useState<string | undefined>(undefined);
  const [tagsInput, setTagsInput] = useState('');
  const [expectedResponseDate, setExpectedResponseDate] = useState('');
  const [senderOrganisation, setSenderOrganisation] = useState('');
  const [isPublic, setIsPublic] = useState(true);
  const [isApproved, setIsApproved] = useState(false);
  const [files, setFiles] = useState<{ file: File; isPublic: boolean }[]>([]);
  const [submitting, setSubmitting] = useState(false);

  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const selectedFiles = e.target.files;
    if (!selectedFiles) return;

    const newFiles = Array.from(selectedFiles).map(file => ({
      file,
      isPublic: true,
    }));
    setFiles(prev => [...prev, ...newFiles]);
    if (fileInputRef.current) fileInputRef.current.value = '';
  };

  const removeFile = (index: number) => {
    setFiles(prev => prev.filter((_, i) => i !== index));
  };

  const toggleFileVisibility = (index: number) => {
    setFiles(prev => prev.map((f, i) => i === index ? { ...f, isPublic: !f.isPublic } : f));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!title.trim()) {
      toast.error('Title is required');
      return;
    }
    if (!isApproved) {
      toast.error('Please confirm the communication has been approved');
      return;
    }

    setSubmitting(true);
    try {
      // Create communication
      const communication = await communicationService.createCommunication(
        {
          title: title.trim(),
          description: description.trim() || undefined,
          communicationType,
          contactId: contact.id,
          departmentId,
          organisationId,
          category: category.trim() || undefined,
          categoryId: categoryId || undefined,
          tags: tagsInput.trim() ? tagsInput.split(',').map(t => t.trim()).filter(Boolean) : [],
          expectedResponseDate: expectedResponseDate || undefined,
          isPublic,
          isApproved,
          senderOrganisation: senderOrganisation.trim() || undefined,
        },
        contact.id // TODO: use actual userId from auth context
      );

      // Upload files
      for (const { file, isPublic: filePublic } of files) {
        await communicationService.uploadDocument(
          communication.id,
          file,
          'sent',
          filePublic,
          contact.id // TODO: use actual userId
        );
      }

      toast.success('Communication created successfully');
      onSubmit(communication.id);
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to create communication');
    } finally {
      setSubmitting(false);
    }
  };

  const formatSize = (bytes: number) => {
    if (bytes < 1024) return `${bytes} B`;
    if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`;
    return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
  };

  return (
    <div className="p-6 bg-stone-50 min-h-screen">
      <BreadcrumbNav
        items={[
          { label: 'Contacts', onClick: onCancel },
          { label: contact.fullName },
          { label: 'New Communication' },
        ]}
      />

      <h1 className="font-serif text-3xl text-slate-800 mb-2">New Communication</h1>
      <p className="text-stone-500 mb-6">
        Sending to <span className="font-bold text-slate-700">{contact.fullName}</span>
        {contact.roleTitle && <span className="text-stone-400"> ({contact.roleTitle})</span>}
        {contact.department && <span className="text-stone-400"> — {contact.department.name}</span>}
      </p>

      <form onSubmit={handleSubmit} className="space-y-6">
        {/* Basic info */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">Communication Details</h2>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {/* Title */}
            <div className="md:col-span-2">
              <label className="block text-sm font-bold text-stone-600 mb-1">Title *</label>
              <input
                type="text"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="e.g., Covid Vaccine Investigation — Data Request"
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500"
                required
              />
            </div>

            {/* Type */}
            <div>
              <label className="block text-sm font-bold text-stone-600 mb-1">Communication Type</label>
              <select
                value={communicationType}
                onChange={(e) => setCommunicationType(e.target.value as CommunicationType)}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500"
              >
                {communicationTypes.map(t => (
                  <option key={t.value} value={t.value}>{t.label}</option>
                ))}
              </select>
            </div>

            {/* Expected response */}
            <div>
              <label className="block text-sm font-bold text-stone-600 mb-1">Expected Response By</label>
              <input
                type="date"
                value={expectedResponseDate}
                onChange={(e) => setExpectedResponseDate(e.target.value)}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500"
              />
            </div>

            {/* Description */}
            <div className="md:col-span-2">
              <label className="block text-sm font-bold text-stone-600 mb-1">Description</label>
              <textarea
                value={description}
                onChange={(e) => setDescription(e.target.value)}
                placeholder="Brief description of what this communication is about..."
                rows={3}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 resize-none"
              />
            </div>

            {/* Category */}
            <div>
              <label className="block text-sm font-bold text-stone-600 mb-1">Category</label>
              <CategoryAutocomplete
                value={categoryId || ''}
                onChange={(id, name) => {
                  setCategoryId(id);
                  setCategory(name);
                }}
                placeholder="e.g., Health, Finance, FOIA"
              />
            </div>

            {/* Tags */}
            <div>
              <label className="block text-sm font-bold text-stone-600 mb-1">Tags (comma separated)</label>
              <input
                type="text"
                value={tagsInput}
                onChange={(e) => setTagsInput(e.target.value)}
                placeholder="e.g., covid, vaccine, data-request"
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500"
              />
            </div>

            {/* Sender org */}
            <div className="md:col-span-2">
              <label className="block text-sm font-bold text-stone-600 mb-1">Your Organisation</label>
              <input
                type="text"
                value={senderOrganisation}
                onChange={(e) => setSenderOrganisation(e.target.value)}
                placeholder="Name of the organisation you're sending on behalf of"
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500"
              />
            </div>
          </div>
        </div>

        {/* Document upload */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">Attach Documents</h2>
          <p className="text-sm text-stone-500 mb-4">
            Upload scanned copies of what you are sending (PDF recommended for clarity).
          </p>

          <input
            ref={fileInputRef}
            type="file"
            accept=".pdf,.doc,.docx,.png,.jpg,.jpeg"
            multiple
            onChange={handleFileSelect}
            className="hidden"
          />
          <button
            type="button"
            onClick={() => fileInputRef.current?.click()}
            className="w-full border-2 border-dashed border-stone-200 dark:border-white/10 rounded-2xl p-8 text-center hover:border-gold-400 transition-colors"
          >
            <Upload className="w-8 h-8 text-stone-300 mx-auto mb-2" />
            <p className="text-sm text-stone-400">Click to upload documents (PDF, DOC, DOCX, PNG, JPG)</p>
          </button>

          {files.length > 0 && (
            <div className="mt-4 space-y-2">
              {files.map((f, index) => (
                <div key={index} className="flex items-center gap-3 bg-stone-50 dark:bg-stone-800 rounded-xl p-3">
                  <span className="flex-1 text-sm text-slate-700 truncate">{f.file.name}</span>
                  <span className="text-xs text-stone-400">{formatSize(f.file.size)}</span>
                  <button
                    type="button"
                    onClick={() => toggleFileVisibility(index)}
                    className={`p-1 rounded ${f.isPublic ? 'text-emerald-500' : 'text-stone-400'}`}
                    title={f.isPublic ? 'Public' : 'Private'}
                  >
                    {f.isPublic ? <Eye className="w-4 h-4" /> : <EyeOff className="w-4 h-4" />}
                  </button>
                  <button
                    type="button"
                    onClick={() => removeFile(index)}
                    className="p-1 text-stone-400 hover:text-red-500"
                  >
                    <X className="w-4 h-4" />
                  </button>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Approval & visibility */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">Approval & Visibility</h2>

          {/* Approved checkbox */}
          <div className="flex items-start gap-3 mb-4 p-4 bg-amber-50 dark:bg-amber-900/20 rounded-xl border border-amber-200 dark:border-amber-800">
            <input
              type="checkbox"
              id="isApproved"
              checked={isApproved}
              onChange={(e) => setIsApproved(e.target.checked)}
              className="mt-1 w-4 h-4 rounded border-stone-300 text-gold-600 focus:ring-gold-500"
            />
            <label htmlFor="isApproved" className="text-sm text-amber-800 dark:text-amber-200">
              <span className="font-bold flex items-center gap-1 mb-1">
                <AlertTriangle className="w-4 h-4" />
                Approved Communication
              </span>
              I confirm this communication has been reviewed and approved by an authorized representative of my organisation. I am authorized to send this correspondence on behalf of the organisation named above.
            </label>
          </div>

          {/* Public toggle */}
          <div className="flex items-center gap-3">
            <button
              type="button"
              onClick={() => setIsPublic(!isPublic)}
              className={`flex items-center gap-2 px-3 py-2 rounded-xl text-sm font-bold transition-all ${
                isPublic
                  ? 'bg-emerald-50 text-emerald-700 border border-emerald-200'
                  : 'bg-stone-100 text-stone-500 border border-stone-200'
              }`}
            >
              {isPublic ? <Eye className="w-4 h-4" /> : <EyeOff className="w-4 h-4" />}
              {isPublic ? 'Public — visible in the transparency register' : 'Private — only visible to authenticated users'}
            </button>
          </div>
        </div>

        {/* Actions */}
        <div className="flex items-center gap-3">
          <button
            type="button"
            onClick={onCancel}
            className="px-6 py-3 bg-stone-100 dark:bg-stone-800 text-stone-600 rounded-2xl font-bold hover:bg-stone-200 transition-all"
          >
            Cancel
          </button>
          <button
            type="submit"
            disabled={submitting || !isApproved}
            className="px-6 py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {submitting ? 'Creating...' : 'Create Communication'}
          </button>
        </div>
      </form>
    </div>
  );
}
