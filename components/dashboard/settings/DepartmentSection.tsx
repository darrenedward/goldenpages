'use client';

import { useState, useEffect } from 'react';
import { Building2, Loader2 } from 'lucide-react';
import { useAuth } from '@/lib/authContext';
import { hierarchyService } from '@/services/hierarchyService';
import { toast } from 'react-hot-toast';

export default function DepartmentSection() {
  const { userDepartmentId, userDepartmentName } = useAuth();
  const [selectedDept, setSelectedDept] = useState(userDepartmentId || '');
  const [departments, setDepartments] = useState<{ id: string; name: string; code?: string }[]>([]);
  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    setSelectedDept(userDepartmentId || '');
  }, [userDepartmentId]);

  useEffect(() => {
    void (async () => {
      setLoading(true);
      try {
        const depts = await hierarchyService.getNWADepartments();
        setDepartments(depts);
      } catch (err) {
        console.error('Failed to load departments:', err);
      } finally {
        setLoading(false);
      }
    })();
  }, []);

  const handleSave = async () => {
    setSaving(true);
    try {
      const res = await fetch('/api/user/profile', {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ departmentId: selectedDept || null }),
      });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Failed to update department');
      }
      toast.success('Department updated');
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to update department');
    } finally {
      setSaving(false);
    }
  };

  const hasChanged = selectedDept !== (userDepartmentId || '');

  return (
    <div className="bg-white dark:bg-slate-900 rounded-[2rem] shadow-sm border border-stone-200 dark:border-white/5 p-6">
      <div className="flex items-center gap-2 mb-4">
        <Building2 className="w-5 h-5 text-gold-600" />
        <h3 className="font-serif text-lg font-bold text-slate-800 dark:text-white">My Department</h3>
      </div>
      <p className="text-sm text-stone-500 dark:text-stone-400 mb-4">
        Select your NWA Foundation department. This auto-fills when you create communications.
      </p>

      {loading ? (
        <div className="flex items-center gap-2 text-stone-400">
          <Loader2 className="w-4 h-4 animate-spin" />
          Loading departments...
        </div>
      ) : (
        <>
          <select
            value={selectedDept}
            onChange={(e) => setSelectedDept(e.target.value)}
            className="w-full px-4 py-3 bg-stone-50 dark:bg-stone-800 border border-stone-200 dark:border-white/5 rounded-xl text-slate-800 dark:text-white focus:outline-none focus:ring-2 focus:ring-gold-500"
          >
            <option value="">No department assigned</option>
            {departments.map(dept => (
              <option key={dept.id} value={dept.id}>
                {dept.name}{dept.code ? ` (${dept.code})` : ''}
              </option>
            ))}
          </select>

          {hasChanged && (
            <button
              type="button"
              onClick={() => void handleSave()}
              disabled={saving}
              className="mt-3 px-4 py-2 bg-gold-600 text-white rounded-xl text-sm font-bold hover:bg-gold-700 disabled:opacity-50 transition-colors"
            >
              {saving ? 'Saving...' : 'Save'}
            </button>
          )}

          {userDepartmentName && !hasChanged && (
            <p className="text-xs text-stone-400 mt-2">
              Current: {userDepartmentName}
            </p>
          )}
        </>
      )}
    </div>
  );
}
