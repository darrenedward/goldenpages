'use client';

import { use } from 'react';
import { useRouter } from 'next/navigation';
import OrganizationDetail from '@/components/hierarchy/OrganizationDetail';

export default function OrganizationDetailPage({ params }: { params: Promise<{ orgId: string }> }) {
  const { orgId } = use(params);
  const router = useRouter();

  return (
    <OrganizationDetail
      orgId={orgId}
      onSelectDept={(dept) => router.push(`/dashboard/organizations/${orgId}/departments/${dept.id}`)}
      onChangeView={(view) => {
        if (view === 'organization-detail') return; // already here
        router.push(viewToDashboardPath(view));
      }}
    />
  );
}

function viewToDashboardPath(view: string): string {
  const map: Record<string, string> = {
    dashboard: '/dashboard',
    organizations: '/dashboard/organizations',
    communications: '/dashboard/communications',
    'my-communications': '/dashboard/my-communications',
  };
  return map[view] || '/dashboard';
}
