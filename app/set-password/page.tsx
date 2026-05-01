'use client';

import React, { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/lib/authContext';
import { authService } from '@/services/authService';
import { GradientMesh } from '@/components/shared/GradientMesh';
import { DotGrid } from '@/components/shared/DotGrid';
import { Check, Loader2, AlertTriangle } from 'lucide-react';
import Link from 'next/link';

export default function SetPasswordPage() {
  const { user, loading, isAuthenticated } = useAuth();
  const router = useRouter();
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [done, setDone] = useState(false);
  const [error, setError] = useState('');

  // Redirect to login if not authenticated (e.g. navigated here directly)
  useEffect(() => {
    if (!loading && !isAuthenticated) {
      router.replace('/login');
    }
  }, [loading, isAuthenticated, router]);

  if (loading) return null;

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    if (password.length < 8) {
      setError('Password must be at least 8 characters');
      return;
    }
    if (password !== confirmPassword) {
      setError('Passwords do not match');
      return;
    }

    setLoading(true);
    try {
      const { error: updateError } = await authService.updatePassword(password);
      if (updateError) throw updateError;
      setDone(true);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to set password');
    } finally {
      setLoading(false);
    }
  };

  if (done) {
    return (
      <div className="min-h-screen flex">
        <div className="hidden lg:flex lg:w-1/2 relative bg-slate-950 items-center justify-center overflow-hidden">
          <GradientMesh
            colors={['hsl(45 93% 47% / 0.1)', 'hsl(45 93% 47% / 0.05)', 'hsl(215 25% 27% / 0.15)']}
            animated
          />
          <DotGrid spacing={32} opacity={0.04} />
          <div className="relative z-10 text-center px-12">
            <div className="w-20 h-20 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 mx-auto mb-6" />
            <h2 className="font-serif text-4xl font-black text-white mb-3">Golden Pages</h2>
            <p className="text-stone-400">Human Rights Accountability Directory</p>
          </div>
        </div>
        <div className="flex-1 flex flex-col bg-stone-50 dark:bg-slate-950 min-h-screen">
          <div className="py-4 px-6 flex items-center justify-between border-b border-stone-200 dark:border-white/10">
            <Link href="/" className="flex items-center gap-3">
              <div className="w-8 h-8 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 shadow-lg shadow-gold-500/20" />
              <span className="text-xl font-serif font-bold tracking-wide text-slate-900 dark:text-gold-100">
                Golden<span className="text-gold-600">Pages</span>
              </span>
            </Link>
          </div>
          <div className="flex-1 flex items-center justify-center p-4">
            <div className="max-w-md w-full">
              <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8 text-center">
                <div className="w-16 h-16 rounded-full bg-emerald-100 dark:bg-emerald-900/30 flex items-center justify-center mx-auto mb-4">
                  <Check className="w-8 h-8 text-emerald-600" />
                </div>
                <h2 className="font-serif text-2xl font-bold text-slate-900 dark:text-white mb-2">
                  You&apos;re all set!
                </h2>
                <p className="text-stone-500 text-sm mb-6">
                  Your password has been saved. You can now sign in anytime.
                </p>
                <Link
                  href="/dashboard"
                  className="inline-flex items-center justify-center w-full py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all"
                >
                  Go to Dashboard
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex">
      <div className="hidden lg:flex lg:w-1/2 relative bg-slate-950 items-center justify-center overflow-hidden">
        <GradientMesh
          colors={['hsl(45 93% 47% / 0.1)', 'hsl(45 93% 47% / 0.05)', 'hsl(215 25% 27% / 0.15)']}
          animated
        />
        <DotGrid spacing={32} opacity={0.04} />
        <div className="relative z-10 text-center px-12">
          <div className="w-20 h-20 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 mx-auto mb-6 animate-pulse-glow" />
          <h2 className="font-serif text-4xl font-black text-white mb-3">Golden Pages</h2>
          <p className="text-stone-400">Human Rights Accountability Directory</p>
        </div>
      </div>

      <div className="flex-1 flex flex-col bg-stone-50 dark:bg-slate-950 min-h-screen">
        <div className="py-4 px-6 flex items-center justify-between border-b border-stone-200 dark:border-white/10">
          <Link href="/" className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 shadow-lg shadow-gold-500/20" />
            <span className="text-xl font-serif font-bold tracking-wide text-slate-900 dark:text-gold-100">
              Golden<span className="text-gold-600">Pages</span>
            </span>
          </Link>
        </div>

        <div className="flex-1 flex items-center justify-center p-4">
          <div className="max-w-md w-full">
            <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
              <div className="text-center mb-8">
                <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-12 mx-auto mb-4" />
                <h2 className="font-serif text-2xl font-bold text-slate-900 dark:text-white">
                  Welcome{user?.email ? `, ${user.email}` : ''}
                </h2>
                <p className="mt-3 text-sm text-stone-500">
                  You&apos;ve been signed in via a secure link. Set a password below so you can sign in anytime without needing a new link.
                </p>
              </div>

              {error && (
                <div className="p-4 bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800/30 rounded-2xl mb-6 flex items-start gap-2">
                  <AlertTriangle className="w-4 h-4 text-red-600 mt-0.5 shrink-0" />
                  <p className="text-sm text-red-800 dark:text-red-300">{error}</p>
                </div>
              )}

              <form onSubmit={handleSubmit} className="space-y-5">
                <div>
                  <label htmlFor="password" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                    New Password
                  </label>
                  <input
                    id="password"
                    type="password"
                    required
                    value={password}
                    onChange={(e) => { setPassword(e.target.value); setError(''); }}
                    className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
                    placeholder="At least 8 characters"
                  />
                </div>

                <div>
                  <label htmlFor="confirmPassword" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                    Confirm Password
                  </label>
                  <input
                    id="confirmPassword"
                    type="password"
                    required
                    value={confirmPassword}
                    onChange={(e) => { setConfirmPassword(e.target.value); setError(''); }}
                    className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
                    placeholder="Re-enter your password"
                  />
                </div>

                <button
                  type="submit"
                  disabled={loading}
                  className="w-full py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all disabled:opacity-50 flex items-center justify-center gap-2"
                >
                  {loading ? <Loader2 className="w-4 h-4 animate-spin" /> : null}
                  {loading ? 'Saving...' : 'Set Password'}
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
