'use client';

import React, { useState, useEffect } from 'react';
import { supabase } from '@/services/supabaseClient';
import {
    BarChart3,
    FileText,
    ChevronRight,
    Download,
    Trash2,
    Plus,
    ArrowLeft
} from 'lucide-react';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';
import DocumentUploader from '@/components/documents/DocumentUploader';

interface SubPackageDetailProps {
    subPkgId: string;
    onBack: () => void;
}

export default function SubPackageDetail({ subPkgId, onBack }: SubPackageDetailProps) {
    const [subPkg, setSubPkg] = useState<any>(null);
    const [loading, setLoading] = useState(true);
    const [showUploader, setShowUploader] = useState(false);

    useEffect(() => {
        void fetchSubPackage();
    }, [subPkgId]);

    const fetchSubPackage = async () => {
        setLoading(true);
        try {
            const { data, error } = await supabase
                .from('sub_packages')
                .select(`
          *,
          package:packages(*),
          documents(*)
        `)
                .eq('id', subPkgId)
                .single();

            if (error) throw error;
            setSubPkg(data);
        } catch (error) {
            console.error('Failed to fetch sub-package:', error);
        } finally {
            setLoading(false);
        }
    };

    if (loading) return <LoadingSpinner message="Loading sub-package..." />;
    if (!subPkg) return <div className="p-8 text-center text-red-500">Sub-package not found.</div>;

    return (
        <div className="p-6 bg-stone-50 min-h-screen">
            <BreadcrumbNav
                items={[
                    { label: 'Packages', onClick: onBack },
                    { label: subPkg.package?.name || 'Package', onClick: onBack },
                    { label: subPkg.name }
                ]}
            />

            <div className="max-w-4xl mx-auto space-y-8">
                <div className="bg-white dark:bg-slate-900 rounded-[2.5rem] p-10 border border-stone-200 dark:border-white/5 shadow-sm">
                    <div className="flex items-center gap-4 mb-6">
                        <div className="w-14 h-14 bg-gold-50 dark:bg-gold-900/20 text-gold-600 rounded-2xl flex items-center justify-center">
                            <BarChart3 size={28} />
                        </div>
                        <div>
                            <h1 className="font-serif text-3xl font-bold text-slate-800 dark:text-white">{subPkg.name}</h1>
                            <p className="text-sm text-stone-500">Part of {subPkg.package?.name}</p>
                        </div>
                    </div>
                    {subPkg.description && (
                        <p className="text-slate-600 dark:text-stone-400">{subPkg.description}</p>
                    )}
                </div>

                <div className="space-y-4">
                    <div className="flex items-center justify-between px-4">
                        <h2 className="font-serif text-2xl font-bold text-slate-800 dark:text-white">Documents</h2>
                        <button
                            onClick={() => setShowUploader(!showUploader)}
                            className="flex items-center gap-2 px-4 py-2 bg-gold-600 text-white rounded-xl font-bold hover:bg-gold-700 transition-all text-sm"
                        >
                            {showUploader ? 'Cancel' : 'Upload Document'}
                        </button>
                    </div>

                    {showUploader && (
                        <div className="animate-in fade-in slide-in-from-top-4 duration-300">
                            <DocumentUploader
                                subPackageId={subPkgId}
                                packageId={subPkg.package_id}
                                onUploadComplete={() => {
                                    setShowUploader(false);
                                    void fetchSubPackage();
                                }}
                            />
                        </div>
                    )}

                    <div className="space-y-3">
                        {subPkg.documents?.length === 0 ? (
                            <div className="py-20 border-2 border-dashed border-stone-100 dark:border-white/5 rounded-3xl flex flex-col items-center justify-center text-stone-400">
                                <FileText className="w-12 h-12 mb-4 opacity-20" />
                                <p className="text-sm">No documents uploaded yet</p>
                            </div>
                        ) : (
                            subPkg.documents.map((doc: any) => (
                                <div key={doc.id} className="bg-white dark:bg-slate-900 rounded-2xl p-5 border border-stone-200 dark:border-white/5 flex items-center justify-between group hover:shadow-md transition-all">
                                    <div className="flex items-center gap-4">
                                        <div className="p-2 bg-stone-50 dark:bg-white/5 text-gold-500 rounded-lg group-hover:bg-gold-50 transition-colors">
                                            <FileText size={20} />
                                        </div>
                                        <div>
                                            <p className="font-bold text-slate-800 dark:text-white">{doc.originalName || doc.filename}</p>
                                            <p className="text-[10px] text-stone-400 uppercase tracking-widest">
                                                {doc.mimeType?.split('/').pop()?.toUpperCase() || 'FILE'} • {(doc.sizeBytes / 1024).toFixed(0)} KB
                                            </p>
                                        </div>
                                    </div>
                                    <div className="flex gap-2">
                                        <button className="p-2 h-9 w-9 bg-stone-100 dark:bg-slate-800 text-stone-500 hover:text-gold-600 rounded-lg flex items-center justify-center transition-all">
                                            <Download size={16} />
                                        </button>
                                        <button className="p-2 h-9 w-9 bg-stone-100 dark:bg-slate-800 text-stone-500 hover:text-red-500 rounded-lg flex items-center justify-center transition-all">
                                            <Trash2 size={16} />
                                        </button>
                                    </div>
                                </div>
                            ))
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
}
