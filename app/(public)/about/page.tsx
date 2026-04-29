'use client';

import { ShieldCheck, Globe2, Eye, Users, Scale, BookOpen, Heart, Wheat, Droplets, Gavel } from 'lucide-react';
import { ScrollReveal } from '@/components/shared/ScrollReveal';
import { GradientMesh } from '@/components/shared/GradientMesh';
import { DotGrid } from '@/components/shared/DotGrid';
import { GlowCard } from '@/components/shared/GlowCard';
import { SectionDivider } from '@/components/shared/SectionDivider';

export default function AboutPage() {
  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 animate-fade-in">
      {/* Header */}
      <div className="relative mb-12">
        <GradientMesh
          colors={['hsl(45 93% 47% / 0.06)', 'hsl(45 93% 47% / 0.03)', 'hsl(215 25% 27% / 0.05)']}
          className="absolute inset-0 -z-10"
        />
        <ScrollReveal>
          <h1 className="font-serif text-4xl font-black text-slate-900 dark:text-white mb-3">About Golden Pages</h1>
          <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-6" />
        </ScrollReveal>
        <p className="text-stone-500 dark:text-stone-400 text-lg max-w-3xl leading-relaxed">
          Golden Pages is the flagship human rights accountability project of the New World Alliances
          Foundation. We build comprehensive directories of contacts within governments and corporations
          whose decisions impact the fundamental rights and dignity of people everywhere.
        </p>
      </div>

      <SectionDivider variant="line" />

      {/* What We Do */}
      <ScrollReveal>
        <div className="relative bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8 md:p-10 mb-8">
          <div className="absolute left-0 top-0 bottom-0 w-1 bg-gradient-to-b from-gold-500 to-gold-600 rounded-l-[2rem]" />
          <div className="flex items-center gap-3 mb-6">
            <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600">
              <BookOpen size={20} />
            </div>
            <h2 className="font-serif text-2xl font-bold text-slate-900 dark:text-white">What We Do</h2>
          </div>
          <div className="space-y-4 text-stone-600 dark:text-stone-400 leading-relaxed">
            <p>
              Every day, decisions are made in government offices and corporate boardrooms that affect billions
              of lives. Which pesticides are approved for use on our food. Whether a community receives clean
              water or a mining company gets preferential access. How pharmaceutical companies price life-saving
              medicines. Whether workers in supply chains are protected or exploited.
            </p>
            <p>
              Golden Pages collects, verifies, and publishes the contact information of the people behind
              these decisions - the ministers, regulators, executives, and officials who wield that power.
              We maintain directories across more than 24 countries, covering departments of agriculture,
              health, environment, labour, justice, and more.
            </p>
            <p>
              Our communications tracker creates a public record of every outreach effort, ensuring that
              correspondence with governments and corporations is documented, traceable, and cannot be
              denied. Truth only has power when it is visible.
            </p>
          </div>
        </div>
      </ScrollReveal>

      <SectionDivider variant="line" />

      {/* Mission & Values */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">
        <ScrollReveal delay={100}>
          <GlowCard>
            <div className="flex items-center gap-3 mb-6">
              <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600">
                <Scale size={20} />
              </div>
              <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white">Our Mission</h2>
            </div>
            <p className="text-stone-600 dark:text-stone-400 leading-relaxed">
              To bring things to light where truth lays. We exist to hold people to account - the ministers
              who approve harmful chemicals, the corporations that poison water supplies, the officials who
              look the other way when human rights are violated. We are here to help humanity by ensuring
              that those who wield power can be reached, questioned, and held responsible by the people
              they affect.
            </p>
          </GlowCard>
        </ScrollReveal>

        <ScrollReveal delay={100}>
          <GlowCard>
            <div className="flex items-center gap-3 mb-6">
              <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600">
                <ShieldCheck size={20} />
              </div>
              <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white">Our Values</h2>
            </div>
            <ul className="space-y-3 text-stone-600 dark:text-stone-400">
              {[
                'Truth above all - we expose what others hide',
                'Accountability for every decision that impacts human lives',
                'Food security is a right, not a commodity to be traded for profit',
                'Environmental sustainability over corporate convenience',
                'Every human being deserves safety, dignity, and freedom',
                'Transparency is the antidote to corruption and negligence',
              ].map((value) => (
                <li key={value} className="flex items-start gap-2">
                  <div className="w-2 h-2 bg-gold-500 rotate-45 flex-shrink-0 mt-1.5" />
                  <span>{value}</span>
                </li>
              ))}
            </ul>
          </GlowCard>
        </ScrollReveal>
      </div>

      <SectionDivider variant="line" />

      {/* Areas We Track */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8 md:p-10 mb-8">
        <div className="flex items-center gap-3 mb-8">
          <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600">
            <Heart size={20} />
          </div>
          <h2 className="font-serif text-2xl font-bold text-slate-900 dark:text-white">Human Rights We Track</h2>
        </div>
        <p className="text-stone-500 dark:text-stone-400 mb-8 max-w-3xl">
          Our directory focuses on contacts relevant to the most pressing human rights issues of our time.
          Here are the areas where we build comprehensive contact databases of those responsible.
        </p>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {[
            {
              icon: Wheat,
              title: 'Food Security & Agricultural Policy',
              desc: 'Tracking agriculture ministers, food safety regulators, and corporations like Bayer/Monsanto whose pesticides and GMO practices affect what reaches our plates. From glyphosate controversies to government-subsidised monocultures that erode food sovereignty.',
            },
            {
              icon: Droplets,
              title: 'Clean Water & Sanitation',
              desc: 'Monitoring those responsible for water policy, privatisation deals, and pollution permits. When corporations poison waterways or governments deny communities access to clean water, we ensure the decision-makers can be identified and contacted.',
            },
            {
              icon: Heart,
              title: 'Public Health & Pharmaceutical Accountability',
              desc: 'Tracking health ministers, drug regulators, and pharmaceutical executives. From unsafe drugs rushed to market to governments that defund public health programs, we document who is responsible when people suffer.',
            },
            {
              icon: Globe2,
              title: 'Environmental Sustainability',
              desc: 'Following environmental ministers, climate negotiators, and corporate polluters. Deforestation, carbon emissions, toxic waste dumping - we maintain contacts for those with the power to stop environmental destruction.',
            },
            {
              icon: Users,
              title: 'Workers\' Rights & Labour Standards',
              desc: 'Tracking labour ministries, workplace safety regulators, and supply chain executives. From sweatshops to unsafe mines, from child labour to forced displacement of workers, we ensure those responsible cannot hide.',
            },
            {
              icon: Gavel,
              title: 'Justice, Policing & Detention',
              desc: 'Monitoring justice ministries, police commissioners, and prison authorities. When states violate due process, use excessive force, or detain citizens without trial, we ensure those in the chain of command are on record.',
            },
          ].map((area, i) => (
            <ScrollReveal key={area.title} delay={i * 75}>
              <GlowCard className="!p-6 !rounded-2xl">
                <div className="flex items-start gap-4">
                  <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600 flex-shrink-0">
                    <area.icon size={20} />
                  </div>
                  <div>
                    <h3 className="font-bold text-slate-900 dark:text-white mb-1">{area.title}</h3>
                    <p className="text-stone-500 dark:text-stone-400 text-sm leading-relaxed">{area.desc}</p>
                  </div>
                </div>
              </GlowCard>
            </ScrollReveal>
          ))}
        </div>
      </div>

      <SectionDivider variant="line" />

      {/* NWA Foundation */}
      <div className="bg-slate-900 rounded-[2.5rem] p-8 md:p-10 relative overflow-hidden noise-overlay">
        <DotGrid spacing={32} opacity={0.03} />
        <GradientMesh
          animated
          colors={['hsl(45 93% 47% / 0.06)', 'hsl(45 93% 47% / 0.03)']}
        />
        <div className="absolute top-0 right-0 w-64 h-64 bg-gold-500/5 blur-[100px] -mr-32 -mt-32" />
        <div className="relative z-10">
          <div className="flex items-center gap-3 mb-6">
            <div className="w-10 h-10 bg-gold-900/30 rounded-xl flex items-center justify-center text-gold-400">
              <Globe2 size={20} />
            </div>
            <h2 className="font-serif text-2xl font-bold text-white">New World Alliances Foundation</h2>
          </div>
          <div className="space-y-4 text-stone-300 leading-relaxed max-w-3xl">
            <p>
              Golden Pages is a project of the New World Alliances Foundation (NWA Foundation), a global
              non-profit organization dedicated to defending human rights through transparency, accountability,
              and direct citizen engagement with power structures worldwide.
            </p>
            <p>
              The NWA Foundation works across multiple domains - food security, environmental justice, public
              health, workers&apos; rights, and indigenous sovereignty. The Communication Division, which houses
              Golden Pages, ensures that the channels between the affected and the powerful remain open,
              documented, and accessible to all.
            </p>
          </div>
          <div className="mt-8 grid grid-cols-1 sm:grid-cols-3 gap-6">
            {[
              { icon: Eye, label: 'Transparency', desc: 'Exposing what others hide' },
              { icon: Users, label: 'Solidarity', desc: 'Built for humanity, by humanity' },
              { icon: Scale, label: 'Justice', desc: 'Holding power to account' },
            ].map((item) => (
              <ScrollReveal key={item.label}>
                <div className="flex items-start gap-3">
                  <div className="w-8 h-8 bg-white/5 rounded-lg flex items-center justify-center text-gold-400 flex-shrink-0">
                    <item.icon size={16} />
                  </div>
                  <div>
                    <p className="text-white font-bold text-sm">{item.label}</p>
                    <p className="text-stone-500 text-xs">{item.desc}</p>
                  </div>
                </div>
              </ScrollReveal>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
