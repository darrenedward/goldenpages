'use client';

import React, { useState, useEffect, useCallback, useRef } from 'react';
import { X, Search, Plus, Building2, User, Globe, ChevronDown } from 'lucide-react';
import { hierarchyService } from '@/services/hierarchyService';
import type { ContactSearchResult } from '@/types';
import type { WizardState } from './CreateCommunicationWizard';

interface WizardStepRecipientsProps {
  state: WizardState;
  updateState: (updates: Partial<WizardState>) => void;
}

export default function WizardStepRecipients({ state, updateState }: WizardStepRecipientsProps) {
  const [searchQuery, setSearchQuery] = useState('');
  const [results, setResults] = useState<ContactSearchResult[]>([]);
  const [searching, setSearching] = useState(false);
  const [showBrowse, setShowBrowse] = useState(false);
  const debounceRef = useRef<ReturnType<typeof setTimeout>>();

  // Debounced global search
  const doSearch = useCallback(async (query: string) => {
    if (!query || query.length < 2) {
      setResults([]);
      return;
    }
    setSearching(true);
    try {
      const hits = await hierarchyService.searchRecipients(query);
      setResults(hits);
    } catch (err) {
      console.error('Search failed:', err);
      setResults([]);
    } finally {
      setSearching(false);
    }
  }, []);

  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
    if (searchQuery.length < 2) {
      setResults([]);
      return;
    }
    debounceRef.current = setTimeout(() => void doSearch(searchQuery), 250);
    return () => { if (debounceRef.current) clearTimeout(debounceRef.current); };
  }, [searchQuery, doSearch]);

  const addRecipient = (r: ContactSearchResult) => {
    const exists = state.recipients.some(rec =>
      rec.departmentId === r.departmentId && rec.contactId === r.contactId
    );
    if (exists) return;

    updateState({
      recipients: [...state.recipients, {
        departmentId: r.departmentId,
        contactId: r.contactId,
        departmentName: r.departmentName,
        contactName: r.contactName,
      }],
    });
  };

  const addDepartment = (r: ContactSearchResult) => {
    const exists = state.recipients.some(rec => rec.departmentId === r.departmentId && !rec.contactId);
    if (exists) return;

    updateState({
      recipients: [...state.recipients, {
        departmentId: r.departmentId,
        contactName: undefined,
        departmentName: r.departmentName,
      }],
    });
  };

  const removeRecipient = (index: number) => {
    updateState({
      recipients: state.recipients.filter((_, i) => i !== index),
    });
  };

  const isAdded = (departmentId: string, contactId?: string) =>
    state.recipients.some(r =>
      r.departmentId === departmentId && r.contactId === contactId
    );

  const isDeptAdded = (departmentId: string) =>
    state.recipients.some(r => r.departmentId === departmentId && !r.contactId);

  // Group results by organization
  const grouped = results.reduce<Record<string, ContactSearchResult[]>>((acc, r) => {
    const key = r.organizationName || 'Unknown';
    if (!acc[key]) acc[key] = [];
    acc[key].push(r);
    return acc;
  }, {});

  return (
    <div className="space-y-6">
      {/* Selected recipients */}
      {state.recipients.length > 0 && (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">
            Recipients ({state.recipients.length})
          </h2>
          <div className="flex flex-wrap gap-2">
            {state.recipients.map((r, i) => (
              <div
                key={`${r.departmentId}-${r.contactId || 'dept'}-${i}`}
                className="flex items-center gap-2 bg-gold-50 dark:bg-gold-900/20 border border-gold-200 dark:border-gold-500/30 px-3 py-2 rounded-xl"
              >
                {r.contactName ? (
                  <User className="w-4 h-4 text-gold-600" />
                ) : (
                  <Building2 className="w-4 h-4 text-gold-600" />
                )}
                <span className="text-sm font-medium text-slate-700 dark:text-stone-300">
                  {r.contactName || r.departmentName}
                </span>
                {r.contactName && r.departmentName && (
                  <span className="text-xs text-stone-400">
                    ({r.departmentName})
                  </span>
                )}
                <button
                  type="button"
                  onClick={() => removeRecipient(i)}
                  className="text-stone-400 hover:text-red-500 transition-colors ml-1"
                >
                  <X className="w-4 h-4" />
                </button>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Global search */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden">
        <div className="p-8 border-b border-stone-100 dark:border-white/5">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">
            Add Recipients
          </h2>
          <div className="relative">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-stone-400" />
            <input
              type="text"
              placeholder="Search by name, role, department or organisation... (e.g. &quot;prime minister&quot;, &quot;finance&quot;, &quot;luxon&quot;)"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-12 pr-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
              autoFocus
            />
          </div>
          <button
            type="button"
            onClick={() => setShowBrowse(!showBrowse)}
            className="flex items-center gap-1 mt-3 text-xs text-stone-400 hover:text-stone-600 transition-colors"
          >
            <ChevronDown className={`w-3 h-3 transition-transform ${showBrowse ? 'rotate-180' : ''}`} />
            {showBrowse ? 'Hide' : 'Show'} organization browser
          </button>
        </div>

        {/* Search results */}
        <div className="max-h-[480px] overflow-y-auto">
          {searchQuery.length < 2 ? (
            <div className="flex flex-col items-center justify-center py-16 text-stone-400">
              <Search className="w-12 h-12 mb-4 opacity-20" />
              <p className="text-sm">Type at least 2 characters to search across all organisations</p>
              <p className="text-xs mt-1 text-stone-300">Search contacts by name, role, or department</p>
            </div>
          ) : searching ? (
            <div className="flex items-center justify-center py-16 text-stone-400">
              <div className="w-6 h-6 border-2 border-gold-200 border-t-gold-600 rounded-full animate-spin mr-2" />
              Searching...
            </div>
          ) : results.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-16 text-stone-400">
              <p className="text-sm">No results for &ldquo;{searchQuery}&rdquo;</p>
              <p className="text-xs mt-1 text-stone-300">Try a different search term</p>
            </div>
          ) : (
            <div className="p-4 space-y-4">
              {Object.entries(grouped).map(([orgName, contacts]) => (
                <div key={orgName}>
                  {/* Org header */}
                  <div className="flex items-center gap-2 px-2 py-1 mb-2">
                    <Globe className="w-4 h-4 text-stone-400" />
                    <span className="text-xs font-bold text-stone-400 uppercase tracking-wider">{orgName}</span>
                    <span className="text-xs text-stone-300">({contacts.length} result{contacts.length !== 1 ? 's' : ''})</span>
                  </div>
                  {/* Contact rows */}
                  <div className="space-y-1.5">
                    {contacts.map(r => (
                      <div
                        key={`${r.contactId}-${r.departmentId}`}
                        className={`flex items-center gap-3 p-3 rounded-xl border transition-all ${
                          isAdded(r.departmentId, r.contactId)
                            ? 'bg-gold-50 border-gold-200 dark:bg-gold-900/20 dark:border-gold-500/30'
                            : 'bg-stone-50 dark:bg-stone-800 border-stone-100 dark:border-white/5 hover:border-gold-200 dark:hover:border-gold-500/20'
                        }`}
                      >
                        <div className="flex-1 min-w-0">
                          <div className="flex items-center gap-2">
                            <span className="font-medium text-slate-800 dark:text-white text-sm">
                              {r.contactName}
                            </span>
                            {r.departmentCode && (
                              <span className="text-[10px] font-bold bg-stone-100 dark:bg-stone-700 text-stone-500 px-1.5 py-0.5 rounded uppercase">
                                {r.departmentCode}
                              </span>
                            )}
                          </div>
                          {r.roleTitle && (
                            <p className="text-xs text-stone-500 dark:text-stone-400 mt-0.5 truncate">
                              {r.roleTitle}
                            </p>
                          )}
                          <p className="text-xs text-stone-400 mt-0.5">
                            {r.departmentName}
                          </p>
                        </div>
                        <div className="flex items-center gap-2 shrink-0">
                          {/* Add whole department button */}
                          {!isDeptAdded(r.departmentId) && (
                            <button
                              type="button"
                              onClick={() => addDepartment(r)}
                              className="flex items-center gap-1 px-2 py-1 rounded-lg text-[10px] font-bold transition-all bg-stone-100 dark:bg-stone-700 text-stone-500 hover:bg-stone-200 dark:hover:bg-stone-600"
                              title="Add whole department"
                            >
                              <Building2 className="w-3 h-3" />
                              Dept
                            </button>
                          )}
                          {/* Add specific contact button */}
                          <button
                            type="button"
                            onClick={() => addRecipient(r)}
                            disabled={isAdded(r.departmentId, r.contactId)}
                            className="flex items-center gap-1 px-3 py-1.5 rounded-lg text-xs font-bold transition-all disabled:opacity-50 bg-gold-600 text-white hover:bg-gold-700"
                          >
                            <Plus className="w-3 h-3" />
                            {isAdded(r.departmentId, r.contactId) ? 'Added' : 'Add'}
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

      {/* Collapsible org browser (fallback) */}
      {showBrowse && (
        <BrowseByOrganization
          recipients={state.recipients}
          onAddDept={(deptId, deptName) => {
            const exists = state.recipients.some(r => r.departmentId === deptId && !r.contactId);
            if (!exists) {
              updateState({
                recipients: [...state.recipients, { departmentId: deptId, departmentName: deptName }],
              });
            }
          }}
          onAddContact={(deptId, deptName, contactId, contactName) => {
            const exists = state.recipients.some(r => r.departmentId === deptId && r.contactId === contactId);
            if (!exists) {
              updateState({
                recipients: [...state.recipients, { departmentId: deptId, departmentName: deptName, contactId, contactName }],
              });
            }
          }}
        />
      )}
    </div>
  );
}

// =============================================================================
// BROWSE BY ORGANIZATION (collapsible fallback)
// =============================================================================

function BrowseByOrganization({
  recipients,
  onAddDept,
  onAddContact,
}: {
  recipients: WizardState['recipients'];
  onAddDept: (deptId: string, deptName: string) => void;
  onAddContact: (deptId: string, deptName: string, contactId: string, contactName: string) => void;
}) {
  const [organizations, setOrganizations] = useState<{ id: string; name: string }[]>([]);
  const [selectedOrgId, setSelectedOrgId] = useState('');
  const [departments, setDepartments] = useState<{ id: string; name: string; code?: string; contactCount: number }[]>([]);
  const [expandedDept, setExpandedDept] = useState<string | null>(null);
  const [contacts, setContacts] = useState<{ id: string; fullName: string; roleTitle?: string }[]>([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    void (async () => {
      const orgs = await hierarchyService.getOrganizations();
      setOrganizations(orgs);
    })();
  }, []);

  useEffect(() => {
    if (!selectedOrgId) return;
    void (async () => {
      setLoading(true);
      const depts = await hierarchyService.getDepartments(selectedOrgId);
      setDepartments(depts.map(d => ({
        id: d.id,
        name: d.name,
        code: d.code,
        contactCount: d.contactCount || 0,
      })));
      setLoading(false);
    })();
  }, [selectedOrgId]);

  const loadContacts = async (deptId: string) => {
    if (expandedDept === deptId) {
      setExpandedDept(null);
      setContacts([]);
      return;
    }
    setExpandedDept(deptId);
    const { data } = await (await import('@/services/supabaseClient')).supabase
      .from('contacts')
      .select('id, fullName, roleTitle')
      .eq('departmentId', deptId)
      .eq('isActive', true);
    setContacts((data as { id: string; fullName: string; roleTitle?: string }[]) || []);
  };

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
      <h3 className="text-sm font-bold text-stone-600 dark:text-stone-400 uppercase tracking-wider mb-4">
        Browse by Organization
      </h3>
      <select
        value={selectedOrgId}
        onChange={(e) => { setSelectedOrgId(e.target.value); setExpandedDept(null); }}
        className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500 mb-4"
      >
        <option value="">Select Organization...</option>
        {organizations.map(org => (
          <option key={org.id} value={org.id}>{org.name}</option>
        ))}
      </select>

      {!selectedOrgId ? (
        <p className="text-sm text-stone-400 text-center py-8">Select an organization above</p>
      ) : loading ? (
        <p className="text-sm text-stone-400 text-center py-8">Loading departments...</p>
      ) : (
        <div className="space-y-1.5">
          {departments.map(dept => {
            const deptAdded = recipients.some(r => r.departmentId === dept.id && !r.contactId);
            return (
              <div key={dept.id}>
                <div className="flex items-center gap-3 p-3 rounded-xl bg-stone-50 dark:bg-stone-800 border border-stone-100 dark:border-white/5">
                  <div className="flex-1 min-w-0">
                    <span className="font-medium text-slate-800 dark:text-white text-sm">{dept.name}</span>
                    {dept.code && (
                      <span className="ml-2 text-[10px] font-bold bg-stone-100 dark:bg-stone-700 text-stone-500 px-1.5 py-0.5 rounded uppercase">
                        {dept.code}
                      </span>
                    )}
                    <span className="ml-2 text-xs text-stone-400">({dept.contactCount} contacts)</span>
                  </div>
                  <button
                    type="button"
                    onClick={() => loadContacts(dept.id)}
                    className="text-xs text-stone-400 hover:text-gold-600 transition-colors"
                  >
                    {expandedDept === dept.id ? 'Hide' : 'Contacts'}
                  </button>
                  <button
                    type="button"
                    onClick={() => onAddDept(dept.id, dept.name)}
                    disabled={deptAdded}
                    className="flex items-center gap-1 px-3 py-1.5 rounded-lg text-xs font-bold transition-all disabled:opacity-50 bg-gold-600 text-white hover:bg-gold-700"
                  >
                    <Plus className="w-3 h-3" />
                    {deptAdded ? 'Added' : 'Add Dept'}
                  </button>
                </div>
                {expandedDept === dept.id && contacts.length > 0 && (
                  <div className="ml-6 mt-1 space-y-1">
                    {contacts.map(c => {
                      const contactAdded = recipients.some(r => r.departmentId === dept.id && r.contactId === c.id);
                      return (
                        <div key={c.id} className="flex items-center gap-2 p-2 rounded-lg hover:bg-stone-50 dark:hover:bg-stone-800">
                          <User className="w-3 h-3 text-stone-400" />
                          <span className="text-sm text-slate-700 dark:text-stone-300 flex-1">{c.fullName}</span>
                          {c.roleTitle && <span className="text-xs text-stone-400 truncate max-w-[200px]">{c.roleTitle}</span>}
                          <button
                            type="button"
                            onClick={() => onAddContact(dept.id, dept.name, c.id, c.fullName)}
                            disabled={contactAdded}
                            className="flex items-center gap-1 px-2 py-1 rounded-lg text-[10px] font-bold transition-all disabled:opacity-50 bg-gold-600 text-white hover:bg-gold-700"
                          >
                            {contactAdded ? 'Added' : 'Add'}
                          </button>
                        </div>
                      );
                    })}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
