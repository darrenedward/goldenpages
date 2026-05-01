'use client';

import React from 'react';
import { CategoryAutocomplete } from '@/components/shared/CategoryAutocomplete';
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

        {/* Sender org */}
        <div>
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-400 mb-1">
            Your Organisation
          </label>
          <input
            type="text"
            value={state.senderOrganisation}
            onChange={(e) => updateState({ senderOrganisation: e.target.value })}
            placeholder="Sending on behalf of..."
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          />
        </div>
      </div>
    </div>
  );
}
