'use client';

import { useRouter } from 'next/navigation';
import OrganizationsList from '@/components/hierarchy/OrganizationsList';

export default function OrganizationsPage() {
  const router = useRouter();

  return (
    <OrganizationsList
      onSelectOrg={(org) => router.push(`/dashboard/organizations/${org.id}`)}
    />
  );
}
