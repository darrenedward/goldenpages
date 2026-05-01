'use client';

import React, { useState } from 'react';
import {
  HelpCircle, ChevronDown, ChevronRight, MessageSquare, Plus, Users, FileText,
  Send, Clock, Eye, ShieldCheck, Settings, Bell, Inbox, Briefcase,
  BookOpen, ArrowRight, CheckCircle2, AlertCircle, AlertTriangle, KeyRound, Mail,
} from 'lucide-react';
import BreadcrumbNav from '@/components/shared/BreadcrumbNav';

interface GuideSection {
  id: string;
  title: string;
  icon: React.ReactNode;
  content: React.ReactNode;
}

export default function HelpGuide() {
  const [openSection, setOpenSection] = useState<string | null>('getting-started');

  const toggle = (id: string) => {
    setOpenSection(openSection === id ? null : id);
  };

  const sections: GuideSection[] = [
    {
      id: 'getting-started',
      title: 'Getting Started',
      icon: <BookOpen className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            Golden Pages is a communication tracking system for the NWA Foundation. It helps you send
            formal communications (letters, emails) to government departments and organisations, then
            track whether they respond. Think of it like a registered mail system — but digital.
          </p>
          <div className="bg-gold-50 dark:bg-gold-900/20 rounded-xl p-4 border border-gold-200 dark:border-gold-800/30">
            <p className="text-sm font-bold text-gold-800 dark:text-gold-300 mb-2">Your role determines what you can do:</p>
            <ul className="space-y-2 text-sm text-gold-700 dark:text-gold-400">
              <li className="flex items-start gap-2">
                <ShieldCheck className="w-4 h-4 mt-0.5 flex-shrink-0" />
                <span><strong>Admin</strong> — Full access. Manage users, delete anything, view all data.</span>
              </li>
              <li className="flex items-start gap-2">
                <Send className="w-4 h-4 mt-0.5 flex-shrink-0" />
                <span><strong>Editor</strong> — Create communications, upload documents, update statuses, add team members.</span>
              </li>
              <li className="flex items-start gap-2">
                <Eye className="w-4 h-4 mt-0.5 flex-shrink-0" />
                <span><strong>User</strong> — Read-only. View organisations, contacts, and communications.</span>
              </li>
            </ul>
          </div>
        </div>
      ),
    },
    {
      id: 'create-communication',
      title: 'How to Create a Communication',
      icon: <Plus className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            A &ldquo;communication&rdquo; is any formal letter, email, or meeting request you send to a
            government department or organisation. Here&rsquo;s how to create one, step by step:
          </p>

          <div className="space-y-3">
            {[
              {
                step: 1,
                title: 'Click "New Communication" in the sidebar',
                desc: 'This opens the Communication Wizard — a guided step-by-step process.',
              },
              {
                step: 2,
                title: 'Fill in the Details (Step 1 of 4)',
                desc: 'Give it a clear title (e.g. "Inquiry: Water Infrastructure Plans 2026-2030"). Choose the type (letter, email, physical mail, or meeting). Add a description explaining what the communication is about. Pick a category like "Water" or "Public Health" — this helps the public find it later.',
              },
              {
                step: 3,
                title: 'Choose Recipients (Step 2 of 4)',
                desc: 'Select which government departments or organisations should receive this communication. You can send the same communication to multiple departments at once — each one gets its own tracking thread.',
              },
              {
                step: 4,
                title: 'Attach Documents (Step 3 of 4)',
                desc: 'Upload the actual letter or document you are sending. You can mark each document as "Public" (visible on the website) or "Private" (team only). Supported formats: PDF, Word, images. Max 50MB per file.',
              },
              {
                step: 5,
                title: 'Review and Submit (Step 4 of 4)',
                desc: 'Double-check everything. Tick the approval checkbox. Set how many working days you expect a response by. Click "Submit" — your communication is now live and tracked.',
              },
            ].map(item => (
              <div key={item.step} className="flex gap-3 p-3 bg-stone-50 dark:bg-stone-800/50 rounded-xl">
                <div className="w-8 h-8 bg-gold-100 dark:bg-gold-900/30 rounded-lg flex items-center justify-center text-gold-700 dark:text-gold-400 font-bold text-sm flex-shrink-0">
                  {item.step}
                </div>
                <div>
                  <p className="text-sm font-bold text-slate-800 dark:text-white">{item.title}</p>
                  <p className="text-xs text-stone-500 dark:text-stone-400 mt-1">{item.desc}</p>
                </div>
              </div>
            ))}
          </div>

          <div className="bg-blue-50 dark:bg-blue-900/20 rounded-xl p-4 border border-blue-200 dark:border-blue-800/30">
            <p className="text-xs font-bold text-blue-700 dark:text-blue-400">
              Tip: After creating a communication, it starts with status "Sent". The system automatically
              calculates the expected response date based on the working days you set.
            </p>
          </div>
        </div>
      ),
    },
    {
      id: 'tracking',
      title: 'Tracking Communication Status',
      icon: <Clock className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            Every communication has a status that tells you where things stand. You can update the status
            from the communication detail view.
          </p>
          <div className="space-y-2">
            {[
              { status: 'Sent', color: 'bg-blue-100 text-blue-700', desc: 'You have sent the communication. Waiting for it to be received.' },
              { status: 'Awaiting Response', color: 'bg-amber-100 text-amber-700', desc: 'The recipient has received it. You are now waiting for their reply.' },
              { status: 'Responded', color: 'bg-emerald-100 text-emerald-700', desc: 'The recipient has replied. Upload their response document to keep the record complete.' },
              { status: 'Closed', color: 'bg-stone-100 text-stone-600', desc: 'The communication is resolved and no further action is needed.' },
              { status: 'Cancelled', color: 'bg-red-100 text-red-600', desc: 'The communication was cancelled and will not proceed.' },
            ].map(s => (
              <div key={s.status} className="flex items-start gap-3 p-3 bg-stone-50 dark:bg-stone-800/50 rounded-xl">
                <span className={`px-2 py-0.5 rounded-md text-xs font-bold flex-shrink-0 ${s.color}`}>
                  {s.status}
                </span>
                <p className="text-xs text-stone-500 dark:text-stone-400">{s.desc}</p>
              </div>
            ))}
          </div>
          <div className="bg-amber-50 dark:bg-amber-900/20 rounded-xl p-4 border border-amber-200 dark:border-amber-800/30">
            <p className="text-xs font-bold text-amber-700 dark:text-amber-400">
              Overdue: If the expected response date passes without a reply, the communication is flagged
              as overdue with a red warning. This is important for accountability — it shows the public
              which departments are not responding.
            </p>
          </div>
        </div>
      ),
    },
    {
      id: 'documents',
      title: 'Managing Documents',
      icon: <FileText className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            Documents are the paper trail. Every letter sent and every response received should be
            uploaded so there&rsquo;s a complete record.
          </p>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div className="p-4 bg-blue-50 dark:bg-blue-900/20 rounded-xl border border-blue-200 dark:border-blue-800/30">
              <p className="text-sm font-bold text-blue-700 dark:text-blue-400 mb-1">Sent Documents</p>
              <p className="text-xs text-blue-600 dark:text-blue-400">
                Letters or emails you sent to the department. Mark these as "Public" so the public
                can see what was sent.
              </p>
            </div>
            <div className="p-4 bg-emerald-50 dark:bg-emerald-900/20 rounded-xl border border-emerald-200 dark:border-emerald-800/30">
              <p className="text-sm font-bold text-emerald-700 dark:text-emerald-400 mb-1">Received Documents</p>
              <p className="text-xs text-emerald-600 dark:text-emerald-400">
                Response letters or documents you receive back. Upload these to complete the record.
              </p>
            </div>
          </div>
          <div className="space-y-2">
            <p className="text-sm font-bold text-slate-800 dark:text-white">Per-recipient documents</p>
            <p className="text-xs text-stone-500 dark:text-stone-400">
              If a communication has multiple recipients (e.g. sent to 3 departments), each recipient
              has their own document thread. Click on a recipient in the Recipients tab to upload
              documents specific to their response.
            </p>
          </div>
          <div className="bg-stone-100 dark:bg-stone-800 rounded-xl p-4">
            <p className="text-xs font-bold text-stone-600 dark:text-stone-300 mb-2">Supported file types</p>
            <p className="text-xs text-stone-500 dark:text-stone-400">PDF, Word documents, images (PNG, JPG), and most common file types. Maximum 50MB per file.</p>
          </div>
        </div>
      ),
    },
    {
      id: 'team',
      title: 'Team Collaboration',
      icon: <Users className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            You don&rsquo;t have to manage communications alone. Invite team members to collaborate.
          </p>
          <div className="space-y-3">
            {[
              {
                role: 'Owner',
                color: 'bg-amber-100 text-amber-700',
                desc: 'The person who created the communication. There can only be one owner. They can add and remove team members.',
              },
              {
                role: 'Assignee',
                color: 'bg-blue-100 text-blue-700',
                desc: 'Someone responsible for following up on this communication. Assignees can update statuses, upload documents, and invite collaborators.',
              },
              {
                role: 'Collaborator',
                color: 'bg-stone-100 text-stone-600',
                desc: 'A team member who can view and contribute. They can upload documents and view everything, but cannot change the status or manage the team.',
              },
            ].map(r => (
              <div key={r.role} className="flex items-start gap-3 p-3 bg-stone-50 dark:bg-stone-800/50 rounded-xl">
                <span className={`px-2 py-0.5 rounded-md text-xs font-bold flex-shrink-0 ${r.color}`}>
                  {r.role}
                </span>
                <p className="text-xs text-stone-500 dark:text-stone-400">{r.desc}</p>
              </div>
            ))}
          </div>
          <p className="text-xs text-stone-500 dark:text-stone-400">
            To add team members: open a communication, go to the Team tab, click "Add Member", search
            for the person, choose their role, and confirm. They will get a notification.
          </p>
        </div>
      ),
    },
    {
      id: 'public-register',
      title: 'The Public Register',
      icon: <Eye className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            The public register at <span className="font-bold text-slate-800 dark:text-white">goldenpages.vercel.app/communications</span> is
            where the public can see your communications. This is the transparency part of the system.
          </p>
          <div className="space-y-2">
            <p className="text-sm font-bold text-slate-800 dark:text-white">What the public can see:</p>
            <ul className="space-y-1.5 text-xs text-stone-500 dark:text-stone-400">
              <li className="flex items-start gap-2">
                <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 mt-0.5 flex-shrink-0" />
                Communications marked as "Public" and "Approved"
              </li>
              <li className="flex items-start gap-2">
                <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 mt-0.5 flex-shrink-0" />
                Only documents you explicitly marked as public
              </li>
              <li className="flex items-start gap-2">
                <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 mt-0.5 flex-shrink-0" />
                Recipient departments and delivery status
              </li>
              <li className="flex items-start gap-2">
                <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 mt-0.5 flex-shrink-0" />
                Team members (author, assignees, contributors)
              </li>
            </ul>
          </div>
          <div className="space-y-2">
            <p className="text-sm font-bold text-slate-800 dark:text-white">What stays private:</p>
            <ul className="space-y-1.5 text-xs text-stone-500 dark:text-stone-400">
              <li className="flex items-start gap-2">
                <AlertCircle className="w-3.5 h-3.5 text-stone-400 mt-0.5 flex-shrink-0" />
                Documents marked as "Private"
              </li>
              <li className="flex items-start gap-2">
                <AlertCircle className="w-3.5 h-3.5 text-stone-400 mt-0.5 flex-shrink-0" />
                Internal notes and activity logs
              </li>
              <li className="flex items-start gap-2">
                <AlertCircle className="w-3.5 h-3.5 text-stone-400 mt-0.5 flex-shrink-0" />
                Communications not marked as public or approved
              </li>
            </ul>
          </div>
        </div>
      ),
    },
    {
      id: 'organisations',
      title: 'Organizations & Contacts',
      icon: <Briefcase className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            The directory contains government departments, diplomatic missions, and organisations
            — along with the people who work there.
          </p>
          <div className="space-y-3">
            <div className="p-3 bg-stone-50 dark:bg-stone-800/50 rounded-xl">
              <p className="text-sm font-bold text-slate-800 dark:text-white mb-1">Organizations</p>
              <p className="text-xs text-stone-500 dark:text-stone-400">
                Government bodies, corporations, international organisations. Each organisation has
                multiple departments (e.g. "Department of Health" under "Government of South Africa").
              </p>
            </div>
            <div className="p-3 bg-stone-50 dark:bg-stone-800/50 rounded-xl">
              <p className="text-sm font-bold text-slate-800 dark:text-white mb-1">Departments</p>
              <p className="text-xs text-stone-500 dark:text-stone-400">
                Specific divisions within an organisation. Departments are the recipients of your
                communications. Each has a portfolio type (health, environment, justice, etc.).
              </p>
            </div>
            <div className="p-3 bg-stone-50 dark:bg-stone-800/50 rounded-xl">
              <p className="text-sm font-bold text-slate-800 dark:text-white mb-1">Contacts</p>
              <p className="text-xs text-stone-500 dark:text-stone-400">
                People within departments — ministers, directors, spokespeople. Contacts have
                communication channels (email, phone, address) which are versioned so you can
                track changes over time.
              </p>
            </div>
          </div>
          <div className="bg-blue-50 dark:bg-blue-900/20 rounded-xl p-4 border border-blue-200 dark:border-blue-800/30">
            <p className="text-xs font-bold text-blue-700 dark:text-blue-400">
              Tip: When creating a communication, you select the department as the recipient — not
              a specific person. The system tracks delivery at the department level.
            </p>
          </div>
        </div>
      ),
    },
    {
      id: 'notifications',
      title: 'Notifications',
      icon: <Bell className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            The notification bell in the top-right of the sidebar lights up when something happens
            on a communication you are part of.
          </p>
          <div className="space-y-2">
            <p className="text-sm font-bold text-slate-800 dark:text-white">You get notified when:</p>
            <ul className="space-y-1.5 text-xs text-stone-500 dark:text-stone-400">
              <li className="flex items-center gap-2"><ArrowRight className="w-3 h-3 text-gold-600" /> You are assigned to or invited to a communication</li>
              <li className="flex items-center gap-2"><ArrowRight className="w-3 h-3 text-gold-600" /> Someone changes the status of a communication you are on</li>
              <li className="flex items-center gap-2"><ArrowRight className="w-3 h-3 text-gold-600" /> Someone uploads a new document</li>
              <li className="flex items-center gap-2"><ArrowRight className="w-3 h-3 text-gold-600" /> A new team member is added</li>
            </ul>
          </div>
        </div>
      ),
    },
    {
      id: 'troubleshooting',
      title: 'Troubleshooting & Limits',
      icon: <AlertTriangle className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            Some operations have limits to prevent abuse or because of email provider restrictions. Here&rsquo;s what you need to know:
          </p>

          <div className="space-y-3">
            <div className="p-4 bg-amber-50 dark:bg-amber-900/20 rounded-xl border border-amber-200 dark:border-amber-800/30">
              <div className="flex items-center gap-2 mb-2">
                <Mail className="w-4 h-4 text-amber-600" />
                <p className="text-sm font-bold text-amber-800 dark:text-amber-300">User Invite Limit</p>
              </div>
              <p className="text-xs text-amber-700 dark:text-amber-400">
                You can send up to <strong>3 invite emails per hour</strong>. This is a Supabase (our auth provider) rate limit, not something we control.
                If you see an error saying &ldquo;rate limit exceeded&rdquo;, wait an hour and try again.
              </p>
              <div className="mt-2 p-2 bg-amber-100/50 dark:bg-amber-900/30 rounded-lg">
                <p className="text-xs text-amber-600 dark:text-amber-500">
                  <strong>Workaround:</strong> If you need to add multiple users urgently, ask your system administrator to create the accounts directly and share the login credentials with each user.
                </p>
              </div>
            </div>

            <div className="p-4 bg-amber-50 dark:bg-amber-900/20 rounded-xl border border-amber-200 dark:border-amber-800/30">
              <div className="flex items-center gap-2 mb-2">
                <KeyRound className="w-4 h-4 text-amber-600" />
                <p className="text-sm font-bold text-amber-800 dark:text-amber-300">Password Reset Limit</p>
              </div>
              <p className="text-xs text-amber-700 dark:text-amber-400">
                The &ldquo;Forgot Password&rdquo; feature on the login page shares the same email rate limit. If you don&rsquo;t receive the reset email within a few minutes, you may have hit the limit. Wait an hour and try again.
              </p>
            </div>

            <div className="p-4 bg-blue-50 dark:bg-blue-900/20 rounded-xl border border-blue-200 dark:border-blue-800/30">
              <div className="flex items-center gap-2 mb-2">
                <AlertCircle className="w-4 h-4 text-blue-600" />
                <p className="text-sm font-bold text-blue-800 dark:text-blue-300">Dashboard Stuck on &ldquo;Loading...&rdquo;</p>
              </div>
              <p className="text-xs text-blue-700 dark:text-blue-400">
                If the dashboard page is stuck spinning and won&rsquo;t load, your browser session may be stale. Try clearing your browser cache and cookies for this site, then log in again. If the problem persists, try using an incognito/private browsing window.
              </p>
            </div>

            <div className="p-4 bg-stone-100 dark:bg-stone-800 rounded-xl">
              <div className="flex items-center gap-2 mb-2">
                <FileText className="w-4 h-4 text-stone-600 dark:text-stone-400" />
                <p className="text-sm font-bold text-slate-800 dark:text-white">Document Upload Fails</p>
              </div>
              <p className="text-xs text-stone-500 dark:text-stone-400">
                Maximum file size is 50MB. Supported formats: PDF, Word (.docx), images (PNG, JPG). If uploads keep failing, check your internet connection — large files need a stable connection.
              </p>
            </div>
          </div>
        </div>
      ),
    },
    {
      id: 'sidebar-guide',
      title: 'Sidebar Menu Guide',
      icon: <MessageSquare className="w-5 h-5 text-gold-600" />,
      content: (
        <div className="space-y-4">
          <p className="text-stone-600 dark:text-stone-400">
            Here is what every menu item does:
          </p>
          <div className="space-y-2">
            {[
              { label: 'Dashboard', desc: 'Overview with stats — how many communications, organisations, contacts exist.' },
              { label: 'Organizations', desc: 'Browse the full directory of organisations, departments, and contacts.' },
              { label: 'Communications', desc: 'All communications in the system. Search, filter by status, find what you need.' },
              { label: 'New Communication', desc: 'Start the 4-step wizard to create a new communication.' },
              { label: 'My Communications', desc: 'Communications where you are a team member (owner, assignee, or collaborator).' },
              { label: 'Public Register', desc: 'Preview what the public sees on the website.' },
              { label: 'Inbound Emails', desc: 'Emails received from external sources linked to communications.' },
              { label: 'Notifications', desc: 'Your notification history.' },
              { label: 'User Management (Admin)', desc: 'Invite users, assign roles (admin, editor, user). Note: Invites are rate-limited to 3 per hour.' },
              { label: 'Issue Categories (Admin)', desc: 'Manage the categories shown on the public site (Food Safety, Water, etc.).' },
              { label: 'Spam Log (Admin)', desc: 'See bot submissions caught by the honeypot on public forms.' },
              { label: 'Settings', desc: 'Update your password, social links, email settings, and notification preferences.' },
            ].map(item => (
              <div key={item.label} className="flex items-start gap-3 p-3 bg-stone-50 dark:bg-stone-800/50 rounded-xl">
                <p className="text-sm font-bold text-slate-800 dark:text-white whitespace-nowrap">{item.label}</p>
                <p className="text-xs text-stone-500 dark:text-stone-400">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-6 animate-fade-in pb-12">
      <BreadcrumbNav items={[{ label: 'Help & Support' }]} />

      {/* Header */}
      <div className="flex items-center gap-3">
        <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600">
          <HelpCircle className="w-5 h-5" />
        </div>
        <div>
          <h2 className="font-serif text-xl font-bold text-slate-800 dark:text-white">
            Help & Support
          </h2>
          <p className="text-xs text-stone-400">Everything you need to know about using Golden Pages</p>
        </div>
      </div>

      {/* Search/quick nav */}
      <div className="flex flex-wrap gap-2">
        {sections.map(s => (
          <button
            key={s.id}
            onClick={() => toggle(s.id)}
            className={`flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-bold transition-all ${
              openSection === s.id
                ? 'bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 ring-1 ring-gold-300 dark:ring-gold-700'
                : 'bg-stone-100 dark:bg-stone-800 text-stone-500 hover:text-stone-700 dark:hover:text-stone-300'
            }`}
          >
            {s.title}
          </button>
        ))}
      </div>

      {/* Sections */}
      <div className="space-y-3">
        {sections.map(s => (
          <div
            key={s.id}
            className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 overflow-hidden"
          >
            <button
              onClick={() => toggle(s.id)}
              className="w-full flex items-center gap-3 p-5 text-left hover:bg-stone-50 dark:hover:bg-slate-800/50 transition-colors"
            >
              {s.icon}
              <span className="flex-1 font-serif text-lg font-bold text-slate-800 dark:text-white">
                {s.title}
              </span>
              {openSection === s.id
                ? <ChevronDown className="w-5 h-5 text-stone-400" />
                : <ChevronRight className="w-5 h-5 text-stone-400" />
              }
            </button>
            {openSection === s.id && (
              <div className="px-5 pb-5 border-t border-stone-100 dark:border-stone-800">
                <div className="pt-4">
                  {s.content}
                </div>
              </div>
            )}
          </div>
        ))}
      </div>

      {/* Footer */}
      <div className="bg-stone-50 dark:bg-stone-800/50 rounded-2xl p-6 text-center">
        <p className="text-sm text-stone-500 dark:text-stone-400">
          Need more help? Contact the system administrator at{' '}
          <span className="font-bold text-slate-700 dark:text-stone-300">goldenpages@nwafoundation.org</span>
        </p>
      </div>
    </div>
  );
}
