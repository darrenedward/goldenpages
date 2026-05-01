'use client';

import { useRouter } from 'next/navigation';
import CommunicationList from '@/components/communications/CommunicationList';

export default function MyCommunicationsPage() {
  const router = useRouter();

  return (
    <CommunicationList
      myOnly={true}
      onSelectCommunication={(id) => router.push(`/dashboard/communications/${id}`)}
    />
  );
}
