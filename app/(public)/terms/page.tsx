'use client';

import { ScrollReveal } from '@/components/shared/ScrollReveal';

export default function TermsPage() {
  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12 animate-fade-in">
      <div className="mb-10">
        <h1 className="font-serif text-4xl font-black text-slate-900 dark:text-white mb-3">Terms of Service</h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-4" />
        <p className="text-stone-400 text-sm">Last updated: April 2026</p>
      </div>

      <div className="space-y-8">
        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Acceptance of Terms</h2>
            <div className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>By accessing and using Golden Pages (&quot;the Service&quot;), operated by the New World Alliances Foundation (&quot;NWA Foundation&quot;), you agree to be bound by these Terms of Service. If you do not agree with any part of these terms, you must not use the Service.</p>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Use of Service</h2>
            <div className="space-y-3 text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>Golden Pages is a public transparency directory and communication tracking platform. You agree to use the Service only for lawful purposes and in accordance with these terms.</p>
              <p>You must not:</p>
              <ul className="list-disc list-inside space-y-1 ml-4">
                <li>Submit false, misleading, or defamatory information.</li>
                <li>Use the Service to harass, threaten, or intimidate individuals or organizations.</li>
                <li>Attempt to gain unauthorized access to any part of the Service.</li>
                <li>Use automated systems to scrape or collect data from the Service at scale without permission.</li>
              </ul>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">User Accounts</h2>
            <div className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>Certain features of the Service require a registered account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You must notify us immediately of any unauthorized use of your account.</p>
              <p className="mt-3">User accounts are assigned roles (Admin, Editor, User) that determine the level of access to the Service&apos;s features. Attempting to circumvent these permissions is prohibited.</p>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Public Transparency Register</h2>
            <div className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>Communications published in the public transparency register have been approved by an authorized representative. Public communications are visible to all visitors and are intended to promote accountability and transparency.</p>
              <p className="mt-3">By publishing a communication to the public register, you confirm that:</p>
              <ul className="list-disc list-inside space-y-1 ml-4 mt-2">
                <li>The communication has been reviewed and approved by an authorized representative of your organization.</li>
                <li>You are authorized to publish this correspondence on behalf of your organization.</li>
                <li>The content is truthful and accurate to the best of your knowledge.</li>
              </ul>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Limitation of Liability</h2>
            <div className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>The Service is provided &quot;as is&quot; without warranties of any kind. The NWA Foundation shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your use of or inability to use the Service.</p>
              <p className="mt-3">We do not guarantee the accuracy, completeness, or reliability of any contact information or communication data stored in the directory. Users are encouraged to verify information independently.</p>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Governing Law</h2>
            <div className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>These terms shall be governed by and construed in accordance with applicable laws. Any disputes arising from these terms or the use of the Service shall be resolved through appropriate legal channels.</p>
            </div>
          </section>
        </ScrollReveal>

        <ScrollReveal>
          <section className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-4">Contact</h2>
            <div className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
              <p>For questions about these Terms of Service, please contact:</p>
              <p className="mt-2 font-bold text-gold-600">goldenpages@nwafoundation.org</p>
              <p className="mt-1">New World Alliances Foundation, Communication Division.</p>
            </div>
          </section>
        </ScrollReveal>
      </div>
    </div>
  );
}
