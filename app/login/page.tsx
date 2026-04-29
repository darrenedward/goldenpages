'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAuth } from '@/lib/authContext';
import { LoginForm } from '@/components/auth/LoginForm';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import { GradientMesh } from '@/components/shared/GradientMesh';
import { DotGrid } from '@/components/shared/DotGrid';

export default function LoginPage() {
  const { isAuthenticated, loading } = useAuth();
  const router = useRouter();

  useEffect(() => {
    if (!loading && isAuthenticated) {
      router.push('/dashboard');
    }
  }, [isAuthenticated, loading, router]);

  if (loading) {
    return (
      <div className="min-h-screen bg-stone-50 dark:bg-slate-950 flex items-center justify-center">
        <LoadingSpinner message="Loading..." />
      </div>
    );
  }

  if (isAuthenticated) {
    return null;
  }

  return (
    <div className="min-h-screen flex">
      {/* Left branding panel - hidden on mobile */}
      <div className="hidden lg:flex lg:w-1/2 relative bg-slate-950 items-center justify-center overflow-hidden">
        <GradientMesh
          colors={['hsl(45 93% 47% / 0.1)', 'hsl(45 93% 47% / 0.05)', 'hsl(215 25% 27% / 0.15)']}
          animated
        />
        <DotGrid spacing={32} opacity={0.04} />

        {/* Network nodes decoration */}
        <svg
          className="absolute bottom-12 left-12 w-48 h-48 opacity-[0.08]"
          viewBox="0 0 200 200"
          fill="none"
          aria-hidden="true"
          role="presentation"
        >
          <circle cx="40" cy="60" r="8" stroke="hsl(45 93% 47%)" strokeWidth="1.5" />
          <circle cx="160" cy="40" r="6" stroke="hsl(45 93% 47%)" strokeWidth="1.5" />
          <circle cx="100" cy="120" r="10" stroke="hsl(45 93% 47%)" strokeWidth="1.5" />
          <circle cx="60" cy="160" r="5" stroke="hsl(45 93% 47%)" strokeWidth="1.5" />
          <circle cx="150" cy="150" r="7" stroke="hsl(45 93% 47%)" strokeWidth="1.5" />
          <line x1="40" y1="60" x2="100" y2="120" stroke="hsl(45 93% 47%)" strokeWidth="0.75" />
          <line x1="100" y1="120" x2="160" y2="40" stroke="hsl(45 93% 47%)" strokeWidth="0.75" />
          <line x1="100" y1="120" x2="60" y2="160" stroke="hsl(45 93% 47%)" strokeWidth="0.75" />
          <line x1="100" y1="120" x2="150" y2="150" stroke="hsl(45 93% 47%)" strokeWidth="0.75" />
          <line x1="40" y1="60" x2="160" y2="40" stroke="hsl(45 93% 47%)" strokeWidth="0.5" />
        </svg>

        <div className="relative z-10 text-center px-12">
          <div className="w-20 h-20 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 mx-auto mb-6 animate-pulse-glow" />
          <h2 className="font-serif text-4xl font-black text-white mb-3">Golden Pages</h2>
          <p className="text-stone-400 max-w-xs mx-auto leading-relaxed">
            Human Rights Accountability Directory
          </p>
          <div className="mt-8 flex items-center justify-center gap-6 text-stone-500 text-xs">
            <span className="flex items-center gap-1.5">
              <span className="w-1.5 h-1.5 rounded-full bg-gold-500" />
              24+ Countries
            </span>
            <span className="flex items-center gap-1.5">
              <span className="w-1.5 h-1.5 rounded-full bg-gold-500" />
              1000+ Contacts
            </span>
          </div>
        </div>
      </div>

      {/* Right form panel */}
      <div className="flex-1 flex flex-col bg-stone-50 dark:bg-slate-950 min-h-screen">
        {/* Top bar */}
        <div className="py-4 px-6 flex items-center justify-between border-b border-stone-200 dark:border-white/10">
          <Link href="/" className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 shadow-lg shadow-gold-500/20" />
            <span className="text-xl font-serif font-bold tracking-wide text-slate-900 dark:text-gold-100">
              Golden<span className="text-gold-600">Pages</span>
            </span>
          </Link>
          <Link
            href="/"
            className="text-sm font-medium text-stone-500 dark:text-stone-400 hover:text-gold-600 transition-colors"
          >
            Back to Home
          </Link>
        </div>

        {/* Login form */}
        <div className="flex-1 flex items-center justify-center p-4">
          <LoginForm />
        </div>
      </div>
    </div>
  );
}
