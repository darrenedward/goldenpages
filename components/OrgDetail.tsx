'use client';

import React, { useState } from 'react';
import type { Organization, Contact, ContactChannel } from '@/types';
import {
  ArrowLeft, MapPin, Globe,
  Mail, Phone, Building, Landmark, Users
} from 'lucide-react';

interface OrgDetailProps {
  org: Organization;
  contacts: Contact[];
  channels: ContactChannel[];
  onBack: () => void;
}

const OrgDetail: React.FC<OrgDetailProps> = ({
  org, contacts, channels, onBack
}) => {
  const getContactChannels = (contactId: string) => channels.filter(c => c.contactId === contactId);

  return (
    <div className="space-y-6 animate-fade-in pb-12">
      {/* Header */}
      <div className="flex items-center justify-between mt-6">
        <button onClick={onBack} className="flex items-center gap-3 text-[10px] text-stone-500 hover:text-gold-600 transition-all font-black uppercase tracking-[0.25em] group">
          <div className="w-10 h-10 rounded-full border border-stone-200 flex items-center justify-center group-hover:border-gold-300 group-hover:bg-gold-50 transition-all shadow-sm">
            <ArrowLeft size={16} />
          </div>
          Exit Profile
        </button>
      </div>

      {/* Main Content Card */}
      <div className="bg-slate-900 rounded-[3.5rem] shadow-2xl border border-white/5 overflow-hidden relative group">
        <div className="absolute inset-0 bg-gradient-to-br from-gold-500/5 to-transparent pointer-events-none" />

        <div className="p-14 relative z-10 flex flex-col md:flex-row items-center md:items-start gap-12">
          {/* Organization Icon */}
          <div className="relative shrink-0">
            <div className="w-40 h-40 rounded-[3.5rem] bg-gradient-to-br from-gold-300 via-gold-500 to-gold-700 flex items-center justify-center text-white shadow-[0_25px_60px_rgba(184,138,0,0.4)] border-4 border-white/10">
              {org.type === 'government' ? <Landmark size={80} strokeWidth={1} /> :
               org.type === 'corporate' ? <Building size={80} strokeWidth={1} /> :
               org.type === 'diplomatic_mission' ? <Globe size={80} strokeWidth={1} /> :
               <Building size={80} strokeWidth={1} />}
            </div>
          </div>

          {/* Organization Details */}
          <div className="flex-1 text-center md:text-left space-y-6">
            <div>
              <div className="inline-flex items-center gap-2 px-4 py-1.5 bg-gold-400/10 border border-gold-400/20 rounded-full mb-4">
                <span className="w-2 h-2 rounded-full bg-gold-600 animate-pulse" />
                <span className="text-[10px] font-black uppercase tracking-[0.3em] text-gold-400">
                  {org.type.replace('_', ' ')} Official Record
                </span>
              </div>
              <h1 className="text-6xl font-serif font-black text-white leading-tight tracking-tight">{org.name}</h1>
            </div>

            {/* Contact Grid */}
            <div className="mt-4">
              <h3 className="text-xs font-black uppercase tracking-[0.3em] text-stone-400 mb-8 px-2 flex items-center gap-3">
                  <Users size={16} className="text-gold-500" /> Team Members
                </h3>
              <div className="grid grid-cols-1 gap-8">
                  {contacts.map(contact => {
                    const cChannels = getContactChannels(contact.id);
                    return (
                      <div key={contact.id} className="bg-white border-2 border-stone-50 rounded-[3rem] p-8 shadow-sm hover:shadow-xl hover:border-gold-200 transition-all group flex flex-col md:flex-row gap-8 items-start relative overflow-hidden">
                        <div className="w-24 h-24 rounded-2xl bg-stone-50 flex items-center justify-center text-4xl font-serif font-black text-stone-300 border border-stone-100 group-hover:bg-slate-900 group-hover:text-gold-400 transition-colors">
                          {contact.fullName.charAt(0)}
                        </div>

                        <div className="flex-1">
                          <div className="flex flex-wrap items-center justify-between gap-4 mb-6">
                            <div>
                              <h4 className="font-serif font-black text-slate-900 text-3xl mb-1 tracking-tight">{contact.fullName}</h4>
                              <div className="flex items-center gap-3">
                                <span className="text-[10px] font-bold uppercase tracking-widest text-gold-600 bg-gold-50 px-3 py-1 rounded-lg border border-gold-100">
                                  {contact.roleTitle || 'Team Member'}
                                </span>
                                {contact.departmentId && (
                                  <span className="text-[10px] font-bold uppercase tracking-widest text-stone-400">{contact.departmentId}</span>
                                )}
                              </div>
                            </div>
                          </div>

                          {/* Contact Channels */}
                          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            {cChannels.map(ch => (
                              <div key={ch.id} className="flex items-center gap-4 p-4 bg-stone-50/50 rounded-2xl border border-stone-100 hover:bg-white hover:border-gold-300 transition-all">
                                <div className="w-10 h-10 rounded-xl bg-white flex items-center justify-center text-gold-600 shadow-sm">
                                  {ch.channelType === 'email' ? <Mail size={16} /> : <Phone size={16} />}
                                </div>
                                <div>
                                  <span className="block text-[9px] font-black text-stone-400 uppercase tracking-widest">{ch.channelType}</span>
                                  <span className="block text-sm font-black text-slate-800 tracking-tight">{ch.value}</span>
                                </div>
                              </div>
                            ))}
                          </div>
                        </div>
                      </div>
                    );
                  })}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
};

export default OrgDetail;
