import React from 'react';
import Link from 'next/link';
import { DotGrid } from '@/components/shared/DotGrid';

export default function PublicFooter() {
  return (
    <>
      {/* Gradient top border */}
      <div className="h-px bg-gradient-to-r from-transparent via-gold-500/30 to-transparent" />

      <footer className="relative bg-slate-900 text-white border-t border-gold-600/30 overflow-hidden">
        <DotGrid spacing={48} opacity={0.02} />

        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            {/* Branding */}
            <div>
              <div className="flex items-center gap-3 mb-4">
                <div className="w-8 h-8 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 shadow-lg shadow-gold-500/20" />
                <span className="text-xl font-serif font-bold tracking-wide text-gold-100">
                  Golden<span className="text-gold-400">Pages</span>
                </span>
              </div>
              <p className="text-stone-400 text-sm leading-relaxed">
                Part of the New World Alliances Foundation Communication Division.
                Bringing truth to light. Holding power to account. Defending human rights worldwide.
              </p>
            </div>

            {/* Quick Links */}
            <div>
              <h3 className="text-sm font-black uppercase tracking-widest text-gold-400 mb-4">Quick Links</h3>
              <ul className="space-y-2">
                {[
                  { href: '/communications', label: 'Public Register' },
                  { href: '/report', label: 'Report an Issue' },
                  { href: '/about', label: 'About Us' },
                  { href: '/get-involved', label: 'Get Involved' },
                  { href: '/contact', label: 'Contact' },
                ].map((link) => (
                  <li key={link.href}>
                    <Link
                      href={link.href}
                      className="text-stone-400 hover:text-gold-400 text-sm transition-colors"
                    >
                      {link.label}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>

            {/* Mission */}
            <div>
              <h3 className="text-sm font-black uppercase tracking-widest text-gold-400 mb-4">Our Mission</h3>
              <p className="text-stone-400 text-sm leading-relaxed">
                Tracking those whose decisions impact human rights - from food security and clean water
                to workers&apos; rights and environmental justice. Because every human being deserves dignity.
              </p>
            </div>

            {/* Connect */}
            <div>
              <h4 className="font-bold text-white text-sm mb-4">Connect</h4>
              <div className="flex gap-3 mb-4">
                {/* GitHub */}
                <a
                  href="https://github.com/darrenedward"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="w-9 h-9 rounded-xl bg-white/5 border border-white/10 flex items-center justify-center text-stone-400 hover:text-gold-400 hover:border-gold-500/30 transition-all"
                  aria-label="GitHub"
                >
                  <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
                  </svg>
                </a>
                {/* X/Twitter */}
                <a
                  href="https://x.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="w-9 h-9 rounded-xl bg-white/5 border border-white/10 flex items-center justify-center text-stone-400 hover:text-gold-400 hover:border-gold-500/30 transition-all"
                  aria-label="X (Twitter)"
                >
                  <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
                  </svg>
                </a>
              </div>
              <p className="text-stone-400 text-xs mb-3">Stay updated on human rights accountability</p>
              <div className="flex gap-2">
                <input
                  type="email"
                  placeholder="your@email.com"
                  className="flex-1 min-w-0 px-3 py-2 bg-white/5 border border-white/10 rounded-xl text-xs text-white placeholder:text-stone-600 focus:outline-none focus:ring-1 focus:ring-gold-500"
                />
                <button className="px-3 py-2 bg-gold-600 text-white rounded-xl text-xs font-bold hover:bg-gold-700 transition-all whitespace-nowrap">
                  Subscribe
                </button>
              </div>
            </div>
          </div>

          {/* Bottom bar */}
          <div className="mt-10 pt-8 border-t border-white/10 flex flex-col sm:flex-row items-center justify-between gap-4">
            <p className="text-stone-500 text-xs">
              &copy; {new Date().getFullYear()} New World Alliances Foundation. All rights reserved.
            </p>
            <div className="flex items-center gap-4">
              <Link href="/privacy" className="text-stone-500 hover:text-gold-400 text-xs transition-colors">
                Privacy Policy
              </Link>
              <span className="text-stone-700 text-xs">&middot;</span>
              <Link href="/terms" className="text-stone-500 hover:text-gold-400 text-xs transition-colors">
                Terms of Service
              </Link>
              <span className="text-stone-700 text-xs">&middot;</span>
              <p className="text-stone-600 text-xs font-medium">
                Golden Pages Directory &mdash; Division of New World Alliances Foundation
              </p>
            </div>
          </div>
        </div>
      </footer>
    </>
  );
}
