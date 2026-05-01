'use client';

import React, { useState } from 'react';
import { useAuth } from '@/lib/authContext';
import { authService } from '@/services/authService';

type AuthMode = 'login' | 'forgot';

export function LoginForm() {
  const { signIn } = useAuth();

  const [mode, setMode] = useState<AuthMode>('login');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setSuccess(null);

    if (!email || !email.includes('@')) {
      setError('Please enter a valid email address');
      return;
    }

    setIsSubmitting(true);

    try {
      if (mode === 'login') {
        if (!password || password.length < 6) {
          setError('Password must be at least 6 characters');
          setIsSubmitting(false);
          return;
        }

        const { error: signInError } = await signIn({ email, password });
        if (signInError) {
          setError(signInError.message || 'Failed to sign in');
          setIsSubmitting(false);
        }
        // If no error, the login page's useEffect will handle redirect
      } else if (mode === 'forgot') {
        const { error: resetError } = await authService.resetPassword(email);
        if (resetError) {
          setError(resetError.message || 'Failed to send reset email');
        } else {
          setSuccess('Password reset link sent to your email if an account exists.');
          setMode('login');
        }
        setIsSubmitting(false);
      }
    } catch {
      setError('An unexpected error occurred');
      setIsSubmitting(false);
    }
  };

  return (
    <div className="max-w-md w-full">
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
        {/* Header */}
        <div className="text-center mb-8">
          <h2 className="font-serif text-2xl font-bold text-slate-900 dark:text-white">
            {mode === 'login' ? 'Welcome Back' : 'Reset Password'}
          </h2>
          <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-12 mx-auto mt-3" />
          <p className="mt-4 text-sm text-stone-500 dark:text-stone-400">
            {mode === 'login'
              ? 'Sign in to access the Golden Pages directory'
              : 'Enter your email to receive a password reset link'}
          </p>
        </div>

        {/* Error/Success */}
        {error && (
          <div className="p-4 bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800/30 rounded-2xl mb-6">
            <p className="text-sm text-red-800 dark:text-red-300">{error}</p>
          </div>
        )}

        {success && (
          <div className="p-4 bg-emerald-50 dark:bg-emerald-900/20 border border-emerald-200 dark:border-emerald-800/30 rounded-2xl mb-6">
            <p className="text-sm text-emerald-800 dark:text-emerald-300">{success}</p>
          </div>
        )}

        {/* Form */}
        <form onSubmit={handleSubmit} className="space-y-5">
          {/* Email */}
          <div>
            <label htmlFor="email" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
              Email Address
            </label>
            <input
              id="email"
              name="email"
              type="email"
              autoComplete="email"
              required
              value={email}
              onChange={(e) => { setEmail(e.target.value); setError(null); setSuccess(null); }}
              className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
              placeholder="you@example.com"
            />
          </div>

          {/* Password (login only) */}
          {mode === 'login' && (
            <div>
              <label htmlFor="password" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                Password
              </label>
              <input
                id="password"
                name="password"
                type="password"
                autoComplete="current-password"
                required
                value={password}
                onChange={(e) => { setPassword(e.target.value); setError(null); }}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
                placeholder="••••••••"
              />
            </div>
          )}

          {/* Submit */}
          <button
            type="submit"
            disabled={isSubmitting}
            className="w-full py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {isSubmitting ? (
              <span className="flex items-center justify-center gap-2">
                <div className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                Processing...
              </span>
            ) : (
              <span>
                {mode === 'login' ? 'Sign In' : 'Send Reset Link'}
              </span>
            )}
          </button>
        </form>

        {/* Mode switching */}
        <div className="text-center text-sm mt-6 space-y-2">
          {mode === 'login' && (
            <button
              type="button"
              onClick={() => setMode('forgot')}
              className="text-stone-500 dark:text-stone-400 hover:text-stone-600 dark:hover:text-stone-300"
            >
              Forgot your password?
            </button>
          )}

          {mode === 'forgot' && (
            <button
              type="button"
              onClick={() => setMode('login')}
              className="text-gold-600 dark:text-gold-400 hover:text-gold-700 dark:hover:text-gold-300 font-medium"
            >
              Back to login
            </button>
          )}
        </div>
      </div>
    </div>
  );
}
