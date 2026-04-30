'use client';

import { useState, useEffect } from 'react';
import { Share2, Plus, Trash2, Save, Loader2, GripVertical } from 'lucide-react';
import * as z from 'zod';
import { settingsService } from '@/services/settingsService';
import toast from 'react-hot-toast';
import type { SocialLink } from '@/types';

const socialLinkSchema = z.object({
  platform: z.string(),
  url: z.string().url('Please enter a valid URL').or(z.literal('')),
  label: z.string(),
});
const socialLinksArraySchema = z.array(socialLinkSchema);

const PLATFORMS = [
  { value: 'github', label: 'GitHub' },
  { value: 'x', label: 'X (Twitter)' },
  { value: 'linkedin', label: 'LinkedIn' },
  { value: 'facebook', label: 'Facebook' },
  { value: 'instagram', label: 'Instagram' },
  { value: 'youtube', label: 'YouTube' },
  { value: 'website', label: 'Website' },
];

const EMPTY_LINK: SocialLink = { platform: 'website', url: '', label: '' };

export default function SocialLinksSection() {
  const [links, setLinks] = useState<SocialLink[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    void loadLinks();
  }, []);

  const loadLinks = async () => {
    try {
      const data = await settingsService.getSocialLinks();
      setLinks(data.length > 0 ? data : [{ ...EMPTY_LINK }]);
    } catch {
      setLinks([{ ...EMPTY_LINK }]);
    } finally {
      setLoading(false);
    }
  };

  const updateLink = (index: number, field: keyof SocialLink, value: string) => {
    setLinks(prev => {
      const next = [...prev];
      next[index] = { ...next[index], [field]: value };
      // Auto-set label from platform selection
      if (field === 'platform') {
        const platform = PLATFORMS.find(p => p.value === value);
        if (platform && !next[index].label) {
          next[index].label = platform.label;
        }
      }
      return next;
    });
  };

  const addLink = () => {
    setLinks(prev => [...prev, { ...EMPTY_LINK }]);
  };

  const removeLink = (index: number) => {
    setLinks(prev => prev.filter((_, i) => i !== index));
  };

  const handleSave = async () => {
    const validLinks = links.filter(l => l.url.trim() && l.label.trim());
    const result = socialLinksArraySchema.safeParse(validLinks);
    if (!result.success) {
      const firstError = result.error.issues[0];
      toast.error(firstError?.message || 'Validation failed');
      return;
    }
    setSaving(true);
    try {
      await settingsService.upsert('social_links', JSON.stringify(validLinks));
      toast.success('Social links saved');
      setLinks(validLinks.length > 0 ? validLinks : [{ ...EMPTY_LINK }]);
    } catch {
      toast.error('Failed to save social links');
    } finally {
      setSaving(false);
    }
  };

  if (loading) {
    return (
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
        <div className="flex items-center justify-center py-8 text-stone-400">
          <Loader2 className="w-5 h-5 animate-spin mr-2" /> Loading...
        </div>
      </div>
    );
  }

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
      <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white mb-4 flex items-center gap-2">
        <Share2 className="w-5 h-5 text-gold-600" />
        Social Media Links
      </h2>
      <p className="text-sm text-stone-500 dark:text-stone-400 mb-6">
        Configure social media links displayed in the public footer. These links appear on every public page.
      </p>

      <div className="space-y-3">
        {links.map((link, i) => (
          <div key={i} className="flex items-center gap-3 p-3 bg-stone-50 dark:bg-stone-800 rounded-xl">
            <GripVertical className="w-4 h-4 text-stone-300 flex-shrink-0" />
            <select
              value={link.platform}
              onChange={(e) => updateLink(i, 'platform', e.target.value)}
              aria-label={`Platform for link ${i + 1}`}
              className="bg-white dark:bg-slate-900 border border-stone-200 dark:border-white/5 rounded-lg px-3 py-2 text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
            >
              {PLATFORMS.map(p => (
                <option key={p.value} value={p.value}>{p.label}</option>
              ))}
            </select>
            <input
              type="text"
              value={link.label}
              onChange={(e) => updateLink(i, 'label', e.target.value)}
              placeholder="Label"
              className="w-28 px-3 py-2 bg-white dark:bg-slate-900 border border-stone-200 dark:border-white/5 rounded-lg text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
            <input
              type="url"
              value={link.url}
              onChange={(e) => updateLink(i, 'url', e.target.value)}
              placeholder="https://"
              className="flex-1 px-3 py-2 bg-white dark:bg-slate-900 border border-stone-200 dark:border-white/5 rounded-lg text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
            />
            <button
              type="button"
              onClick={() => removeLink(i)}
              className="p-2 text-stone-400 hover:text-red-600 hover:bg-red-50 dark:hover:bg-red-900/20 rounded-lg transition-colors flex-shrink-0"
              title="Remove link"
            >
              <Trash2 className="w-4 h-4" />
            </button>
          </div>
        ))}
      </div>

      <div className="flex items-center gap-3 mt-4">
        <button
          type="button"
          onClick={addLink}
          className="flex items-center gap-2 px-4 py-2 bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-300 rounded-xl text-sm font-bold hover:bg-stone-200 dark:hover:bg-stone-700 transition-all"
        >
          <Plus className="w-4 h-4" /> Add Link
        </button>
        <button
          onClick={() => void handleSave()}
          disabled={saving}
          className="flex items-center gap-2 px-4 py-2 bg-gold-600 text-white rounded-xl font-bold text-sm hover:bg-gold-700 transition-all disabled:opacity-50"
        >
          {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
          {saving ? 'Saving...' : 'Save Links'}
        </button>
      </div>
    </div>
  );
}
