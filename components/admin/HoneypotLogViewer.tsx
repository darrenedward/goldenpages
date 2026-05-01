'use client';

import { useState, useEffect } from 'react';
import { Bug, Trash2, RefreshCw, ExternalLink } from 'lucide-react';
import { supabase } from '@/services/supabaseClient';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';
import toast from 'react-hot-toast';

interface HoneypotLog {
  id: string;
  form_name: string;
  honeypot_value: string;
  user_agent: string;
  created_at: string;
}

const FORM_LABELS: Record<string, string> = {
  contact: 'Contact Form',
  report: 'Report Form',
  newsletter: 'Newsletter',
};

export default function HoneypotLogViewer() {
  const [logs, setLogs] = useState<HoneypotLog[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    void fetchLogs();
  }, []);

  const fetchLogs = async () => {
    setLoading(true);
    try {
      const { data, error } = await supabase
        .from('honeypot_logs')
        .select('*')
        .order('created_at', { ascending: false })
        .limit(100);

      if (error) throw error;
      setLogs(data || []);
    } catch (err) {
      console.error('Failed to fetch honeypot logs:', err);
    } finally {
      setLoading(false);
    }
  };

  const clearLogs = async () => {
    if (!confirm('Delete all honeypot logs?')) return;
    try {
      await supabase.from('honeypot_logs').delete().neq('id', '');
      toast.success('Logs cleared');
      setLogs([]);
    } catch {
      toast.error('Failed to clear logs');
    }
  };

  const formatDate = (dateStr: string) => {
    return new Date(dateStr).toLocaleDateString('en-US', {
      month: 'short', day: 'numeric', year: 'numeric',
      hour: '2-digit', minute: '2-digit',
    });
  };

  const formCounts = logs.reduce<Record<string, number>>((acc, log) => {
    acc[log.form_name] = (acc[log.form_name] || 0) + 1;
    return acc;
  }, {});

  return (
    <div className="space-y-6">
      <BreadcrumbNav items={[{ label: 'Spam Log' }]} />

      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 bg-red-50 dark:bg-red-900/20 rounded-xl flex items-center justify-center text-red-500">
            <Bug className="w-5 h-5" />
          </div>
          <div>
            <h2 className="font-serif text-xl font-bold text-slate-800 dark:text-white">
              Honeypot Spam Log
            </h2>
            <p className="text-xs text-stone-400">
              Bot submissions caught by hidden honeypot fields
            </p>
          </div>
        </div>
        <div className="flex gap-2">
          <button
            onClick={() => void fetchLogs()}
            className="p-2 rounded-xl bg-stone-100 dark:bg-stone-800 text-stone-500 hover:text-stone-700 transition-colors"
            title="Refresh"
          >
            <RefreshCw className="w-4 h-4" />
          </button>
          {logs.length > 0 && (
            <button
              onClick={() => void clearLogs()}
              className="flex items-center gap-1.5 px-3 py-2 bg-red-50 dark:bg-red-900/20 text-red-600 rounded-xl text-xs font-bold hover:bg-red-100 transition-colors"
            >
              <Trash2 className="w-3.5 h-3.5" />
              Clear All
            </button>
          )}
        </div>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
        <div className="bg-white dark:bg-slate-900 rounded-2xl border border-stone-200 dark:border-white/5 p-4 text-center">
          <p className="text-2xl font-bold text-slate-800 dark:text-white">{logs.length}</p>
          <p className="text-xs text-stone-400">Total Caught</p>
        </div>
        {Object.entries(formCounts).map(([form, count]) => (
          <div key={form} className="bg-white dark:bg-slate-900 rounded-2xl border border-stone-200 dark:border-white/5 p-4 text-center">
            <p className="text-2xl font-bold text-slate-800 dark:text-white">{count}</p>
            <p className="text-xs text-stone-400">{FORM_LABELS[form] || form}</p>
          </div>
        ))}
      </div>

      {/* Log table */}
      {loading ? (
        <div className="flex items-center justify-center py-12 text-stone-400">
          <div className="w-5 h-5 border-2 border-stone-200 border-t-gold-600 rounded-full animate-spin mr-2" />
          Loading logs...
        </div>
      ) : logs.length === 0 ? (
        <div className="bg-white dark:bg-slate-900 rounded-2xl border border-stone-200 dark:border-white/5 p-12 text-center">
          <Bug className="w-8 h-8 text-stone-300 mx-auto mb-3" />
          <p className="text-sm text-stone-400">No bot submissions caught yet</p>
          <p className="text-xs text-stone-400 mt-1">When a bot fills the hidden honeypot field, it will appear here</p>
        </div>
      ) : (
        <div className="bg-white dark:bg-slate-900 rounded-2xl border border-stone-200 dark:border-white/5 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-stone-100 dark:border-stone-800">
                  <th className="text-left px-4 py-3 text-xs font-bold text-stone-400 uppercase tracking-wider">Date</th>
                  <th className="text-left px-4 py-3 text-xs font-bold text-stone-400 uppercase tracking-wider">Form</th>
                  <th className="text-left px-4 py-3 text-xs font-bold text-stone-400 uppercase tracking-wider">Value</th>
                  <th className="text-left px-4 py-3 text-xs font-bold text-stone-400 uppercase tracking-wider">User Agent</th>
                </tr>
              </thead>
              <tbody>
                {logs.map(log => (
                  <tr key={log.id} className="border-b border-stone-50 dark:border-stone-800/50 hover:bg-stone-50 dark:hover:bg-stone-800/30">
                    <td className="px-4 py-3 text-stone-500 whitespace-nowrap">{formatDate(log.created_at)}</td>
                    <td className="px-4 py-3">
                      <span className="px-2 py-0.5 bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 rounded-md text-xs font-bold">
                        {FORM_LABELS[log.form_name] || log.form_name}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-stone-600 dark:text-stone-400 max-w-[200px] truncate" title={log.honeypot_value}>
                      {log.honeypot_value}
                    </td>
                    <td className="px-4 py-3 text-stone-400 max-w-[300px] truncate text-xs" title={log.user_agent}>
                      {log.user_agent}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  );
}
