'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { useAuth } from '@/lib/authContext';
import { Menu, X, LayoutDashboard, LogIn } from 'lucide-react';

const navLinks = [
  { href: '/', label: 'Home' },
  { href: '/communications', label: 'Communications' },
  { href: '/report', label: 'Report' },
  { href: '/about', label: 'About' },
  { href: '/get-involved', label: 'Get Involved' },
  { href: '/contact', label: 'Contact' },
];

export default function PublicNav() {
  const pathname = usePathname();
  const { isAuthenticated } = useAuth();
  const [mobileOpen, setMobileOpen] = useState(false);

  const isActive = (href: string) => {
    if (href === '/') return pathname === '/';
    return pathname.startsWith(href);
  };

  return (
    <header className="sticky top-0 z-50 glass border-b border-white/10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Logo */}
          <Link href="/" className="flex items-center gap-3 group">
            <div className="w-8 h-8 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 shadow-lg shadow-gold-500/20 group-hover:scale-110 transition-transform" />
            <span className="text-xl font-serif font-bold tracking-wide text-slate-900 dark:text-gold-100">
              Golden<span className="text-gold-600">Pages</span>
            </span>
          </Link>

          {/* Desktop nav */}
          <nav className="hidden md:flex items-center gap-1">
            {navLinks.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                className={`relative px-3 py-2 rounded-lg text-sm font-medium transition-all ${
                  isActive(link.href)
                    ? 'text-gold-700 dark:text-gold-400 bg-gold-50 dark:bg-gold-900/20'
                    : 'text-slate-600 dark:text-slate-400 hover:text-gold-700 dark:hover:text-gold-400 hover:bg-stone-50 dark:hover:bg-white/5'
                }`}
              >
                {link.label}
                {isActive(link.href) && (
                  <span className="absolute bottom-0 left-3 right-3 h-[2px] bg-gradient-to-r from-gold-500 to-gold-600 rounded-full" />
                )}
              </Link>
            ))}
          </nav>

          {/* Auth button */}
          <div className="hidden md:flex items-center gap-3">
            {isAuthenticated ? (
              <Link
                href="/dashboard"
                className="flex items-center gap-2 px-4 py-2 bg-slate-900 dark:bg-white/10 text-white rounded-xl text-sm font-bold hover:bg-slate-800 transition-all"
              >
                <LayoutDashboard size={16} />
                Dashboard
              </Link>
            ) : (
              <Link
                href="/login"
                className="flex items-center gap-2 px-4 py-2 bg-gold-600 text-white rounded-xl text-sm font-bold hover:bg-gold-700 transition-all animate-pulse-glow"
              >
                <LogIn size={16} />
                Sign In
              </Link>
            )}
          </div>

          {/* Mobile hamburger */}
          <button
            onClick={() => setMobileOpen(!mobileOpen)}
            className="md:hidden p-2 rounded-lg text-slate-600 dark:text-slate-400 hover:bg-stone-100 dark:hover:bg-white/5"
            aria-label="Toggle menu"
          >
            {mobileOpen ? <X size={24} /> : <Menu size={24} />}
          </button>
        </div>

        {/* Mobile menu */}
        {mobileOpen && (
          <div className="md:hidden border-t border-white/10 py-4 space-y-1 animate-slide-in-up">
            {navLinks.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                onClick={() => setMobileOpen(false)}
                className={`block px-4 py-2.5 rounded-lg text-sm font-medium transition-all ${
                  isActive(link.href)
                    ? 'text-gold-700 dark:text-gold-400 bg-gold-50 dark:bg-gold-900/20'
                    : 'text-slate-600 dark:text-slate-400 hover:bg-stone-50 dark:hover:bg-white/5'
                }`}
              >
                {link.label}
              </Link>
            ))}
            <div className="pt-3 border-t border-white/10">
              {isAuthenticated ? (
                <Link
                  href="/dashboard"
                  onClick={() => setMobileOpen(false)}
                  className="flex items-center gap-2 px-4 py-2.5 text-sm font-bold text-gold-700 dark:text-gold-400"
                >
                  <LayoutDashboard size={16} /> Dashboard
                </Link>
              ) : (
                <Link
                  href="/login"
                  onClick={() => setMobileOpen(false)}
                  className="flex items-center gap-2 px-4 py-2.5 bg-gold-600 text-white rounded-xl text-sm font-bold justify-center"
                >
                  <LogIn size={16} /> Sign In
                </Link>
              )}
            </div>
          </div>
        )}
      </div>
    </header>
  );
}
