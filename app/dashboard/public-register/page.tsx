'use client';

import { useRouter } from 'next/navigation';
import PublicCommunicationBrowser from '@/components/communications/PublicCommunicationBrowser';

export default function PublicRegisterPage() {
  const router = useRouter();

  return (
    <PublicCommunicationBrowser
      onSelectCommunication={(id) => router.push(`/dashboard/communications/${id}`)}
    />
  );
}
