'use client';

import React from 'react';
import { AlertTriangle, Trash2, CheckCircle2, Database, Loader2, X } from 'lucide-react';
import type { LogEntry } from './StatusModalContext';

interface StatusModalProps {
  show: boolean;
  processType: 'clear' | 'seed';
  isProcessing: boolean;
  statusLogs: LogEntry[];
  onClose: () => void;
  onConfirmClear: () => void;
}

export default function StatusModal({ show, processType, isProcessing, statusLogs, onClose, onConfirmClear }: StatusModalProps) {
  if (!show) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-sm">
      <div className="bg-white dark:bg-slate-900 rounded-[2.5rem] shadow-2xl w-full max-w-md overflow-hidden border border-stone-200">
        <div className={`p-6 border-b flex justify-between items-center ${processType === 'clear' ? 'bg-red-50 border-red-100' : 'bg-gold-50 border-gold-100'}`}>
          <h3 className={`text-lg font-bold flex items-center gap-2 ${processType === 'clear' ? 'text-red-800' : 'text-gold-900'}`}>
            {processType === 'clear' ? <AlertTriangle size={20} /> : <Database size={20} />}
            System Status
          </h3>
          {!isProcessing && <button onClick={onClose} className="text-stone-400 hover:text-stone-700"><X size={20} /></button>}
        </div>
        <div className="p-8">
          {processType === 'clear' && statusLogs.length === 0 && !isProcessing ? (
            <div className="space-y-6">
              <p className="text-slate-700 font-medium text-center">Permanently wipe hierarchy data?</p>
              <div className="flex gap-4">
                <button onClick={onClose} className="flex-1 py-3 border border-stone-300 rounded-2xl text-slate-600 font-bold">Cancel</button>
                <button onClick={onConfirmClear} className="flex-1 py-3 bg-red-600 text-white rounded-2xl font-bold">Confirm Delete</button>
              </div>
            </div>
          ) : (
            <div className="space-y-6">
              <div className="flex items-center gap-3 text-slate-800 font-bold">
                {isProcessing ? <Loader2 size={20} className="animate-spin text-gold-500" /> : <CheckCircle2 size={20} className="text-emerald-500" />}
                <span>{isProcessing ? 'Syncing database...' : 'Data Sync Complete'}</span>
              </div>
              <div className="bg-slate-950 rounded-2xl p-5 font-mono text-[10px] h-56 overflow-y-auto text-gold-200/70 custom-scrollbar">
                {statusLogs.map((log, idx) => (
                  <div key={idx} className="mb-1.5">
                    <span className="opacity-40">[{log.timestamp.toLocaleTimeString()}]</span> {log.message}
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
