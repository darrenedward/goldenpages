import React from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { LayoutDashboard, Settings, ShieldCheck, LogOut, Briefcase, MessageSquare, Eye, Tags, Bell, Users, Inbox, Plus, Bug, HelpCircle, UserCircle } from 'lucide-react';
import { isPathActive } from '@/lib/dashboardNavigation';
import NotificationBell from '@/components/notifications/NotificationBell';

interface SidebarProps {
  isAdmin: boolean;
  onSignOut: () => void;
  userEmail?: string | null;
}

const Sidebar: React.FC<SidebarProps> = ({ isAdmin, onSignOut, userEmail }) => {
  const pathname = usePathname();

  const menuItems = [
    { path: '/dashboard', label: 'Dashboard', icon: LayoutDashboard },
    { path: '/dashboard/organizations', label: 'Organizations', icon: Briefcase },
    { path: '/dashboard/communications', label: 'Communications', icon: MessageSquare },
    { path: '/dashboard/communications/new', label: 'New Communication', icon: Plus },
    { path: '/dashboard/my-communications', label: 'My Communications', icon: Users },
  ];

  const publicItems = [
    { path: '/dashboard/public-register', label: 'Public Register', icon: Eye },
    { path: '/dashboard/inbound-emails', label: 'Inbound Emails', icon: Inbox },
    { path: '/dashboard/notifications', label: 'Notifications', icon: Bell },
    { path: '/dashboard/help', label: 'Help & Support', icon: HelpCircle },
  ];

  const adminItems = [
    { path: '/dashboard/admin/users', label: 'User Management', icon: ShieldCheck },
    { path: '/dashboard/admin/categories', label: 'Issue Categories', icon: Tags },
    { path: '/dashboard/admin/honeypot', label: 'Spam Log', icon: Bug },
    { path: '/dashboard/settings', label: 'Settings', icon: Settings },
  ];

  return (
    <aside className="w-64 bg-slate-900 text-white flex flex-col h-screen fixed left-0 top-0 border-r border-gold-600/30 shadow-2xl z-20">
      <div className="p-6 border-b border-white/10 flex items-center justify-between">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 rounded-full bg-gradient-to-br from-gold-300 to-gold-600 shadow-lg shadow-gold-500/20" />
          <h1 className="text-xl font-serif font-bold tracking-wide text-gold-100">
            Golden<span className="text-gold-400">Pages</span>
          </h1>
        </div>
        <NotificationBell />
      </div>

      <nav className="flex-1 py-6 px-3 space-y-1 overflow-y-auto">
        <p className="px-3 text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Main</p>
        {menuItems.map((item) => (
          <Link
            key={item.path}
            href={item.path}
            className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all duration-200 ${isPathActive(item.path, pathname)
              ? 'bg-gradient-to-r from-gold-600 to-gold-500 text-white shadow-lg'
              : 'text-slate-400 hover:text-white hover:bg-white/5'
              }`}
          >
            <item.icon size={18} />
            {item.label}
          </Link>
        ))}

        <div className="pt-6">
          <p className="px-3 text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Transparency</p>
          {publicItems.map((item) => (
            <Link
              key={item.path}
              href={item.path}
              className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all duration-200 ${isPathActive(item.path, pathname)
                ? 'bg-gradient-to-r from-gold-600 to-gold-500 text-white shadow-lg'
                : 'text-slate-400 hover:text-white hover:bg-white/5'
              }`}
            >
              <item.icon size={18} />
              {item.label}
            </Link>
          ))}
        </div>

        {isAdmin && (
          <div className="pt-6">
            <p className="px-3 text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">System</p>
            {adminItems.map((item) => (
              <Link
                key={item.path}
                href={item.path}
                className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all duration-200 ${isPathActive(item.path, pathname)
                  ? 'bg-gradient-to-r from-gold-600 to-gold-500 text-white shadow-lg'
                  : 'text-slate-400 hover:text-white hover:bg-white/5'
                }`}
              >
                <item.icon size={18} />
                {item.label}
              </Link>
            ))}
          </div>
        )}
      </nav>

      <div className="p-4 border-t border-white/10">
        {userEmail && (
          <div className="flex items-center gap-2.5 px-3 py-2 mb-1">
            <UserCircle size={18} className="text-gold-500 shrink-0" />
            <span className="text-xs text-slate-400 truncate">{userEmail}</span>
          </div>
        )}
        <button
          onClick={onSignOut}
          className="flex items-center gap-3 w-full px-3 py-2 text-sm font-medium text-slate-400 hover:text-white transition-colors"
        >
          <LogOut size={18} />
          Sign Out
        </button>
      </div>
    </aside>
  );
};

export default Sidebar;
