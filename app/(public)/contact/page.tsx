'use client';

import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import { Mail, MapPin, Globe2, Send, CheckCircle2 } from 'lucide-react';
import { ScrollReveal } from '@/components/shared/ScrollReveal';
import { contactService } from '@/services/contactService';
import toast from 'react-hot-toast';

const contactSchema = z.object({
  name: z.string().min(1, 'Name is required'),
  email: z.string().email('Please enter a valid email'),
  subject: z.string().min(1, 'Subject is required'),
  message: z.string().min(10, 'Message must be at least 10 characters'),
});
type ContactFormValues = z.infer<typeof contactSchema>;

export default function ContactPage() {
  const [submitted, setSubmitted] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  const { register, handleSubmit, formState: { errors }, reset } = useForm<ContactFormValues>({
    resolver: zodResolver(contactSchema),
    defaultValues: { name: '', email: '', subject: '', message: '' },
  });

  const onSubmit = async (data: ContactFormValues) => {
    if (submitting) return;
    setSubmitting(true);
    try {
      await contactService.submit(data);
      setSubmitted(true);
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to send message. Please try again.');
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 animate-fade-in">
      {/* Header */}
      <ScrollReveal className="mb-12">
        <h1 className="font-serif text-4xl font-black text-slate-900 dark:text-white mb-3">Contact Us</h1>
        <div className="h-1 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-24 mb-6" />
        <p className="text-stone-500 dark:text-stone-400 text-lg max-w-3xl leading-relaxed">
          Have questions, suggestions, or want to report an issue with our directory?
          We&apos;d love to hear from you.
        </p>
      </ScrollReveal>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* Contact Info */}
        <ScrollReveal className="space-y-6" delay={0}>
          <div className="relative bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            <div className="absolute left-0 top-0 bottom-0 w-1 bg-gradient-to-b from-gold-500 to-gold-600 rounded-l-[2rem]" />
            <h2 className="font-serif text-xl font-bold text-slate-900 dark:text-white mb-6">Get in Touch</h2>

            <div className="space-y-5">
              <div className="flex items-start gap-4 hover:translate-x-1 transition-transform">
                <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600 flex-shrink-0">
                  <Mail size={18} />
                </div>
                <div>
                  <p className="text-sm font-bold text-slate-900 dark:text-white">Email</p>
                  <p className="text-stone-500 dark:text-stone-400 text-sm">goldenpages@nwafoundation.org</p>
                </div>
              </div>

              <div className="flex items-start gap-4 hover:translate-x-1 transition-transform">
                <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600 flex-shrink-0">
                  <MapPin size={18} />
                </div>
                <div>
                  <p className="text-sm font-bold text-slate-900 dark:text-white">Organization</p>
                  <p className="text-stone-500 dark:text-stone-400 text-sm">
                    New World Alliances Foundation<br />
                    Communication Division
                  </p>
                </div>
              </div>

              <div className="flex items-start gap-4 hover:translate-x-1 transition-transform">
                <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600 flex-shrink-0">
                  <Globe2 size={18} />
                </div>
                <div>
                  <p className="text-sm font-bold text-slate-900 dark:text-white">Website</p>
                  <p className="text-stone-500 dark:text-stone-400 text-sm">nwafoundation.org</p>
                </div>
              </div>
            </div>
          </div>
        </ScrollReveal>

        {/* Contact Form */}
        <ScrollReveal className="lg:col-span-2" delay={100}>
          <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-8">
            {submitted ? (
              <div className="text-center py-12">
                <div className="w-16 h-16 bg-emerald-50 dark:bg-emerald-900/20 rounded-full flex items-center justify-center mx-auto mb-6 glow-gold">
                  <CheckCircle2 className="text-emerald-500" size={32} />
                </div>
                <h3 className="font-serif text-2xl font-bold text-slate-900 dark:text-white mb-3">
                  Message Sent
                </h3>
                <p className="text-stone-500 dark:text-stone-400 mb-6">
                  Thank you for reaching out. We&apos;ll get back to you as soon as possible.
                </p>
                <button
                  onClick={() => { setSubmitted(false); reset(); }}
                  className="px-6 py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all hover:scale-[1.02] active:scale-[0.98]"
                >
                  Send Another Message
                </button>
              </div>
            ) : (
              <form onSubmit={handleSubmit(onSubmit)} noValidate className="space-y-6">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                  <div>
                    <label htmlFor="name" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                      Name
                    </label>
                    <input
                      id="name"
                      type="text"
                      {...register('name')}
                      className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 focus:shadow-[0_0_15px_hsl(45_93%_47%/0.1)] text-sm text-slate-800 dark:text-white"
                      placeholder="Your name"
                    />
                    {errors.name && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.name.message}</p>}
                  </div>
                  <div>
                    <label htmlFor="email" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                      Email
                    </label>
                    <input
                      id="email"
                      type="email"
                      {...register('email')}
                      className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 focus:shadow-[0_0_15px_hsl(45_93%_47%/0.1)] text-sm text-slate-800 dark:text-white"
                      placeholder="you@example.com"
                    />
                    {errors.email && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.email.message}</p>}
                  </div>
                </div>

                <div>
                  <label htmlFor="subject" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                    Subject
                  </label>
                  <input
                    id="subject"
                    type="text"
                    {...register('subject')}
                    className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 focus:shadow-[0_0_15px_hsl(45_93%_47%/0.1)] text-sm text-slate-800 dark:text-white"
                    placeholder="What's this about?"
                  />
                  {errors.subject && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.subject.message}</p>}
                </div>

                <div>
                  <label htmlFor="message" className="block text-sm font-bold text-slate-900 dark:text-white mb-2">
                    Message
                  </label>
                  <textarea
                    id="message"
                    rows={6}
                    {...register('message')}
                    className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-2xl focus:outline-none focus:ring-2 focus:ring-gold-500 focus:shadow-[0_0_15px_hsl(45_93%_47%/0.1)] text-sm resize-none"
                    placeholder="Your message..."
                  />
                  {errors.message && <p className="text-red-500 text-[10px] font-bold mt-1 ml-1">{errors.message.message}</p>}
                </div>

                <button
                  type="submit"
                  disabled={submitting}
                  className="flex items-center gap-2 px-6 py-3 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all hover:scale-[1.02] active:scale-[0.98] disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  <Send size={16} />
                  {submitting ? 'Sending...' : 'Send Message'}
                </button>
              </form>
            )}
          </div>
        </ScrollReveal>
      </div>
    </div>
  );
}
