'use client';

import React from 'react';
import { FolderOpen, Users } from 'lucide-react';
import type { DepartmentWithContacts } from '@/types';

interface DepartmentListProps {
    departments: DepartmentWithContacts[];
    onSelectDept: (dept: DepartmentWithContacts) => void;
    searchQuery?: string;
}

export default function DepartmentList({ departments, onSelectDept, searchQuery = '' }: DepartmentListProps) {
    const filteredDepts = departments.filter(dept =>
        dept.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        (dept.code && dept.code.toLowerCase().includes(searchQuery.toLowerCase()))
    );

    // Promote head-of-organization style departments to top using common keywords
    const headKeywords = [
        'president', 'prime minister', 'prime-minister', 'pm', 'ceo', 'chief executive', 'chair', 'chairperson', 'chancellor', 'head of state', 'head of government', 'executive office', 'office of the president', 'office of the prime minister', 'presidency', 'cabinet office'
    ];

    const isHeadDept = (name: string) => {
        const n = name.toLowerCase();
        return headKeywords.some(k => n.includes(k));
    };

    const heads = filteredDepts.filter(d => isHeadDept(d.name));
    const others = filteredDepts.filter(d => !isHeadDept(d.name)).sort((a, b) => a.name.localeCompare(b.name));
    const ordered = [...heads, ...others];

    return (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden">
            <ul className="divide-y divide-stone-200 dark:divide-white/10">
                {ordered.map((dept) => (
                    <li key={dept.id}>
                        <button
                            onClick={() => onSelectDept(dept)}
                            className="w-full px-5 py-4 text-left hover:bg-stone-50 dark:hover:bg-stone-800/60 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-gold-500"
                        >
                            <div className="flex items-center gap-4">
                                <div className="w-10 h-10 shrink-0 bg-gradient-to-br from-gold-400 to-gold-600 rounded-xl flex items-center justify-center">
                                    <FolderOpen className="w-5 h-5 text-white" />
                                </div>
                                <div className="flex-1 min-w-0">
                                    <div className="flex items-center justify-between gap-3">
                                        <h3 className="font-serif font-bold text-slate-800 dark:text-white truncate">{dept.name}</h3>
                                        {dept.code && (
                                            <span className="px-2 py-1 bg-gold-100 text-gold-700 dark:bg-gold-900/30 dark:text-gold-400 text-[10px] font-bold uppercase rounded-lg shrink-0">{dept.code}</span>
                                        )}
                                    </div>
                                    {dept.description && (
                                        <p className="mt-1 text-sm text-stone-500 dark:text-stone-400 line-clamp-2">{dept.description}</p>
                                    )}
                                    <div className="mt-1 flex items-center gap-1 text-sm text-stone-600 dark:text-stone-400">
                                        <Users className="w-4 h-4" />
                                        <span>{dept.contactCount || 0} contacts</span>
                                    </div>
                                </div>
                            </div>
                        </button>
                    </li>
                ))}
            </ul>
        </div>
    );
}
