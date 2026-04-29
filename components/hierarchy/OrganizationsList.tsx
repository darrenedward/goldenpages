'use client';

import { useState, useEffect } from 'react';
import { Search, Building2, Users, FolderOpen, Plus } from 'lucide-react';
import { hierarchyService } from '@/services/hierarchyService';
import { usePermissions } from '@/lib/hooks/usePermissions';
import type { OrganizationWithCounts, HeadOfficeType } from '@/types';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import EmptyState from '@/components/shared/EmptyState';
import StatusBadge from '@/components/shared/StatusBadge';

interface OrganizationsListProps {
  onSelectOrg: (org: OrganizationWithCounts) => void;
  onChangeView: (view: string) => void;
}

// Head office type labels for display
const HEAD_OFFICE_LABELS: Record<string, string> = {
  CORPORATE: 'Corporate',
  PRIME_MINISTER: 'Prime Minister',
  PRESIDENT: 'President',
  MINISTERIAL: 'Ministerial',
  DIPLOMATIC_MISSION: 'Diplomatic Mission',
  LOCAL_GOVT: 'Local Government',
};

export default function OrganizationsList({ onSelectOrg, onChangeView }: OrganizationsListProps) {
  const [organizations, setOrganizations] = useState<OrganizationWithCounts[]>([]);
  const [filtered, setFiltered] = useState<OrganizationWithCounts[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const [typeFilter, setTypeFilter] = useState<string>('all');
  const [headOfficeTypeFilter, setHeadOfficeTypeFilter] = useState<string>('all');
  const { canWriteDepartments } = usePermissions();

  useEffect(() => {
    void fetchOrganizations();
  }, []);

  useEffect(() => {
    let filtered = organizations;

    // Filter by search query
    if (searchQuery) {
      filtered = filtered.filter(org =>
        org.name.toLowerCase().includes(searchQuery.toLowerCase())
      );
    }

    // Filter by type
    if (typeFilter !== 'all') {
      filtered = filtered.filter(org => org.type === typeFilter);
    }

    // Filter by head office type
    if (headOfficeTypeFilter !== 'all') {
      filtered = filtered.filter(org => org.headOfficeType === headOfficeTypeFilter);
    }

    setFiltered(filtered);
  }, [organizations, searchQuery, typeFilter, headOfficeTypeFilter]);

  const fetchOrganizations = async () => {
    setLoading(true);
    setError(null);
    try {
      const data = await hierarchyService.getOrganizations();
      setOrganizations(data);
      setFiltered(data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch organizations');
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <LoadingSpinner message="Loading organizations..." />;
  }

  if (error) {
    return (
      <div className="text-center py-12">
        <p className="text-red-600 mb-4">{error}</p>
        <button
          onClick={() => void fetchOrganizations()}
          className="px-4 py-2 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all"
        >
          Retry
        </button>
      </div>
    );
  }

  return (
    <div className="p-6 bg-stone-50 min-h-screen">
      {/* Header */}
      <div className="mb-6 flex items-center justify-between">
        <div>
          <h1 className="font-serif text-3xl text-slate-800 mb-2">Organizations</h1>
          <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24" />
        </div>
        {canWriteDepartments && (
          <button className="flex items-center gap-2 px-4 py-2 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all">
            <Plus className="w-4 h-4" />
            New Organization
          </button>
        )}
      </div>

      {/* Filters */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6 mb-6">
        <div className="flex flex-col md:flex-row gap-4">
          {/* Search */}
          <div className="flex-1 relative">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
            <input
              type="text"
              placeholder="Search organizations..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-12 pr-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
          </div>

          {/* Type Filter */}
          <select
            value={typeFilter}
            onChange={(e) => setTypeFilter(e.target.value)}
            className="px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500"
          >
            <option value="all">All Types</option>
            <option value="government">Government</option>
            <option value="corporate">Corporate</option>
            <option value="diplomatic_mission">Diplomatic Mission</option>
            <option value="international_organization">International Organization</option>
          </select>

          {/* Head Office Type Filter */}
          <select
            value={headOfficeTypeFilter}
            onChange={(e) => setHeadOfficeTypeFilter(e.target.value)}
            className="px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500"
          >
            <option value="all">All Head Offices</option>
            <option value="CORPORATE">Corporate</option>
            <option value="PRIME_MINISTER">Prime Minister</option>
            <option value="PRESIDENT">President</option>
            <option value="MINISTERIAL">Ministerial</option>
            <option value="DIPLOMATIC_MISSION">Diplomatic Mission</option>
            <option value="LOCAL_GOVT">Local Government</option>
          </select>
        </div>

        {/* Results count */}
        <p className="text-sm text-stone-500 mt-4">
          Showing {filtered.length} of {organizations.length} organizations
        </p>
      </div>

      {/* Organizations List */}
      {filtered.length === 0 ? (
        <EmptyState
          title="No organizations found"
          description={searchQuery || typeFilter !== 'all' ? 'Try adjusting your filters' : 'No organizations available'}
          action={searchQuery || typeFilter !== 'all' ? {
            label: 'Clear Filters',
            onClick: () => { setSearchQuery(''); setTypeFilter('all'); }
          } : undefined}
        />
      ) : (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden">
          <ul className="divide-y divide-stone-200 dark:divide-white/10">
            {filtered.map((org) => (
              <li key={org.id}>
                <button
                  onClick={() => onSelectOrg(org)}
                  className="w-full px-5 py-4 text-left hover:bg-stone-50 dark:hover:bg-stone-800/60 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-gold-500"
                >
                  <div className="flex items-center gap-4">
                    <div className="w-10 h-10 shrink-0 bg-gradient-to-br from-gold-400 to-gold-600 rounded-2xl flex items-center justify-center">
                      <Building2 className="w-5 h-5 text-white" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <div className="flex items-start justify-between gap-3">
                        <h3 className="font-serif text-base md:text-lg font-bold text-slate-800 dark:text-white truncate">
                          {org.name}
                        </h3>
                        <div className="shrink-0 flex gap-2">
                          <StatusBadge status={org.type} />
                          <span className="px-2 py-0.5 bg-stone-100 dark:bg-stone-800 text-stone-700 dark:text-stone-300 text-xs font-medium rounded-full">
                            {HEAD_OFFICE_LABELS[org.headOfficeType] || org.headOfficeType}
                          </span>
                        </div>
                      </div>
                      <div className="mt-1 flex flex-wrap items-center gap-x-4 gap-y-1 text-sm text-stone-600 dark:text-stone-400">
                        {org.headOfficeCity && (
                          <span className="truncate">{org.headOfficeCity}</span>
                        )}
                        <span className="flex items-center gap-1">
                          <FolderOpen className="w-4 h-4" />
                          <span>{org.departmentCount || 0} depts</span>
                        </span>
                        <span className="flex items-center gap-1">
                          <Users className="w-4 h-4" />
                          <span>{org.contactCount || 0} contacts</span>
                        </span>
                      </div>
                    </div>
                  </div>
                </button>
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}
