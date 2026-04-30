'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import { AlertTriangle, Wheat, Droplets, Heart, Globe2, Users, ShieldCheck, Gavel, Eye, CheckCircle2, Upload, FileText, type LucideIcon } from 'lucide-react';
import { issueCategoryService, type IssueCategory } from '@/services/issueCategoryService';
import { reportService } from '@/services/reportService';
import toast from 'react-hot-toast';

// Map icon names to lucide components
const ICON_MAP: Record<string, LucideIcon> = {
  AlertTriangle, Wheat, Droplets, Heart, Globe2, Users, ShieldCheck, Gavel, Eye,
};

const reportSchema = z.object({
  firstName: z.string().min(1, 'First name is required'),
  lastName: z.string().min(1, 'Last name is required'),
  email: z.string().email('Please enter a valid email'),
  category: z.string().min(1, 'Please select a category'),
  urgency: z.string().min(1, 'Please select an urgency level'),
  organizationName: z.string(),
  country: z.string(),
  subject: z.string().min(1, 'Subject is required'),
  description: z.string().min(10, 'Please provide at least 10 characters'),
  anonymous: z.boolean(),
});
type ReportFormValues = z.infer<typeof reportSchema>;

interface DisplayCategory {
  value: string;
  label: string;
  icon: LucideIcon;
  desc: string;
}

const FALLBACK_CATEGORIES: DisplayCategory[] = [
  { value: 'food_safety', label: 'Food Security & Safety', icon: Wheat, desc: 'Pesticides, GMO practices, food contamination, agricultural policy' },
  { value: 'water', label: 'Clean Water & Sanitation', icon: Droplets, desc: 'Water contamination, privatisation, pollution, access denial' },
  { value: 'public_health', label: 'Public Health', icon: Heart, desc: 'Pharmaceutical harm, healthcare access, drug safety, public health failures' },
  { value: 'environment', label: 'Environmental Justice', icon: Globe2, desc: 'Pollution, deforestation, climate negligence, toxic waste' },
  { value: 'workers_rights', label: 'Workers\' Rights', icon: Users, desc: 'Unsafe conditions, child labour, forced labour, wage theft' },
  { value: 'indigenous', label: 'Indigenous Rights', icon: ShieldCheck, desc: 'Land displacement, cultural destruction, consent violations' },
  { value: 'justice', label: 'Justice & Due Process', icon: Gavel, desc: 'Police brutality, arbitrary detention, fair trial violations' },
  { value: 'transparency', label: 'Right to Information', icon: Eye, desc: 'Government secrecy, censorship, whistleblower retaliation' },
  { value: 'other', label: 'Other Human Rights Issue', icon: AlertTriangle, desc: 'Any other issue affecting human dignity and rights' },
];

const URGENCY_LEVELS = [
  { value: 'informational', label: 'Informational', desc: 'General information or documentation' },
  { value: 'concern', label: 'Concern', desc: 'Potential or emerging issue requiring attention' },
  { value: 'urgent', label: 'Urgent', desc: 'Active harm occurring now or imminent' },
  { value: 'critical', label: 'Critical', desc: 'Immediate threat to life or safety' },
];

const DEFAULT_VALUES: ReportFormValues = {
  firstName: '',
  lastName: '',
  email: '',
  category: '',
  urgency: '',
  organizationName: '',
  country: '',
  subject: '',
  description: '',
  anonymous: false,
};

export default function ReportPage() {
  const [submitted, setSubmitted] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [categories, setCategories] = useState<DisplayCategory[]>(FALLBACK_CATEGORIES);
  const { register, handleSubmit, setValue, watch, formState: { errors }, reset } = useForm<ReportFormValues>({
    resolver: zodResolver(reportSchema),
    defaultValues: DEFAULT_VALUES,
  });
  const formData = watch();

  useEffect(() => {
    void (async () => {
      try {
        const data = await issueCategoryService.getActive();
        if (data.length > 0) {
          setCategories(data.map((cat) => ({
            value: cat.slug,
            label: cat.name,
            icon: ICON_MAP[cat.icon || ''] || AlertTriangle,
            desc: cat.description || '',
          })));
        }
      } catch {
        // Keep fallback categories
      }
    })();
  }, []);

  const selectedCategory = categories.find(c => c.value === formData.category);

  const onSubmit = async (data: ReportFormValues) => {
    if (submitting) return;
    setSubmitting(true);
    try {
      await reportService.submitReport(data);
      setSubmitted(true);
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to submit report. Please try again.');
    } finally {
      setSubmitting(false);
    }
  };

  if (submitted) {
    return (
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-12 animate-fade-in">
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-10 md:p-14 text-center">
          <div className="w-20 h-20 bg-emerald-50 dark:bg-emerald-900/20 rounded-full flex items-center justify-center mx-auto mb-8">
            <CheckCircle2 className="text-emerald-500" size={40} />
          </div>
          <h2 className="font-serif text-3xl font-black text-slate-900 dark:text-white mb-4">
            Report Submitted
          </h2>
          <p className="text-stone-500 dark:text-stone-400 leading-relaxed mb-4 max-w-lg mx-auto">
            Thank you, {formData.firstName}. Your report has been received by the New World Alliances
            Foundation Communication Division. Our team will review the information you provided.
          </p>
          <p className="text-stone-400 text-sm mb-8">
            A confirmation has been sent to <span className="font-bold text-stone-600 dark:text-stone-300">{formData.email}</span>.
            If you have additional evidence or information, please submit a follow-up report referencing the same subject.
          </p>
          <div className="flex flex-wrap gap-4 justify-center">
            <button
              onClick={() => { setSubmitted(false); setSubmitting(false); reset(DEFAULT_VALUES); }}
              className="px-6 py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all"
            >
              Submit Another Report
            </button>
            <Link
              href="/"
              className="px-6 py-3 bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-300 rounded-2xl font-bold hover:bg-stone-200 dark:hover:bg-stone-700 transition-all"
            >
              Back to Home
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12 animate-fade-in">
      {/* Header */}
      <div className="mb-10">
        <h1 className="font-serif text-4xl font-black text-slate-900 dark:text-white mb-3">
          Report an Issue
        </h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-6" />
        <p className="text-stone-500 dark:text-stone-400 text-lg max-w-3xl leading-relaxed">
          If you are aware of a human rights issue, corporate misconduct, or government negligence that
          the NWA Foundation should investigate, submit a report below. All submissions are reviewed by
          our Communication Division.
        </p>
      </div>

      <form onSubmit={handleSubmit(onSubmit)} className="space-y-8">
        {/* Reporter Information */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
          <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-2">Your Information</h2>
          <p className="text-stone-500 dark:text-stone-400 text-sm mb-6">
            We need a way to contact you about your report. Your information is kept confidential.
          </p>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
            <div>
              <label htmlFor="firstName" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                First Name *
              </label>
              <input
                id="firstName"
                type="text"
                {...register('firstName')}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
                placeholder="First name"
              />
              {errors.firstName && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.firstName.message}</p>}
            </div>
            <div>
              <label htmlFor="lastName" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                Last Name *
              </label>
              <input
                id="lastName"
                type="text"
                {...register('lastName')}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
                placeholder="Last name"
              />
              {errors.lastName && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.lastName.message}</p>}
            </div>
          </div>

          <div className="mt-5">
            <label htmlFor="email" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
              Email Address *
            </label>
            <input
              id="email"
              type="email"
              {...register('email')}
              className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
              placeholder="you@example.com"
            />
            {errors.email && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.email.message}</p>}
          </div>

          <div className="mt-5 flex items-start gap-3">
            <input
              id="anonymous"
              type="checkbox"
              {...register('anonymous')}
              className="mt-1 w-4 h-4 text-gold-600 border-stone-300 rounded focus:ring-gold-500"
            />
            <label htmlFor="anonymous" className="text-sm text-stone-600 dark:text-stone-400">
              I would prefer my identity to remain confidential. The NWA Foundation will not disclose
              my name in any follow-up actions related to this report.
            </label>
          </div>
        </div>

        {/* Issue Category */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
          <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-2">Issue Category</h2>
          <p className="text-stone-500 dark:text-stone-400 text-sm mb-6">
            Select the human rights area most relevant to your report.
          </p>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
            {categories.map((cat) => (
              <button
                key={cat.value}
                type="button"
                onClick={() => setValue('category', cat.value, { shouldValidate: true })}
                className={`text-left p-4 rounded-2xl border transition-all ${
                  formData.category === cat.value
                    ? 'border-gold-500 border-l-4 border-l-gold-500 bg-gold-50 dark:bg-gold-900/20 shadow-sm'
                    : 'border-stone-200 dark:border-white/5 hover:border-gold-300 hover:bg-stone-50 dark:hover:bg-white/5'
                }`}
              >
                <div className="flex items-center gap-3">
                  <div className={`w-8 h-8 rounded-lg flex items-center justify-center ${
                    formData.category === cat.value
                      ? 'bg-gold-200 dark:bg-gold-800/30 text-gold-700 dark:text-gold-400'
                      : 'bg-stone-100 dark:bg-stone-800 text-gold-600'
                  }`}>
                    <cat.icon size={16} />
                  </div>
                  <div>
                    <p className="text-sm font-bold text-slate-900 dark:text-white">{cat.label}</p>
                    <p className="text-[10px] text-stone-400 leading-tight mt-0.5">{cat.desc}</p>
                  </div>
                </div>
              </button>
            ))}
          </div>
          {errors.category && <p className="text-red-500 text-[10px] font-bold mt-2 ml-1">{errors.category.message}</p>}
        </div>

        {/* Urgency */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
          <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-2">Urgency Level</h2>
          <p className="text-stone-500 dark:text-stone-400 text-sm mb-6">
            Help us prioritise your report by indicating the severity of the issue.
          </p>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3">
            {URGENCY_LEVELS.map((level) => (
              <button
                key={level.value}
                type="button"
                onClick={() => setValue('urgency', level.value, { shouldValidate: true })}
                className={`text-left p-4 rounded-2xl border transition-all ${
                  formData.urgency === level.value
                    ? level.value === 'critical'
                      ? 'border-red-500 border-l-4 border-l-red-500 bg-red-50 dark:bg-red-900/20'
                      : level.value === 'urgent'
                        ? 'border-orange-500 border-l-4 border-l-orange-500 bg-orange-50 dark:bg-orange-900/20'
                        : 'border-gold-500 border-l-4 border-l-gold-500 bg-gold-50 dark:bg-gold-900/20'
                    : 'border-stone-200 dark:border-white/5 hover:border-stone-300 dark:hover:border-white/10'
                }`}
              >
                <p className="text-sm font-bold text-slate-900 dark:text-white">{level.label}</p>
                <p className="text-[10px] text-stone-400 mt-1">{level.desc}</p>
              </button>
            ))}
          </div>
          {errors.urgency && <p className="text-red-500 text-[10px] font-bold mt-2 ml-1">{errors.urgency.message}</p>}
        </div>

        {/* Who Is Involved */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
          <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-2">Who Is Involved</h2>
          <p className="text-stone-500 dark:text-stone-400 text-sm mb-6">
            Identify the government, corporation, or organization responsible. This helps us direct the report to the right team.
          </p>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
            <div>
              <label htmlFor="organizationName" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                Organization / Government Body
              </label>
              <input
                id="organizationName"
                type="text"
                {...register('organizationName')}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
                placeholder="e.g., Ministry of Health, Monsanto/Bayer"
              />
            </div>
            <div>
              <label htmlFor="country" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                Country
              </label>
              <input
                id="country"
                type="text"
                {...register('country')}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
                placeholder="e.g., New Zealand, United States"
              />
            </div>
          </div>
        </div>

        {/* Report Details */}
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
          <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-2">Report Details</h2>
          <p className="text-stone-500 dark:text-stone-400 text-sm mb-6">
            Provide as much detail as possible. The more context you give, the better we can assess and act on the issue.
          </p>

          <div className="space-y-5">
            <div>
              <label htmlFor="subject" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                Subject *
              </label>
              <input
                id="subject"
                type="text"
                {...register('subject')}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white"
                placeholder="Brief summary of the issue"
              />
              {errors.subject && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.subject.message}</p>}
            </div>

            <div>
              <label htmlFor="description" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                Full Description *
              </label>
              <textarea
                id="description"
                rows={8}
                {...register('description')}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm resize-none"
                placeholder="Describe the issue in detail. Include: what happened, who is affected, when it occurred, any evidence you are aware of, and how it relates to human rights..."
              />
              {errors.description && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.description.message}</p>}
            </div>

            {/* Evidence upload placeholder */}
            <div className="border-2 border-dashed border-stone-200 dark:border-white/10 rounded-2xl p-6 text-center">
              <Upload className="w-8 h-8 text-stone-400 mx-auto mb-3" />
              <p className="text-sm font-bold text-stone-600 dark:text-stone-400 mb-1">
                Supporting Evidence
              </p>
              <p className="text-xs text-stone-400 mb-3">
                Attach documents, photos, or files that support your report (coming soon)
              </p>
              <button
                type="button"
                disabled
                className="px-4 py-2 bg-stone-100 dark:bg-stone-800 text-stone-400 rounded-xl text-xs font-bold cursor-not-allowed"
              >
                <FileText size={14} className="inline mr-1" />
                Upload Files
              </button>
            </div>
          </div>
        </div>

        {/* Submit */}
        <div className="flex flex-col sm:flex-row items-center gap-4 pt-2">
          <button
            type="submit"
            disabled={submitting}
            className={`w-full sm:w-auto flex items-center justify-center gap-2 px-8 py-4 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 hover:scale-[1.02] active:scale-[0.98] transition-all text-base disabled:opacity-50 disabled:cursor-not-allowed ${formData.category && formData.urgency && formData.subject && formData.description ? 'animate-pulse-glow' : ''}`}
          >
            <AlertTriangle size={18} />
            {submitting ? 'Submitting...' : 'Submit Report'}
          </button>
          <p className="text-xs text-stone-400 text-center sm:text-left">
            By submitting, you confirm that the information provided is truthful to the best of your knowledge.
            All reports are treated with strict confidentiality.
          </p>
        </div>
      </form>
    </div>
  );
}
