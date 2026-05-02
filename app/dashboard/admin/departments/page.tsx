'use client';

import NWADepartmentsSection from '@/components/dashboard/settings/NWADepartmentsSection';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';

export default function DepartmentsPage() {
  return (
    <div className="space-y-6 animate-fade-in pb-12">
      <BreadcrumbNav items={[{ label: 'Departments' }]} />
      <div className="max-w-2xl">
        <NWADepartmentsSection />
      </div>
    </div>
  );
}
