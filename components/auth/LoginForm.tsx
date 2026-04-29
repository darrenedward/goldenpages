'use client';

/**
 * LoginForm Component
 *
 * Provides a user interface for email/password authentication.
 * Handles sign in, sign up, and password reset flows.
 * Styled with the Golden Theme.
 */

import React, { useState } from 'react';
import { useAuth } from '@/lib/authContext';

// ============================================================================
// TYPES
// ============================================================================

type AuthMode = 'login' | 'signup' | 'forgot';

interface LoginFormData {
  email: string;
  password: string;
  name?: string;
  confirmPassword?: string;
}

// ============================================================================
// COMPONENT
// ============================================================================

export function LoginForm() {
  const { signIn, signUp, loading } = useAuth();

  const [mode, setMode] = useState<AuthMode>('login');
  const [formData, setFormData] = useState<LoginFormData>({
    email: '',
    password: '',
  });
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  // ==========================================================================
  // HANDLERS
  // ==========================================================================

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
    setError(null);
    setSuccess(null);
  };

  const validateForm = (): boolean => {
    if (!formData.email || !formData.email.includes('@')) {
      setError('Please enter a valid email address');
      return false;
    }

    if (mode === 'login' || mode === 'signup') {
      if (!formData.password || formData.password.length < 6) {
        setError('Password must be at least 6 characters');
        return false;
      }
    }

    if (mode === 'signup') {
      if (!formData.name || formData.name.trim().length < 2) {
        setError('Please enter your name');
        return false;
      }
      if (formData.password !== formData.confirmPassword) {
        setError('Passwords do not match');
        return false;
      }
    }

    return true;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setSuccess(null);

    if (!validateForm()) return;

    setIsSubmitting(true);

    try {
      if (mode === 'login') {
        const { error } = await signIn({
          email: formData.email,
          password: formData.password,
        });

        if (error) {
          setError(error.message || 'Failed to sign in');
        }
      } else if (mode === 'signup') {
        const { error } = await signUp({
          email: formData.email,
          password: formData.password,
          metadata: {
            name: formData.name,
          },
        });

        if (error) {
          setError(error.message || 'Failed to create account');
        } else {
          setSuccess('Account created! Please check your email to verify your account.');
          setMode('login');
        }
      } else if (mode === 'forgot') {
        setSuccess('Password reset link sent to your email if account exists.');
        setMode('login');
      }
    } catch {
      setError('An unexpected error occurred');
    } finally {
      setIsSubmitting(false);
    }
  };

  // ==========================================================================
  // RENDER
  // ==========================================================================

  if (loading) {
    return (
      <div className="flex items-center justify-center py-12">
        <div className="w-8 h-8 border-4 border-gold-200 border-t-gold-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="max-w-md w-full">
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
        {/* Header */}
        <div className="text-center mb-8">
          <h2 className="font-serif text-2xl font-bold text-slate-900 dark:text-white">
            {mode === 'login' && 'Welcome Back'}
            {mode === 'signup' && 'Create Account'}
            {mode === 'forgot' && 'Reset Password'}
          </h2>
          <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-12 mx-auto mt-3" />
          <p className="mt-4 text-sm text-stone-500 dark:text-stone-400">
            {mode === 'login' && 'Sign in to access the Golden Pages directory'}
            {mode === 'signup' && 'Sign up to get started with Golden Pages'}
            {mode === 'forgot' && 'Enter your email to reset your password'}
          </p>
        </div>

        {/* Error/Success Messages */}
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
          {/* Name field for signup */}
          {mode === 'signup' && (
            <div>
              <label htmlFor="name" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                Full Name
              </label>
              <input
                id="name"
                name="name"
                type="text"
                required
                value={formData.name || ''}
                onChange={handleInputChange}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
                placeholder="John Doe"
              />
            </div>
          )}

          {/* Email field */}
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
              value={formData.email}
              onChange={handleInputChange}
              className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
              placeholder="you@example.com"
            />
          </div>

          {/* Password field */}
          {(mode === 'login' || mode === 'signup') && (
            <div>
              <label htmlFor="password" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                Password
              </label>
              <input
                id="password"
                name="password"
                type="password"
                autoComplete={mode === 'login' ? 'current-password' : 'new-password'}
                required
                value={formData.password}
                onChange={handleInputChange}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
                placeholder="••••••••"
              />
            </div>
          )}

          {/* Confirm password for signup */}
          {mode === 'signup' && (
            <div>
              <label htmlFor="confirmPassword" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                Confirm Password
              </label>
              <input
                id="confirmPassword"
                name="confirmPassword"
                type="password"
                autoComplete="new-password"
                required
                value={formData.confirmPassword || ''}
                onChange={handleInputChange}
                className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm"
                placeholder="••••••••"
              />
            </div>
          )}

          {/* Submit button */}
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
                {mode === 'login' && 'Sign In'}
                {mode === 'signup' && 'Create Account'}
                {mode === 'forgot' && 'Send Reset Link'}
              </span>
            )}
          </button>
        </form>

        {/* Mode switching */}
        <div className="text-center text-sm mt-6 space-y-2">
          {mode === 'login' && (
            <>
              <button
                type="button"
                onClick={() => setMode('signup')}
                className="text-gold-600 dark:text-gold-400 hover:text-gold-700 dark:hover:text-gold-300 font-medium"
              >
                Don&apos;t have an account? Sign up
              </button>
              <div>
                <button
                  type="button"
                  onClick={() => setMode('forgot')}
                  className="text-stone-500 dark:text-stone-400 hover:text-stone-600 dark:hover:text-stone-300"
                >
                  Forgot your password?
                </button>
              </div>
            </>
          )}

          {mode === 'signup' && (
            <button
              type="button"
              onClick={() => setMode('login')}
              className="text-gold-600 dark:text-gold-400 hover:text-gold-700 dark:hover:text-gold-300 font-medium"
            >
              Already have an account? Sign in
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
