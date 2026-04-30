'use client';

import { useState, useEffect } from 'react';
import { Phone, Mail, Globe, MapPin, Search, User, Plus, MessageSquare, ChevronDown, ChevronRight } from 'lucide-react';
import { hierarchyService } from '@/services/hierarchyService';
import { usePermissions } from '@/lib/hooks/usePermissions';
import type { ContactWithChannels, Department, Organization } from '@/types';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import EmptyState from '@/components/shared/EmptyState';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';

interface DepartmentContactsProps {
  orgId: string;
  deptId: string;
  onChangeView: (view: string, data?: Record<string, string>) => void;
}

export default function DepartmentContacts({ orgId, deptId, onChangeView }: DepartmentContactsProps) {
  const [contacts, setContacts] = useState<ContactWithChannels[]>([]);
  const [department, setDepartment] = useState<Department | null>(null);
  const [organization, setOrganization] = useState<Organization | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const [showFormer, setShowFormer] = useState(false);
  const { canReadContacts, canWriteContacts, canWriteCommunications } = usePermissions();

  useEffect(() => {
    void fetchData();
  }, [deptId]);

  const fetchData = async () => {
    setLoading(true);
    setError(null);
    try {
      // Fetch department and org info independently so breadcrumb works even with 0 contacts
      const [contactsData, deptData, orgData] = await Promise.all([
        hierarchyService.getDepartmentContacts(deptId),
        hierarchyService.getDepartment(deptId),
        orgId ? hierarchyService.getOrganization(orgId) : Promise.resolve(null),
      ]);

      // Prefer nested data from contacts (already loaded), fall back to direct fetch
      if (contactsData.length > 0) {
        setDepartment(contactsData[0].department || deptData);
        setOrganization(contactsData[0].organisation || orgData);
      } else {
        setDepartment(deptData);
        setOrganization(orgData);
      }

      setContacts(contactsData);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch contacts');
    } finally {
      setLoading(false);
    }
  };

  const activeContacts = contacts.filter(c => c.isActive !== false);
  const formerContacts = contacts.filter(c => c.isActive === false);

  const filteredActive = activeContacts.filter(contact =>
    contact.fullName.toLowerCase().includes(searchQuery.toLowerCase()) ||
    (contact.roleTitle && contact.roleTitle.toLowerCase().includes(searchQuery.toLowerCase()))
  );
  const filteredFormer = formerContacts.filter(contact =>
    contact.fullName.toLowerCase().includes(searchQuery.toLowerCase()) ||
    (contact.roleTitle && contact.roleTitle.toLowerCase().includes(searchQuery.toLowerCase()))
  );

  const getChannelIcon = (type: string) => {
    switch (type) {
      case 'phone':
      case 'mobile':
      case 'fax':
        return <Phone className="w-4 h-4" />;
      case 'email':
        return <Mail className="w-4 h-4" />;
      case 'website':
        return <Globe className="w-4 h-4" />;
      case 'office_address':
        return <MapPin className="w-4 h-4" />;
      default:
        return null;
    }
  };

  const getChannelValue = (channel: Record<string, unknown>): string => {
    if (channel.channelType === 'office_address') {
      const parts = [
        channel.addressLine1,
        channel.city,
        channel.state,
        channel.postalCode,
        channel.country,
      ].filter(Boolean) as string[];
      return parts.join(', ');
    }
    return String(channel.displayValue || channel.value || '');
  };

  const renderContactCard = (contact: ContactWithChannels, isActive: boolean) => (
    <div
      key={contact.id}
      className={`bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border p-6 ${isActive ? 'border-stone-200 dark:border-white/5' : 'border-stone-200/60 dark:border-white/5 opacity-75'}`}
    >
      <div className="flex items-start gap-4">
        <div className={`w-14 h-14 rounded-2xl flex items-center justify-center flex-shrink-0 ${isActive ? 'bg-gradient-to-br from-gold-400 to-gold-600' : 'bg-stone-300 dark:bg-stone-700'}`}>
          <User className="w-7 h-7 text-white" />
        </div>

        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2">
            <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white">
              {contact.fullName}
            </h3>
            {isActive && (
              <span className="px-2 py-0.5 bg-emerald-100 dark:bg-emerald-900/30 text-emerald-700 dark:text-emerald-400 text-xs font-bold rounded-lg">
                Current
              </span>
            )}
            {!isActive && (
              <span className="px-2 py-0.5 bg-stone-100 dark:bg-stone-800 text-stone-500 text-xs font-bold rounded-lg">
                Former
              </span>
            )}
          </div>
          {contact.roleTitle && (
            <p className={`font-medium ${isActive ? 'text-gold-600' : 'text-stone-500'}`}>{contact.roleTitle}</p>
          )}

          {contact.contactChannels && contact.contactChannels.length > 0 && (
            <div className="mt-3 space-y-2">
              {contact.contactChannels.map((channel) => (
                <div key={channel.id} className="flex items-center gap-2 text-sm text-stone-600 dark:text-stone-400">
                  <div className="w-8 h-8 bg-stone-100 dark:bg-stone-800 rounded-lg flex items-center justify-center text-gold-600">
                    {getChannelIcon(channel.channelType)}
                  </div>
                  <span className="break-all">{getChannelValue(channel as unknown as Record<string, unknown>)}</span>
                </div>
              ))}
            </div>
          )}
        </div>

        {isActive && (
          <div className="flex flex-col gap-2 flex-shrink-0">
            {canWriteCommunications && (
              <button
                onClick={() => onChangeView('create-communication', {
                  contactId: contact.id,
                  departmentId: deptId || '',
                  organisationId: orgId || '',
                })}
                className="flex items-center gap-2 px-3 py-2 bg-gold-600 text-white rounded-xl text-xs font-bold hover:bg-gold-700 transition-all"
              >
                <MessageSquare className="w-3.5 h-3.5" />
                Start Communication
              </button>
            )}
            <button
              onClick={() => onChangeView('communication-list', {
                contactId: contact.id,
                departmentId: deptId || '',
                organisationId: orgId || '',
              })}
              className="flex items-center gap-2 px-3 py-2 bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-300 rounded-xl text-xs font-bold hover:bg-stone-200 dark:hover:bg-stone-700 transition-all"
            >
              <MessageSquare className="w-3.5 h-3.5" />
              View Communications
            </button>
          </div>
        )}
      </div>
    </div>
  );

  if (loading) {
    return <LoadingSpinner message="Loading contacts..." />;
  }

  if (error) {
    return (
      <div className="text-center py-12">
        <p className="text-red-600 mb-4">{error}</p>
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
    <div className="space-y-6 animate-fade-in pb-12">
      {/* Breadcrumb */}
      <BreadcrumbNav
        items={[
          { label: 'Organizations', onClick: () => onChangeView('organizations') },
          { label: organization?.name || 'Organization', onClick: () => onChangeView('organization-detail') },
          { label: department?.name || 'Department' },
        ]}
      />

      {/* Header */}
      <div className="mb-6">
        <h1 className="font-serif text-3xl text-slate-800 mb-2">{department?.name || 'Department'}</h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24" />
        {department?.description && (
          <p className="text-stone-600 dark:text-stone-400 mt-3 max-w-2xl">{department.description}</p>
        )}
      </div>

      {/* Search */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6 mb-6">
        <div className="flex items-center gap-4">
          <div className="flex-1 relative">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
            <input
              type="text"
              placeholder="Search contacts by name or role..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-12 pr-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
          </div>
          {canWriteContacts && (
            <button className="flex items-center gap-2 px-4 py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all">
              <Plus className="w-4 h-4" />
              New Contact
            </button>
          )}
        </div>
        <p className="text-sm text-stone-500 mt-4">
          {activeContacts.length} current{formerContacts.length > 0 ? `, ${formerContacts.length} former` : ''} contacts
        </p>
      </div>

      {/* Current Contacts */}
      {filteredActive.length === 0 && filteredFormer.length === 0 ? (
        <EmptyState
          title={searchQuery ? 'No contacts found' : 'No contacts'}
          description={searchQuery ? 'Try a different search term' : 'This department has no contacts yet'}
        />
      ) : (
        <>
          {filteredActive.length > 0 && (
            <div className="space-y-4 mb-6">
              {filteredActive.map(c => renderContactCard(c, true))}
            </div>
          )}

          {/* Former Contacts (collapsible) */}
          {filteredFormer.length > 0 && (
            <div className="mt-8">
              <button
                onClick={() => setShowFormer(!showFormer)}
                className="flex items-center gap-2 text-stone-500 hover:text-stone-700 transition-colors mb-4"
              >
                {showFormer ? <ChevronDown className="w-4 h-4" /> : <ChevronRight className="w-4 h-4" />}
                <span className="text-sm font-semibold uppercase tracking-wider">
                  Former Officeholders ({filteredFormer.length})
                </span>
              </button>
              {showFormer && (
                <div className="space-y-4">
                  {filteredFormer.map(c => renderContactCard(c, false))}
                </div>
              )}
            </div>
          )}
        </>
      )}
    </div>
  );
}
