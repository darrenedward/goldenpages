'use client';

import { useRouter, useSearchParams } from 'next/navigation';
import CreateCommunicationWizard from '@/components/communications/wizard/CreateCommunicationWizard';

export default function NewCommunicationPage() {
  const router = useRouter();
  const searchParams = useSearchParams();

  const deptId = searchParams.get('deptId');
  const contactId = searchParams.get('contactId');

  const preselectedRecipients = deptId ? [{ departmentId: deptId, contactId: contactId || undefined }] : undefined;

  return (
    <CreateCommunicationWizard
      onCancel={() => router.push('/dashboard/communications')}
      onSubmit={(id) => router.push(`/dashboard/communications/${id}`)}
      preselectedRecipients={preselectedRecipients}
    />
  );
}
