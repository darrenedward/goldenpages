'use client';

import { ScrollReveal } from '@/components/shared/ScrollReveal';

export default function PrivacyPage() {
  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12 animate-fade-in">
      <div className="mb-10">
        <h1 className="font-serif text-4xl font-black text-slate-900 dark:text-white mb-3">Privacy Policy</h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-4" />
        <p className="text-stone-400 text-sm">Last updated: April 2026</p>
      </div>

      <div className="space-y-8">
        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Information We Collect</h2>
            <div className="space-y-3 text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>Golden Pages collects information you provide directly through our services:</p>
              <ul className="list-disc list-inside space-y-1 ml-4">
                <li><strong>Account information:</strong> Email address and authentication credentials when you create an account.</li>
                <li><strong>Contact directory data:</strong> Organization names, department details, contact names, and communication channels (phone, email, address) that you submit to the directory.</li>
                <li><strong>Communications:</strong> Titles, descriptions, documents, and metadata related to correspondence tracked in the public transparency register.</li>
                <li><strong>Reports:</strong> Information submitted through our issue reporting form, including your name, email, and the details of the report.</li>
                <li><strong>Contact form submissions:</strong> Name, email, subject, and message content.</li>
              </ul>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">How We Use Your Information</h2>
            <div className="space-y-3 text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>We use collected information to:</p>
              <ul className="list-disc list-inside space-y-1 ml-4">
                <li>Operate and maintain the Golden Pages contact directory and transparency register.</li>
                <li>Track and publish approved public communications for accountability purposes.</li>
                <li>Process and investigate submitted reports of human rights issues.</li>
                <li>Respond to your inquiries and contact form submissions.</li>
                <li>Send newsletter updates if you have subscribed (you may unsubscribe at any time).</li>
              </ul>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Data Storage &amp; Security</h2>
            <div className="space-y-3 text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>Your data is stored using Supabase, which hosts data on secure servers with encryption at rest and in transit. We implement Row Level Security (RLS) policies to ensure that:</p>
              <ul className="list-disc list-inside space-y-1 ml-4">
                <li>Public communications are only visible when approved by an authorized representative.</li>
                <li>Private communications and internal data are accessible only to authenticated users with appropriate roles.</li>
                <li>Report submissions are stored securely and only accessible to authorized administrators.</li>
              </ul>
              <p>While we take reasonable measures to protect your data, no system is completely secure. We encourage you to use strong passwords and protect your account credentials.</p>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Third-Party Services</h2>
            <div className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>We use the following third-party services:</p>
              <ul className="list-disc list-inside space-y-1 ml-4 mt-2">
                <li><strong>Supabase</strong> — Database, authentication, and file storage provider.</li>
                <li><strong>Vercel</strong> — Application hosting and deployment platform.</li>
              </ul>
              <p className="mt-3">These services have their own privacy policies governing how they handle data.</p>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Your Rights</h2>
            <div className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>You have the right to:</p>
              <ul className="list-disc list-inside space-y-1 ml-4 mt-2">
                <li>Access the personal data we hold about you.</li>
                <li>Request correction of inaccurate data.</li>
                <li>Request deletion of your account and associated data.</li>
                <li>Opt out of newsletter communications at any time.</li>
              </ul>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Contact Us</h2>
            <div className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>For privacy-related inquiries, please contact us at:</p>
              <p className="mt-2 font-bold text-gold-600">goldenpages@nwafoundation.org</p>
              <p className="mt-1">New World Alliances Foundation, Communication Division.</p>
            </div>
          </section>
        </ScrollReveal>
      </div>
    </div>
  );
}
