'use client';

import React, { useState } from 'react';
import { ArrowLeft, ArrowRight, Check, Loader2 } from 'lucide-react';
import { communicationService } from '@/services/communicationService';
import { useAuth } from '@/lib/authContext';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';
import { toast } from 'react-hot-toast';
import type { CommunicationType } from '@/types';
import WizardStepDetails from './WizardStepDetails';
import WizardStepRecipients from './WizardStepRecipients';
import WizardStepDocuments from './WizardStepDocuments';
import WizardStepReview from './WizardStepReview';

interface CreateCommunicationWizardProps {
  onCancel: () => void;
  onSubmit: (communicationId: string) => void;
  preselectedRecipients?: { departmentId: string; contactId?: string }[];
}

export interface WizardState {
  // Step 1: Details
  title: string;
  description: string;
  communicationType: CommunicationType;
  category: string;
  categoryId: string | undefined;
  tags: string[];
  senderOrganisation: string;
  // Step 2: Recipients
  recipients: { departmentId: string; contactId?: string; departmentName?: string; contactName?: string }[];
  // Step 3: Documents
  files: { file: File; isPublic: boolean }[];
  // Step 4: Review
  expectedResponseDays: number;
  isPublic: boolean;
  isApproved: boolean;
}

const INITIAL_STATE: WizardState = {
  title: '',
  description: '',
  communicationType: 'letter',
  category: '',
  categoryId: undefined,
  tags: [],
  senderOrganisation: '',
  recipients: [],
  files: [],
  expectedResponseDays: 20,
  isPublic: true,
  isApproved: false,
};

const STEPS = [
  { key: 'details', label: 'Details', icon: '📝' },
  { key: 'recipients', label: 'Recipients', icon: '👥' },
  { key: 'documents', label: 'Documents', icon: '📄' },
  { key: 'review', label: 'Review', icon: '✅' },
];

export default function CreateCommunicationWizard({
  onCancel,
  onSubmit,
  preselectedRecipients,
}: CreateCommunicationWizardProps) {
  const [step, setStep] = useState(0);
  const [state, setState] = useState<WizardState>({
    ...INITIAL_STATE,
    recipients: preselectedRecipients || [],
  });
  const [submitting, setSubmitting] = useState(false);
  const { user } = useAuth();

  const updateState = (updates: Partial<WizardState>) => {
    setState(prev => ({ ...prev, ...updates }));
  };

  const canGoNext = (): boolean => {
    switch (step) {
      case 0: return state.title.trim().length > 0;
      case 1: return state.recipients.length > 0;
      case 2: return true; // Documents are optional
      case 3: return state.isApproved;
      default: return false;
    }
  };

  const handleSubmit = async () => {
    if (!user?.id) return;
    setSubmitting(true);
    try {
      const communication = await communicationService.createCommunication(
        {
          title: state.title.trim(),
          description: state.description.trim() || undefined,
          communicationType: state.communicationType,
          category: state.category.trim() || undefined,
          categoryId: state.categoryId || undefined,
          tags: state.tags,
          senderOrganisation: state.senderOrganisation.trim() || undefined,
          expectedResponseDays: state.expectedResponseDays,
          isPublic: state.isPublic,
          isApproved: state.isApproved,
          recipients: state.recipients.map(r => ({
            departmentId: r.departmentId,
            contactId: r.contactId,
          })),
        },
        user.id
      );

      // Upload documents
      for (const { file, isPublic: filePublic } of state.files) {
        await communicationService.uploadDocument(
          communication.id,
          file,
          'sent',
          filePublic,
          user.id
        );
      }

      toast.success('Communication created successfully');
      onSubmit(communication.id);
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to create communication');
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="p-6 bg-stone-50 min-h-screen">
      <BreadcrumbNav
        items={[
          { label: 'Communications', onClick: onCancel },
          { label: 'New Communication' },
        ]}
      />

      <h1 className="font-serif text-3xl text-slate-800 dark:text-white mb-2">New Communication</h1>
      <p className="text-stone-500 dark:text-stone-400 mb-6">
        Create a multi-recipient communication with documents and response tracking.
      </p>

      {/* Step indicator */}
      <div className="flex items-center gap-2 mb-8">
        {STEPS.map((s, i) => (
          <React.Fragment key={s.key}>
            <button
              type="button"
              onClick={() => i < step && setStep(i)}
              className={`flex items-center gap-2 px-4 py-2 rounded-xl text-sm font-bold transition-all ${
                i === step
                  ? 'bg-gold-600 text-white'
                  : i < step
                  ? 'bg-emerald-50 text-emerald-700 cursor-pointer hover:bg-emerald-100'
                  : 'bg-stone-100 dark:bg-stone-800 text-stone-400'
              }`}
            >
              {i < step ? (
                <Check className="w-4 h-4" />
              ) : (
                <span>{s.icon}</span>
              )}
              <span className="hidden sm:inline">{s.label}</span>
            </button>
            {i < STEPS.length - 1 && (
              <div className={`w-8 h-0.5 ${i < step ? 'bg-emerald-300' : 'bg-stone-200 dark:bg-stone-700'}`} />
            )}
          </React.Fragment>
        ))}
      </div>

      {/* Step content */}
      <div className="max-w-3xl">
        {step === 0 && (
          <WizardStepDetails state={state} updateState={updateState} />
        )}
        {step === 1 && (
          <WizardStepRecipients state={state} updateState={updateState} />
        )}
        {step === 2 && (
          <WizardStepDocuments state={state} updateState={updateState} />
        )}
        {step === 3 && (
          <WizardStepReview state={state} updateState={updateState} />
        )}
      </div>

      {/* Navigation */}
      <div className="flex items-center gap-3 mt-8 max-w-3xl">
        <button
          type="button"
          onClick={onCancel}
          className="px-6 py-3 bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-300 rounded-2xl font-bold hover:bg-stone-200 dark:hover:bg-stone-700 transition-all"
        >
          Cancel
        </button>

        {step > 0 && (
          <button
            type="button"
            onClick={() => setStep(step - 1)}
            className="flex items-center gap-2 px-6 py-3 bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-300 rounded-2xl font-bold hover:bg-stone-200 dark:hover:bg-stone-700 transition-all"
          >
            <ArrowLeft className="w-4 h-4" />
            Back
          </button>
        )}

        <div className="flex-1" />

        {step < 3 ? (
          <button
            type="button"
            onClick={() => setStep(step + 1)}
            disabled={!canGoNext()}
            className="flex items-center gap-2 px-6 py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
          >
            Next
            <ArrowRight className="w-4 h-4" />
          </button>
        ) : (
          <button
            type="button"
            onClick={() => void handleSubmit()}
            disabled={submitting || !state.isApproved}
            className="flex items-center gap-2 px-6 py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {submitting ? (
              <>
                <Loader2 className="w-4 h-4 animate-spin" />
                Creating...
              </>
            ) : (
              <>
                <Check className="w-4 h-4" />
                Create Communication
              </>
            )}
          </button>
        )}
      </div>
    </div>
  );
}
