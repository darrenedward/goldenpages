'use client';

import { use } from 'react';
import { useRouter } from 'next/navigation';
import DepartmentContacts from '@/components/hierarchy/DepartmentContacts';

export default function DepartmentContactsPage({ params }: { params: Promise<{ orgId: string; deptId: string }> }) {
  const { orgId, deptId } = use(params);
  const router = useRouter();

  return (
    <DepartmentContacts
      orgId={orgId}
      deptId={deptId}
      onChangeView={(view, data) => {
        if (view === 'create-communication' && data) {
          const sp = new URLSearchParams({ deptId: data.departmentId || deptId, orgId });
          if (data.contactId) sp.set('contactId', data.contactId);
          router.push(`/dashboard/communications/new?${sp.toString()}`);
        } else if (view === 'communication-list' && data) {
          const sp = new URLSearchParams();
          if (data.contactId) sp.set('contactId', data.contactId);
          if (data.departmentId) sp.set('departmentId', data.departmentId);
          if (data.organisationId) sp.set('organisationId', data.organisationId);
          router.push(`/dashboard/communications?${sp.toString()}`);
        } else if (view === 'organization-detail') {
          router.push(`/dashboard/organizations/${orgId}`);
        } else if (view === 'organizations') {
          router.push('/dashboard/organizations');
        } else {
          router.push('/dashboard');
        }
      }}
    />
  );
}
