'use client';

import React, { useState, useEffect } from 'react';
import { CategoryAutocomplete } from '@/components/shared/CategoryAutocomplete';
import { hierarchyService } from '@/services/hierarchyService';
import type { CommunicationType } from '@/types';
import type { WizardState } from './CreateCommunicationWizard';

const communicationTypes: { value: CommunicationType; label: string }[] = [
  { value: 'letter', label: 'Letter' },
  { value: 'email', label: 'Email' },
  { value: 'physical_mail', label: 'Physical Mail' },
  { value: 'meeting', label: 'Meeting' },
];

interface WizardStepDetailsProps {
  state: WizardState;
  updateState: (updates: Partial<WizardState>) => void;
}

export default function WizardStepDetails({ state, updateState }: WizardStepDetailsProps) {
  const [tagsInput, setTagsInput] = React.useState(state.tags.join(', '));
  const [nwaDepartments, setNwaDepartments] = useState<{ id: string; name: string; code?: string }[]>([]);

  useEffect(() => {
    void (async () => {
      try {
        const depts = await hierarchyService.getNWADepartments();
        setNwaDepartments(depts);
      } catch (err) {
        console.error('Failed to load NWA departments:', err);
      }
    })();
  }, []);

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
      <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-6">Communication Details</h2>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
        {/* Title */}
        <div className="md:col-span-2">
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-400 mb-1">
            Title *
          </label>
          <input
            type="text"
            value={state.title}
            onChange={(e) => updateState({ title: e.target.value })}
            placeholder="e.g., Covid Vaccine Investigation — Data Request"
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
            required
          />
        </div>

        {/* Type */}
        <div>
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-400 mb-1">
            Communication Type
          </label>
          <select
            value={state.communicationType}
            onChange={(e) => updateState({ communicationType: e.target.value as CommunicationType })}
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          >
            {communicationTypes.map(t => (
              <option key={t.value} value={t.value}>{t.label}</option>
            ))}
          </select>
        </div>

        {/* Category */}
        <div>
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-400 mb-1">
            Category
          </label>
          <CategoryAutocomplete
            value={state.categoryId || ''}
            onChange={(id, name) => updateState({ categoryId: id, category: name })}
            placeholder="e.g., Health, Finance, FOIA"
          />
        </div>

        {/* Description */}
        <div className="md:col-span-2">
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-400 mb-1">
            Description
          </label>
          <textarea
            value={state.description}
            onChange={(e) => updateState({ description: e.target.value })}
            placeholder="Brief description of what this communication is about..."
            rows={3}
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500 resize-none"
          />
        </div>

        {/* Tags */}
        <div>
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-400 mb-1">
            Tags (comma separated)
          </label>
          <input
            type="text"
            value={tagsInput}
            onChange={(e) => {
              setTagsInput(e.target.value);
              updateState({
                tags: e.target.value.split(',').map(t => t.trim()).filter(Boolean),
              });
            }}
            placeholder="e.g., covid, vaccine, data-request"
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          />
        </div>

        {/* Sender org — read-only */}
        <div>
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-400 mb-1">
            Your Organisation
          </label>
          <input
            type="text"
            value={state.senderOrganisation}
            disabled
            className="w-full px-4 py-3 bg-stone-100 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white opacity-70 cursor-not-allowed"
          />
        </div>

        {/* Sender department */}
        <div>
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-400 mb-1">
            Your Department
          </label>
          <select
            value={state.senderDepartmentId}
            onChange={(e) => {
              const dept = nwaDepartments.find(d => d.id === e.target.value);
              updateState({
                senderDepartmentId: e.target.value,
                senderDepartmentName: dept?.name || '',
              });
            }}
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          >
            <option value="">Select department...</option>
            {nwaDepartments.map(dept => (
              <option key={dept.id} value={dept.id}>
                {dept.name}{dept.code ? ` (${dept.code})` : ''}
              </option>
            ))}
          </select>
        </div>
      </div>
    </div>
  );
}
