'use client';

import React, { useState, useEffect } from 'react';
import { X, Building2, User, Plus, Search } from 'lucide-react';
import { hierarchyService } from '@/services/hierarchyService';
import { supabase } from '@/services/supabaseClient';
import type { Organization, DepartmentWithContacts, Contact } from '@/types';
import type { WizardState } from './CreateCommunicationWizard';

interface WizardStepRecipientsProps {
  state: WizardState;
  updateState: (updates: Partial<WizardState>) => void;
}

export default function WizardStepRecipients({ state, updateState }: WizardStepRecipientsProps) {
  const [organizations, setOrganizations] = useState<Organization[]>([]);
  const [selectedOrgId, setSelectedOrgId] = useState<string>('');
  const [departments, setDepartments] = useState<DepartmentWithContacts[]>([]);
  const [contacts, setContacts] = useState<Contact[]>([]);
  const [loading, setLoading] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');

  useEffect(() => {
    void fetchOrgs();
  }, []);

  useEffect(() => {
    if (selectedOrgId) {
      void fetchDepartments(selectedOrgId);
    }
  }, [selectedOrgId]);

  const fetchOrgs = async () => {
    try {
      const orgs = await hierarchyService.getOrganizations();
      setOrganizations(orgs);
    } catch (err) {
      console.error('Failed to load organizations:', err);
    }
  };

  const fetchDepartments = async (orgId: string) => {
    setLoading(true);
    try {
      const depts = await hierarchyService.getDepartments(orgId);
      setDepartments(depts);
    } catch (err) {
      console.error('Failed to load departments:', err);
    } finally {
      setLoading(false);
    }
  };

  const fetchContacts = async (deptId: string) => {
    try {
      const { data } = await supabase
        .from('contacts')
        .select('*')
        .eq('departmentId', deptId)
        .eq('isActive', true);
      setContacts((data as Contact[]) || []);
    } catch {
      setContacts([]);
    }
  };

  const addRecipient = (departmentId: string, departmentName: string, contactId?: string, contactName?: string) => {
    const exists = state.recipients.some(r =>
      r.departmentId === departmentId && r.contactId === contactId
    );
    if (exists) return;

    updateState({
      recipients: [...state.recipients, { departmentId, contactId, departmentName, contactName }],
    });
  };

  const removeRecipient = (index: number) => {
    updateState({
      recipients: state.recipients.filter((_, i) => i !== index),
    });
  };

  const filteredDepts = departments.filter(d =>
    d.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    (d.code && d.code.toLowerCase().includes(searchQuery.toLowerCase()))
  );

  return (
    <div className="space-y-6">
      {/* Selected recipients */}
      {state.recipients.length > 0 && (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">
            Selected Recipients ({state.recipients.length})
          </h2>
          <div className="flex flex-wrap gap-2">
            {state.recipients.map((r, i) => (
              <div
                key={`${r.departmentId}-${r.contactId || 'none'}`}
                className="flex items-center gap-2 bg-gold-50 dark:bg-gold-900/20 border border-gold-200 dark:border-gold-500/30 px-3 py-2 rounded-xl"
              >
                <Building2 className="w-4 h-4 text-gold-600" />
                <span className="text-sm font-medium text-slate-700 dark:text-stone-300">
                  {r.departmentName || r.departmentId.slice(0, 8)}
                </span>
                {r.contactName && (
                  <>
                    <span className="text-stone-400">·</span>
                    <span className="text-xs text-stone-500 flex items-center gap-1">
                      <User className="w-3 h-3" />
                      {r.contactName}
                    </span>
                  </>
                )}
                <button
                  type="button"
                  onClick={() => removeRecipient(i)}
                  className="text-stone-400 hover:text-red-500 transition-colors"
                >
                  <X className="w-4 h-4" />
                </button>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Department selector */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden">
        <div className="p-6 border-b border-stone-100 dark:border-white/5">
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">
            Add Recipients
          </h2>
          <div className="flex gap-3">
            <div className="flex-1 relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
              <input
                type="text"
                placeholder="Search departments..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full pl-10 pr-4 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
              />
            </div>
            <select
              value={selectedOrgId}
              onChange={(e) => {
                setSelectedOrgId(e.target.value);
                setContacts([]);
              }}
              className="px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500 w-48"
              aria-label="Select organization"
            >
              <option value="">Select Organization...</option>
              {organizations.map(org => (
                <option key={org.id} value={org.id}>{org.name}</option>
              ))}
            </select>
          </div>
        </div>

        <div className="max-h-80 overflow-y-auto p-4">
          {!selectedOrgId ? (
            <div className="flex flex-col items-center justify-center py-12 text-stone-400">
              <Building2 className="w-12 h-12 mb-4 opacity-20" />
              <p className="text-sm">Select an organization to browse departments</p>
            </div>
          ) : loading ? (
            <div className="flex items-center justify-center py-12 text-stone-400">
              Loading departments...
            </div>
          ) : filteredDepts.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-12 text-stone-400">
              <p className="text-sm">No departments found</p>
            </div>
          ) : (
            <div className="space-y-2">
              {filteredDepts.map(dept => {
                const isAdded = state.recipients.some(r => r.departmentId === dept.id);
                return (
                  <div
                    key={dept.id}
                    className={`flex items-center gap-3 p-3 rounded-xl border transition-all ${
                      isAdded
                        ? 'bg-gold-50 border-gold-200 dark:bg-gold-900/20 dark:border-gold-500/30'
                        : 'bg-stone-50 dark:bg-stone-800 border-stone-100 dark:border-white/5 hover:border-gold-200 dark:hover:border-gold-500/20'
                    }`}
                  >
                    <div className="flex-1 min-w-0">
                      <span className="font-medium text-slate-800 dark:text-white text-sm">
                        {dept.name}
                      </span>
                      {dept.code && (
                        <span className="ml-2 text-[10px] font-bold bg-stone-100 dark:bg-stone-700 text-stone-500 px-1.5 py-0.5 rounded uppercase">
                          {dept.code}
                        </span>
                      )}
                      <span className="ml-2 text-xs text-stone-400">
                        ({dept.contactCount || 0} contacts)
                      </span>
                    </div>
                    <button
                      type="button"
                      onClick={() => {
                        addRecipient(dept.id, dept.name);
                        void fetchContacts(dept.id);
                      }}
                      disabled={isAdded}
                      className="flex items-center gap-1 px-3 py-1.5 rounded-lg text-xs font-bold transition-all disabled:opacity-50 bg-gold-600 text-white hover:bg-gold-700"
                    >
                      <Plus className="w-3 h-3" />
                      {isAdded ? 'Added' : 'Add'}
                    </button>
                  </div>
                );
              })}
            </div>
          )}
        </div>
      </div>

      {/* Contact picker for a selected department */}
      {contacts.length > 0 && (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
          <h3 className="text-sm font-bold text-stone-600 dark:text-stone-400 mb-3">
            Optional: Assign a specific contact
          </h3>
          <div className="flex flex-wrap gap-2">
            {contacts.map(contact => (
              <button
                key={contact.id}
                type="button"
                onClick={() => {
                  const dept = departments.find(d =>
                    contacts.some(c => c.id === contact.id && c.departmentId === d.id)
                  );
                  if (dept) {
                    addRecipient(dept.id, dept.name, contact.id, contact.fullName);
                  }
                }}
                className="flex items-center gap-2 px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-sm hover:border-gold-300 transition-colors"
              >
                <User className="w-4 h-4 text-stone-400" />
                <span className="text-slate-700 dark:text-stone-300">{contact.fullName}</span>
                {contact.roleTitle && (
                  <span className="text-xs text-stone-400">({contact.roleTitle})</span>
                )}
              </button>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
