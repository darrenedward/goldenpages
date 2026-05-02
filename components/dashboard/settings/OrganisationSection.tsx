'use client';

import { useState, useEffect } from 'react';
import { Building2, Loader2, Mail, Phone, MapPin } from 'lucide-react';
import { toast } from 'react-hot-toast';

interface OrgData {
  name: string;
  headOfficeEmail: string;
  headOfficePhone: string;
  headOfficeAddress: string;
  headOfficeCity: string;
}

export default function OrganisationSection() {
  const [org, setOrg] = useState<OrgData>({
    name: '',
    headOfficeEmail: '',
    headOfficePhone: '',
    headOfficeAddress: '',
    headOfficeCity: '',
  });
  const [savedOrg, setSavedOrg] = useState<OrgData>(org);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    void (async () => {
      try {
        const res = await fetch('/api/organisation');
        if (res.ok) {
          const data = await res.json();
          const orgData: OrgData = {
            name: data.name || '',
            headOfficeEmail: data.headOfficeEmail || '',
            headOfficePhone: data.headOfficePhone || '',
            headOfficeAddress: data.headOfficeAddress || '',
            headOfficeCity: data.headOfficeCity || '',
          };
          setOrg(orgData);
          setSavedOrg(orgData);
        }
      } catch (err) {
        console.error('Failed to load org:', err);
      } finally {
        setLoading(false);
      }
    })();
  }, []);

  const hasChanged = JSON.stringify(org) !== JSON.stringify(savedOrg);

  const handleSave = async () => {
    setSaving(true);
    try {
      const res = await fetch('/api/organisation', {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(org),
      });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to update');
      }
      setSavedOrg({ ...org });
      toast.success('Organisation details saved');
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to save');
    } finally {
      setSaving(false);
    }
  };

  if (loading) {
    return (
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
        <div className="flex items-center gap-2 text-stone-400">
          <Loader2 className="w-4 h-4 animate-spin" />
          Loading organisation details...
        </div>
      </div>
    );
  }

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
      <div className="flex items-center gap-2 mb-4">
        <Building2 className="w-5 h-5 text-gold-600" />
        <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white">Our Organisation</h2>
      </div>
      <p className="text-sm text-stone-500 dark:text-stone-400 mb-4">
        These details appear on communications as the sender. &ldquo;Sent on behalf of&rdquo; uses the name below.
      </p>

      <div className="space-y-4">
        <div>
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
            Organisation Name
          </label>
          <input
            type="text"
            value={org.name}
            onChange={(e) => setOrg(prev => ({ ...prev, name: e.target.value }))}
            placeholder="e.g. New World Alliances Foundation"
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          />
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
              <Mail className="w-3.5 h-3.5 inline mr-1 -mt-0.5" />
              Email
            </label>
            <input
              type="email"
              value={org.headOfficeEmail}
              onChange={(e) => setOrg(prev => ({ ...prev, headOfficeEmail: e.target.value }))}
              placeholder="contact@example.com"
              className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
          </div>
          <div>
            <label className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
              <Phone className="w-3.5 h-3.5 inline mr-1 -mt-0.5" />
              Phone
            </label>
            <input
              type="tel"
              value={org.headOfficePhone}
              onChange={(e) => setOrg(prev => ({ ...prev, headOfficePhone: e.target.value }))}
              placeholder="+64 4 000 0000"
              className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
          </div>
        </div>

        <div>
          <label className="block text-sm font-bold text-stone-600 dark:text-stone-300 mb-1">
            <MapPin className="w-3.5 h-3.5 inline mr-1 -mt-0.5" />
            Address
          </label>
          <input
            type="text"
            value={org.headOfficeAddress}
            onChange={(e) => setOrg(prev => ({ ...prev, headOfficeAddress: e.target.value }))}
            placeholder="PO Box 123, Wellington"
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          />
        </div>

        {hasChanged && (
          <button
            type="button"
            onClick={() => void handleSave()}
            disabled={saving}
            className="px-4 py-2 bg-gold-600 text-white rounded-xl text-sm font-bold hover:bg-gold-700 disabled:opacity-50 transition-colors flex items-center gap-2"
          >
            {saving && <Loader2 className="w-4 h-4 animate-spin" />}
            Save Changes
          </button>
        )}
      </div>
    </div>
  );
}
