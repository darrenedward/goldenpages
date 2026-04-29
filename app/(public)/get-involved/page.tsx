'use client';

import Link from 'next/link';
import { Heart, Globe2, Users, ShieldCheck, ArrowRight, ExternalLink, Wheat, Droplets, Gavel, Eye } from 'lucide-react';

export default function GetInvolvedPage() {
  const joinUrl = process.env.NEXT_PUBLIC_NWA_JOIN_URL;

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 animate-fade-in">
      {/* Header */}
      <div className="mb-12">
        <h1 className="font-serif text-4xl font-black text-slate-900 dark:text-white mb-3">Get Involved</h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-6" />
        <p className="text-stone-500 dark:text-stone-400 text-lg max-w-3xl leading-relaxed">
          The New World Alliances Foundation is building a global movement of people who refuse to accept
          that human rights are negotiable. Here&apos;s how you can stand with us.
        </p>
      </div>

      {/* What We Stand For */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8 md:p-10 mb-8">
        <div className="flex items-center gap-3 mb-8">
          <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600">
            <Heart size={20} />
          </div>
          <h2 className="font-serif text-2xl font-bold text-slate-900 dark:text-white">What We Stand For</h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {[
            {
              title: 'Truth Over Comfort',
              description: 'We bring things to light where truth lays - even when the truth is uncomfortable, even when it challenges powerful interests. Monsanto\'s glyphosate, government water contamination cover-ups, pharmaceutical price gouging - the public deserves to know.',
            },
            {
              title: 'Accountability Without Exception',
              description: 'No government minister, no corporate executive, no regulator is above scrutiny. When decisions harm people - through toxic pesticides, polluted water, denied healthcare, or unsafe workplaces - those responsible must answer.',
            },
            {
              title: 'Food as a Human Right',
              description: 'Food security is not a commodity. We stand against agricultural practices that prioritise corporate profit over human nutrition, against pesticides that poison communities, and against policies that create hunger while others profit.',
            },
            {
              title: 'Solidarity With the Affected',
              description: 'We stand with indigenous communities displaced from their land, with workers exploited in supply chains, with families drinking contaminated water, and with communities denied healthcare. Their voices deserve to be heard.',
            },
          ].map((item) => (
            <div key={item.title} className="flex items-start gap-4 p-4 rounded-2xl hover:bg-stone-50 dark:hover:bg-white/5 transition-colors">
              <div className="w-2 h-2 rounded-full bg-gold-500 mt-2 flex-shrink-0" />
              <div>
                <h3 className="font-bold text-slate-900 dark:text-white mb-1">{item.title}</h3>
                <p className="text-stone-500 dark:text-stone-400 text-sm leading-relaxed">{item.description}</p>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* How to Help */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        {[
          {
            icon: Globe2,
            title: 'Expose the Truth',
            description: 'Submit verified contact information for officials and executives whose decisions impact human rights. Help us build the most comprehensive accountability directory on earth.',
          },
          {
            icon: Eye,
            title: 'Document & Verify',
            description: 'Help us track government programs and corporate practices that harm communities. From pesticide approvals to water contamination events, every record strengthens the case for justice.',
          },
          {
            icon: Users,
            title: 'Join the Movement',
            description: 'Become part of a global network of human rights defenders. Together we ensure that no minister, regulator, or executive can hide from the consequences of their decisions.',
          },
        ].map((card) => (
          <div
            key={card.title}
            className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8 hover:shadow-xl hover:border-gold-300 transition-all duration-300 group"
          >
            <div className="w-12 h-12 bg-gold-50 dark:bg-gold-900/20 rounded-2xl flex items-center justify-center text-gold-600 mb-5 group-hover:scale-110 transition-transform">
              <card.icon size={24} />
            </div>
            <h3 className="font-serif text-lg font-bold text-slate-900 dark:text-white mb-3">{card.title}</h3>
            <p className="text-stone-500 dark:text-stone-400 text-sm leading-relaxed">{card.description}</p>
          </div>
        ))}
      </div>

      {/* Real-World Examples */}
      <div className="bg-slate-900 rounded-[2.5rem] p-8 md:p-10 mb-8 relative overflow-hidden">
        <div className="absolute top-0 right-0 w-64 h-64 bg-gold-500/5 blur-[100px] -mr-32 -mt-32" />
        <div className="relative z-10">
          <h2 className="font-serif text-2xl font-bold text-white mb-3">Why This Work Matters</h2>
          <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-8" />

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {[
              {
                icon: Wheat,
                title: 'Pesticides & Food Safety',
                example: 'Bayer/Monsanto\'s glyphosate-based herbicides have been linked to cancer while being sprayed on crops worldwide. Regulators who approve these chemicals and executives who market them must be identifiable and reachable.',
              },
              {
                icon: Droplets,
                title: 'Water Contamination',
                example: 'From Flint, Michigan to mining communities in the Global South, government officials and corporate executives make decisions that put toxic water in people\'s glasses. We track who signs off on these decisions.',
              },
              {
                icon: Gavel,
                title: 'Government Accountability',
                example: 'When governments implement programs detrimental to human rights - mass surveillance, forced displacement, suppression of protest - the officials responsible must face public scrutiny. We make sure they can be found.',
              },
            ].map((item) => (
              <div key={item.title}>
                <div className="w-10 h-10 bg-gold-900/30 rounded-xl flex items-center justify-center text-gold-400 mb-4">
                  <item.icon size={20} />
                </div>
                <h3 className="text-white font-bold mb-2">{item.title}</h3>
                <p className="text-stone-400 text-sm leading-relaxed">{item.example}</p>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Join CTA */}
      <div className="bg-gradient-to-br from-gold-500 to-gold-600 rounded-[2.5rem] p-10 md:p-14 text-white relative overflow-hidden">
        <div className="absolute top-0 right-0 w-64 h-64 bg-white/10 blur-[100px] -mr-32 -mt-32" />
        <div className="relative z-10 max-w-2xl">
          <h2 className="font-serif text-3xl font-black mb-4">Join the Fight for Human Rights</h2>
          <p className="text-white/90 leading-relaxed mb-8">
            The NWA Foundation is not waiting for governments to police themselves. We are building the
            tools, the directories, and the networks to ensure that every person who makes a decision
            affecting human lives can be held to account. Stand with us.
          </p>
          {joinUrl ? (
            <a
              href={joinUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 px-6 py-3 bg-white text-gold-700 rounded-2xl font-bold hover:bg-stone-50 transition-all"
            >
              Join Us
              <ExternalLink size={18} />
            </a>
          ) : (
            <div className="inline-flex items-center gap-2 px-6 py-3 bg-white/20 text-white rounded-2xl font-bold border border-white/20">
              Registration Coming Soon
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
