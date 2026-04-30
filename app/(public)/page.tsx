'use client';

import Link from 'next/link';
import { Eye, ShieldCheck, Globe2, Users, ArrowRight, Scale, Heart, Droplets, Wheat, Gavel } from 'lucide-react';
import { ScrollReveal } from '@/components/shared/ScrollReveal';
import { AnimatedCounter } from '@/components/shared/AnimatedCounter';
import { GradientMesh } from '@/components/shared/GradientMesh';
import { DotGrid } from '@/components/shared/DotGrid';
import { GlowCard } from '@/components/shared/GlowCard';
import { AnimatedGradientText } from '@/components/shared/AnimatedGradientText';
import { HeroBeamLine } from '@/components/shared/HeroBeamLine';

export default function LandingPage() {
  return (
    <div>
      {/* Hero Section */}
      <section className="relative overflow-hidden">
        {/* Layer 0: Base gradient */}
        <div className="absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-slate-800" />

        {/* Layer 1: Animated mesh */}
        <GradientMesh
          colors={['hsl(45 93% 47% / 0.08)', 'hsl(45 93% 47% / 0.04)', 'hsl(215 25% 27% / 0.1)']}
          animated
        />

        {/* Layer 2: Dot grid */}
        <DotGrid spacing={32} opacity={0.05} />

        {/* Layer 3: Floating orbs */}
        <div className="absolute top-0 right-0 w-96 h-96 bg-gold-500/10 blur-[120px] -mr-48 -mt-48 animate-float" />
        <div className="absolute bottom-0 left-0 w-96 h-96 bg-gold-500/5 blur-[120px] -ml-48 -mb-48 animate-float delay-300" />
        <div className="absolute top-1/2 left-1/2 w-64 h-64 bg-gold-400/5 blur-[100px] animate-float delay-500" />

        {/* Layer 4: Globe wireframe SVG */}
        <svg
          className="absolute right-[-10%] top-[10%] w-[50%] h-[80%] opacity-[0.06] pointer-events-none"
          viewBox="0 0 400 400"
          fill="none"
          aria-hidden="true"
          role="presentation"
        >
          <circle cx="200" cy="200" r="180" stroke="hsl(45 93% 47%)" strokeWidth="1" />
          <circle cx="200" cy="200" r="120" stroke="hsl(45 93% 47%)" strokeWidth="0.75" />
          <circle cx="200" cy="200" r="60" stroke="hsl(45 93% 47%)" strokeWidth="0.5" />
          <ellipse cx="200" cy="200" rx="180" ry="60" stroke="hsl(45 93% 47%)" strokeWidth="0.75" />
          <ellipse cx="200" cy="200" rx="180" ry="120" stroke="hsl(45 93% 47%)" strokeWidth="0.5" />
          <ellipse cx="200" cy="200" rx="60" ry="180" stroke="hsl(45 93% 47%)" strokeWidth="0.75" />
          <ellipse cx="200" cy="200" rx="120" ry="180" stroke="hsl(45 93% 47%)" strokeWidth="0.5" />
          <line x1="20" y1="200" x2="380" y2="200" stroke="hsl(45 93% 47%)" strokeWidth="0.5" />
          <line x1="200" y1="20" x2="200" y2="380" stroke="hsl(45 93% 47%)" strokeWidth="0.5" />
        </svg>

        {/* Content */}
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-24 md:py-32 z-10">
          <ScrollReveal className="max-w-3xl">
            <div className="flex items-center gap-3 mb-6">
              <div className="w-10 h-10 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 shadow-lg shadow-gold-500/20 animate-pulse-glow" />
              <span className="text-gold-400 text-sm font-black uppercase tracking-[0.2em]">
                New World Alliances Foundation
              </span>
            </div>

            <h1 className="text-4xl md:text-6xl font-serif font-black text-white tracking-tight mb-2 leading-tight">
              Where Truth
            </h1>
            <h1 className="text-4xl md:text-6xl font-serif font-black tracking-tight mb-6 leading-tight">
              <AnimatedGradientText>Meets Accountability</AnimatedGradientText>
            </h1>

            <HeroBeamLine delay={800} />

            <p className="text-lg md:text-xl text-stone-300 leading-relaxed mb-4 max-w-2xl">
              Golden Pages is a comprehensive directory of contacts within governments and corporations
              whose decisions impact human rights worldwide. We shine light where truth lays, so that
              those responsible can be held to account.
            </p>

            <p className="text-stone-400 leading-relaxed mb-8 max-w-2xl">
              From food security and environmental sustainability to workers&apos; rights and public health,
              we connect advocates, journalists, and citizens directly with decision-makers. Because every
              human being deserves to live with dignity, safety, and freedom.
            </p>

            <div className="flex flex-wrap gap-4">
              <Link
                href="/communications"
                className="flex items-center gap-2 px-6 py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 hover:scale-[1.02] hover:shadow-xl hover:shadow-gold-600/20 active:scale-[0.98] transition-all shadow-lg shadow-gold-600/20"
              >
                <Eye size={18} />
                Public Register
              </Link>
              <Link
                href="/login"
                className="flex items-center gap-2 px-6 py-3 bg-white/10 text-white rounded-2xl font-bold hover:bg-white/20 hover:scale-[1.02] active:scale-[0.98] transition-all border border-white/10"
              >
                Sign In
                <ArrowRight size={18} />
              </Link>
            </div>
          </ScrollReveal>
        </div>
      </section>

      {/* Human Rights Focus Areas */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-12 relative z-10">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {[
            {
              icon: Scale,
              title: 'Accountability',
              description: 'Holding governments and corporations to account for policies and practices that harm human lives. Every decision-maker should answer to the people they affect.',
            },
            {
              icon: Wheat,
              title: 'Food Security',
              description: 'Tracking those responsible for agricultural policy, pesticide regulation, and food supply chains. From Monsanto\'s glyphosate to government-subsidised monocultures, we document who controls what reaches our plates.',
            },
            {
              icon: Heart,
              title: 'Right to Health',
              description: 'Ensuring access to healthcare, safe medicines, and clean environments is a fundamental right. We track pharmaceutical companies, health ministries, and regulators who fail to protect public wellbeing.',
            },
          ].map((card, i) => (
            <ScrollReveal key={card.title} delay={i * 100}>
              <GlowCard>
                <div className="w-12 h-12 bg-gold-50 dark:bg-gold-900/20 rounded-2xl flex items-center justify-center text-gold-600 mb-5 group-hover:scale-110 transition-transform">
                  <card.icon size={24} />
                </div>
                <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-3">
                  {card.title}
                </h2>
                <p className="text-stone-500 dark:text-stone-400 text-sm leading-relaxed">
                  {card.description}
                </p>
              </GlowCard>
            </ScrollReveal>
          ))}
        </div>
      </section>

      {/* Why It Matters */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20">
        <div className="bg-slate-900 rounded-[2.5rem] p-10 md:p-14 relative overflow-hidden noise-overlay">
          <GradientMesh
            colors={['hsl(45 93% 47% / 0.06)', 'hsl(45 93% 47% / 0.03)']}
            animated
          />
          <DotGrid spacing={32} opacity={0.04} />
          <div className="relative z-10">
            <ScrollReveal>
              <h2 className="font-serif text-3xl font-black text-white mb-3">Why This Matters</h2>
              <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-8" />
            </ScrollReveal>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-10">
              <ScrollReveal delay={100}>
                <p className="text-stone-300 leading-relaxed">
                  Corporations like Monsanto (now Bayer) have spent decades pushing pesticides linked to cancer
                  onto farmland worldwide, while lobbying governments to weaken safety regulations. Government
                  programs that displace indigenous communities, poison water supplies, or deny access to
                  essential medicines operate in the shadows. Golden Pages exists to bring those shadows into the light.
                </p>
              </ScrollReveal>
              <ScrollReveal delay={200}>
                <p className="text-stone-300 leading-relaxed">
                  We believe that when people know who is making decisions about their food, their water, their
                  health, and their environment, they can demand better. Transparency is not a privilege reserved
                  for the powerful - it is a right that belongs to every human being on this planet.
                </p>
              </ScrollReveal>
            </div>

            <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
              {[
                { target: 24, label: 'Countries Monitored' },
                { target: 1000, label: 'Decision-Makers Tracked' },
                { target: 127, label: 'Government Departments' },
                { target: 2720, label: 'Contact Channels' },
              ].map((stat, i) => (
                <ScrollReveal key={stat.label} delay={i * 100}>
                  <p className="text-3xl md:text-4xl font-serif font-black text-gold-400">
                    <AnimatedCounter target={stat.target} suffix="+" />
                  </p>
                  <p className="text-stone-400 text-sm font-medium mt-1">{stat.label}</p>
                </ScrollReveal>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Human Rights Areas Grid */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-16">
        <ScrollReveal>
          <h2 className="font-serif text-3xl font-black text-slate-900 dark:text-white mb-3">Human Rights We Defend</h2>
          <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-8" />
        </ScrollReveal>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {[
            { icon: Wheat, title: 'Food Security & Safety', desc: 'Pesticide regulation, GMO transparency, agricultural policy, food supply chains' },
            { icon: Droplets, title: 'Clean Water Access', desc: 'Water privatisation, pollution, indigenous water rights, sanitation infrastructure' },
            { icon: Heart, title: 'Public Health', desc: 'Pharmaceutical accountability, healthcare access, mental health services, drug safety' },
            { icon: Globe2, title: 'Environmental Justice', desc: 'Climate accountability, pollution, deforestation, corporate environmental harm' },
            { icon: Users, title: 'Workers\' Rights', desc: 'Fair wages, safe conditions, child labour, forced labour, supply chain transparency' },
            { icon: ShieldCheck, title: 'Indigenous Rights', desc: 'Land rights, cultural preservation, free prior and informed consent, displacement' },
            { icon: Gavel, title: 'Justice & Due Process', desc: 'Police accountability, prison reform, fair trial rights, freedom from arbitrary detention' },
            { icon: Eye, title: 'Right to Information', desc: 'Government transparency, press freedom, whistleblower protection, public records access' },
          ].map((area, i) => (
            <ScrollReveal key={area.title} delay={i * 75}>
              <GlowCard className="!p-6 !rounded-2xl group">
                <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600 mb-4 group-hover:scale-110 group-hover:rotate-3 transition-transform">
                  <area.icon size={20} />
                </div>
                <h3 className="font-bold text-slate-900 dark:text-white text-sm mb-2">{area.title}</h3>
                <p className="text-stone-500 dark:text-stone-400 text-xs leading-relaxed">{area.desc}</p>
              </GlowCard>
            </ScrollReveal>
          ))}
        </div>
      </section>

      {/* CTA Section */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-20">
        <ScrollReveal>
          <div className="bg-gradient-to-br from-gold-500 to-gold-600 rounded-[2.5rem] p-10 md:p-14 text-white relative overflow-hidden shimmer">
            <div className="absolute top-0 right-0 w-64 h-64 bg-white/10 blur-[100px] -mr-32 -mt-32" />
            <div className="relative z-10 max-w-2xl">
              <h2 className="font-serif text-3xl font-black mb-4">We Are Here to Help Humanity</h2>
              <p className="text-white/90 leading-relaxed mb-8">
                Golden Pages is not just a directory - it is a tool for justice. Whether you are a journalist
                exposing corporate harm, an advocate fighting for clean water, or a citizen demanding answers
                from your government, we provide the contacts and evidence you need to make change happen.
              </p>
              <div className="flex flex-wrap gap-4">
                <Link
                  href="/get-involved"
                  className="flex items-center gap-2 px-6 py-3 bg-white text-gold-700 rounded-2xl font-bold hover:bg-stone-50 hover:scale-[1.02] active:scale-[0.98] transition-all"
                >
                  Get Involved
                  <ArrowRight size={18} />
                </Link>
                <Link
                  href="/about"
                  className="flex items-center gap-2 px-6 py-3 bg-white/20 text-white rounded-2xl font-bold hover:bg-white/30 hover:scale-[1.02] active:scale-[0.98] transition-all border border-white/20"
                >
                  Learn More About Us
                </Link>
              </div>
            </div>
          </div>
        </ScrollReveal>
      </section>
    </div>
  );
}
