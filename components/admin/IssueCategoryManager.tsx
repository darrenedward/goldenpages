'use client';

import { useState, useEffect } from 'react';
import { Plus, Pencil, Trash2, Check, X, GripVertical, ToggleLeft, ToggleRight } from 'lucide-react';
import * as z from 'zod';
import { issueCategoryService, type IssueCategory } from '@/services/issueCategoryService';
import LoadingSpinner from '@/components/shared/LoadingSpinner';
import toast from 'react-hot-toast';

const categorySchema = z.object({
  name: z.string().min(1, 'Name is required'),
  slug: z.string().min(1, 'Slug is required'),
  description: z.string(),
  icon: z.string(),
  sortOrder: z.number().min(0),
});
type CategoryFormData = z.infer<typeof categorySchema>;

const EMPTY_FORM: CategoryFormData = {
  name: '',
  slug: '',
  description: '',
  icon: 'AlertTriangle',
  sortOrder: 0,
};

export default function IssueCategoryManager() {
  const [categories, setCategories] = useState<IssueCategory[]>([]);
  const [loading, setLoading] = useState(true);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [showAdd, setShowAdd] = useState(false);
  const [form, setForm] = useState<CategoryFormData>(EMPTY_FORM);

  useEffect(() => {
    void fetchCategories();
  }, []);

  const fetchCategories = async () => {
    setLoading(true);
    try {
      const data = await issueCategoryService.getAll();
      setCategories(data);
    } catch (err) {
      toast.error('Failed to load categories');
    } finally {
      setLoading(false);
    }
  };

  const handleNameChange = (name: string) => {
    setForm(prev => ({
      ...prev,
      name,
      slug: issueCategoryService.slugify(name),
    }));
  };

  const handleSaveNew = async () => {
    const result = categorySchema.safeParse(form);
    if (!result.success) {
      const firstError = result.error.issues[0];
      toast.error(firstError?.message || 'Validation failed');
      return;
    }
    try {
      await issueCategoryService.create({
        name: form.name,
        slug: form.slug || issueCategoryService.slugify(form.name),
        description: form.description || undefined,
        icon: form.icon || undefined,
        sortOrder: form.sortOrder || categories.length + 1,
      });
      toast.success('Category created');
      setShowAdd(false);
      setForm(EMPTY_FORM);
      void fetchCategories();
    } catch (err) {
      toast.error('Failed to create category');
    }
  };

  const handleSaveEdit = async (id: string) => {
    const result = categorySchema.safeParse(form);
    if (!result.success) {
      const firstError = result.error.issues[0];
      toast.error(firstError?.message || 'Validation failed');
      return;
    }
    try {
      await issueCategoryService.update(id, {
        name: form.name,
        slug: form.slug,
        description: form.description || null,
        icon: form.icon || null,
        sortOrder: form.sortOrder,
      });
      toast.success('Category updated');
      setEditingId(null);
      setForm(EMPTY_FORM);
      void fetchCategories();
    } catch (err) {
      toast.error('Failed to update category');
    }
  };

  const handleToggleActive = async (cat: IssueCategory) => {
    try {
      await issueCategoryService.update(cat.id, { isActive: !cat.isActive });
      toast.success(cat.isActive ? 'Category deactivated' : 'Category activated');
      void fetchCategories();
    } catch (err) {
      toast.error('Failed to toggle category');
    }
  };

  const handleDelete = async (cat: IssueCategory) => {
    if (!confirm(`Delete "${cat.name}"? This cannot be undone.`)) return;
    try {
      await issueCategoryService.delete(cat.id);
      toast.success('Category deleted');
      void fetchCategories();
    } catch (err) {
      toast.error('Failed to delete category');
    }
  };

  const startEdit = (cat: IssueCategory) => {
    setEditingId(cat.id);
    setShowAdd(false);
    setForm({
      name: cat.name,
      slug: cat.slug,
      description: cat.description || '',
      icon: cat.icon || 'AlertTriangle',
      sortOrder: cat.sortOrder,
    });
  };

  const cancelEdit = () => {
    setEditingId(null);
    setShowAdd(false);
    setForm(EMPTY_FORM);
  };

  if (loading) return <LoadingSpinner message="Loading categories..." />;

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-3xl font-serif font-bold text-slate-800 dark:text-white">Issue Categories</h2>
          <p className="text-sm text-stone-500 dark:text-stone-400 mt-1">Manage the human rights categories shown on the Report page</p>
        </div>
        {!showAdd && (
          <button
            onClick={() => { setShowAdd(true); setEditingId(null); setForm({ ...EMPTY_FORM, sortOrder: categories.length + 1 }); }}
            className="flex items-center gap-2 px-4 py-2 bg-gold-600 text-white rounded-2xl font-bold hover:bg-gold-700 transition-all"
          >
            <Plus size={16} /> New Category
          </button>
        )}
      </div>

      {/* Add form */}
      {showAdd && (
        <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-gold-300 dark:border-gold-600/30 p-6 space-y-4">
          <h3 className="font-serif text-lg font-bold text-slate-900 dark:text-white">New Category</h3>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <label className="block text-xs font-bold text-slate-700 dark:text-stone-300 mb-1">Name *</label>
              <input value={form.name} onChange={(e) => handleNameChange(e.target.value)} className="w-full px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" placeholder="Food Security & Safety" />
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 dark:text-stone-300 mb-1">Slug</label>
              <input value={form.slug} onChange={(e) => setForm(prev => ({ ...prev, slug: e.target.value }))} className="w-full px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" placeholder="food_safety" />
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 dark:text-stone-300 mb-1">Icon (lucide-react)</label>
              <input value={form.icon} onChange={(e) => setForm(prev => ({ ...prev, icon: e.target.value }))} className="w-full px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" placeholder="Wheat" />
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 dark:text-stone-300 mb-1">Sort Order</label>
              <input type="number" value={form.sortOrder} onChange={(e) => setForm(prev => ({ ...prev, sortOrder: parseInt(e.target.value) || 0 }))} className="w-full px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" />
            </div>
          </div>
          <div>
            <label className="block text-xs font-bold text-slate-700 dark:text-stone-300 mb-1">Description</label>
            <input value={form.description} onChange={(e) => setForm(prev => ({ ...prev, description: e.target.value }))} className="w-full px-3 py-2 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" placeholder="Brief description shown on report form" />
          </div>
          <div className="flex gap-3">
            <button onClick={() => void handleSaveNew()} className="flex items-center gap-2 px-4 py-2 bg-gold-600 text-white rounded-xl text-sm font-bold hover:bg-gold-700 transition-all"><Check size={14} /> Save</button>
            <button onClick={cancelEdit} className="flex items-center gap-2 px-4 py-2 bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-300 rounded-xl text-sm font-bold hover:bg-stone-200 dark:hover:bg-stone-700 transition-all"><X size={14} /> Cancel</button>
          </div>
        </div>
      )}

      {/* Category list */}
      <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden">
        <div className="px-6 py-4 border-b border-stone-200 dark:border-white/5">
          <div className="grid grid-cols-12 gap-4 text-xs font-black uppercase tracking-widest text-stone-500 dark:text-stone-400">
            <div className="col-span-1">#</div>
            <div className="col-span-3">Name</div>
            <div className="col-span-2">Slug</div>
            <div className="col-span-3">Description</div>
            <div className="col-span-1">Active</div>
            <div className="col-span-2 text-right">Actions</div>
          </div>
        </div>

        {categories.length === 0 ? (
          <div className="p-8 text-center text-stone-400">No categories found. Create your first one.</div>
        ) : (
          <ul className="divide-y divide-stone-200 dark:divide-white/5">
            {categories.map((cat) => (
              <li key={cat.id}>
                {editingId === cat.id ? (
                  /* Edit mode */
                  <div className="p-4 bg-gold-50/50 dark:bg-gold-900/10 space-y-3">
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                      <input value={form.name} onChange={(e) => handleNameChange(e.target.value)} className="px-3 py-2 bg-white dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" />
                      <input value={form.slug} onChange={(e) => setForm(prev => ({ ...prev, slug: e.target.value }))} className="px-3 py-2 bg-white dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" />
                      <input value={form.description} onChange={(e) => setForm(prev => ({ ...prev, description: e.target.value }))} className="px-3 py-2 bg-white dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" placeholder="Description" />
                      <div className="flex gap-2">
                        <input value={form.icon} onChange={(e) => setForm(prev => ({ ...prev, icon: e.target.value }))} className="flex-1 px-3 py-2 bg-white dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" placeholder="Icon" />
                        <input type="number" value={form.sortOrder} onChange={(e) => setForm(prev => ({ ...prev, sortOrder: parseInt(e.target.value) || 0 }))} className="w-20 px-3 py-2 bg-white dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl focus:outline-none focus:ring-2 focus:ring-gold-500 text-sm text-slate-800 dark:text-white" />
                      </div>
                    </div>
                    <div className="flex gap-2">
                      <button onClick={() => void handleSaveEdit(cat.id)} className="flex items-center gap-1 px-3 py-1.5 bg-gold-600 text-white rounded-lg text-xs font-bold hover:bg-gold-700"><Check size={12} /> Save</button>
                      <button onClick={cancelEdit} className="flex items-center gap-1 px-3 py-1.5 bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-300 rounded-lg text-xs font-bold"><X size={12} /> Cancel</button>
                    </div>
                  </div>
                ) : (
                  /* Display mode */
                  <div className="grid grid-cols-12 gap-4 px-6 py-4 items-center hover:bg-stone-50 dark:hover:bg-white/5 transition-colors">
                    <div className="col-span-1 text-sm text-stone-400 flex items-center gap-1">
                      <GripVertical size={14} className="text-stone-300" />
                      {cat.sortOrder}
                    </div>
                    <div className="col-span-3">
                      <p className={`text-sm font-bold ${cat.isActive ? 'text-slate-900 dark:text-white' : 'text-stone-400 line-through'}`}>{cat.name}</p>
                      {cat.icon && <span className="text-[10px] text-stone-400 font-mono">{cat.icon}</span>}
                    </div>
                    <div className="col-span-2 text-xs text-stone-500 dark:text-stone-400 font-mono">{cat.slug}</div>
                    <div className="col-span-3 text-xs text-stone-500 dark:text-stone-400 truncate">{cat.description || '—'}</div>
                    <div className="col-span-1">
                      <button onClick={() => void handleToggleActive(cat)} className="text-stone-400 hover:text-gold-600 transition-colors">
                        {cat.isActive ? <ToggleRight size={20} className="text-emerald-500" /> : <ToggleLeft size={20} />}
                      </button>
                    </div>
                    <div className="col-span-2 flex justify-end gap-1">
                      <button onClick={() => startEdit(cat)} className="p-2 rounded-lg text-stone-400 hover:text-gold-600 hover:bg-gold-50 dark:hover:bg-gold-900/20 transition-all"><Pencil size={14} /></button>
                      <button onClick={() => void handleDelete(cat)} className="p-2 rounded-lg text-stone-400 hover:text-red-600 hover:bg-red-50 dark:hover:bg-red-900/20 transition-all"><Trash2 size={14} /></button>
                    </div>
                  </div>
                )}
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}
