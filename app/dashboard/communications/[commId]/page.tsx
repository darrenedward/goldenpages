'use client';

import { use } from 'react';
import { useRouter } from 'next/navigation';
import CommunicationDetail from '@/components/communications/CommunicationDetail';

export default function CommunicationDetailPage({ params }: { params: Promise<{ commId: string }> }) {
  const { commId } = use(params);
  const router = useRouter();

  return (
    <CommunicationDetail
      communicationId={commId}
      onBack={() => router.push('/dashboard/communications')}
    />
  );
}
