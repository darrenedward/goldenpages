/**
 * Settings Service
 *
 * Manages site configuration stored in the site_settings table.
 * Uses in-memory cache with 5-min TTL to avoid repeated DB queries.
 */

import { supabase } from './supabaseClient';
import type { SiteSetting, SocialLink } from '@/types';

interface CacheEntry {
  value: SiteSetting;
  expiresAt: number;
}

class SettingsService {
  private static instance: SettingsService;
  private cache = new Map<string, CacheEntry>();
  private CACHE_TTL = 5 * 60 * 1000; // 5 minutes

  private constructor() {}

  static getInstance(): SettingsService {
    if (!SettingsService.instance) {
      SettingsService.instance = new SettingsService();
    }
    return SettingsService.instance;
  }

  private isExpired(entry: CacheEntry): boolean {
    return Date.now() > entry.expiresAt;
  }

  private setCache(setting: SiteSetting): void {
    this.cache.set(setting.key, {
      value: setting,
      expiresAt: Date.now() + this.CACHE_TTL,
    });
  }

  private invalidateCache(key?: string): void {
    if (key) {
      this.cache.delete(key);
    } else {
      this.cache.clear();
    }
  }

  async getAll(): Promise<SiteSetting[]> {
    const { data, error } = await supabase
      .from('site_settings')
      .select('*')
      .order('category')
      .order('label');

    if (error) throw error;

    const settings = (data || []) as unknown as SiteSetting[];
    settings.forEach(s => this.setCache(s));
    return settings;
  }

  async getByCategory(category: string): Promise<SiteSetting[]> {
    const { data, error } = await supabase
      .from('site_settings')
      .select('*')
      .eq('category', category)
      .order('label');

    if (error) throw error;
    return (data || []) as unknown as SiteSetting[];
  }

  async getByKey(key: string): Promise<SiteSetting | null> {
    // Check cache first
    const cached = this.cache.get(key);
    if (cached && !this.isExpired(cached)) {
      return cached.value;
    }

    const { data, error } = await supabase
      .from('site_settings')
      .select('*')
      .eq('key', key)
      .single();

    if (error) {
      if (error.code === 'PGRST116') return null; // not found
      throw error;
    }

    const setting = data as unknown as SiteSetting;
    this.setCache(setting);
    return setting;
  }

  async getValue(key: string): Promise<string | null> {
    const setting = await this.getByKey(key);
    return setting?.value ?? null;
  }

  async upsert(key: string, value: string): Promise<SiteSetting> {
    const { data, error } = await supabase
      .from('site_settings')
      .update({
        value,
        updatedAt: new Date().toISOString(),
      })
      .eq('key', key)
      .select()
      .single();

    if (error) throw error;

    const setting = data as unknown as SiteSetting;
    this.invalidateCache(key);
    this.setCache(setting);
    return setting;
  }

  async bulkUpsert(updates: Array<{ key: string; value: string }>): Promise<void> {
    const now = new Date().toISOString();

    for (const { key, value } of updates) {
      const { error } = await supabase
        .from('site_settings')
        .update({ value, updatedAt: now })
        .eq('key', key);

      if (error) throw error;
      this.invalidateCache(key);
    }
  }

  // Convenience getters

  async getEmailDomain(): Promise<string> {
    return (await this.getValue('email_domain')) || 'mail.goldenpages.newworldalliances.nz';
  }

  async getReportEmail(): Promise<string> {
    return (await this.getValue('report_email')) || 'reports@mail.goldenpages.newworldalliances.nz';
  }

  async getContactEmail(): Promise<string> {
    return (await this.getValue('contact_email')) || 'contact@mail.goldenpages.newworldalliances.nz';
  }

  async getSenderEmail(): Promise<string> {
    return (await this.getValue('sender_email')) || 'notifications@mail.goldenpages.newworldalliances.nz';
  }

  async getSenderName(): Promise<string> {
    return (await this.getValue('sender_name')) || 'Golden Pages';
  }

  async getSocialLinks(): Promise<SocialLink[]> {
    const raw = await this.getValue('social_links');
    if (!raw) return [];
    try {
      return JSON.parse(raw) as SocialLink[];
    } catch {
      return [];
    }
  }

  async getBoolean(key: string): Promise<boolean> {
    const val = await this.getValue(key);
    return val === 'true';
  }
}

export const settingsService = SettingsService.getInstance();
