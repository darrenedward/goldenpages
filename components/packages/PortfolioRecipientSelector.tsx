'use client';

import React, { useState, useEffect, useMemo } from 'react';
import { Users, Globe, Check, ChevronDown } from 'lucide-react';
import { supabase } from '@/services/supabaseClient';
import { PORTFOLIO_LABELS, PORTFOLIO_GROUP_LABELS, getPortfolioGroup } from '@/lib/portfolioHelpers';
import type { Portfolio, DepartmentWithContacts } from '@/types';

interface PortfolioRecipientSelectorProps {
  selectedIds: Set<string>;
  onToggle: (id: string) => void;
  onSelectAll: (ids: string[]) => void;
  onClearAll: () => void;
}

/** Government portfolios available for selection */
const GOV_PORTFOLIOS: Portfolio[] = [
  'finance', 'transport', 'foreign_affairs', 'immigration', 'health', 'education',
  'defense', 'justice', 'trade', 'interior', 'agriculture', 'environment',
  'labor', 'energy', 'communications', 'prime_minister', 'deputy_pm', 'cabinet'
];

/** Corporate executive roles available for selection */
const CORP_PORTFOLIOS: Portfolio[] = [
  'ceo', 'cfo', 'cto', 'coo', 'cio', 'cmo', 'cso', 'clo', 'chair', 'director', 'vp', 'secretary'
];

export default function PortfolioRecipientSelector({
  selectedIds,
  onToggle,
  onSelectAll,
  onClearAll
}: PortfolioRecipientSelectorProps) {
  const [loading, setLoading] = useState(false);
  const [departments, setDepartments] = useState<DepartmentWithContacts[]>([]);
  const [expandedGroup, setExpandedGroup] = useState<string | null>(null);
  const [selectedPortfolio, setSelectedPortfolio] = useState<Portfolio | null>(null);

  // Fetch all departments with their portfolio
  useEffect(() => {
    const fetchDepartments = async () => {
      const { data, error } = await supabase
        .from('departments')
        .select(`
          *,
          organisation:organisations(name, type, "headOfficeType")
        `)
        .eq('isActive', true)
        .order('organisation(name), name');

      if (data && !error) {
        setDepartments(data as DepartmentWithContacts[]);
      }
    };

    void fetchDepartments();
  }, []);

  // Group departments by portfolio
  const portfolioDepts = useMemo(() => {
    const grouped: Record<string, DepartmentWithContacts[]> = {};

    for (const dept of departments) {
      const portfolio = dept.portfolio || 'unspecified';
      if (!grouped[portfolio]) {
        grouped[portfolio] = [];
      }
      grouped[portfolio].push(dept);
    }

    return grouped;
  }, [departments]);

  // Get available portfolios (those that exist in data)
  const availablePortfolios = useMemo(() => {
    const unique = new Set<Portfolio>();
    for (const portfolio of [...GOV_PORTFOLIOS, ...CORP_PORTFOLIOS]) {
      if (portfolioDepts[portfolio]?.length > 0) {
        unique.add(portfolio);
      }
    }
    return Array.from(unique);
  }, [portfolioDepts]);

  // Count departments by portfolio
  const portfolioCounts = useMemo(() => {
    const counts: Record<string, number> = {};
    for (const portfolio of availablePortfolios) {
      counts[portfolio] = portfolioDepts[portfolio]?.length || 0;
    }
    return counts;
  }, [portfolioDepts, availablePortfolios]);

  // Toggle group expansion
  const toggleGroup = (group: string) => {
    setExpandedGroup(expandedGroup === group ? null : group);
  };

  // Select all departments for a portfolio
  const selectAllForPortfolio = async (portfolio: Portfolio) => {
    setLoading(true);
    try {
      const depts = portfolioDepts[portfolio] || [];
      const ids = depts.map(d => d.id);
      onSelectAll(ids);
    } finally {
      setLoading(false);
    }
  };

  // Get portfolios grouped by category
  const groupedPortfolios = useMemo(() => {
    const groups: Record<string, Portfolio[]> = {};

    for (const portfolio of availablePortfolios) {
      const group = getPortfolioGroup(portfolio);
      if (group) {
        if (!groups[group]) groups[group] = [];
        groups[group].push(portfolio);
      }
    }

    // Add ungrouped portfolios at the end
    for (const portfolio of availablePortfolios) {
      if (!getPortfolioGroup(portfolio)) {
        if (!groups['other']) groups['other'] = [];
        groups['other'].push(portfolio);
      }
    }

    return groups;
  }, [availablePortfolios]);

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h3 className="text-xl font-serif font-bold text-slate-800 dark:text-white flex items-center gap-2">
            <Users className="w-5 h-5" />
            Recipients by Portfolio
          </h3>
          <p className="text-sm text-stone-500 mt-1">
            Select a portfolio to add all matching departments across all organizations
          </p>
        </div>
        <button
          onClick={onClearAll}
          disabled={selectedIds.size === 0}
          className="px-4 py-2 bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-400 rounded-2xl font-bold hover:bg-stone-200 dark:hover:bg-stone-700 disabled:opacity-50 transition-all text-sm"
        >
          Clear All ({selectedIds.size})
        </button>
      </div>

      {/* Portfolio Groups */}
      {Object.entries(groupedPortfolios).map(([group, portfolios]) => (
        <div key={group} className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden">
          {/* Group Header */}
          <button
            onClick={() => toggleGroup(group)}
            className="w-full px-6 py-4 flex items-center justify-between hover:bg-stone-50 dark:hover:bg-stone-800/60 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-gold-500"
          >
            <div className="flex items-center gap-3">
              <Globe className="w-5 h-5 text-stone-400" />
              <div className="flex items-center gap-2">
                <h4 className="font-serif font-bold text-slate-800 dark:text-white">
                  {PORTFOLIO_GROUP_LABELS[group as keyof typeof PORTFOLIO_GROUP_LABELS] || group}
                </h4>
                <span className="text-sm text-stone-500">
                  ({portfolios.length} portfolio{portfolios.length !== 1 ? 's' : ''})
                </span>
              </div>
            </div>
            <ChevronDown
              className={`w-5 h-5 text-stone-400 transition-transform ${
                expandedGroup === group ? 'rotate-180' : ''
              }`}
            />
          </button>

          {/* Portfolio Options */}
          {expandedGroup === group && (
            <div className="border-t border-stone-200 dark:border-white/10 divide-y divide-stone-200 dark:divide-white/10">
              {portfolios.map((portfolio) => {
                const count = portfolioCounts[portfolio] || 0;
                const isSelected = selectedPortfolio === portfolio;
                const deptCount = portfolioDepts[portfolio]?.length || 0;

                return (
                  <div key={portfolio} className="p-4 hover:bg-stone-50 dark:hover:bg-stone-800/60 transition-colors">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-3">
                        {/* Selection Radio */}
                        <div
                          onClick={() => setSelectedPortfolio(portfolio)}
                          className={`w-5 h-5 rounded-full border-2 cursor-pointer transition-all ${
                            isSelected
                              ? 'border-gold-500 bg-gold-500'
                              : 'border-stone-300 dark:border-white/20 hover:border-gold-400'
                          }`}
                        />

                        {/* Portfolio Label */}
                        <span className="font-medium text-slate-800 dark:text-white">
                          {PORTFOLIO_LABELS[portfolio]}
                        </span>

                        {/* Count Badge */}
                        <span className="px-2 py-0.5 bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-400 text-xs font-medium rounded-full">
                          {deptCount} dept{deptCount !== 1 ? 's' : ''}
                        </span>
                      </div>

                      {/* Select All Button */}
                      <button
                        onClick={() => selectAllForPortfolio(portfolio)}
                        disabled={loading || count === deptCount}
                        className="px-3 py-1.5 bg-gold-500 text-white rounded-2xl font-bold hover:bg-gold-600 disabled:opacity-50 transition-all text-sm flex items-center gap-2"
                      >
                        {count === deptCount ? (
                          <>
                            <Check size={16} />
                            <span>Selected</span>
                          </>
                        ) : (
                          <>
                            <Users size={16} />
                            <span>Select All</span>
                          </>
                        )}
                      </button>
                    </div>

                    {/* Selected Departments List */}
                    {count > 0 && (
                      <div className="mt-2 pl-8 text-xs text-stone-500 dark:text-stone-400 border-l border-stone-200 dark:border-white/10">
                        {count} department{count !== 1 ? 's' : ''} already selected
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          )}
        </div>
      ))}

      {/* Loading Overlay */}
      {loading && (
        <div className="fixed inset-0 bg-stone-900/50 flex items-center justify-center z-50">
          <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-2xl p-8 flex items-center gap-4">
            <div className="w-8 h-8 border-4 border-gold-500 border-t-transparent animate-spin rounded-full">
              <div className="w-6 h-6 border-2 border-gold-500 border-t-transparent animate-spin rounded-full" />
            </div>
            <span className="text-stone-600 dark:text-stone-400">Adding recipients...</span>
          </div>
        </div>
      )}
    </div>
  );
}
