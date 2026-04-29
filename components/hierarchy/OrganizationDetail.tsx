'use client';

import { useState, useEffect } from 'react';
import { ArrowLeft, Building2, MapPin, Globe, Mail, Phone, Users, FolderOpen, Plus } from 'lucide-react';
import { hierarchyService } from '@/services/hierarchyService';
import { usePermissions } from '@/lib/hooks/usePermissions';
import type { OrganizationWithCounts, DepartmentWithContacts } from '@/types';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import EmptyState from '@/components/shared/EmptyState';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';
import StatusBadge from '@/components/shared/StatusBadge';
import DepartmentList from './DepartmentList';

interface OrganizationDetailProps {
  orgId: string;
  onSelectDept?: (dept: DepartmentWithContacts) => void;
  onChangeView: (view: string) => void;
}

export default function OrganizationDetail({ orgId, onSelectDept, onChangeView }: OrganizationDetailProps) {
  const [organization, setOrganization] = useState<OrganizationWithCounts | null>(null);
  const [departments, setDepartments] = useState<DepartmentWithContacts[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const { canReadDepartments, canWriteDepartments } = usePermissions();

  useEffect(() => {
    void fetchData();
  }, [orgId]);

  const fetchData = async () => {
    setLoading(true);
    setError(null);
    try {
      const [orgData, deptsData] = await Promise.all([
        hierarchyService.getOrganization(orgId),
        hierarchyService.getDepartments(orgId),
      ]);

      // Add counts to organization
      const orgWithCounts: OrganizationWithCounts = {
        ...orgData!,
        departmentCount: deptsData.length,
        contactCount: deptsData.reduce((sum, d) => sum + (d.contactCount || 0), 0),
      };

      setOrganization(orgWithCounts);
      setDepartments(deptsData);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch organization details');
    } finally {
      setLoading(false);
    }
  };

  const filteredDepts = departments.filter(dept =>
    dept.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    (dept.code && dept.code.toLowerCase().includes(searchQuery.toLowerCase()))
  );

  if (loading) {
    return <LoadingSpinner message="Loading organization details..." />;
  }

  if (error || !organization) {
    return (
      <div className="text-center py-12">
        <p className="text-red-600 mb-4">{error || 'Organization not found'}</p>
        <button
          onClick={() => onChangeView('organizations')}
          className="px-4 py-2 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all"
        >
          Back to Organizations
        </button>
      </div>
    );
  }

  return (
    <div className="p-6 bg-stone-50 min-h-screen">
      {/* Breadcrumb */}
      <BreadcrumbNav
        items={[
          { label: 'Organizations', onClick: () => onChangeView('organizations') },
          { label: organization.name },
        ]}
      />

      {/* Header */}
      <div className="bg-gradient-to-br from-gold-500 to-gold-600 rounded-[2.5rem] shadow-lg p-8 mb-6 text-white">
        <div className="flex items-start justify-between">
          <div className="flex-1">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-14 h-14 bg-white/20 backdrop-blur rounded-2xl flex items-center justify-center">
                <Building2 className="w-7 h-7 text-white" />
              </div>
              <StatusBadge status={organization.type} className="bg-white/20 text-white border-white/30" />
            </div>
            <h1 className="font-serif text-3xl font-bold mb-2">{organization.name}</h1>
            {organization.description && (
              <p className="text-white/90 max-w-2xl">{organization.description}</p>
            )}
          </div>

          {/* Stats */}
          <div className="flex gap-6">
            <div className="text-center">
              <p className="text-3xl font-bold">{organization.departmentCount || 0}</p>
              <p className="text-sm text-white/70">Departments</p>
            </div>
            <div className="text-center">
              <p className="text-3xl font-bold">{organization.contactCount || 0}</p>
              <p className="text-sm text-white/70">Contacts</p>
            </div>
          </div>
        </div>
      </div>

      {/* Contact Information */}
      {(organization.headOfficeCity || organization.headOfficeEmail || organization.headOfficePhone || organization.headOfficeWebsite) && (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6 mb-6">
          <h2 className="font-serif text-xl font-bold text-slate-800 dark:text-white mb-4">Contact Information</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            {organization.headOfficeCity && (
              <div className="flex items-center gap-3 text-stone-600 dark:text-stone-400">
                <MapPin className="w-5 h-5 text-gold-600" />
                <span>{organization.headOfficeCity}</span>
              </div>
            )}
            {organization.headOfficeEmail && (
              <div className="flex items-center gap-3 text-stone-600 dark:text-stone-400">
                <Mail className="w-5 h-5 text-gold-600" />
                <a href={`mailto:${organization.headOfficeEmail}`} className="hover:text-gold-600 transition-colors">
                  {organization.headOfficeEmail}
                </a>
              </div>
            )}
            {organization.headOfficePhone && (
              <div className="flex items-center gap-3 text-stone-600 dark:text-stone-400">
                <Phone className="w-5 h-5 text-gold-600" />
                <a href={`tel:${organization.headOfficePhone}`} className="hover:text-gold-600 transition-colors">
                  {organization.headOfficePhone}
                </a>
              </div>
            )}
            {organization.headOfficeWebsite && (
              <div className="flex items-center gap-3 text-stone-600 dark:text-stone-400">
                <Globe className="w-5 h-5 text-gold-600" />
                <a
                  href={organization.headOfficeWebsite.startsWith('http') ? organization.headOfficeWebsite : `https://${organization.headOfficeWebsite}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="hover:text-gold-600 transition-colors truncate"
                >
                  {organization.headOfficeWebsite.replace(/^https?:\/\//, '')}
                </a>
              </div>
            )}
          </div>
        </div>
      )}

      {/* Departments */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
        <div className="flex items-center justify-between mb-4">
          <h2 className="font-serif text-xl font-bold text-slate-800 dark:text-white">Departments</h2>
          <div className="flex items-center gap-3">
            <div className="relative">
              <input
                type="text"
                placeholder="Search departments..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="pl-10 pr-4 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm w-64"
              />
            </div>
            {canWriteDepartments && (
              <button className="flex items-center gap-2 px-4 py-2 bg-gold-600 text-white rounded-xl font-bold hover:bg-gold-700 transition-all text-sm">
                <Plus className="w-4 h-4" />
                New Department
              </button>
            )}
          </div>
        </div>

        {filteredDepts.length === 0 ? (
          <EmptyState
            title={searchQuery ? 'No departments found' : 'No departments'}
            description={searchQuery ? 'Try a different search term' : 'This organization has no departments yet'}
          />
        ) : (
          <DepartmentList
            departments={departments}
            searchQuery={searchQuery}
            onSelectDept={(dept) => onSelectDept?.(dept)}
          />
        )}
      </div>
    </div>
  );
}
