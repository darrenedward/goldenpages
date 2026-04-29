'use client';

import React, { useState, useEffect } from 'react';
import { Search, Check, Building2, FolderOpen, Users, X } from 'lucide-react';
import { hierarchyService } from '@/services/hierarchyService';
import type { Organization, DepartmentWithContacts } from '@/types';
import LoadingSpinner from '@/components/shared/LoadingSpinner';

interface DepartmentSelectorProps {
    selectedIds: Set<string>;
    onToggle: (deptId: string) => void;
    onSelectAll?: (deptIds: string[]) => void;
    onClearAll?: () => void;
}

export default function DepartmentSelector({ selectedIds, onToggle, onSelectAll, onClearAll }: DepartmentSelectorProps) {
    const [loading, setLoading] = useState(true);
    const [organizations, setOrganizations] = useState<Organization[]>([]);
    const [selectedOrgId, setSelectedOrgId] = useState<string>('all');
    const [departments, setDepartments] = useState<DepartmentWithContacts[]>([]);
    const [searchQuery, setSearchQuery] = useState('');

    useEffect(() => {
        void fetchInitialData();
    }, []);

    useEffect(() => {
        void fetchDepartments();
    }, [selectedOrgId]);

    const fetchInitialData = async () => {
        try {
            const orgs = await hierarchyService.getOrganizations();
            setOrganizations(orgs);
        } catch (error) {
            console.error('Failed to fetch organizations:', error);
        }
    };

    const fetchDepartments = async () => {
        setLoading(true);
        try {
            if (selectedOrgId === 'all') {
                // Fetch all departments for all orgs might be heavy,
                // but for selecting recipients we usually want to search.
                // For now, let's just fetch if an org is selected or shown as empty
                setDepartments([]);
            } else {
                const depts = await hierarchyService.getDepartments(selectedOrgId);
                setDepartments(depts);
            }
        } catch (error) {
            console.error('Failed to fetch departments:', error);
        } finally {
            setLoading(false);
        }
    };

    const filteredDepts = departments.filter(dept =>
        dept.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        (dept.code && dept.code.toLowerCase().includes(searchQuery.toLowerCase()))
    );

    return (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden flex flex-col h-[500px]">
            {/* Header / Filter */}
            <div className="p-6 border-b border-stone-100 dark:border-white/5 space-y-4">
                <div className="flex items-center justify-between">
                    <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white">Select Recipients</h3>
                    <div className="flex items-center gap-2">
                        <span className="text-xs font-bold px-2 py-1 bg-gold-100 text-gold-700 rounded-full">
                            {selectedIds.size} selected
                        </span>
                        {selectedIds.size > 0 && (
                            <button
                                onClick={onClearAll}
                                className="text-xs text-stone-500 hover:text-red-500 transition-colors"
                            >
                                Clear all
                            </button>
                        )}
                    </div>
                </div>

                <div className="flex gap-3">
                    <div className="flex-1 relative">
                        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                        <input
                            type="text"
                            placeholder="Search departments..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="w-full pl-10 pr-4 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
                        />
                    </div>
                    <select
                        value={selectedOrgId}
                        onChange={(e) => setSelectedOrgId(e.target.value)}
                        className="px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm w-48"
                    >
                        <option value="all">Select Organization...</option>
                        {organizations.map(org => (
                            <option key={org.id} value={org.id}>{org.name}</option>
                        ))}
                    </select>
                </div>
            </div>

            {/* List */}
            <div className="flex-1 overflow-y-auto p-4 custom-scrollbar">
                {loading ? (
                    <div className="h-full flex items-center justify-center">
                        <LoadingSpinner size="sm" />
                    </div>
                ) : selectedOrgId === 'all' ? (
                    <div className="h-full flex flex-col items-center justify-center text-stone-400 text-center p-8">
                        <Building2 className="w-12 h-12 mb-4 opacity-20" />
                        <p className="text-sm">Select an organization above to browse departments</p>
                    </div>
                ) : filteredDepts.length === 0 ? (
                    <div className="h-full flex flex-col items-center justify-center text-stone-400 text-center p-8">
                        <FolderOpen className="w-12 h-12 mb-4 opacity-20" />
                        <p className="text-sm">No departments found in this organization</p>
                    </div>
                ) : (
                    <div className="space-y-2">
                        <div className="flex items-center justify-between mb-2">
                            <button
                                onClick={() => onSelectAll?.(filteredDepts.map(d => d.id))}
                                className="text-[11px] font-bold text-gold-600 hover:text-gold-700 uppercase tracking-wider"
                            >
                                Select All Visible
                            </button>
                        </div>
                        {filteredDepts.map((dept) => {
                            const isSelected = selectedIds.has(dept.id);
                            return (
                                <div
                                    key={dept.id}
                                    onClick={() => onToggle(dept.id)}
                                    className={`
                    flex items-center gap-3 p-3 rounded-2xl cursor-pointer transition-all border
                    ${isSelected
                                            ? 'bg-gold-50 border-gold-200 dark:bg-gold-900/20 dark:border-gold-500/30'
                                            : 'bg-white dark:bg-stone-900 border-stone-100 dark:border-white/5 hover:border-gold-200 dark:hover:border-gold-500/20'}
                  `}
                                >
                                    <div className={`
                    w-5 h-5 rounded-md flex items-center justify-center border transition-all
                    ${isSelected ? 'bg-gold-600 border-gold-600' : 'bg-white dark:bg-stone-800 border-stone-300 dark:border-stone-600'}
                  `}>
                                        {isSelected && <Check className="w-3.5 h-3.5 text-white" />}
                                    </div>

                                    <div className="flex-1 min-w-0">
                                        <div className="flex items-center gap-2">
                                            <span className="font-medium text-slate-800 dark:text-white truncate text-sm">{dept.name}</span>
                                            {dept.code && (
                                                <span className="text-[10px] font-bold bg-stone-100 dark:bg-stone-800 text-stone-500 px-1.5 py-0.5 rounded uppercase">
                                                    {dept.code}
                                                </span>
                                            )}
                                        </div>
                                        <div className="flex items-center gap-2 text-[11px] text-stone-500">
                                            <Users className="w-3 h-3" />
                                            <span>{dept.contactCount || 0} contacts</span>
                                        </div>
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                )}
            </div>

            {/* Selected Tags */}
            {selectedIds.size > 0 && (
                <div className="p-4 bg-stone-50 dark:bg-black/20 border-t border-stone-100 dark:border-white/5">
                    <p className="text-[10px] font-black uppercase text-stone-400 mb-3 tracking-widest">Selected Recipients</p>
                    <div className="flex flex-wrap gap-2 max-h-24 overflow-y-auto custom-scrollbar">
                        {Array.from(selectedIds).map(id => {
                            // This is slightly inefficient as we only have departments from current org,
                            // in a real app we'd want a lookup map.
                            return (
                                <div key={id} className="flex items-center gap-1.5 bg-white dark:bg-stone-800 border border-gold-200 dark:border-gold-500/30 px-2 py-1 rounded-lg shadow-sm">
                                    <span className="text-[11px] font-medium text-slate-700 dark:text-stone-300">Dept ID: {id.slice(0, 8)}...</span>
                                    <button onClick={() => onToggle(id)} className="text-stone-400 hover:text-red-500">
                                        <X className="w-3 h-3" />
                                    </button>
                                </div>
                            );
                        })}
                    </div>
                </div>
            )}
        </div>
    );
}
