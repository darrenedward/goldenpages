import React from 'react';
import {
  Building2, Users, FileText, Activity,
  TrendingUp, ArrowUpRight, Zap, Download,
  PlusCircle, ShieldCheck
} from 'lucide-react';
import type { Organization, Contact } from '@/types';

interface DashboardProps {
  orgs: Organization[];
  contacts: Contact[];
  onNavigate: (view: string) => void;
}

const Dashboard: React.FC<DashboardProps> = ({ orgs, contacts, onNavigate }) => {
  const stats = [
    { label: 'Total Organizations', value: orgs.length, icon: Building2, color: 'text-gold-600', bg: 'bg-gold-50' },
    { label: 'Total Contacts', value: contacts.length, icon: Users, color: 'text-emerald-600', bg: 'bg-emerald-50' },
    { label: 'Active Outreach', value: '1,284', icon: FileText, color: 'text-blue-600', bg: 'bg-blue-50' },
    { label: 'Data Integrity', value: '98.4%', icon: ShieldCheck, color: 'text-amber-600', bg: 'bg-amber-50' },
  ];

  const typeCounts = orgs.reduce((acc, org) => {
    acc[org.type] = (acc[org.type] || 0) + 1;
    return acc;
  }, {} as Record<string, number>);

  return (
    <div className="space-y-8 animate-fade-in pb-12">
      <header className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h2 className="text-4xl font-serif font-black text-slate-900 dark:text-white tracking-tight">Directory Overview</h2>
          <p className="text-stone-400 font-bold uppercase tracking-widest text-xs mt-1">Directory Health & Performance Matrix</p>
        </div>
        <div className="flex gap-3">
          <button className="flex items-center gap-2 px-4 py-2 bg-white dark:bg-slate-800 border border-stone-200 dark:border-slate-700 rounded-xl text-sm font-bold shadow-sm hover:shadow-md transition-all">
            <Download size={16} className="text-gold-600" /> Export PDF
          </button>
          <button onClick={() => onNavigate('directory')} className="flex items-center gap-2 px-4 py-2 bg-slate-900 text-white rounded-xl text-sm font-bold shadow-lg shadow-slate-900/20 hover:bg-slate-800 transition-all">
            <PlusCircle size={16} className="text-gold-400" /> New Entry
          </button>
        </div>
      </header>

      {/* KPI Row */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {stats.map((stat, i) => (
          <div key={i} className="bg-white dark:bg-slate-900 p-6 rounded-[2rem] border border-stone-100 dark:border-white/5 shadow-sm hover:shadow-xl transition-all duration-500 group">
            <div className="flex items-start justify-between mb-4">
              <div className={`p-4 rounded-2xl ${stat.bg} dark:bg-white/5 transition-transform group-hover:scale-110`}>
                <stat.icon className={stat.color} size={24} />
              </div>
              <span className="flex items-center gap-1 text-xs font-black text-emerald-500 bg-emerald-50 dark:bg-emerald-500/10 px-2 py-1 rounded-full">
                <TrendingUp size={12} /> +12%
              </span>
            </div>
            <p className="text-stone-400 font-bold uppercase tracking-widest text-[10px]">{stat.label}</p>
            <h3 className="text-3xl font-serif font-black text-slate-900 dark:text-white mt-1">{stat.value}</h3>
          </div>
        ))}
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
        {/* Outreach Velocity Graph */}
        <div className="lg:col-span-8 bg-white dark:bg-slate-900 rounded-[2.5rem] p-8 border border-stone-100 dark:border-white/5 shadow-sm overflow-hidden relative group">
          <div className="flex items-center justify-between mb-8">
            <div>
              <h3 className="text-xl font-serif font-black text-slate-900 dark:text-white">Communication Velocity</h3>
              <p className="text-xs text-stone-400 font-medium">Monthly outreach volume across all channels</p>
            </div>
            <select className="bg-stone-50 dark:bg-white/5 border-none text-xs font-bold rounded-lg px-3 py-1.5 focus:ring-0 cursor-pointer">
              <option>Last 6 Months</option>
              <option>Last Year</option>
            </select>
          </div>
          
          <div className="h-64 flex items-end justify-between gap-4 px-2">
            {[45, 65, 35, 85, 55, 95].map((val, i) => (
              <div key={i} className="flex-1 flex flex-col items-center gap-3">
                <div 
                  className="w-full bg-gradient-to-t from-gold-600 to-gold-400 rounded-xl relative group/bar transition-all duration-700 ease-out hover:brightness-110"
                  style={{ height: `${val}%` }}
                >
                  <div className="absolute -top-10 left-1/2 -translate-x-1/2 bg-slate-900 text-gold-400 text-[10px] font-black px-2 py-1 rounded opacity-0 group-hover/bar:opacity-100 transition-opacity">
                    {val * 12}
                  </div>
                </div>
                <span className="text-[10px] font-black text-stone-400 uppercase tracking-tighter">Month {i+1}</span>
              </div>
            ))}
          </div>
        </div>

        {/* Entity Distribution Pie */}
        <div className="lg:col-span-4 bg-white dark:bg-slate-900 rounded-[2.5rem] p-8 border border-stone-100 dark:border-white/5 shadow-sm flex flex-col">
          <h3 className="text-xl font-serif font-black text-slate-900 dark:text-white mb-6 text-center">Entity Ecosystem</h3>
          
          <div className="flex-1 flex items-center justify-center relative">
            <svg viewBox="0 0 100 100" className="w-48 h-48 -rotate-90">
              <circle cx="50" cy="50" r="40" fill="transparent" stroke="#f5f5f4" strokeWidth="12" className="dark:stroke-white/5" />
              <circle cx="50" cy="50" r="40" fill="transparent" stroke="#b88a00" strokeWidth="12" strokeDasharray="251.2" strokeDashoffset="60" className="transition-all duration-1000 ease-in-out" />
              <circle cx="50" cy="50" r="40" fill="transparent" stroke="#ffd04d" strokeWidth="12" strokeDasharray="251.2" strokeDashoffset="180" className="transition-all duration-1000 ease-in-out" />
            </svg>
            <div className="absolute inset-0 flex flex-col items-center justify-center pointer-events-none">
              <Building2 className="text-gold-600" size={24} />
              <span className="text-[10px] font-black text-stone-400 uppercase">Types</span>
            </div>
          </div>

          <div className="mt-8 space-y-3">
            {Object.entries(typeCounts).slice(0, 3).map(([type, count], i) => (
              <div key={i} className="flex items-center justify-between text-xs font-bold">
                <div className="flex items-center gap-2">
                  <div className={`w-2 h-2 rounded-full ${i === 0 ? 'bg-gold-600' : i === 1 ? 'bg-gold-300' : 'bg-stone-200'}`} />
                  <span className="capitalize text-slate-700 dark:text-stone-300">{type}</span>
                </div>
                <span className="text-stone-400">{Math.round((count/orgs.length)*100)}%</span>
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
              { label: 'Bulk Record Import', desc: 'Import spreadsheet data', icon: Zap },
              { label: 'Communication Log', desc: 'Add offline outreach event', icon: Activity },
              { label: 'Data Validation', desc: 'Validate organization records', icon: ArrowUpRight }
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
              {[
                { user: 'Admin', action: 'updated the primary contact for', target: 'The United Kingdom', time: '2m ago' },
                { user: 'System', action: 'verified organization data for', target: 'Federal Republic of Germany', time: '14m ago' },
                { user: 'Editor', action: 'added 14 new contacts to', target: 'Republic of Indonesia', time: '1h ago' }
              ].map((log, i) => (
                <div key={i} className="flex items-start gap-4 border-b border-white/5 pb-4 last:border-0">
                  <div className="w-8 h-8 rounded-full bg-white/5 border border-white/10 flex items-center justify-center text-[10px] font-black text-gold-500">
                    {log.user.charAt(0)}
                  </div>
                  <div className="flex-1 text-xs">
                    <p className="text-stone-400 leading-relaxed">
                      <span className="text-stone-100 font-bold">{log.user}</span> {log.action} <span className="text-gold-400 font-black">{log.target}</span>
                    </p>
                    <span className="text-[10px] text-stone-600 font-bold uppercase mt-1 block">{log.time}</span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;