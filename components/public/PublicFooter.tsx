'use client';

import React, { useState, useEffect } from 'react';
import Link from 'next/link';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import { DotGrid } from '@/components/shared/DotGrid';
import { contactService } from '@/services/contactService';
import { settingsService } from '@/services/settingsService';
import toast from 'react-hot-toast';
import type { SocialLink } from '@/types';

const newsletterSchema = z.object({
  email: z.string().email('Please enter a valid email address'),
});
type NewsletterValues = z.infer<typeof newsletterSchema>;

const FALLBACK_LINKS: SocialLink[] = [
  { platform: 'github', url: 'https://github.com/darrenedward', label: 'GitHub' },
  { platform: 'x', url: 'https://x.com', label: 'X (Twitter)' },
];

const SOCIAL_ICONS: Record<string, React.ReactNode> = {
  github: (
    <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
      <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
    </svg>
  ),
  x: (
    <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
      <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
    </svg>
  ),
  linkedin: (
    <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
      <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
    </svg>
  ),
  facebook: (
    <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
      <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
    </svg>
  ),
  instagram: (
    <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
      <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.052.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.333 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z" />
    </svg>
  ),
  youtube: (
    <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
      <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z" />
    </svg>
  ),
};

export default function PublicFooter() {
  const [subscribed, setSubscribed] = useState(false);
  const [subscribing, setSubscribing] = useState(false);
  const [socialLinks, setSocialLinks] = useState<SocialLink[]>(FALLBACK_LINKS);
  const { register, handleSubmit, formState: { errors }, reset } = useForm<NewsletterValues>({
    resolver: zodResolver(newsletterSchema),
  });

  useEffect(() => {
    settingsService.getSocialLinks().then(links => {
      if (links.length > 0) setSocialLinks(links);
    }).catch(() => {});
  }, []);

  const onSubscribe = async (data: NewsletterValues) => {
    setSubscribing(true);
    try {
      await contactService.subscribeNewsletter(data.email);
      setSubscribed(true);
      toast.success('Subscribed! You\'ll receive updates on human rights accountability.');
    } catch {
      toast.error('Failed to subscribe. Please try again.');
    } finally {
      setSubscribing(false);
    }
  };

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
                {socialLinks.map((link) => (
                  <a
                    key={link.platform}
                    href={link.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="w-9 h-9 rounded-xl bg-white/5 border border-white/10 flex items-center justify-center text-stone-400 hover:text-gold-400 hover:border-gold-500/30 transition-all"
                    aria-label={link.label}
                  >
                    {SOCIAL_ICONS[link.platform] || (
                      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
                      </svg>
                    )}
                  </a>
                ))}
              </div>
              <p className="text-stone-400 text-xs mb-3">Stay updated on human rights accountability</p>
              {subscribed ? (
                <p className="text-emerald-400 text-xs font-bold">Subscribed!</p>
              ) : (
                <form onSubmit={handleSubmit(onSubscribe)} className="flex flex-col gap-1">
                  <div className="flex gap-2">
                    <input
                      type="email"
                      {...register('email')}
                      placeholder="your@email.com"
                      className="flex-1 min-w-0 px-3 py-2 bg-white/5 border border-white/10 rounded-xl text-xs text-white placeholder:text-stone-600 focus:outline-none focus:ring-1 focus:ring-gold-500"
                    />
                    <button
                      type="submit"
                      disabled={subscribing}
                      className="px-3 py-2 bg-gold-600 text-white rounded-xl text-xs font-bold hover:bg-gold-700 transition-all whitespace-nowrap disabled:opacity-50"
                    >
                      {subscribing ? '...' : 'Subscribe'}
                    </button>
                  </div>
                  {errors.email && <p className="text-red-400 text-[10px] font-bold ml-1">{errors.email.message}</p>}
                </form>
              )}
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
