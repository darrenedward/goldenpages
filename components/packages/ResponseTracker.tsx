'use client';

import React, { useState, useEffect } from 'react';
import { supabase } from '@/services/supabaseClient';
import {
    Users,
    Search,
    Filter,
    Clock,
    CheckCircle2,
    AlertCircle,
    MoreVertical,
    Mail,
    Phone
} from 'lucide-react';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import StatusBadge from '@/components/shared/StatusBadge';
import { notificationService } from '@/services/notificationService';
import { toast } from 'react-hot-toast';


export default function ResponseTracker({ packageId }: { packageId?: string }) {
    const [recipients, setRecipients] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [searchQuery, setSearchQuery] = useState('');

    useEffect(() => {
        void fetchRecipientResponses();
    }, [packageId]);

    const fetchRecipientResponses = async () => {
        setLoading(true);
        try {
            let query = supabase
                .from('package_recipients')
                .select(`
          *,
          department:departments(*),
          organisation:organisations(*),
          audit:package_audit_logs(count)
        `)
                .order('createdAt', { ascending: false });

            if (packageId) {
                query = query.eq('packageId', packageId);
            }

            const { data, error } = await query;
            if (error) throw error;
            setRecipients(data || []);
        } catch (error) {
            console.error('Failed to fetch responses:', error);
        } finally {
            setLoading(false);
        }
    };

    const handleResend = async (rec: any) => {
        try {
            const result = await notificationService.sendPackageNotification({
                recipientId: rec.id, // In real app, this would be a contact ID
                recipientEmail: rec.recipientEmail || 'contact@example.gov',
                recipientName: rec.recipientName || rec.department?.name,
                packageId: rec.packageId,
                packageName: 'Document Package Update',
                documentCount: 0
            });

            if (result.success) {
                toast.success('Notification resent successfully');
                void fetchRecipientResponses();
            } else {
                toast.error('Failed to resend notification');
            }
        } catch (error) {
            toast.error('An error occurred');
        }
    };


    const filtered = recipients.filter(rec =>
        rec.department?.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        rec.organisation?.name.toLowerCase().includes(searchQuery.toLowerCase())
    );

    if (loading) return <LoadingSpinner message="Loading response analytics..." />;

    return (
        <div className="bg-white dark:bg-slate-900 rounded-[2.5rem] border border-stone-200 dark:border-white/5 shadow-sm overflow-hidden">
            <div className="p-8 border-b border-stone-100 dark:border-white/5 flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div>
                    <h2 className="font-serif text-2xl font-bold text-slate-800 dark:text-white">Response Tracker</h2>
                    <p className="text-sm text-stone-500">Monitor distribution and acknowledgment status</p>
                </div>
                <div className="relative w-full md:w-64">
                    <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                    <input
                        type="text"
                        placeholder="Search recipients..."
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        className="w-full pl-10 pr-4 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
                    />
                </div>
            </div>

            <div className="overflow-x-auto">
                <table className="w-full text-left">
                    <thead className="bg-stone-50 dark:bg-white/5 text-[10px] font-black uppercase tracking-widest text-stone-400">
                        <tr>
                            <th className="px-8 py-4">Recipient Department</th>
                            <th className="px-4 py-4">Organization</th>
                            <th className="px-4 py-4">Delivery</th>
                            <th className="px-4 py-4">Status</th>
                            <th className="px-4 py-4">Activity</th>
                            <th className="px-8 py-4 text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody className="divide-y divide-stone-100 dark:divide-white/5">
                        {filtered.map((rec) => (
                            <tr key={rec.id} className="hover:bg-stone-50 dark:hover:bg-white/5 transition-colors group">
                                <td className="px-8 py-5">
                                    <p className="font-bold text-slate-800 dark:text-white">{rec.department?.name}</p>
                                    <p className="text-xs text-stone-500">{rec.recipientName || 'Unassigned'}</p>
                                </td>
                                <td className="px-4 py-5 text-sm text-stone-600 dark:text-stone-400">
                                    {rec.organisation?.name}
                                </td>
                                <td className="px-4 py-5">
                                    <div className="flex items-center gap-2">
                                        <div className={`w-2 h-2 rounded-full ${rec.deliveryStatus === 'DELIVERED' ? 'bg-emerald-500' :
                                            rec.deliveryStatus === 'SENT' ? 'bg-gold-500' : 'bg-stone-300'
                                            }`} />
                                        <span className="text-[10px] font-bold text-slate-500 uppercase tracking-wider">{rec.deliveryStatus}</span>
                                    </div>
                                    {rec.sentAt && (
                                        <p className="text-[10px] text-stone-400 mt-1">{new Date(rec.sentAt).toLocaleDateString()}</p>
                                    )}
                                </td>
                                <td className="px-4 py-5">
                                    <StatusBadge status={rec.status || 'PENDING'} size="sm" />
                                </td>
                                <td className="px-4 py-5">
                                    <div className="flex items-center gap-1.5 text-stone-500 text-xs">
                                        <Clock size={14} />
                                        <span>{rec.audit?.[0]?.count || 0} Events</span>
                                    </div>
                                </td>
                                <td className="px-8 py-5 text-right">
                                    <div className="flex items-center justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
                                        <button
                                            onClick={() => void handleResend(rec)}
                                            className="p-2 hover:bg-gold-50 text-gold-600 rounded-lg"
                                            title="Resend Notification"
                                        >
                                            <Mail size={16} />
                                        </button>
                                        <button className="p-2 hover:bg-stone-100 text-stone-400 rounded-lg"><MoreVertical size={16} /></button>
                                    </div>
                                </td>

                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            {filtered.length === 0 && (
                <div className="p-20 text-center text-stone-400 italic">
                    No recipients found for this package.
                </div>
            )}
        </div>
    );
}
