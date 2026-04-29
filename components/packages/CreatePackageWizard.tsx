'use client';

import React, { useState } from 'react';
import {
    Package,
    ChevronRight,
    ChevronLeft,
    BarChart3,
    Users,
    FileText,
    Check,
    X,
    Plus,
    Trash2,
    Upload,
    AlertCircle
} from 'lucide-react';
import DepartmentSelector from '@/components/hierarchy/DepartmentSelector';
import StatusBadge from '@/components/shared/StatusBadge';
import { supabase } from '@/services/supabaseClient';
import { notificationService } from '@/services/notificationService';


type WizardStep = 'basics' | 'contents' | 'recipients' | 'review';

export default function CreatePackageWizard({ onCancel, onComplete }: { onCancel: () => void; onComplete: () => void }) {
    const [step, setStep] = useState<WizardStep>('basics');
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    // Form State
    const [pkgData, setPkgData] = useState({
        name: '',
        description: '',
        type: 'STANDARD'
    });

    const [subPackages, setSubPackages] = useState<{ id: string; name: string; documents: File[] }[]>([]);
    const [selectedRecipientIds, setSelectedRecipientIds] = useState<Set<string>>(new Set());
    const [draggedFile, setDraggedFile] = useState<File | null>(null);
    const [dragOverSubPkg, setDragOverSubPkg] = useState<string | null>(null);

    const steps: { id: WizardStep; label: string; icon: any }[] = [
        { id: 'basics', label: 'Basic Info', icon: Package },
        { id: 'contents', label: 'Contents', icon: BarChart3 },
        { id: 'recipients', label: 'Recipients', icon: Users },
        { id: 'review', label: 'Review & Post', icon: FileText }
    ];

    const handleNext = () => {
        if (step === 'basics') setStep('contents');
        else if (step === 'contents') setStep('recipients');
        else if (step === 'recipients') setStep('review');
    };

    const handleBack = () => {
        if (step === 'contents') setStep('basics');
        else if (step === 'recipients') setStep('contents');
        else if (step === 'review') setStep('recipients');
    };

    const addSubPackage = () => {
        setSubPackages([...subPackages, { id: crypto.randomUUID(), name: `Sub-package ${subPackages.length + 1}`, documents: [] }]);
    };

    // File handling functions
    const handleFileSelect = (subPackageId: string, files: FileList | null) => {
        if (!files || files.length === 0) return;

        const newFiles = Array.from(files);
        setSubPackages(prev => prev.map(sp => {
            if (sp.id === subPackageId) {
                const existingFiles = sp.documents || [];
                return { ...sp, documents: [...existingFiles, ...newFiles] };
            }
            return sp;
        }));
    };

    const handleFileDrop = (e: React.DragEvent, subPackageId: string) => {
        e.preventDefault();
        setDragOverSubPkg(null);

        if (e.dataTransfer.files && e.dataTransfer.files.length > 0) {
            handleFileSelect(subPackageId, e.dataTransfer.files);
        }
    };

    const handleDragOver = (e: React.DragEvent, subPackageId: string) => {
        e.preventDefault();
        setDragOverSubPkg(subPackageId);
    };

    const handleDragLeave = () => {
        setDragOverSubPkg(null);
    };

    const removeFile = (subPackageId: string, fileIndex: number) => {
        setSubPackages(prev => prev.map(sp => {
            if (sp.id === subPackageId && sp.documents) {
                const newDocs = [...sp.documents];
                newDocs.splice(fileIndex, 1);
                return { ...sp, documents: newDocs };
            }
            return sp;
        }));
    };

    const toggleRecipient = (id: string) => {
        const next = new Set(selectedRecipientIds);
        if (next.has(id)) next.delete(id);
        else next.add(id);
        setSelectedRecipientIds(next);
    };

    const handleFinalize = async () => {
        setLoading(true);
        setError(null);
        try {
            // 1. Create Package
            const { data: pkg, error: pkgError } = await supabase
                .from('packages')
                .insert({
                    name: pkgData.name,
                    description: pkgData.description,
                    status: 'SENT',
                    createdBy: (await supabase.auth.getUser()).data.user?.id || null
                })
                .select()
                .single();

            if (pkgError) throw pkgError;

            // 2. Create Sub-packages
            if (subPackages.length > 0) {
                const subPkgItems = subPackages.map((sp, idx) => ({
                    packageId: pkg.id,
                    name: sp.name,
                    sequence: idx,
                    status: 'SENT'
                }));
                const { error: subError } = await supabase.from('sub_packages').insert(subPkgItems);
                if (subError) throw subError;
            }

            // 3. Create Recipients & Send Notifications
            if (selectedRecipientIds.size > 0) {
                const recipientIds = Array.from(selectedRecipientIds);

                // Fetch contact details for these departments to send emails
                const { data: contacts } = await supabase
                    .from('contacts')
                    .select('*, organisation:organisations(name)')
                    .in('departmentId', recipientIds);

                const recipientItems = recipientIds.map(deptId => ({
                    packageId: pkg.id,
                    departmentId: deptId,
                    deliveryStatus: 'SENDING',
                    status: 'PENDING'
                }));

                const { error: recError } = await supabase.from('package_recipients').insert(recipientItems);
                if (recError) throw recError;

                // Trigger simulated notifications
                if (contacts && contacts.length > 0) {
                    const notifications = contacts.map(c => ({
                        recipientId: c.id,
                        recipientEmail: `${c.fullName.toLowerCase().replace(' ', '.')}@example.gov`, // Mock email
                        recipientName: c.fullName,
                        packageId: pkg.id,
                        packageName: pkg.name,
                        documentCount: 0 // In real app, count documents
                    }));

                    await notificationService.batchSendNotifications(notifications);
                }
            }

            onComplete();
        } catch (err: any) {
            console.error('Failed to create package:', err);
            setError(err.message || 'An unexpected error occurred');
        } finally {
            setLoading(false);
        }
    };


    return (
        <div className="max-w-5xl mx-auto">
            {/* Wizard Header */}
            <div className="mb-8 flex items-center justify-between">
                <div>
                    <h1 className="font-serif text-3xl text-slate-800 dark:text-white mb-2">Create Document Package</h1>
                    <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24" />
                </div>
                <button onClick={onCancel} className="p-2 hover:bg-stone-100 dark:hover:bg-white/5 rounded-full text-stone-400 transition-colors">
                    <X size={24} />
                </button>
            </div>

            {/* Stepper */}
            <div className="flex items-center justify-between mb-10 bg-white dark:bg-slate-900 p-4 rounded-3xl border border-stone-200 dark:border-white/5 shadow-sm">
                {steps.map((s, idx) => {
                    const Icon = s.icon;
                    const isActive = step === s.id;
                    const isPast = steps.findIndex(x => x.id === step) > idx;

                    return (
                        <React.Fragment key={s.id}>
                            <div className="flex flex-col items-center gap-2 flex-1">
                                <div className={`
                  w-10 h-10 rounded-xl flex items-center justify-center transition-all duration-300
                  ${isActive ? 'bg-gold-500 text-white shadow-lg shadow-gold-500/20 scale-110' :
                                        isPast ? 'bg-emerald-500 text-white' : 'bg-stone-100 dark:bg-stone-800 text-stone-400'}
                `}>
                                    {isPast ? <Check size={20} /> : <Icon size={20} />}
                                </div>
                                <span className={`text-[10px] font-black uppercase tracking-widest ${isActive ? 'text-gold-600' : 'text-stone-400'}`}>
                                    {s.label}
                                </span>
                            </div>
                            {idx < steps.length - 1 && (
                                <div className="w-12 h-px bg-stone-200 dark:bg-white/10" />
                            )}
                        </React.Fragment>
                    );
                })}
            </div>

            {/* Step Content */}
            <div className="bg-white dark:bg-slate-900 rounded-[2.5rem] shadow-sm border border-stone-200 dark:border-white/5 p-10 min-h-[500px] transition-all">
                {step === 'basics' && (
                    <div className="space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
                        <div className="space-y-2">
                            <label className="text-xs font-black uppercase text-stone-400 tracking-widest ml-1">Package Name</label>
                            <input
                                type="text"
                                value={pkgData.name}
                                onChange={(e) => setPkgData({ ...pkgData, name: e.target.value })}
                                placeholder="e.g. Q1 Infrastructure Reporting"
                                className="w-full px-6 py-4 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 transition-all text-lg font-serif"
                            />
                        </div>
                        <div className="space-y-2">
                            <label className="text-xs font-black uppercase text-stone-400 tracking-widest ml-1">Description</label>
                            <textarea
                                rows={5}
                                value={pkgData.description}
                                onChange={(e) => setPkgData({ ...pkgData, description: e.target.value })}
                                placeholder="Describe the contents and purpose of this package..."
                                className="w-full px-6 py-4 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-[2rem] focus:outline-none focus:ring-2 focus:ring-gold-500 transition-all resize-none"
                            />
                        </div>
                    </div>
                )}

                {step === 'contents' && (
                    <div className="space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
                        <div className="flex items-center justify-between">
                            <div>
                                <h3 className="text-xl font-serif font-bold text-slate-800 dark:text-white">Sub-packages</h3>
                                <p className="text-sm text-stone-500">Organize your documents into logical groups</p>
                            </div>
                            <button
                                onClick={addSubPackage}
                                className="flex items-center gap-2 px-4 py-2 bg-gold-50 text-gold-600 rounded-xl font-bold hover:bg-gold-100 transition-all text-sm"
                            >
                                <Plus size={18} /> Add Sub-package
                            </button>
                        </div>

                        {subPackages.length === 0 ? (
                            <div className="py-20 border-2 border-dashed border-stone-100 dark:border-white/5 rounded-[2rem] flex flex-col items-center justify-center text-stone-400">
                                <BarChart3 className="w-12 h-12 mb-4 opacity-20" />
                                <p className="text-sm">No sub-packages added yet</p>
                            </div>
                        ) : (
                            <div className="space-y-4">
                                {subPackages.map((sp, idx) => (
                                    <div key={sp.id} className="p-6 bg-stone-50 dark:bg-white/5 rounded-3xl border border-stone-200 dark:border-white/5 group relative">
                                        <div className="flex items-center justify-between mb-4">
                                            <div className="flex items-center gap-3">
                                                <div className="w-8 h-8 rounded-lg bg-gold-100 flex items-center justify-center text-gold-600">
                                                    <span className="text-xs font-bold">{idx + 1}</span>
                                                </div>
                                                <input
                                                    type="text"
                                                    value={sp.name}
                                                    onChange={(e) => {
                                                        const next = [...subPackages];
                                                        next[idx].name = e.target.value;
                                                        setSubPackages(next);
                                                    }}
                                                    className="bg-transparent border-none text-slate-800 dark:text-white font-bold focus:outline-none focus:ring-0 p-0"
                                                />
                                            </div>
                                            <button
                                                onClick={() => setSubPackages(subPackages.filter(p => p.id !== sp.id))}
                                                className="text-stone-300 hover:text-red-500 transition-colors"
                                            >
                                                <Trash2 size={18} />
                                            </button>
                                        </div>
                                        {/* Document Upload Area */}
                                        <div
                                            className={`p-8 border-2 border-dashed rounded-2xl flex flex-col transition-all ${
                                                dragOverSubPkg === sp.id
                                                    ? 'border-gold-500 bg-gold-50 dark:bg-gold-900/20'
                                                    : 'border-stone-200 dark:border-white/10 bg-stone-50 dark:bg-white/5 hover:border-gold-300'
                                            }`}
                                            onDrop={(e) => handleFileDrop(e, sp.id)}
                                            onDragOver={(e) => handleDragOver(e, sp.id)}
                                            onDragLeave={handleDragLeave}
                                        >
                                            {/* Hidden file input */}
                                            <input
                                                type="file"
                                                multiple
                                                accept=".pdf,.doc,.docx,.xls,.xlsx"
                                                onChange={(e) => handleFileSelect(sp.id, e.target.files)}
                                                className="hidden"
                                                id={`file-input-${sp.id}`}
                                            />

                                            {/* Upload State */}
                                            {(sp.documents?.length ?? 0) === 0 ? (
                                                <>
                                                    <Upload className="w-12 h-12 mb-3 opacity-30" />
                                                    <div>
                                                        <p className="text-xs font-bold uppercase tracking-widest text-center">
                                                            Drag & Drop or Click to Upload
                                                        </p>
                                                        <p className="text-sm text-stone-500 mt-1">
                                                            PDF, Word, or Spreadsheet
                                                        </p>
                                                    </div>
                                                </>
                                            ) : (
                                                <>
                                                    <div className="flex items-center justify-between mb-3">
                                                        <div className="flex items-center gap-2">
                                                            <Upload className="w-6 h-6 text-stone-400" />
                                                            <span className="text-sm font-medium text-stone-700 dark:text-stone-300">
                                                                {sp.documents?.length || 0} file{(sp.documents?.length || 0) !== 1 ? 's' : ''}
                                                            </span>
                                                        </div>
                                                        <button
                                                            onClick={() => {
                                                                const input = document.getElementById(`file-input-${sp.id}`) as HTMLInputElement;
                                                                input?.click();
                                                            }}
                                                            className="px-3 py-1.5 text-gold-600 dark:text-gold-400 rounded-lg font-bold hover:bg-gold-50 dark:hover:bg-gold-900/20 text-sm transition-all"
                                                        >
                                                            Add More
                                                        </button>
                                                    </div>

                                                    {/* File List */}
                                                    <div className="space-y-2">
                                                        {sp.documents?.map((file, idx) => (
                                                            <div
                                                                key={`${sp.id}-${idx}`}
                                                                className="flex items-center justify-between p-3 bg-stone-100 dark:bg-stone-800 rounded-lg border border-stone-200 dark:border-white/10 group"
                                                            >
                                                                <div className="flex items-center gap-3 min-w-0">
                                                                    <div className="w-8 h-8 rounded bg-gradient-to-br from-blue-100 to-blue-200 dark:from-blue-900/30 dark:to-blue-800 flex items-center justify-center text-blue-600 dark:text-blue-400">
                                                                        <FileText size={16} />
                                                                    </div>
                                                                    <div className="min-w-0">
                                                                        <p className="font-medium text-stone-800 dark:text-white text-sm truncate pr-2">
                                                                            {file.name}
                                                                        </p>
                                                                        <p className="text-xs text-stone-500 dark:text-stone-400">
                                                                            {(file.size / 1024).toFixed(1)} KB
                                                                        </p>
                                                                    </div>
                                                                </div>

                                                                {/* Remove Button */}
                                                                <button
                                                                    onClick={() => removeFile(sp.id, idx)}
                                                                    className="opacity-0 group-hover:opacity-100 transition-opacity p-1 text-stone-400 hover:text-red-500"
                                                                >
                                                                    <Trash2 size={16} />
                                                                </button>
                                                            </div>
                                                        ))}
                                                    </div>
                                                </>
                                            )}
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>
                )}

                {step === 'recipients' && (
                    <div className="space-y-6 animate-in fade-in slide-in-from-bottom-4 duration-500">
                        <div className="flex items-center justify-between">
                            <div>
                                <h3 className="text-xl font-serif font-bold text-slate-800 dark:text-white">Recipients</h3>
                                <p className="text-sm text-stone-500">Select which departments will receive this package</p>
                            </div>
                        </div>

                        <DepartmentSelector
                            selectedIds={selectedRecipientIds}
                            onToggle={toggleRecipient}
                            onClearAll={() => setSelectedRecipientIds(new Set())}
                            onSelectAll={(ids) => setSelectedRecipientIds(new Set([...Array.from(selectedRecipientIds), ...ids]))}
                        />
                    </div>
                )}

                {step === 'review' && (
                    <div className="space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
                        <div className="bg-gold-50 dark:bg-gold-900/20 p-8 rounded-[2rem] border border-gold-100 dark:border-gold-500/20">
                            <h3 className="text-gold-900 dark:text-gold-400 text-[10px] font-black uppercase tracking-widest mb-4">Package Identity</h3>
                            <h2 className="font-serif text-3xl font-bold text-slate-800 dark:text-white mb-2">{pkgData.name || 'Untitled Package'}</h2>
                            <p className="text-slate-600 dark:text-stone-400">{pkgData.description || 'No description provided'}</p>
                        </div>

                        <div className="grid grid-cols-2 gap-6">
                            <div className="p-6 bg-stone-50 dark:bg-white/5 rounded-3xl border border-stone-200 dark:border-white/5">
                                <h4 className="text-[10px] font-black uppercase tracking-widest text-stone-400 mb-4">Content Summary</h4>
                                <div className="space-y-3">
                                    <div className="flex items-center justify-between">
                                        <span className="text-sm text-slate-600">Sub-packages</span>
                                        <span className="text-sm font-bold">{subPackages.length}</span>
                                    </div>
                                    <div className="flex items-center justify-between">
                                        <span className="text-sm text-slate-600">Total Documents</span>
                                        <span className="text-sm font-bold">0</span>
                                    </div>
                                </div>
                            </div>
                            <div className="p-6 bg-stone-50 dark:bg-white/5 rounded-3xl border border-stone-200 dark:border-white/5">
                                <h4 className="text-[10px] font-black uppercase tracking-widest text-stone-400 mb-4">Distribution</h4>
                                <div className="space-y-3">
                                    <div className="flex items-center justify-between">
                                        <span className="text-sm text-slate-600">Target Departments</span>
                                        <span className="text-sm font-bold">{selectedRecipientIds.size}</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {/* Safety Warning */}
                        <div className="flex items-start gap-4 p-6 bg-amber-50 dark:bg-amber-900/20 border border-amber-100 dark:border-amber-500/20 rounded-2xl text-amber-800 dark:text-amber-400">
                            <AlertCircle className="w-6 h-6 shrink-0" />
                            <div className="text-sm">
                                <p className="font-bold mb-1">Final Review Required</p>
                                <p>Review all documents for sensitive information before posting. Once sent, notifications will be dispatched to all selected department contacts.</p>
                            </div>
                        </div>
                    </div>
                )}
            </div>

            {/* Wizard Actions */}
            <div className="mt-8 flex items-center justify-between p-6 bg-slate-900 rounded-3xl shadow-xl shadow-slate-900/20 border border-gold-600/30">
                <button
                    onClick={step === 'basics' ? onCancel : handleBack}
                    className="flex items-center gap-2 px-6 py-3 text-slate-400 hover:text-white transition-all font-bold"
                >
                    {step === 'basics' ? <X size={20} /> : <ChevronLeft size={20} />}
                    {step === 'basics' ? 'Cancel' : 'Back'}
                </button>

                <div className="flex items-center gap-4">
                    {step === 'review' ? (
                        <button
                            onClick={handleFinalize}
                            disabled={loading}
                            className={`bg-gradient-to-r from-emerald-500 to-emerald-600 text-white px-10 py-3 rounded-2xl font-bold shadow-lg shadow-emerald-500/20 hover:scale-[1.02] active:scale-[0.98] transition-all flex items-center gap-3 ${loading ? 'opacity-70 cursor-not-allowed' : ''}`}
                        >
                            {loading ? 'Processing...' : 'Finalize & Send'} <Check size={20} />
                        </button>
                    ) : (

                        <button
                            onClick={handleNext}
                            disabled={step === 'basics' && !pkgData.name}
                            className="bg-gradient-to-r from-gold-500 to-gold-600 text-white px-10 py-3 rounded-2xl font-bold shadow-lg shadow-gold-500/20 hover:scale-[1.02] active:scale-[0.98] transition-all disabled:opacity-50 disabled:hover:scale-100 flex items-center gap-3"
                        >
                            Next Step <ChevronRight size={20} />
                        </button>
                    )}
                </div>
            </div>
        </div>
    );
}
