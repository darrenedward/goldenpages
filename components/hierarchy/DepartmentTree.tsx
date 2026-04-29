'use client';

import React, { useState } from 'react';
import { ChevronRight, ChevronDown, FolderOpen, Users } from 'lucide-react';
import type { DepartmentNode } from '@/types';

interface DepartmentTreeProps {
    nodes: DepartmentNode[];
    onSelect?: (node: DepartmentNode) => void;
    expandedIds?: Set<string>;
}

export default function DepartmentTree({ nodes, onSelect, expandedIds: initialExpandedIds }: DepartmentTreeProps) {
    const [expandedIds, setExpandedIds] = useState<Set<string>>(initialExpandedIds || new Set());

    const toggleExpand = (id: string, e: React.MouseEvent) => {
        e.stopPropagation();
        const newExpanded = new Set(expandedIds);
        if (newExpanded.has(id)) {
            newExpanded.delete(id);
        } else {
            newExpanded.add(id);
        }
        setExpandedIds(newExpanded);
    };

    const renderNode = (node: DepartmentNode) => {
        const isExpanded = expandedIds.has(node.id);
        const hasChildren = node.children && node.children.length > 0;

        return (
            <div key={node.id} className="select-none">
                <div
                    onClick={() => onSelect?.(node)}
                    className={`
            flex items-center gap-2 py-2 px-3 rounded-xl cursor-pointer transition-all
            hover:bg-gold-50 dark:hover:bg-gold-900/20 group
            ${node.level > 0 ? 'ml-6 border-l-2 border-stone-200 dark:border-white/5 pl-4' : ''}
          `}
                >
                    {hasChildren ? (
                        <button
                            onClick={(e) => toggleExpand(node.id, e)}
                            className="p-1 hover:bg-gold-100 dark:hover:bg-gold-900/40 rounded-lg transition-colors"
                        >
                            {isExpanded ? <ChevronDown className="w-4 h-4 text-gold-600" /> : <ChevronRight className="w-4 h-4 text-gold-600" />}
                        </button>
                    ) : (
                        <div className="w-6" />
                    )}

                    <div className={`
            p-2 rounded-lg transition-colors
            ${isExpanded ? 'bg-gold-500 text-white' : 'bg-stone-100 dark:bg-stone-800 text-gold-600 group-hover:bg-gold-100'}
          `}>
                        <FolderOpen className="w-4 h-4" />
                    </div>

                    <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2">
                            <span className="font-medium text-slate-800 dark:text-white truncate">{node.name}</span>
                            {node.code && (
                                <span className="text-[10px] font-bold bg-stone-100 dark:bg-stone-800 text-stone-500 px-1.5 py-0.5 rounded uppercase">
                                    {node.code}
                                </span>
                            )}
                        </div>
                        <div className="flex items-center gap-2 text-[11px] text-stone-500">
                            <Users className="w-3 h-3" />
                            <span>{node.contactCount || 0} contacts</span>
                        </div>
                    </div>
                </div>

                {hasChildren && isExpanded && (
                    <div className="mt-1">
                        {node.children.map(child => renderNode(child))}
                    </div>
                )}
            </div>
        );
    };

    return (
        <div className="space-y-1">
            {nodes.map(node => renderNode(node))}
        </div>
    );
}
