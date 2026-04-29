import React from 'react';
import Link from 'next/link';

export default function PublicFooter() {
  return (
    <footer className="bg-slate-900 text-white border-t border-gold-600/30">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
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
        </div>

        <div className="mt-10 pt-8 border-t border-white/10 flex flex-col sm:flex-row items-center justify-between gap-4">
          <p className="text-stone-500 text-xs">
            &copy; {new Date().getFullYear()} New World Alliances Foundation. All rights reserved.
          </p>
          <p className="text-stone-600 text-xs font-medium">
            Communication Division &middot; Golden Pages Directory
          </p>
        </div>
      </div>
    </footer>
  );
}
