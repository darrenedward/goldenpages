'use client';

import React, { useState, useEffect, useCallback } from 'react';
import { communicationService } from '@/services/communicationService';
import { issueCategoryService, type IssueCategory } from '@/services/issueCategoryService';
import { CategorySidebar } from './CategorySidebar';
import CommunicationCard from './CommunicationCard';
import { ScrollReveal } from '@/components/shared/ScrollReveal';
import { ChevronLeft, ChevronRight, Globe2 } from 'lucide-react';
import type { CommunicationWithDetails } from '@/types';

interface PublicCommunicationBrowserProps {
  onSelectCommunication: (id: string) => void;
}

const PAGE_SIZE = 20;

function SkeletonCard(): React.ReactNode {
  return (
    <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-6 animate-pulse">
      <div className="flex items-start gap-4">
        <div className="w-10 h-10 bg-stone-100 dark:bg-stone-800 rounded-xl" />
        <div className="flex-1 space-y-3">
          <div className="h-5 bg-stone-100 dark:bg-stone-800 rounded-lg w-3/4" />
          <div className="h-3 bg-stone-100 dark:bg-stone-800 rounded-lg w-1/2" />
          <div className="h-3 bg-stone-100 dark:bg-stone-800 rounded-lg w-2/3" />
        </div>
      </div>
    </div>
  );
}

function range(start: number, end: number): number[] {
  return Array.from({ length: end - start + 1 }, (_, i) => start + i);
}

function buildPageNumbers(current: number, totalPages: number): (number | 'ellipsis')[] {
  if (totalPages <= 7) return range(0, totalPages - 1);

  const pages: (number | 'ellipsis')[] = [0];

  if (current <= 3) {
    pages.push(...range(1, 4), 'ellipsis', totalPages - 1);
  } else if (current >= totalPages - 4) {
    pages.push('ellipsis', ...range(totalPages - 5, totalPages - 1));
  } else {
    pages.push('ellipsis', current - 1, current, current + 1, 'ellipsis', totalPages - 1);
  }

  return pages;
}

export default function PublicCommunicationBrowser({ onSelectCommunication }: PublicCommunicationBrowserProps) {
  const [communications, setCommunications] = useState<CommunicationWithDetails[]>([]);
  const [totalCount, setTotalCount] = useState(0);
  const [page, setPage] = useState(0);
  const [selectedCategoryId, setSelectedCategoryId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [categories, setCategories] = useState<IssueCategory[]>([]);

  const totalPages = Math.max(1, Math.ceil(totalCount / PAGE_SIZE));

  // Fetch active categories for the mobile category bar
  useEffect(() => {
    void (async () => {
      try {
        const cats = await issueCategoryService.getActive();
        setCategories(cats);
      } catch {
        // Keep empty state
      }
    })();
  }, []);

  // Fetch communications when category or page changes
  const fetchCommunications = useCallback(async (categoryId: string | null, pageNum: number) => {
    setLoading(true);
    try {
      const result = await communicationService.getPublicCommunications({
        ...(categoryId ? { categoryId } : {}),
        page: pageNum,
        pageSize: PAGE_SIZE,
      });
      setCommunications(result.data);
      setTotalCount(result.totalCount);
    } catch (err) {
      console.error('Failed to fetch communications:', err);
      setCommunications([]);
      setTotalCount(0);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void fetchCommunications(selectedCategoryId, page);
  }, [selectedCategoryId, page, fetchCommunications]);

  // Reset page when category changes
  const handleCategorySelect = useCallback((categoryId: string | null) => {
    setSelectedCategoryId(categoryId);
    setPage(0);
  }, []);

  const goToPage = useCallback((p: number) => {
    setPage(p);
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }, []);

  // Computed pagination display values
  const showingFrom = totalCount === 0 ? 0 : page * PAGE_SIZE + 1;
  const showingTo = Math.min((page + 1) * PAGE_SIZE, totalCount);
  const pageNumbers = buildPageNumbers(page, totalPages);

  return (
    <ScrollReveal>
      <div className="flex flex-col lg:flex-row gap-8">
        {/* Desktop sidebar */}
        <aside className="hidden lg:block w-64 flex-shrink-0">
          <div className="sticky top-24">
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-stone-200 dark:border-white/5 p-4">
              <h2 className="font-serif text-sm font-bold text-slate-800 dark:text-white mb-3 uppercase tracking-wider">
                Categories
              </h2>
              <CategorySidebar
                activeCategoryId={selectedCategoryId}
                onSelectCategory={handleCategorySelect}
              />
            </div>
          </div>
        </aside>

        {/* Main content area */}
        <main className="flex-1 min-w-0">
          {/* Header */}
          <div className="mb-6">
            <div className="flex items-center gap-3 mb-2">
              <div className="w-10 h-10 bg-gold-50 dark:bg-gold-900/20 rounded-xl flex items-center justify-center text-gold-600">
                <Globe2 className="w-5 h-5" />
              </div>
              <div>
                <h1 className="font-serif text-2xl font-bold text-slate-800 dark:text-white">
                  Public Register
                </h1>
                <p className="text-xs text-stone-400">
                  Approved public communications &middot; Transparency in action
                </p>
              </div>
            </div>
            <div className="h-0.5 bg-gradient-to-r from-gold-500 to-gold-600 rounded-full w-16 mt-3" />
          </div>

          {/* Mobile category bar */}
          <div className="lg:hidden flex gap-2 overflow-x-auto pb-3 -mx-4 px-4 scrollbar-hide">
            <button
              onClick={() => { handleCategorySelect(null); }}
              className={`whitespace-nowrap px-3 py-1.5 rounded-full text-xs font-medium transition-all ${
                selectedCategoryId === null
                  ? 'bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 font-bold'
                  : 'bg-stone-100 dark:bg-stone-800 text-stone-500 dark:text-stone-400'
              }`}
            >
              All
            </button>
            {categories.map((cat) => (
              <button
                key={cat.id}
                onClick={() => { handleCategorySelect(cat.id); }}
                className={`whitespace-nowrap px-3 py-1.5 rounded-full text-xs font-medium transition-all ${
                  selectedCategoryId === cat.id
                    ? 'bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 font-bold'
                    : 'bg-stone-100 dark:bg-stone-800 text-stone-500 dark:text-stone-400'
                }`}
              >
                {cat.name}
              </button>
            ))}
          </div>

          {/* Results count */}
          {!loading && totalCount > 0 && (
            <p className="text-sm text-stone-400 mb-4">
              Showing {showingFrom}&ndash;{showingTo} of {totalCount} result{totalCount !== 1 ? 's' : ''}
            </p>
          )}

          {/* Content */}
          {loading ? (
            <div className="space-y-3">
              <SkeletonCard />
              <SkeletonCard />
              <SkeletonCard />
            </div>
          ) : communications.length === 0 ? (
            <div className="flex flex-col items-center justify-center h-64 text-center">
              <div className="w-16 h-16 bg-stone-100 dark:bg-stone-800 rounded-full flex items-center justify-center mb-4">
                <Globe2 className="w-8 h-8 text-stone-400" />
              </div>
              <h3 className="text-lg font-serif font-bold text-slate-800 dark:text-white">
                No communications found
              </h3>
              <p className="text-stone-500 dark:text-stone-400 mt-1 max-w-sm">
                No approved public communications yet. Check back soon.
              </p>
            </div>
          ) : (
            <>
              <div className="space-y-3">
                {communications.map((comm) => (
                  <CommunicationCard
                    key={comm.id}
                    communication={comm}
                    onClick={onSelectCommunication}
                    isPublicView
                  />
                ))}
              </div>

              {/* Pagination */}
              {totalPages > 1 && (
                <nav className="mt-8 flex items-center justify-center gap-1" aria-label="Pagination">
                  <button
                    onClick={() => { goToPage(page - 1); }}
                    disabled={page === 0}
                    className="p-2 rounded-lg text-stone-400 hover:text-stone-600 hover:bg-stone-100 dark:hover:bg-white/5 disabled:opacity-30 disabled:cursor-not-allowed transition-all"
                    aria-label="Previous page"
                  >
                    <ChevronLeft className="w-4 h-4" />
                  </button>

                  {pageNumbers.map((pn, idx) =>
                    pn === 'ellipsis' ? (
                      <span
                        key={`ellipsis-${idx}`}
                        className="px-2 text-stone-400 text-sm select-none"
                      >
                        &hellip;
                      </span>
                    ) : (
                      <button
                        key={pn}
                        onClick={() => { goToPage(pn); }}
                        className={`min-w-[2rem] h-8 rounded-lg text-sm font-medium transition-all ${
                          pn === page
                            ? 'bg-gold-50 dark:bg-gold-900/20 text-gold-700 dark:text-gold-400 font-bold'
                            : 'text-stone-500 hover:bg-stone-100 dark:hover:bg-white/5'
                        }`}
                        aria-label={`Page ${pn + 1}`}
                        aria-current={pn === page ? 'page' : undefined}
                      >
                        {pn + 1}
                      </button>
                    )
                  )}

                  <button
                    onClick={() => { goToPage(page + 1); }}
                    disabled={page >= totalPages - 1}
                    className="p-2 rounded-lg text-stone-400 hover:text-stone-600 hover:bg-stone-100 dark:hover:bg-white/5 disabled:opacity-30 disabled:cursor-not-allowed transition-all"
                    aria-label="Next page"
                  >
                    <ChevronRight className="w-4 h-4" />
                  </button>
                </nav>
              )}
            </>
          )}
        </main>
      </div>
    </ScrollReveal>
  );
}
