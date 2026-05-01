'use client';

import { useRouter, useSearchParams } from 'next/navigation';
import CommunicationList from '@/components/communications/CommunicationList';

export default function CommunicationsPage() {
  const router = useRouter();
  const searchParams = useSearchParams();

  const contactId = searchParams.get('contactId') || undefined;
  const departmentId = searchParams.get('departmentId') || undefined;
  const organisationId = searchParams.get('organisationId') || undefined;

  return (
    <CommunicationList
      contactId={contactId}
      departmentId={departmentId}
      organisationId={organisationId}
      onSelectCommunication={(id) => router.push(`/dashboard/communications/${id}`)}
    />
  );
}
