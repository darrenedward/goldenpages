'use client';

import React from 'react';
import { Package, Calendar, Users, BarChart3, ChevronRight } from 'lucide-react';
import type { Package as PackageType } from '@/types';
import StatusBadge from '@/components/shared/StatusBadge';

interface PackageCardProps {
    pkg: PackageType & { subPackageCount?: number; recipientCount?: number; progress?: number };
    onClick: (id: string) => void;
}

export default function PackageCard({ pkg, onClick }: PackageCardProps) {
    const progress = pkg.progress || 0;

    return (
        <button
            onClick={() => onClick(pkg.id)}
            className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6 text-left hover:shadow-lg hover:scale-[1.02] transition-all duration-200 group"
        >
            <div className="flex items-start justify-between mb-4">
                <div className="w-12 h-12 bg-gradient-to-br from-gold-400 to-gold-600 rounded-2xl flex items-center justify-center shadow-lg shadow-gold-500/20 group-hover:scale-110 transition-transform">
                    <Package className="w-6 h-6 text-white" />
                </div>
                <StatusBadge status={pkg.status} />
            </div>

            <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-2 line-clamp-1">
                {pkg.name}
            </h3>

            {pkg.description && (
                <p className="text-sm text-stone-500 dark:text-stone-400 mb-4 line-clamp-2">
                    {pkg.description}
                </p>
            )}

            {/* Progress Bar */}
            <div className="mb-4">
                <div className="flex items-center justify-between text-[10px] font-black uppercase text-stone-400 tracking-widest mb-1.5">
                    <span>Overall Progress</span>
                    <span className="text-gold-600">{Math.round(progress)}%</span>
                </div>
                <div className="h-1.5 bg-stone-100 dark:bg-white/5 rounded-full overflow-hidden">
                    <div
                        className="h-full bg-gradient-to-r from-gold-400 to-gold-600 rounded-full transition-all duration-500"
                        style={{ width: `${progress}%` }}
                    />
                </div>
            </div>

            <div className="grid grid-cols-2 gap-4 mb-4">
                <div className="flex items-center gap-2 text-[11px] text-stone-500">
                    <BarChart3 className="w-3.5 h-3.5 text-gold-600" />
                    <span>{pkg.subPackageCount || 0} Sub-packages</span>
                </div>
                <div className="flex items-center gap-2 text-[11px] text-stone-500">
                    <Users className="w-3.5 h-3.5 text-gold-600" />
                    <span>{pkg.recipientCount || 0} Recipients</span>
                </div>
            </div>

            <div className="flex items-center justify-between pt-4 border-t border-stone-100 dark:border-white/5">
                <div className="flex items-center gap-2 text-[11px] text-stone-400">
                    <Calendar className="w-3 h-3" />
                    <span>Created {new Date(pkg.createdAt).toLocaleDateString()}</span>
                </div>
                <ChevronRight className="w-4 h-4 text-stone-300 group-hover:text-gold-600 group-hover:translate-x-1 transition-all" />
            </div>
        </button>
    );
}
