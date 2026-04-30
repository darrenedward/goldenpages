'use client';

import React, { useState, useEffect } from 'react';
import type { Organization, OrganizationWithCounts } from '@/types';
import { Search, Filter, Building, MapPin, Globe, ChevronRight, Users, Landmark } from 'lucide-react';
import { supabase } from '@/services/supabaseClient';

interface OrganizationTableProps {
  data: OrganizationWithCounts[];
  onSelectOrg: (org: Organization) => void;
}

const OrganizationTable: React.FC<OrganizationTableProps> = ({ data, onSelectOrg }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const [typeFilter, setTypeFilter] = useState<string>('all');
  const [countryNames, setCountryNames] = useState<Record<string, string>>({});

  useEffect(() => {
    const fetchCountries = async () => {
      const { data: regions } = await supabase.from('regions').select('id, name');
      if (regions) {
        const map = regions.reduce((acc, r) => ({ ...acc, [r.id]: r.name }), {});
        setCountryNames(map);
      }
    };
    void fetchCountries();
  }, []);

  const filteredData = data.filter((org) => {
    const matchesSearch = org.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                          (org.headOfficeCity || '').toLowerCase().includes(searchTerm.toLowerCase());
    const matchesType = typeFilter === 'all' || org.type === typeFilter;
    return matchesSearch && matchesType;
  });

  const getTypeColor = (type: string) => {
    switch (type) {
      case 'government': return 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400 border-blue-200 dark:border-blue-800';
      case 'corporate': return 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400 border-emerald-200 dark:border-emerald-800';
      case 'diplomatic_mission': return 'bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400 border-purple-200 dark:border-purple-800';
      case 'international_organization': return 'bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400 border-amber-200 dark:border-amber-800';
      default: return 'bg-slate-100 text-slate-700 dark:bg-slate-800 dark:text-slate-400 border-slate-200 dark:border-slate-700';
    }
  };

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2.5rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden flex flex-col h-full animate-fade-in">
      <div className="p-8 border-b border-stone-100 dark:border-white/5 bg-stone-50/30 dark:bg-white/5 flex flex-col sm:flex-row justify-between gap-6 items-center">
        <div className="relative w-full sm:w-96">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-stone-400" size={18} />
          <input
            type="text"
            placeholder="Search the Golden Directory..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="w-full pl-12 pr-4 py-3 bg-white dark:bg-slate-800 border border-stone-200 dark:border-white/10 rounded-2xl text-sm font-medium text-slate-800 dark:text-white placeholder:text-stone-400 dark:placeholder:text-stone-500 focus:outline-none focus:ring-2 focus:ring-gold-400/30 focus:border-gold-400 transition-all shadow-sm"
          />
        </div>

        <div className="flex items-center gap-4 w-full sm:w-auto">
          <div className="relative">
            <select
              value={typeFilter}
              onChange={(e) => setTypeFilter(e.target.value)}
              className="appearance-none pl-6 pr-12 py-3 bg-white dark:bg-slate-800 border border-stone-200 dark:border-white/10 rounded-2xl text-sm font-black uppercase tracking-widest text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-400/30 cursor-pointer shadow-sm"
            >
              <option value="all">Global Scope</option>
              <option value="government">Governments</option>
              <option value="corporate">Corporate</option>
              <option value="diplomatic_mission">Diplomatic Missions</option>
              <option value="international_organization">International Orgs</option>
            </select>
            <Filter className="absolute right-4 top-1/2 -translate-y-1/2 text-stone-400 pointer-events-none" size={14} />
          </div>
          <button className="bg-slate-900 hover:bg-slate-800 text-gold-400 px-6 py-3 rounded-2xl text-xs font-black uppercase tracking-widest transition-all shadow-xl shadow-slate-900/10 active:scale-95">
            Create Entry
          </button>
        </div>
      </div>

      <div className="overflow-auto flex-1 custom-scrollbar">
        <table className="w-full text-left border-collapse">
          <thead className="bg-stone-50/50 dark:bg-white/5 sticky top-0 z-10 backdrop-blur-md text-[10px] font-black text-stone-400 uppercase tracking-[0.2em]">
            <tr>
              <th className="px-8 py-6 border-b border-stone-100 dark:border-white/5">Organization</th>
              <th className="px-8 py-6 border-b border-stone-100 dark:border-white/5">Type</th>
              <th className="px-8 py-6 border-b border-stone-100 dark:border-white/5">Location</th>
              <th className="px-8 py-6 border-b border-stone-100 dark:border-white/5">Team Size</th>
              <th className="px-8 py-6 border-b border-stone-100 dark:border-white/5 text-right">Action</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-stone-50 dark:divide-white/5">
            {filteredData.map((org) => (
              <tr
                key={org.id}
                onClick={() => onSelectOrg(org)}
                className="hover:bg-gold-50/30 dark:hover:bg-white/5 cursor-pointer transition-all duration-300 group"
              >
                <td className="px-8 py-6">
                  <div className="flex items-center gap-5">
                    <div className="w-14 h-14 rounded-2xl bg-white dark:bg-slate-800 border border-stone-100 dark:border-white/10 shadow-sm flex items-center justify-center text-stone-300 group-hover:text-gold-600 group-hover:bg-slate-900 group-hover:border-gold-500 transition-all duration-500 transform group-hover:rotate-3">
                      {org.type === 'government' ? <Landmark size={24} /> :
                       org.type === 'corporate' ? <Building size={24} /> :
                       org.type === 'diplomatic_mission' ? <Globe size={24} /> :
                       org.type === 'international_organization' ? <Globe size={24} /> :
                       <Building size={24} />}
                    </div>
                    <div>
                      <p className="font-serif font-black text-xl text-slate-900 dark:text-white group-hover:text-gold-800 dark:group-hover:text-gold-400 transition-colors leading-tight">{org.name}</p>
                      {org.headOfficeWebsite && (
                        <span className="text-[10px] text-stone-400 font-bold flex items-center gap-1 mt-1 group-hover:text-gold-500">
                          <Globe size={10} />
                          {org.headOfficeWebsite}
                        </span>
                      )}
                    </div>
                  </div>
                </td>
                <td className="px-8 py-6">
                  <span className={`inline-flex items-center px-4 py-1.5 rounded-xl text-[10px] font-black uppercase tracking-widest border ${getTypeColor(org.type)} shadow-sm`}>
                    {org.type.replace('_', ' ')}
                  </span>
                </td>
                <td className="px-8 py-6">
                  <div className="flex flex-col gap-1">
                    <div className="flex items-center gap-2 text-sm text-slate-700 dark:text-stone-300 font-black tracking-tight">
                      <MapPin size={14} className="text-gold-500" />
                      {org.headOfficeCity || 'N/A'}
                    </div>
                    <span className="text-[10px] text-stone-400 dark:text-stone-500 font-bold uppercase tracking-wider ml-6">
                      {org.headOfficeCountryId ? countryNames[org.headOfficeCountryId] || org.headOfficeCountryId : 'Global'}
                    </span>
                  </div>
                </td>
                <td className="px-8 py-6">
                   <div className="flex flex-col gap-1.5">
                      <div className="flex items-center gap-2 text-xs text-stone-500">
                          <Users size={14} className="text-stone-300" />
                          {org.contactCount && org.contactCount > 0 ? (
                            <span className="font-black text-slate-800 dark:text-stone-300 tracking-tight">{org.contactCount} {org.contactCount === 1 ? 'Contact' : 'Contacts'}</span>
                          ) : (
                            <span className="italic text-stone-300 font-medium">No contacts</span>
                          )}
                      </div>
                      <div className="w-24 h-1 bg-stone-100 rounded-full overflow-hidden">
                        <div className="h-full bg-gold-500 w-2/3" />
                      </div>
                   </div>
                </td>
                <td className="px-8 py-6 text-right">
                  <button className="text-gold-600 hover:text-white hover:bg-slate-900 px-5 py-2.5 rounded-xl transition-all duration-300 flex items-center gap-2 ml-auto text-xs font-black uppercase tracking-widest">
                    Access <ChevronRight size={16} />
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default OrganizationTable;
