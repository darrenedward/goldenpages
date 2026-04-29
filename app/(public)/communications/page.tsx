'use client';

import { useState } from 'react';
import PublicCommunicationBrowser from '@/components/communications/PublicCommunicationBrowser';

export default function CommunicationsPage() {
  const [selectedId, setSelectedId] = useState<string | null>(null);

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 animate-fade-in">
      <div className="mb-8">
        <h1 className="font-serif text-4xl font-black text-slate-900 dark:text-white mb-3">
          Public Communications Register
        </h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-6" />
        <p className="text-stone-500 dark:text-stone-400 text-lg max-w-3xl leading-relaxed">
          Browse all public communications between the New World Alliances Foundation and
          government entities worldwide. Transparency is our commitment.
        </p>
      </div>

      <PublicCommunicationBrowser
        onSelectCommunication={(id) => setSelectedId(id)}
      />
    </div>
  );
}
