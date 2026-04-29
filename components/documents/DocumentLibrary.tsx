'use client';

import React, { useState, useEffect } from 'react';
import { FileText, Search, Plus, Filter, LayoutGrid, List, File, Download, MoreVertical, Trash2 } from 'lucide-react';
import { supabase } from '@/services/supabaseClient';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import EmptyState from '@/components/shared/EmptyState';
import StatusBadge from '@/components/shared/StatusBadge';

export default function DocumentLibrary({ onChangeView }: { onChangeView: (view: string) => void }) {
    const [documents, setDocuments] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [searchQuery, setSearchQuery] = useState('');

    useEffect(() => {
        void fetchDocuments();
    }, []);

    const fetchDocuments = async () => {
        setLoading(true);
        try {
            const { data, error } = await supabase
                .from('documents')
                .select('*')
                .order('createdAt', { ascending: false });

            if (error) throw error;
            setDocuments(data || []);
        } catch (error) {
            console.error('Failed to fetch documents:', error);
        } finally {
            setLoading(false);
        }
    };

    const filtered = documents.filter(doc =>
        (doc.filename || doc.originalName).toLowerCase().includes(searchQuery.toLowerCase())
    );

    if (loading) return <LoadingSpinner message="Loading document library..." />;

    return (
        <div className="p-6 bg-stone-50 min-h-screen">
            {/* Header */}
            <div className="mb-6 flex items-center justify-between">
                <div>
                    <h1 className="font-serif text-3xl text-slate-800 mb-2">Document Library</h1>
                    <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24" />
                </div>
                <button
                    onClick={() => onChangeView('create-package')}
                    className="flex items-center gap-2 px-6 py-3 bg-gradient-to-r from-gold-500 to-gold-600 text-white rounded-2xl font-bold hover:scale-[1.02] transition-all"
                >
                    <Plus size={20} /> New Upload
                </button>
            </div>

            {/* Toolbar */}
            <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6 mb-8 flex flex-col md:flex-row gap-4">
                <div className="flex-1 relative">
                    <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                    <input
                        type="text"
                        placeholder="Search documents..."
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        className="w-full pl-12 pr-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 transition-all font-medium"
                    />
                </div>
                <div className="flex gap-2">
                    <button className="px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl text-stone-600 hover:text-gold-600 transition-colors">
                        <Filter size={18} />
                    </button>
                    <div className="flex bg-stone-100 dark:bg-stone-800 p-1 rounded-2xl border border-stone-200 dark:border-white/5">
                        <button className="p-2 bg-white dark:bg-slate-700 shadow-sm rounded-xl text-gold-600"><LayoutGrid size={18} /></button>
                        <button className="p-2 text-stone-400 hover:text-stone-600"><List size={18} /></button>
                    </div>
                </div>
            </div>

            {/* Document Grid */}
            {filtered.length === 0 ? (
                <EmptyState
                    title="Library empty"
                    description={searchQuery ? "No matches for your search" : "Your document library is currently empty. Documents uploaded to packages appear here."}
                />
            ) : (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    {filtered.map(doc => (
                        <div key={doc.id} className="bg-white dark:bg-slate-900 rounded-[2.5rem] border border-stone-200 dark:border-white/5 p-6 group hover:shadow-xl transition-all">
                            <div className="relative mb-4 aspect-[3/4] bg-stone-100 dark:bg-stone-800 rounded-3xl overflow-hidden flex items-center justify-center">
                                {doc.thumbnailUrl ? (
                                    <img src={doc.thumbnailUrl} alt={doc.originalName || doc.filename} className="w-full h-full object-cover" />
                                ) : (
                                    <FileText className="w-16 h-16 text-stone-300" />
                                )}
                                <div className="absolute inset-0 bg-slate-900/60 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-4">
                                    <button className="w-10 h-10 bg-white rounded-full flex items-center justify-center text-slate-900 hover:bg-gold-500 hover:text-white transition-colors">
                                        <Download size={20} />
                                    </button>
                                    <button className="w-10 h-10 bg-white rounded-full flex items-center justify-center text-slate-900 hover:bg-red-500 hover:text-white transition-colors">
                                        <Trash2 size={20} />
                                    </button>
                                </div>
                            </div>
                            <h3 className="font-bold text-slate-800 dark:text-white truncate mb-1">{doc.originalName || doc.filename}</h3>
                            <p className="text-[10px] font-black uppercase text-stone-400 tracking-widest mb-4">
                                {doc.sizeBytes ? `${(doc.sizeBytes / 1024 / 1024).toFixed(2)} MB` : 'Size Unknown'}
                            </p>
                            <div className="flex items-center justify-between">
                                <span className="text-[10px] font-medium text-stone-500">{new Date(doc.createdAt).toLocaleDateString()}</span>
                                <StatusBadge status={doc.status || 'ACTIVE'} size="sm" />
                            </div>
                        </div>
                    ))}
                </div>
            )}
        </div>
    );
}
