'use client';

import React, { useState, useCallback } from 'react';
import { Upload, X, FileText, CheckCircle2, AlertCircle, Loader2 } from 'lucide-react';
import { supabase } from '@/services/supabaseClient';

interface DocumentUploaderProps {
    onUploadComplete: (doc: any) => void;
    subPackageId?: string;
    packageId?: string;
}

export default function DocumentUploader({ onUploadComplete, subPackageId, packageId }: DocumentUploaderProps) {
    const [isUploading, setIsUploading] = useState(false);
    const [progress, setProgress] = useState(0);
    const [error, setError] = useState<string | null>(null);

    const handleUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (!file) return;

        // Basic validation
        if (file.size > 50 * 1024 * 1024) { // 50MB limit
            setError('File size exceeds 50MB limit');
            return;
        }

        setIsUploading(true);
        setProgress(0);
        setError(null);

        try {
            // 1. Upload to Supabase Storage
            const fileExt = file.name.split('.').pop();
            const fileName = `${crypto.randomUUID()}.${fileExt}`;
            const filePath = `documents/${fileName}`;

            const { data: uploadData, error: uploadError } = await supabase.storage
                .from('documents')
                .upload(filePath, file);

            if (uploadError) throw uploadError;

            // 2. Create database record
            const { data: docData, error: docError } = await supabase
                .from('documents')
                .insert({
                    filename: fileName,
                    originalName: file.name,
                    storagePath: filePath,
                    sizeBytes: file.size,
                    mimeType: file.type,
                    subPackageId: subPackageId,
                    packageId: packageId,
                    status: 'ACTIVE'
                })
                .select()
                .single();

            if (docError) throw docError;

            onUploadComplete(docData);
        } catch (err) {
            setError(err instanceof Error ? err.message : 'Upload failed');
        } finally {
            setIsUploading(false);
        }
    };

    return (
        <div className="w-full">
            <div className={`
        relative border-2 border-dashed rounded-[2rem] p-8 transition-all
        ${isUploading ? 'bg-stone-50 border-gold-300' : 'bg-white dark:bg-slate-900 border-stone-200 dark:border-white/10 hover:border-gold-400'}
      `}>
                <input
                    type="file"
                    onChange={handleUpload}
                    disabled={isUploading}
                    className="absolute inset-0 w-full h-full opacity-0 cursor-pointer disabled:cursor-not-allowed"
                    accept=".pdf,.doc,.docx,.xls,.xlsx"
                />

                <div className="flex flex-col items-center justify-center text-center">
                    {isUploading ? (
                        <div className="space-y-4 w-full max-w-xs">
                            <Loader2 className="w-10 h-10 text-gold-500 animate-spin mx-auto" />
                            <p className="font-serif font-bold text-slate-800 dark:text-white">Uploading {progress}%</p>
                            <div className="h-1.5 bg-stone-100 dark:bg-white/5 rounded-full overflow-hidden">
                                <div className="h-full bg-gold-500 transition-all duration-300" style={{ width: `${progress}%` }} />
                            </div>
                        </div>
                    ) : (
                        <>
                            <div className="w-16 h-16 bg-gold-50 dark:bg-gold-900/20 text-gold-600 rounded-2xl flex items-center justify-center mb-4">
                                <Upload size={32} />
                            </div>
                            <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-1">Upload Documents</h3>
                            <p className="text-sm text-stone-500 mb-6">Drag and drop or click to browse</p>
                            <div className="flex flex-wrap justify-center gap-3">
                                <span className="px-2 py-1 bg-stone-100 dark:bg-stone-800 rounded-lg text-[10px] font-bold text-stone-500 uppercase tracking-wider">PDF</span>
                                <span className="px-2 py-1 bg-stone-100 dark:bg-stone-800 rounded-lg text-[10px] font-bold text-stone-500 uppercase tracking-wider">Word</span>
                                <span className="px-2 py-1 bg-stone-100 dark:bg-stone-800 rounded-lg text-[10px] font-bold text-stone-500 uppercase tracking-wider">Excel</span>
                            </div>
                        </>
                    )}
                </div>
            </div>

            {error && (
                <div className="mt-4 p-4 bg-red-50 border border-red-100 rounded-2xl flex items-center gap-3 text-red-600 text-sm">
                    <AlertCircle className="w-5 h-5" />
                    <p>{error}</p>
                </div>
            )}
        </div>
    );
}
