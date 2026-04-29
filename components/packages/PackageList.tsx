'use client';

import React, { useState, useEffect } from 'react';
import { Search, Plus, Filter, LayoutGrid, List } from 'lucide-react';
import { supabase } from '@/services/supabaseClient';
import type { Package } from '@/types';
import PackageCard from './PackageCard';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import EmptyState from '@/components/shared/EmptyState';

interface PackageListProps {
    onSelectPkg: (id: string) => void;
    onChangeView: (view: string) => void;
}

export default function PackageList({ onSelectPkg, onChangeView }: PackageListProps) {
    const [packages, setPackages] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const [searchQuery, setSearchQuery] = useState('');
    const [statusFilter, setStatusFilter] = useState('all');

    useEffect(() => {
        void fetchPackages();
    }, []);

    const fetchPackages = async () => {
        setLoading(true);
        setError(null);
        try {
            // In a real app, we'd use a dedicated service with proper count joins
            const { data, error } = await supabase
                .from('packages')
                .select(`
          *,
          subPackages:sub_packages(count),
          recipients:package_recipients(count)
        `)
                .order('created_at', { ascending: false });

            if (error) throw error;

            // Mocking progress for demonstration since DB logic for progress calculation is complex
            const enriched = (data || []).map(pkg => ({
                ...pkg,
                subPackageCount: pkg.subPackages?.[0]?.count || 0,
                recipientCount: pkg.recipients?.[0]?.count || 0,
                progress: pkg.status === 'COMPLETED' ? 100 : pkg.status === 'SENT' ? 60 : pkg.status === 'DRAFT' ? 10 : 30
            }));

            setPackages(enriched);
        } catch (err) {
            setError(err instanceof Error ? err.message : 'Failed to fetch packages');
        } finally {
            setLoading(false);
        }
    };

    const filtered = packages.filter(pkg => {
        const matchesSearch = pkg.name.toLowerCase().includes(searchQuery.toLowerCase());
        const matchesStatus = statusFilter === 'all' || pkg.status === statusFilter;
        return matchesSearch && matchesStatus;
    });

    if (loading) return <LoadingSpinner message="Loading packages..." />;

    return (
        <div className="p-6 bg-stone-50 min-h-screen">
            {/* Header */}
            <div className="mb-6 flex items-center justify-between">
                <div>
                    <h1 className="font-serif text-3xl text-slate-800 mb-2">Package Management</h1>
                    <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24" />
                </div>
                <button
                    onClick={() => onChangeView('create-package')}
                    className="flex items-center gap-2 px-6 py-3 bg-gradient-to-r from-gold-500 to-gold-600 text-white rounded-2xl font-bold shadow-lg shadow-gold-500/20 hover:scale-[1.02] active:scale-[0.98] transition-all"
                >
                    <Plus className="w-5 h-5" />
                    Create New Package
                </button>
            </div>

            {/* Filters Area */}
            <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6 mb-8 flex flex-col md:flex-row gap-4 items-center">
                <div className="flex-1 relative w-full">
                    <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                    <input
                        type="text"
                        placeholder="Search packages by name..."
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        className="w-full pl-12 pr-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 transition-all font-medium"
                    />
                </div>

                <div className="flex gap-4 w-full md:w-auto">
                    <select
                        value={statusFilter}
                        onChange={(e) => setStatusFilter(e.target.value)}
                        className="px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 font-medium min-w-[160px]"
                    >
                        <option value="all">All Statuses</option>
                        <option value="DRAFT">Draft</option>
                        <option value="SENT">Sent</option>
                        <option value="COMPLETED">Completed</option>
                        <option value="CLOSED">Closed</option>
                    </select>

                    <div className="flex bg-stone-100 dark:bg-stone-800 p-1 rounded-2xl border border-stone-200 dark:border-white/5">
                        <button className="p-2 bg-white dark:bg-slate-700 shadow-sm rounded-xl text-gold-600"><LayoutGrid size={18} /></button>
                        <button className="p-2 text-stone-400 hover:text-stone-600"><List size={18} /></button>
                    </div>
                </div>
            </div>

            {/* Grid */}
            {filtered.length === 0 ? (
                <EmptyState
                    title="No packages found"
                    description={searchQuery || statusFilter !== 'all' ? "Try adjusting your filters" : "You haven't created any document packages yet."}
                    action={searchQuery || statusFilter !== 'all' ? { label: "Clear Filters", onClick: () => { setSearchQuery(''); setStatusFilter('all'); } } : undefined}
                />
            ) : (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                    {filtered.map((pkg) => (
                        <PackageCard
                            key={pkg.id}
                            pkg={pkg}
                            onClick={onSelectPkg}
                        />
                    ))}
                </div>
            )}
        </div>
    );
}
