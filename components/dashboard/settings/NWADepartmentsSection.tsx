'use client';

import { useState, useEffect } from 'react';
import { Building2, Plus, Trash2, Loader2, X } from 'lucide-react';
import { toast } from 'react-hot-toast';

interface Dept { id: string; name: string; code?: string }

export default function NWADepartmentsSection() {
  const [departments, setDepartments] = useState<Dept[]>([]);
  const [loading, setLoading] = useState(true);
  const [showAdd, setShowAdd] = useState(false);
  const [newName, setNewName] = useState('');
  const [newCode, setNewCode] = useState('');
  const [adding, setAdding] = useState(false);

  const loadDepartments = async () => {
    try {
      const res = await fetch('/api/nwa-departments');
      if (res.ok) {
        const data = await res.json();
        setDepartments(data.departments || []);
      }
    } catch (err) {
      console.error('Failed to load departments:', err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    void loadDepartments();
  }, []);

  const handleAdd = async () => {
    if (!newName.trim()) return;
    setAdding(true);
    try {
      const res = await fetch('/api/nwa-departments', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name: newName, code: newCode }),
      });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to add');
      }
      setNewName('');
      setNewCode('');
      setShowAdd(false);
      await loadDepartments();
      toast.success('Department added');
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to add department');
    } finally {
      setAdding(false);
    }
  };

  const handleDelete = async (id: string) => {
    try {
      const res = await fetch(`/api/nwa-departments?id=${id}`, { method: 'DELETE' });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to remove');
      }
      await loadDepartments();
      toast.success('Department removed');
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to remove department');
    }
  };

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-2">
          <Building2 className="w-5 h-5 text-gold-600" />
          <h2 className="font-serif text-lg font-bold text-slate-800 dark:text-white">Departments</h2>
        </div>
        <button
          type="button"
          onClick={() => setShowAdd(!showAdd)}
          className="flex items-center gap-1 px-3 py-1.5 rounded-lg text-xs font-bold bg-gold-600 text-white hover:bg-gold-700 transition-colors"
        >
          {showAdd ? <X className="w-3 h-3" /> : <Plus className="w-3 h-3" />}
          {showAdd ? 'Cancel' : 'Add Department'}
        </button>
      </div>
      <p className="text-sm text-stone-500 dark:text-stone-400 mb-4">
        Internal departments that send communications on behalf of the organisation.
      </p>

      {showAdd && (
        <div className="flex gap-3 mb-4 p-3 bg-stone-50 dark:bg-stone-800 rounded-xl">
          <input
            type="text"
            value={newName}
            onChange={(e) => setNewName(e.target.value)}
            placeholder="Department name"
            className="flex-1 px-3 py-2 bg-white dark:bg-stone-900 border border-stone-200 dark:border-white/5 rounded-lg text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          />
          <input
            type="text"
            value={newCode}
            onChange={(e) => setNewCode(e.target.value)}
            placeholder="Code (e.g. NWA-TOUR)"
            className="w-32 px-3 py-2 bg-white dark:bg-stone-900 border border-stone-200 dark:border-white/5 rounded-lg text-sm text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          />
          <button
            type="button"
            onClick={() => void handleAdd()}
            disabled={adding || !newName.trim()}
            className="px-4 py-2 bg-gold-600 text-white rounded-lg text-sm font-bold hover:bg-gold-700 disabled:opacity-50 transition-colors"
          >
            {adding ? <Loader2 className="w-4 h-4 animate-spin" /> : 'Add'}
          </button>
        </div>
      )}

      {loading ? (
        <div className="flex items-center gap-2 text-stone-400">
          <Loader2 className="w-4 h-4 animate-spin" />
          Loading...
        </div>
      ) : departments.length === 0 ? (
        <p className="text-sm text-stone-400 text-center py-4">No departments yet</p>
      ) : (
        <div className="space-y-1.5">
          {departments.map(dept => (
            <div
              key={dept.id}
              className="flex items-center gap-3 p-3 rounded-xl bg-stone-50 dark:bg-stone-800 border border-stone-100 dark:border-white/5"
            >
              <div className="flex-1 min-w-0">
                <span className="font-medium text-slate-800 dark:text-white text-sm">{dept.name}</span>
                {dept.code && (
                  <span className="ml-2 text-[10px] font-bold bg-stone-100 dark:bg-stone-700 text-stone-500 px-1.5 py-0.5 rounded uppercase">
                    {dept.code}
                  </span>
                )}
              </div>
              <button
                type="button"
                onClick={() => void handleDelete(dept.id)}
                className="text-stone-400 hover:text-red-500 transition-colors p-1"
                title="Remove department"
              >
                <Trash2 className="w-4 h-4" />
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
