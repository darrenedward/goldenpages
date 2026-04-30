'use client';

import React, { useRef } from 'react';
import { Upload, X, Eye, EyeOff } from 'lucide-react';
import type { WizardState } from './CreateCommunicationWizard';

interface WizardStepDocumentsProps {
  state: WizardState;
  updateState: (updates: Partial<WizardState>) => void;
}

export default function WizardStepDocuments({ state, updateState }: WizardStepDocumentsProps) {
  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const selectedFiles = e.target.files;
    if (!selectedFiles) return;

    const newFiles = Array.from(selectedFiles).map(file => ({
      file,
      isPublic: true,
    }));
    updateState({ files: [...state.files, ...newFiles] });
    if (fileInputRef.current) fileInputRef.current.value = '';
  };

  const removeFile = (index: number) => {
    updateState({ files: state.files.filter((_, i) => i !== index) });
  };

  const toggleFileVisibility = (index: number) => {
    updateState({
      files: state.files.map((f, i) =>
        i === index ? { ...f, isPublic: !f.isPublic } : f
      ),
    });
  };

  const formatSize = (bytes: number) => {
    if (bytes < 1024) return `${bytes} B`;
    if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`;
    return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
  };

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
      <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-2">
        Attach Documents
      </h2>
      <p className="text-sm text-stone-500 dark:text-stone-400 mb-4">
        Upload scanned copies of what you are sending. These become the initial shared documents for all recipients.
        You can add recipient-specific documents (replies, follow-ups) later from the communication detail view.
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
        <p className="text-sm text-stone-400 dark:text-stone-500">
          Click to upload documents (PDF, DOC, DOCX, PNG, JPG)
        </p>
      </button>

      {state.files.length > 0 && (
        <div className="mt-4 space-y-2">
          {state.files.map((f, index) => (
            <div
              key={f.file.name + index}
              className="flex items-center gap-3 bg-stone-50 dark:bg-stone-800 rounded-xl p-3"
            >
              <span className="flex-1 text-sm text-slate-700 dark:text-stone-300 truncate">
                {f.file.name}
              </span>
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
                className="p-1 text-stone-400 hover:text-red-500 transition-colors"
              >
                <X className="w-4 h-4" />
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
