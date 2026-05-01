'use client';

import React, { createContext, useContext, useState, useCallback, ReactNode } from 'react';
import StatusModal from './StatusModal';

export type LogEntry = { message: string; type: 'info' | 'success' | 'error'; timestamp: Date };

interface StatusModalContextValue {
  showStatusModal: boolean;
  setShowStatusModal: (show: boolean) => void;
  setProcessType: (type: 'clear' | 'seed') => void;
  executeClearDatabase: () => Promise<void>;
}

const StatusModalContext = createContext<StatusModalContextValue | null>(null);

export function StatusModalProvider({ children }: { children: ReactNode }) {
  const [show, setShow] = useState(false);
  const [processType, setProcessType] = useState<'clear' | 'seed'>('clear');
  const [isProcessing, setIsProcessing] = useState(false);
  const [logs, setLogs] = useState<LogEntry[]>([]);

  const addLog = useCallback((message: string, type: 'info' | 'success' | 'error' = 'info') => {
    setLogs(prev => [...prev, { message, type, timestamp: new Date() }]);
  }, []);

  const executeClearDatabase = useCallback(async () => {
    setIsProcessing(true);
    setLogs([]);
    addLog('Starting database wipe...', 'info');
    try {
      const { supabase } = await import('@/services/supabaseClient');
      await supabase.from('contact_channels').delete().neq('id', '00000000-0000-0000-0000-000000000000');
      await supabase.from('contacts').delete().neq('id', '00000000-0000-0000-0000-000000000000');
      await supabase.from('organisations').delete().neq('id', '00000000-0000-0000-0000-000000000000');
      addLog('Database cleared.', 'success');
      setTimeout(() => setShow(false), 1500);
    } catch (error) {
      const msg = error instanceof Error ? error.message : 'Unknown deletion error';
      addLog(msg, 'error');
    } finally {
      setIsProcessing(false);
    }
  }, [addLog]);

  return (
    <StatusModalContext.Provider value={{ showStatusModal: show, setShowStatusModal: setShow, setProcessType, executeClearDatabase }}>
      {children}
      <StatusModal
        show={show}
        processType={processType}
        isProcessing={isProcessing}
        statusLogs={logs}
        onClose={() => setShow(false)}
        onConfirmClear={() => void executeClearDatabase()}
      />
    </StatusModalContext.Provider>
  );
}

export function useStatusModal() {
  const ctx = useContext(StatusModalContext);
  if (!ctx) throw new Error('useStatusModal must be used within StatusModalProvider');
  return ctx;
}
