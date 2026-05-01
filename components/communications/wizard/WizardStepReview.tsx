'use client';

import React from 'react';
import { AlertTriangle, Eye, EyeOff, Calendar } from 'lucide-react';
import { addWorkingDays, formatDateDisplay } from '@/lib/dateHelpers';
import type { WizardState } from './CreateCommunicationWizard';

interface WizardStepReviewProps {
  state: WizardState;
  updateState: (updates: Partial<WizardState>) => void;
}

export default function WizardStepReview({ state, updateState }: WizardStepReviewProps) {
  const expectedDate = addWorkingDays(new Date(), state.expectedResponseDays);

  return (
    <div className="space-y-6">
      {/* Summary */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
        <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4">
          Review Communication
        </h2>

        <div className="space-y-4">
          <div>
            <span className="text-xs font-bold text-stone-400 uppercase tracking-wider">Title</span>
            <p className="text-slate-800 dark:text-white font-medium mt-1">{state.title}</p>
          </div>

          {state.description && (
            <div>
              <span className="text-xs font-bold text-stone-400 uppercase tracking-wider">Description</span>
              <p className="text-stone-600 dark:text-stone-400 text-sm mt-1">{state.description}</p>
            </div>
          )}

          <div className="grid grid-cols-2 gap-4">
            <div>
              <span className="text-xs font-bold text-stone-400 uppercase tracking-wider">Type</span>
              <p className="text-slate-800 dark:text-white text-sm mt-1 capitalize">
                {state.communicationType.replace('_', ' ')}
              </p>
            </div>
            {state.category && (
              <div>
                <span className="text-xs font-bold text-stone-400 uppercase tracking-wider">Category</span>
                <p className="text-gold-700 text-sm font-bold mt-1">{state.category}</p>
              </div>
            )}
          </div>

          {state.senderOrganisation && (
            <div>
              <span className="text-xs font-bold text-stone-400 uppercase tracking-wider">Sending on behalf of</span>
              <p className="text-slate-800 dark:text-white text-sm mt-1">{state.senderOrganisation}</p>
            </div>
          )}
        </div>
      </div>

      {/* Recipients */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
        <h3 className="text-sm font-bold text-stone-400 uppercase tracking-wider mb-3">
          Recipients ({state.recipients.length})
        </h3>
        <div className="space-y-2">
          {state.recipients.map((r, i) => (
            <div
              key={`${r.departmentId}-${r.contactId || 'none'}-${i}`}
              className="flex items-center gap-2 bg-gold-50 dark:bg-gold-900/20 border border-gold-200 dark:border-gold-500/30 px-3 py-2 rounded-xl"
            >
              <span className="text-sm font-medium text-slate-700 dark:text-stone-300">
                {r.departmentName || r.departmentId.slice(0, 8)}
              </span>
              {r.contactName && (
                <>
                  <span className="text-stone-400">·</span>
                  <span className="text-xs text-stone-500">{r.contactName}</span>
                </>
              )}
            </div>
          ))}
        </div>
      </div>

      {/* Documents */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
        <h3 className="text-sm font-bold text-stone-400 uppercase tracking-wider mb-3">
          Documents ({state.files.length})
        </h3>
        {state.files.length === 0 ? (
          <p className="text-sm text-stone-400">No documents attached</p>
        ) : (
          <div className="space-y-1">
            {state.files.map((f, i) => (
              <div key={f.file.name + i} className="flex items-center gap-2 text-sm">
                <span className="text-slate-700 dark:text-stone-300">{f.file.name}</span>
                <span className={`text-xs ${f.isPublic ? 'text-emerald-500' : 'text-stone-400'}`}>
                  {f.isPublic ? 'Public' : 'Private'}
                </span>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Expected response */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
        <h3 className="text-sm font-bold text-stone-400 uppercase tracking-wider mb-3 flex items-center gap-2">
          <Calendar className="w-4 h-4" />
          Expected Response Time
        </h3>
        <div className="flex items-center gap-4">
          <div>
            <label className="block text-xs text-stone-500 mb-1">Working days</label>
            <input
              type="number"
              min={1}
              max={120}
              value={state.expectedResponseDays}
              onChange={(e) => updateState({ expectedResponseDays: parseInt(e.target.value) || 20 })}
              className="w-24 px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white text-sm focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
          </div>
          <div className="text-sm text-stone-600 dark:text-stone-400">
            <span className="font-bold text-slate-800 dark:text-white">{state.expectedResponseDays} working days</span>
            {' '}from today →{' '}
            <span className="font-bold text-gold-600">{formatDateDisplay(expectedDate)}</span>
          </div>
        </div>
        <p className="text-xs text-stone-400 mt-2">
          Weekends (Sat/Sun) are excluded. You will be notified when this deadline approaches.
        </p>
      </div>

      {/* Approval & visibility */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
        <h3 className="text-sm font-bold text-stone-400 uppercase tracking-wider mb-4">
          Approval & Visibility
        </h3>

        {/* Approved checkbox */}
        <div className="flex items-start gap-3 mb-4 p-4 bg-amber-50 dark:bg-amber-900/20 rounded-xl border border-amber-200 dark:border-amber-800">
          <input
            type="checkbox"
            id="wizard-isApproved"
            checked={state.isApproved}
            onChange={(e) => updateState({ isApproved: e.target.checked })}
            className="mt-1 w-4 h-4 rounded border-stone-300 text-gold-600 focus:ring-gold-500"
          />
          <label htmlFor="wizard-isApproved" className="text-sm text-amber-800 dark:text-amber-200">
            <span className="font-bold flex items-center gap-1 mb-1">
              <AlertTriangle className="w-4 h-4" />
              Approved Communication
            </span>
            I confirm this communication has been reviewed and approved by an authorized representative.
            I am authorized to send this correspondence on behalf of the organisation named above.
          </label>
        </div>

        {/* Public toggle */}
        <button
          type="button"
          onClick={() => updateState({ isPublic: !state.isPublic })}
          className={`flex items-center gap-2 px-3 py-2 rounded-xl text-sm font-bold transition-all ${
            state.isPublic
              ? 'bg-emerald-50 text-emerald-700 border border-emerald-200'
              : 'bg-stone-100 dark:bg-stone-800 text-stone-500 border border-stone-200 dark:border-white/5'
          }`}
        >
          {state.isPublic ? <Eye className="w-4 h-4" /> : <EyeOff className="w-4 h-4" />}
          {state.isPublic
            ? 'Public — visible in the transparency register'
            : 'Private — only visible to authenticated users'}
        </button>
      </div>
    </div>
  );
}
