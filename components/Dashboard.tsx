'use client';

import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import {
  Building2, Users, FileText, Activity,
  Download, PlusCircle, ShieldCheck, Clock, AlertTriangle,
} from 'lucide-react';
import { statsService } from '@/services/statsService';
import { activityLogService } from '@/services/activityLogService';
import { hierarchyService } from '@/services/hierarchyService';
import type { Organization } from '@/types';
import type { DashboardStats } from '@/services/statsService';

export default function Dashboard() {
  const router = useRouter();
  const [stats, setStats] = useState<DashboardStats | null>(null);
  const [orgs, setOrgs] = useState<Organization[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    void loadStats();
  }, []);

  const loadStats = async () => {
    try {
      const [data, orgData] = await Promise.all([
        statsService.getDashboardStats(),
        hierarchyService.getOrganizations(),
      ]);
      setStats(data);
      setOrgs(orgData);
    } catch (err) {
      console.error('Failed to load dashboard stats:', err);
    } finally {
      setLoading(false);
    }
  };

  const typeCounts = orgs.reduce((acc, org) => {
    acc[org.type] = (acc[org.type] || 0) + 1;
    return acc;
  }, {} as Record<string, number>);

  const typeEntries = Object.entries(typeCounts).slice(0, 3);
  const totalForChart = typeEntries.reduce((sum, [, c]) => sum + c, 0);
  const circumference = 251.2;

  // Compute dynamic SVG offsets for pie chart
  const pieColors = ['bg-gold-600', 'bg-gold-300', 'bg-stone-200'];
  const pieStrokes = ['#b88a00', '#ffd04d', '#d6d3d1'];

  const kpiCards = stats ? [
    { label: 'Total Organizations', value: stats.orgCount.toLocaleString(), icon: Building2, color: 'text-gold-600', bg: 'bg-gold-50' },
    { label: 'Total Contacts', value: stats.contactCount.toLocaleString(), icon: Users, color: 'text-emerald-600', bg: 'bg-emerald-50' },
    { label: 'Active Communications', value: stats.activeCommunications.toLocaleString(), icon: FileText, color: 'text-blue-600 dark:text-blue-400', bg: 'bg-blue-50 dark:bg-blue-900/20' },
    { label: 'Data Integrity', value: `${stats.dataIntegrityPct}%`, icon: ShieldCheck, color: 'text-amber-600', bg: 'bg-amber-50' },
    { label: 'Overdue Responses', value: stats.overdueCommunications.toLocaleString(), icon: AlertTriangle, color: 'text-red-600', bg: 'bg-red-50' },
  ] : [];

  const chartData = stats?.communicationsByMonth || [];
  const maxChartVal = Math.max(...chartData.map(d => d.count), 1);

  const formatTimeAgo = (dateStr: string): string => {
    const diff = Date.now() - new Date(dateStr).getTime();
    const mins = Math.floor(diff / 60000);
    if (mins < 1) return 'just now';
    if (mins < 60) return `${mins}m ago`;
    const hours = Math.floor(mins / 60);
    if (hours < 24) return `${hours}h ago`;
    const days = Math.floor(hours / 24);
    return `${days}d ago`;
  };

  return (
    <div className="space-y-8 animate-fade-in pb-12">
      <header className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h2 className="text-4xl font-serif font-black text-slate-900 dark:text-white tracking-tight">Directory Overview</h2>
          <p className="text-stone-400 font-bold uppercase tracking-widest text-xs mt-1">Directory Health & Performance Matrix</p>
        </div>
        <div className="flex gap-3">
          <button className="flex items-center gap-2 px-4 py-2 bg-white dark:bg-slate-800 border border-stone-200 dark:border-slate-700 rounded-xl text-sm font-bold text-slate-700 dark:text-white shadow-sm hover:shadow-md transition-all">
            <Download size={16} className="text-gold-600" /> Export PDF
          </button>
          <button onClick={() => router.push('/dashboard/organizations')} className="flex items-center gap-2 px-4 py-2 bg-slate-900 text-white rounded-xl text-sm font-bold shadow-lg shadow-slate-900/20 hover:bg-slate-800 transition-all">
            <PlusCircle size={16} className="text-gold-400" /> New Entry
          </button>
        </div>
      </header>

      {/* KPI Row */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-6">
        {loading ? (
          Array.from({ length: 5 }).map((_, i) => (
            <div key={i} className="bg-white dark:bg-slate-900 p-6 rounded-[2rem] border border-stone-100 dark:border-white/5 shadow-sm animate-pulse">
              <div className="h-6 w-6 bg-stone-100 dark:bg-stone-800 rounded mb-4" />
              <div className="h-3 bg-stone-100 dark:bg-stone-800 rounded w-20 mb-2" />
              <div className="h-8 bg-stone-100 dark:bg-stone-800 rounded w-16" />
            </div>
          ))
        ) : (
          kpiCards.map((stat, i) => (
            <div key={i} className="bg-white dark:bg-slate-900 p-6 rounded-[2rem] border border-stone-100 dark:border-white/5 shadow-sm hover:shadow-xl transition-all duration-500 group">
              <div className="flex items-start justify-between mb-4">
                <div className={`p-4 rounded-2xl ${stat.bg} dark:bg-white/5 transition-transform group-hover:scale-110`}>
                  <stat.icon className={stat.color} size={24} />
                </div>
              </div>
              <p className="text-stone-400 font-bold uppercase tracking-widest text-[10px]">{stat.label}</p>
              <h3 className="text-3xl font-serif font-black text-slate-900 dark:text-white mt-1">{stat.value}</h3>
            </div>
          ))
        )}
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
        {/* Communication Velocity Chart */}
        <div className="lg:col-span-8 bg-white dark:bg-slate-900 rounded-[2.5rem] p-8 border border-stone-100 dark:border-white/5 shadow-sm overflow-hidden relative group">
          <div className="flex items-center justify-between mb-8">
            <div>
              <h3 className="text-xl font-serif font-black text-slate-900 dark:text-white">Communication Velocity</h3>
              <p className="text-xs text-stone-400 font-medium">Monthly outreach volume across all channels</p>
            </div>
          </div>

          <div className="h-64 flex items-end justify-between gap-4 px-2">
            {loading ? (
              Array.from({ length: 6 }).map((_, i) => (
                <div key={i} className="flex-1 flex flex-col items-center gap-3">
                  <div className="w-full bg-stone-100 dark:bg-stone-800 rounded-xl animate-pulse" style={{ height: `${30 + Math.random() * 50}%` }} />
                  <div className="h-3 w-10 bg-stone-100 dark:bg-stone-800 rounded animate-pulse" />
                </div>
              ))
            ) : chartData.length === 0 ? (
              <div className="flex-1 flex items-center justify-center text-stone-400 text-sm">
                No communication data yet
              </div>
            ) : (
              chartData.map((d, i) => {
                const pct = maxChartVal > 0 ? (d.count / maxChartVal) * 100 : 0;
                const barHeight = Math.max(pct, d.count > 0 ? 8 : 2);
                return (
                  <div key={i} className="flex-1 flex flex-col items-center gap-3">
                    <div
                      className={`w-full rounded-xl relative group/bar transition-all duration-700 ease-out hover:brightness-110 ${
                        d.count > 0
                          ? 'bg-gradient-to-t from-gold-600 to-gold-400'
                          : 'bg-stone-100 dark:bg-stone-800'
                      }`}
                      style={{ height: `${barHeight}%` }}
                    >
                      {d.count > 0 && (
                        <div className="absolute -top-10 left-1/2 -translate-x-1/2 bg-slate-900 text-gold-400 text-[10px] font-black px-2 py-1 rounded opacity-0 group-hover/bar:opacity-100 transition-opacity whitespace-nowrap">
                          {d.count} communication{d.count !== 1 ? 's' : ''}
                        </div>
                      )}
                    </div>
                    <span className="text-[10px] font-black text-stone-400 uppercase tracking-tighter">{d.month}</span>
                  </div>
                );
              })
            )}
          </div>
        </div>

        {/* Entity Distribution Pie */}
        <div className="lg:col-span-4 bg-white dark:bg-slate-900 rounded-[2.5rem] p-8 border border-stone-100 dark:border-white/5 shadow-sm flex flex-col">
          <h3 className="text-xl font-serif font-black text-slate-900 dark:text-white mb-6 text-center">Entity Ecosystem</h3>

          <div className="flex-1 flex items-center justify-center relative">
            <svg viewBox="0 0 100 100" className="w-48 h-48 -rotate-90">
              <circle cx="50" cy="50" r="40" fill="transparent" stroke="#f5f5f4" strokeWidth="12" className="dark:stroke-white/5" />
              {typeEntries.map(([, count], i) => {
                const pct = totalForChart > 0 ? count / totalForChart : 0;
                const offset = circumference * (1 - pct);
                return (
                  <circle
                    key={i}
                    cx="50" cy="50" r="40"
                    fill="transparent"
                    stroke={pieStrokes[i] || '#d6d3d1'}
                    strokeWidth="12"
                    strokeDasharray={circumference}
                    strokeDashoffset={offset}
                    className="transition-all duration-1000 ease-in-out"
                  />
                );
              })}
            </svg>
            <div className="absolute inset-0 flex flex-col items-center justify-center pointer-events-none">
              <Building2 className="text-gold-600" size={24} />
              <span className="text-[10px] font-black text-stone-400 uppercase">Types</span>
            </div>
          </div>

          <div className="mt-8 space-y-3">
            {typeEntries.map(([type, count], i) => (
              <div key={type} className="flex items-center justify-between text-xs font-bold">
                <div className="flex items-center gap-2">
                  <div className={`w-2 h-2 rounded-full ${pieColors[i] || 'bg-stone-200'}`} />
                  <span className="capitalize text-slate-700 dark:text-stone-300">{type.replace('_', ' ')}</span>
                </div>
                <span className="text-stone-400">{orgs.length > 0 ? Math.round((count / orgs.length) * 100) : 0}%</span>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Quick Actions & Recent Activity */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <div className="lg:col-span-1 space-y-4">
          <h3 className="text-sm font-black text-stone-400 uppercase tracking-[0.2em] px-2">Quick Protocols</h3>
          <div className="space-y-3">
            {[
              { label: 'Bulk Record Import', desc: 'Import spreadsheet data', icon: Activity },
              { label: 'Communication Log', desc: 'Add offline outreach event', icon: FileText },
              { label: 'Data Validation', desc: 'Validate organization records', icon: ShieldCheck }
            ].map((action, i) => (
              <button key={i} className="w-full flex items-center gap-4 p-4 bg-white dark:bg-slate-900 border border-stone-100 dark:border-white/5 rounded-2xl shadow-sm hover:border-gold-300 transition-all text-left group">
                <div className="w-10 h-10 bg-gold-50 dark:bg-white/5 rounded-xl flex items-center justify-center text-gold-600 group-hover:scale-110 transition-transform">
                  <action.icon size={18} />
                </div>
                <div>
                  <p className="text-sm font-bold text-slate-900 dark:text-white">{action.label}</p>
                  <p className="text-[10px] text-stone-400 font-medium">{action.desc}</p>
                </div>
              </button>
            ))}
          </div>
        </div>

        <div className="lg:col-span-2 bg-slate-900 rounded-[2.5rem] p-8 border border-white/5 relative overflow-hidden group">
          <div className="absolute top-0 right-0 w-64 h-64 bg-gold-500/5 blur-[100px] -mr-32 -mt-32" />
          <div className="relative z-10">
            <h3 className="text-xl font-serif font-black text-white mb-6">Real-time Directory Pulse</h3>
            <div className="space-y-6">
              {loading ? (
                Array.from({ length: 3 }).map((_, i) => (
                  <div key={i} className="flex items-start gap-4 border-b border-white/5 pb-4 animate-pulse">
                    <div className="w-8 h-8 rounded-full bg-white/5" />
                    <div className="flex-1 space-y-2">
                      <div className="h-3 bg-white/5 rounded w-3/4" />
                      <div className="h-2 bg-white/5 rounded w-16" />
                    </div>
                  </div>
                ))
              ) : stats?.recentActivity.length ? (
                stats.recentActivity.map((log) => (
                  <div key={log.id} className="flex items-start gap-4 border-b border-white/5 pb-4 last:border-0">
                    <div className="w-8 h-8 rounded-full bg-white/5 border border-white/10 flex items-center justify-center text-[10px] font-black text-gold-500">
                      {(log.user?.displayName || log.user?.email || '?').charAt(0).toUpperCase()}
                    </div>
                    <div className="flex-1 text-xs">
                      <p className="text-stone-400 leading-relaxed">
                        <span className="text-stone-100 font-bold">{log.user?.displayName || log.user?.email || 'Unknown'}</span>
                        {' '}{activityLogService.getActionLabel(log.action)}
                      </p>
                      <span className="text-[10px] text-stone-500 font-bold uppercase mt-1 block">{formatTimeAgo(log.createdAt)}</span>
                    </div>
                  </div>
                ))
              ) : (
                <div className="flex flex-col items-center py-8 text-stone-500">
                  <Clock className="w-8 h-8 mb-2 opacity-30" />
                  <p className="text-sm">No recent activity yet</p>
                  <p className="text-xs mt-1">Activity will appear here as you use the platform</p>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
