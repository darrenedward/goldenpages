'use client';

import React, { useState, useEffect } from 'react';
import { Globe, Building2, Users, ChevronRight, Search } from 'lucide-react';
import { supabase } from '@/services/supabaseClient';
import { communicationService } from '@/services/communicationService';
import type { CommunicationWithDetails, Organization } from '@/types';
import CommunicationCard from './CommunicationCard';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import EmptyState from '@/components/shared/EmptyState';

interface PublicCommunicationBrowserProps {
  onSelectCommunication: (id: string) => void;
}

type BrowseLevel = 'countries' | 'organisations' | 'communications';

interface CountryWithCounts {
  id: string;
  name: string;
  code: string;
  organisationCount: number;
  communicationCount: number;
}

export default function PublicCommunicationBrowser({ onSelectCommunication }: PublicCommunicationBrowserProps) {
  const [level, setLevel] = useState<BrowseLevel>('countries');
  const [countries, setCountries] = useState<CountryWithCounts[]>([]);
  const [organisations, setOrganisations] = useState<Organization[]>([]);
  const [communications, setCommunications] = useState<CommunicationWithDetails[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedCountry, setSelectedCountry] = useState<string | null>(null);
  const [selectedOrg, setSelectedOrg] = useState<Organization | null>(null);
  const [searchQuery, setSearchQuery] = useState('');

  useEffect(() => {
    void fetchCountries();
  }, []);

  const fetchCountries = async () => {
    setLoading(true);
    try {
      // Get all organisations with their countries
      const { data, error } = await supabase
        .from('organisations')
        .select('id, name, headOfficeCountryId, headOfficeCountry:regions!organisations_headOfficeCountryId_fkey(id, name, code)')
        .order('name');

      if (error) throw error;

      // Group by country and count
      const countryMap = new Map<string, CountryWithCounts>();
      for (const org of data || []) {
        const country = (Array.isArray(org.headOfficeCountry) ? org.headOfficeCountry[0] : org.headOfficeCountry) as { id: string; name: string; code: string } | null;
        if (!country) continue;

        if (!countryMap.has(country.id)) {
          countryMap.set(country.id, {
            id: country.id,
            name: country.name,
            code: country.code,
            organisationCount: 0,
            communicationCount: 0,
          });
        }
        const entry = countryMap.get(country.id)!;
        entry.organisationCount++;
      }

      // Get public communication counts per organisation
      const { data: commData } = await supabase
        .from('communications')
        .select('organisation_id')
        .eq('is_public', true);

      if (commData) {
        const orgCommCounts = new Map<string, number>();
        for (const c of commData) {
          if (c.organisation_id) {
            orgCommCounts.set(c.organisation_id, (orgCommCounts.get(c.organisation_id) || 0) + 1);
          }
        }
        // Aggregate to country level
        for (const org of data || []) {
          const count = orgCommCounts.get(org.id) || 0;
          const country = (Array.isArray(org.headOfficeCountry) ? org.headOfficeCountry[0] : org.headOfficeCountry) as { id: string } | null;
          if (country && countryMap.has(country.id)) {
            countryMap.get(country.id)!.communicationCount += count;
          }
        }
      }

      setCountries(Array.from(countryMap.values()).sort((a, b) => a.name.localeCompare(b.name)));
    } catch (err) {
      console.error('Failed to fetch countries:', err);
    } finally {
      setLoading(false);
    }
  };

  const fetchOrganisations = async (countryId: string) => {
    setLoading(true);
    setSelectedCountry(countryId);
    try {
      const { data, error } = await supabase
        .from('organisations')
        .select('*')
        .eq('headOfficeCountryId', countryId)
        .order('name');

      if (error) throw error;
      setOrganisations(data || []);
      setLevel('organisations');
    } catch (err) {
      console.error('Failed to fetch organisations:', err);
    } finally {
      setLoading(false);
    }
  };

  const fetchCommunications = async (org: Organization) => {
    setLoading(true);
    setSelectedOrg(org);
    try {
      const data = await communicationService.getPublicCommunications({
        organisationId: org.id,
      });
      setCommunications(data);
      setLevel('communications');
    } catch (err) {
      console.error('Failed to fetch communications:', err);
    } finally {
      setLoading(false);
    }
  };

  const filteredCountries = countries.filter(c =>
    c.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const filteredOrgs = organisations.filter(o =>
    o.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  if (loading) return <LoadingSpinner message="Loading public register..." />;

  return (
    <div className="p-6 bg-stone-50 min-h-screen">
      {/* Header */}
      <div className="mb-8">
        <h1 className="font-serif text-3xl text-slate-800 mb-2">Public Communication Register</h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-4" />
        <p className="text-stone-500 max-w-2xl">
          Browse all publicly available communications between organizations and government departments.
          Transparency in action.
        </p>
      </div>

      {/* Search */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-4 mb-6">
        <div className="relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
          <input
            type="text"
            placeholder={level === 'countries' ? 'Search countries...' : level === 'organisations' ? 'Search organisations...' : 'Search communications...'}
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="w-full pl-12 pr-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500"
          />
        </div>
      </div>

      {/* Breadcrumb */}
      <div className="flex items-center gap-2 mb-6 text-sm">
        <button
          onClick={() => { setLevel('countries'); setSearchQuery(''); }}
          className="text-gold-600 hover:underline"
        >
          Countries
        </button>
        {level === 'organisations' && selectedCountry && (
          <>
            <ChevronRight className="w-4 h-4 text-stone-300" />
            <span className="text-stone-600">
              {countries.find(c => c.id === selectedCountry)?.name}
            </span>
          </>
        )}
        {level === 'communications' && selectedOrg && (
          <>
            <ChevronRight className="w-4 h-4 text-stone-300" />
            <button
              onClick={() => { setLevel('organisations'); setSearchQuery(''); }}
              className="text-gold-600 hover:underline"
            >
              {countries.find(c => c.id === selectedCountry)?.name}
            </button>
            <ChevronRight className="w-4 h-4 text-stone-300" />
            <span className="text-stone-600">{selectedOrg.name}</span>
          </>
        )}
      </div>

      {/* Content */}
      {level === 'countries' && (
        filteredCountries.length === 0 ? (
          <EmptyState title="No countries found" description="No organisations with public communications found" />
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {filteredCountries.map(country => (
              <button
                key={country.id}
                onClick={() => fetchOrganisations(country.id)}
                className="text-left bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-6 hover:shadow-md hover:border-gold-300 transition-all"
              >
                <div className="flex items-center gap-3 mb-3">
                  <div className="w-10 h-10 bg-stone-100 dark:bg-stone-800 rounded-xl flex items-center justify-center text-gold-600">
                    <Globe className="w-5 h-5" />
                  </div>
                  <div>
                    <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white">{country.name}</h3>
                    <p className="text-xs text-stone-400 uppercase">{country.code}</p>
                  </div>
                </div>
                <div className="flex items-center gap-4 text-sm text-stone-500">
                  <span>{country.organisationCount} org{country.organisationCount !== 1 ? 's' : ''}</span>
                  <span>{country.communicationCount} communication{country.communicationCount !== 1 ? 's' : ''}</span>
                </div>
              </button>
            ))}
          </div>
        )
      )}

      {level === 'organisations' && (
        filteredOrgs.length === 0 ? (
          <EmptyState title="No organisations found" description="No organisations in this country with public communications" />
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {filteredOrgs.map(org => (
              <button
                key={org.id}
                onClick={() => fetchCommunications(org)}
                className="text-left bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-6 hover:shadow-md hover:border-gold-300 transition-all"
              >
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 bg-stone-100 dark:bg-stone-800 rounded-xl flex items-center justify-center text-gold-600">
                    <Building2 className="w-5 h-5" />
                  </div>
                  <div>
                    <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white">{org.name}</h3>
                    <p className="text-xs text-stone-400 capitalize">{org.type.replace('_', ' ')}</p>
                  </div>
                </div>
              </button>
            ))}
          </div>
        )
      )}

      {level === 'communications' && (
        communications.length === 0 ? (
          <EmptyState title="No public communications" description={`No public communications found for ${selectedOrg?.name}`} />
        ) : (
          <div className="space-y-3">
            {communications.map(comm => (
              <CommunicationCard
                key={comm.id}
                communication={comm}
                onClick={onSelectCommunication}
                isPublicView
              />
            ))}
          </div>
        )
      )}
    </div>
  );
}
