'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAuth } from '@/lib/authContext';
import { LoginForm } from '@/components/auth/LoginForm';
import LoadingSpinner from '@/components/shared/LoadingSpinner';

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
    <div className="min-h-screen bg-stone-50 dark:bg-slate-950 flex flex-col">
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
  );
}
