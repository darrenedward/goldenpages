import React from 'react';
import { LayoutDashboard, Settings, ShieldCheck, LogOut, Briefcase, MessageSquare, Eye, Tags, Bell, Users, Inbox, Plus } from 'lucide-react';
import NotificationBell from '@/components/notifications/NotificationBell';

interface SidebarProps {
  activeView: string;
  onChangeView: (view: string, data?: Record<string, string>) => void;
  isAdmin: boolean;
  onSignOut: () => void;
}

const Sidebar: React.FC<SidebarProps> = ({ activeView, onChangeView, isAdmin, onSignOut }) => {
  const menuItems = [
    { id: 'dashboard', label: 'Dashboard', icon: LayoutDashboard },
    { id: 'organizations', label: 'Organizations', icon: Briefcase },
    { id: 'communications', label: 'Communications', icon: MessageSquare },
    { id: 'create-communication', label: 'New Communication', icon: Plus },
    { id: 'my-communications', label: 'My Communications', icon: Users },
  ];

  const publicItems = [
    { id: 'public-register', label: 'Public Register', icon: Eye },
    { id: 'inbound-emails', label: 'Inbound Emails', icon: Inbox },
    { id: 'notifications', label: 'Notifications', icon: Bell },
  ];

  const adminItems = [
    { id: 'admin', label: 'User Management', icon: ShieldCheck },
    { id: 'admin-categories', label: 'Issue Categories', icon: Tags },
    { id: 'settings', label: 'Settings', icon: Settings },
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
        <NotificationBell onNavigate={(view, data) => {
          onChangeView(view, data);
        }} />
      </div>

      <nav className="flex-1 py-6 px-3 space-y-1 overflow-y-auto">
        <p className="px-3 text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Main</p>
        {menuItems.map((item) => (
          <button
            key={item.id}
            onClick={() => onChangeView(item.id)}
            className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all duration-200 ${activeView === item.id
              ? 'bg-gradient-to-r from-gold-600 to-gold-500 text-white shadow-lg'
              : 'text-slate-400 hover:text-white hover:bg-white/5'
              }`}
          >
            <item.icon size={18} />
            {item.label}
          </button>
        ))}

        <div className="pt-6">
          <p className="px-3 text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Transparency</p>
          {publicItems.map((item) => (
            <button
              key={item.id}
              onClick={() => onChangeView(item.id)}
              className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all duration-200 ${activeView === item.id
                ? 'bg-gradient-to-r from-gold-600 to-gold-500 text-white shadow-lg'
                : 'text-slate-400 hover:text-white hover:bg-white/5'
              }`}
            >
              <item.icon size={18} />
              {item.label}
            </button>
          ))}
        </div>

        {isAdmin && (
          <div className="pt-6">
            <p className="px-3 text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">System</p>
            {adminItems.map((item) => (
              <button
                key={item.id}
                onClick={() => onChangeView(item.id)}
                className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all duration-200 ${activeView === item.id
                  ? 'bg-gradient-to-r from-gold-600 to-gold-500 text-white shadow-lg'
                  : 'text-slate-400 hover:text-white hover:bg-white/5'
                }`}
              >
                <item.icon size={18} />
                {item.label}
              </button>
            ))}
          </div>
        )}
      </nav>

      <div className="p-4 border-t border-white/10">
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
