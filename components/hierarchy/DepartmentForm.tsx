'use client';

import React, { useState } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import { Save, X, Loader2, AlertCircle } from 'lucide-react';
import type { Department, Organization } from '@/types';

const departmentSchema = z.object({
    name: z.string().min(2, 'Name must be at least 2 characters'),
    code: z.string().optional(),
    description: z.string().optional(),
    organisationId: z.string().uuid('Invalid organization'),
    parentId: z.string().uuid().nullable().optional(),
    isActive: z.boolean(),
});

type DepartmentFormValues = z.infer<typeof departmentSchema>;

interface DepartmentFormProps {
    initialData?: Partial<Department>;
    organizations: Organization[];
    onSubmit: (data: DepartmentFormValues) => Promise<void>;
    onCancel: () => void;
    isLoading?: boolean;
}

export default function DepartmentForm({
    initialData,
    organizations,
    onSubmit,
    onCancel,
    isLoading = false
}: DepartmentFormProps) {
    const [error, setError] = useState<string | null>(null);

    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm<DepartmentFormValues>({
        resolver: zodResolver(departmentSchema),
        defaultValues: {
            name: initialData?.name || '',
            code: initialData?.code || '',
            description: initialData?.description || '',
            organisationId: initialData?.organisationId || '',
            parentId: initialData?.parentId || null,
            isActive: initialData?.isActive ?? true,
        },
    });

    const handleFormSubmit = async (data: DepartmentFormValues) => {
        setError(null);
        try {
            await onSubmit(data);
        } catch (err) {
            setError(err instanceof Error ? err.message : 'An unexpected error occurred');
        }
    };

    return (
        <form onSubmit={handleSubmit(handleFormSubmit)} noValidate className="space-y-6">
            {error && (
                <div className="p-4 bg-red-50 border border-red-100 rounded-2xl flex items-center gap-3 text-red-600 text-sm">
                    <AlertCircle className="w-5 h-5" />
                    <p>{error}</p>
                </div>
            )}

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {/* Name */}
                <div className="space-y-2">
                    <label className="text-xs font-black uppercase text-stone-400 tracking-widest ml-1">
                        Department Name
                    </label>
                    <input
                        {...register('name')}
                        className={`
              w-full px-5 py-4 bg-stone-50 dark:bg-stone-800 border rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 transition-all
              ${errors.name ? 'border-red-300 ring-red-100' : 'border-stone-200 dark:border-white/5'}
            `}
                        placeholder="e.g. Finance"
                    />
                    {errors.name && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.name.message}</p>}
                </div>

                {/* Code */}
                <div className="space-y-2">
                    <label className="text-xs font-black uppercase text-stone-400 tracking-widest ml-1">
                        Department Code
                    </label>
                    <input
                        {...register('code')}
                        className="w-full px-5 py-4 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 transition-all"
                        placeholder="e.g. FIN-001"
                    />
                </div>

                {/* Organization */}
                <div className="space-y-2">
                    <label className="text-xs font-black uppercase text-stone-400 tracking-widest ml-1">
                        Organization
                    </label>
                    <select
                        {...register('organisationId')}
                        className="w-full px-5 py-4 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 transition-all"
                        disabled={!!initialData?.organisationId}
                    >
                        <option value="">Select Organization...</option>
                        {organizations.map(org => (
                            <option key={org.id} value={org.id}>{org.name}</option>
                        ))}
                    </select>
                    {errors.organisationId && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.organisationId.message}</p>}
                </div>

                {/* Visibility/Status */}
                <div className="space-y-2">
                    <label className="text-xs font-black uppercase text-stone-400 tracking-widest ml-1">
                        Status
                    </label>
                    <div className="flex items-center gap-4 py-4 px-5 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl">
                        <input
                            type="checkbox"
                            {...register('isActive')}
                            className="w-5 h-5 rounded border-stone-300 text-gold-600 focus:ring-gold-500"
                        />
                        <span className="text-sm font-medium text-slate-700 dark:text-stone-300">This department is active</span>
                    </div>
                </div>
            </div>

            {/* Description */}
            <div className="space-y-2">
                <label className="text-xs font-black uppercase text-stone-400 tracking-widest ml-1">
                    Description
                </label>
                <textarea
                    {...register('description')}
                    rows={4}
                    className="w-full px-5 py-4 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-[2rem] focus:outline-none focus:ring-2 focus:ring-gold-500 transition-all resize-none"
                    placeholder="Detailed description of the department's function..."
                />
            </div>

            {/* Actions */}
            <div className="flex items-center justify-end gap-4 pt-6 border-t border-stone-100 dark:border-white/5">
                <button
                    type="button"
                    onClick={onCancel}
                    className="px-8 py-3 bg-stone-100 dark:bg-stone-800 text-slate-700 dark:text-stone-300 rounded-2xl font-bold hover:bg-stone-200 transition-all flex items-center gap-2"
                >
                    <X className="w-4 h-4" />
                    Cancel
                </button>
                <button
                    type="submit"
                    disabled={isLoading}
                    className="px-10 py-3 bg-gradient-to-r from-gold-500 to-gold-600 text-white rounded-2xl font-bold shadow-lg shadow-gold-500/20 hover:scale-[1.02] active:scale-[0.98] transition-all flex items-center gap-2"
                >
                    {isLoading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
                    {initialData?.id ? 'Update Department' : 'Create Department'}
                </button>
            </div>
        </form>
    );
}
