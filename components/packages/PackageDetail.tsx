'use client';

import React, { useState, useEffect } from 'react';
import {
    ArrowLeft,
    Package,
    BarChart3,
    Users,
    FileText,
    Calendar,
    Download,
    ExternalLink,
    ChevronRight,
    Clock,
    MoreVertical,
    CheckCircle2
} from 'lucide-react';
import { supabase } from '@/services/supabaseClient';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import StatusBadge from '@/components/shared/StatusBadge';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';

interface PackageDetailProps {
    pkgId: string;
    onBack: () => void;
    onChangeView: (view: string, id?: string) => void;
}

export default function PackageDetail({ pkgId, onBack, onChangeView }: PackageDetailProps) {
    const [pkg, setPkg] = useState<any>(null);
    const [subPackages, setSubPackages] = useState<any[]>([]);
    const [recipients, setRecipients] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        void fetchPackageData();
    }, [pkgId]);

    const fetchPackageData = async () => {
        setLoading(true);
        try {
            const { data: pkgData, error: pkgError } = await supabase
                .from('packages')
                .select('*')
                .eq('id', pkgId)
                .single();

            if (pkgError) throw pkgError;

            const { data: subData, error: subError } = await supabase
                .from('sub_packages')
                .select(`
          *,
          documents(*)
        `)
                .eq('package_id', pkgId)
                .order('order_index');

            if (subError) throw subError;

            const { data: recipientData, error: recError } = await supabase
                .from('package_recipients')
                .select(`
          *,
          department:departments(*),
          organisation:organisations(*)
        `)
                .eq('package_id', pkgId);

            if (recError) throw recError;

            setPkg(pkgData);
            setSubPackages(subData || []);
            setRecipients(recipientData || []);
        } catch (error) {
            console.error('Failed to fetch package details:', error);
        } finally {
            setLoading(false);
        }
    };

    if (loading) return <LoadingSpinner message="Loading package details..." />;
    if (!pkg) return (
        <div className="p-8 text-center text-red-500">Package not found. <button onClick={onBack} className="underline">Go back</button></div>
    );

    return (
        <div className="p-6 bg-stone-50 min-h-screen">
            <BreadcrumbNav
                items={[
                    { label: 'Packages', onClick: onBack },
                    { label: pkg.name },
                ]}
            />

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                {/* Left Column: Metadata & Contents */}
                <div className="lg:col-span-2 space-y-8">
                    {/* Main Info */}
                    <div className="bg-white dark:bg-slate-900 rounded-[2.5rem] p-10 border border-stone-200 dark:border-white/5 shadow-sm">
                        <div className="flex items-start justify-between mb-6">
                            <div className="flex items-center gap-4">
                                <div className="w-16 h-16 bg-gradient-to-br from-gold-400 to-gold-600 rounded-2xl flex items-center justify-center shadow-lg shadow-gold-500/20">
                                    <Package className="w-8 h-8 text-white" />
                                </div>
                                <div>
                                    <h1 className="font-serif text-3xl font-bold text-slate-800 dark:text-white mb-2">{pkg.name}</h1>
                                    <div className="flex items-center gap-4">
                                        <StatusBadge status={pkg.status} />
                                        <span className="text-xs text-stone-400 flex items-center gap-1.5 font-medium">
                                            <Calendar className="w-3.5 h-3.5" />
                                            Created {new Date(pkg.createdAt).toLocaleDateString()}
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <button className="p-2 hover:bg-stone-50 dark:hover:bg-white/5 rounded-xl border border-stone-100 dark:border-white/5 transition-colors">
                                <MoreVertical size={20} className="text-stone-400" />
                            </button>
                        </div>
                        {pkg.description && (
                            <p className="text-slate-600 dark:text-stone-400 leading-relaxed">{pkg.description}</p>
                        )}
                    </div>

                    {/* Sub-packages & Documents */}
                    <div className="space-y-4">
                        <h2 className="font-serif text-2xl font-bold text-slate-800 dark:text-white px-4">Package Contents</h2>
                        {subPackages.length === 0 ? (
                            <div className="p-10 text-center text-stone-400 italic bg-white dark:bg-slate-900 rounded-[2.5rem] border border-dashed border-stone-200 dark:border-white/5">
                                No sub-packages defined.
                            </div>
                        ) : (
                            <div className="space-y-4">
                                {subPackages.map((sp) => (
                                    <div
                                        key={sp.id}
                                        onClick={() => onChangeView('sub-package-detail', sp.id)}
                                        className="bg-white dark:bg-slate-900 rounded-[2rem] border border-stone-200 dark:border-white/5 p-6 shadow-sm overflow-hidden hover:border-gold-400 transition-all cursor-pointer group"
                                    >
                                        <div className="flex items-center justify-between mb-4">
                                            <div className="flex items-center gap-3">
                                                <div className="p-2 bg-gold-50 dark:bg-gold-900/20 text-gold-600 rounded-lg group-hover:bg-gold-500 group-hover:text-white transition-colors">
                                                    <BarChart3 size={18} />
                                                </div>
                                                <h3 className="font-bold text-slate-800 dark:text-white">{sp.name}</h3>
                                            </div>
                                            <ChevronRight size={18} className="text-stone-300 group-hover:text-gold-500 translate-x-1 group-hover:translate-x-2 transition-all" />
                                        </div>

                                        <div className="space-y-2">
                                            {sp.documents?.map((doc: any) => (
                                                <div key={doc.id} className="flex items-center justify-between p-4 bg-stone-50 dark:bg-white/5 rounded-2xl hover:bg-stone-100 dark:hover:bg-white/10 transition-colors group">
                                                    <div className="flex items-center gap-3">
                                                        <FileText className="w-5 h-5 text-gold-500" />
                                                        <div>
                                                            <p className="text-sm font-medium text-slate-800 dark:text-white">{doc.originalName || doc.filename}</p>
                                                            <p className="text-[10px] text-stone-400 uppercase tracking-wider">
                                                                {doc.mimeType?.split('/').pop()?.toUpperCase() || 'FILE'} • {(doc.sizeBytes / 1024).toFixed(0)} KB
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div className="flex gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
                                                        <button className="p-2 h-8 w-8 rounded-lg bg-white dark:bg-slate-800 text-stone-500 hover:text-gold-600 shadow-sm flex items-center justify-center">
                                                            <Download size={14} />
                                                        </button>
                                                        <button className="p-2 h-8 w-8 rounded-lg bg-white dark:bg-slate-800 text-stone-500 hover:text-gold-600 shadow-sm flex items-center justify-center">
                                                            <ExternalLink size={14} />
                                                        </button>
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>
                </div>

                {/* Right Column: Recipients & Activity */}
                <div className="space-y-8">
                    {/* Recipient Status */}
                    <div className="bg-white dark:bg-slate-900 rounded-[2.5rem] p-8 border border-stone-200 dark:border-white/5 shadow-sm">
                        <div className="flex items-center justify-between mb-6">
                            <h2 className="font-serif text-xl font-bold text-slate-800 dark:text-white">Distribution</h2>
                            <Users size={20} className="text-gold-600" />
                        </div>

                        <div className="space-y-4">
                            {recipients.length === 0 ? (
                                <p className="text-sm text-stone-400 italic text-center py-4">No recipients selected.</p>
                            ) : (
                                recipients.map((rec) => (
                                    <div key={rec.id} className="flex flex-col gap-1 p-4 bg-stone-50 dark:bg-white/5 rounded-2xl">
                                        <div className="flex items-center justify-between">
                                            <p className="text-sm font-bold text-slate-800 dark:text-white truncate max-w-[150px]">
                                                {rec.department?.name || 'Unknown Dept'}
                                            </p>
                                            <StatusBadge status={rec.status} size="sm" />
                                        </div>
                                        <p className="text-[10px] text-stone-500 truncate">
                                            {rec.organisation?.name || 'Organization'}
                                        </p>
                                        {rec.sentAt && (
                                            <div className="flex items-center gap-1.5 mt-2 text-[10px] text-stone-400">
                                                <Clock size={10} />
                                                <span>Sent {new Date(rec.sentAt).toLocaleTimeString()}</span>
                                            </div>
                                        )}
                                    </div>
                                ))
                            )}
                        </div>

                        <button
                            onClick={() => onChangeView('outreach')}
                            className="w-full mt-6 py-3 border-2 border-dashed border-stone-200 dark:border-white/10 rounded-2xl text-stone-400 text-sm font-bold hover:border-gold-300 hover:text-gold-600 transition-all"
                        >
                            Manage Recipients
                        </button>
                    </div>

                    {/* Quick Stats */}
                    <div className="bg-gradient-to-br from-slate-800 to-slate-900 rounded-[2.5rem] p-8 text-white shadow-xl shadow-slate-900/20">
                        <h3 className="text-[10px] font-black uppercase tracking-widest text-gold-400/60 mb-6">Execution Status</h3>
                        <div className="space-y-6">
                            <div>
                                <div className="flex justify-between text-xs mb-2">
                                    <span className="text-slate-400 uppercase font-black tracking-widest">Acknowledgment</span>
                                    <span className="text-gold-400 font-bold">12%</span>
                                </div>
                                <div className="h-1.5 bg-slate-700 rounded-full overflow-hidden">
                                    <div className="h-full bg-gold-500 rounded-full w-[12%]" />
                                </div>
                            </div>
                            <div className="flex items-center gap-4 py-4 px-5 bg-white/5 rounded-2xl border border-white/5">
                                <CheckCircle2 size={24} className="text-emerald-400" />
                                <div>
                                    <p className="text-[10px] font-black uppercase tracking-widest text-slate-500">System Integrity</p>
                                    <p className="text-xs font-bold">Package Verified</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
