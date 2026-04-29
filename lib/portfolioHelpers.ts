/**
 * Portfolio/Role constants and helpers
 * Provides labels, auto-detection, and portfolio selection helpers
 */

import type { Portfolio } from '@/types';

// ============================================================================
// PORTFOLIO LABELS
// ============================================================================

/** Display labels for each portfolio type */
export const PORTFOLIO_LABELS: Record<Portfolio, string> = {
  // Government portfolios
  finance: 'Minister of Finance',
  transport: 'Minister of Transport',
  foreign_affairs: 'Minister of Foreign Affairs',
  immigration: 'Minister of Immigration',
  health: 'Minister of Health',
  education: 'Minister of Education',
  defense: 'Minister of Defense',
  justice: 'Attorney General / Justice',
  trade: 'Minister of Trade',
  interior: 'Minister of Interior',
  agriculture: 'Minister of Agriculture',
  environment: 'Minister of Environment',
  labor: 'Minister of Labor',
  energy: 'Minister of Energy',
  communications: 'Minister of Communications',
  prime_minister: 'Prime Minister',
  deputy_pm: 'Deputy Prime Minister',
  cabinet: 'Cabinet Office',

  // Corporate executive roles
  ceo: 'Chief Executive Officer',
  cfo: 'Chief Financial Officer',
  cto: 'Chief Technology Officer',
  coo: 'Chief Operating Officer',
  cio: 'Chief Information Officer',
  cmo: 'Chief Marketing Officer',
  cso: 'Chief Security Officer',
  clo: 'Chief Legal Officer / General Counsel',
  chair: 'Board Chair / Chairman',
  director: 'Director',
  vp: 'Vice President',
  secretary: 'Secretary / Company Secretary',

  // General
  other: 'Other',
  unspecified: 'Unspecified',
};

// ============================================================================
// AUTO-DETECTION PATTERNS
// ============================================================================

/** Pattern matching for government portfolios */
const GOV_PORTFOLIO_PATTERNS: Array<{ portfolio: Portfolio; patterns: string[] }> = [
  { portfolio: 'finance', patterns: ['finance', 'treasury', 'revenue', 'exchequer'] },
  { portfolio: 'transport', patterns: ['transport', 'transportation', 'aviation', 'infrastructure'] },
  { portfolio: 'foreign_affairs', patterns: ['foreign affairs', 'foreign affairs & trade', 'external affairs'] },
  { portfolio: 'immigration', patterns: ['immigration', 'border', 'citizenship'] },
  { portfolio: 'health', patterns: ['health', 'medical', 'nh'] },
  { portfolio: 'education', patterns: ['education', 'schools', 'tertiary'] },
  { portfolio: 'defense', patterns: ['defense', 'defence', 'military', 'army', 'navy', 'air force'] },
  { portfolio: 'justice', patterns: ['justice', 'attorney general', 'legal affairs', 'prosecutor'] },
  { portfolio: 'trade', patterns: ['trade', 'commerce', 'commerce & industry', 'economic development'] },
  { portfolio: 'interior', patterns: ['interior', 'home affairs', 'internal affairs', 'security'] },
  { portfolio: 'agriculture', patterns: ['agriculture', 'farming', 'fisheries', 'forestry'] },
  { portfolio: 'environment', patterns: ['environment', 'climate', 'conservation'] },
  { portfolio: 'labor', patterns: ['labor', 'labour', 'employment', 'work'] },
  { portfolio: 'energy', patterns: ['energy', 'power', 'resources', 'mining'] },
  { portfolio: 'communications', patterns: ['communications', 'media', 'digital', 'broadcasting'] },
  { portfolio: 'prime_minister', patterns: ['prime minister', 'pm', 'premier'] },
  { portfolio: 'deputy_pm', patterns: ['deputy prime minister', 'deputy premier'] },
  { portfolio: 'cabinet', patterns: ['cabinet', 'government executive'] },
];

/** Pattern matching for corporate executive roles */
const CORP_ROLE_PATTERNS: Array<{ portfolio: Portfolio; patterns: string[] }> = [
  { portfolio: 'ceo', patterns: ['chief executive', 'ceo', 'managing director', 'md'] },
  { portfolio: 'cfo', patterns: ['chief financial', 'cfo', 'finance director'] },
  { portfolio: 'cto', patterns: ['chief technology', 'cto', 'technology director', 'it director'] },
  { portfolio: 'coo', patterns: ['chief operating', 'coo', 'operations director'] },
  { portfolio: 'cio', patterns: ['chief information', 'cio', 'information director'] },
  { portfolio: 'cmo', patterns: ['chief marketing', 'cmo', 'marketing director'] },
  { portfolio: 'cso', patterns: ['chief security', 'cso', 'security director'] },
  { portfolio: 'clo', patterns: ['chief legal', 'clo', 'general counsel', 'legal director'] },
  { portfolio: 'chair', patterns: ['chair', 'chairman', 'chairwoman', 'board chair'] },
  { portfolio: 'director', patterns: ['director', 'board of directors'] },
  { portfolio: 'vp', patterns: ['vice president', 'vp', 'executive vice president'] },
  { portfolio: 'secretary', patterns: ['secretary', 'company secretary', 'corporate secretary'] },
];

// ============================================================================
// AUTO-DETECTION FUNCTION
// ============================================================================

/**
 * Auto-detect portfolio from department name and organization type
 */
export function detectPortfolio(departmentName: string, organizationType: string): Portfolio {
  const lowerName = departmentName.toLowerCase();

  // Government organizations - use portfolio patterns
  if (organizationType === 'government') {
    for (const { portfolio, patterns } of GOV_PORTFOLIO_PATTERNS) {
      for (const pattern of patterns) {
        if (lowerName.includes(pattern)) {
          return portfolio;
        }
      }
    }
  }

  // Corporate organizations - use role patterns
  if (organizationType === 'corporate') {
    for (const { portfolio, patterns } of CORP_ROLE_PATTERNS) {
      for (const pattern of patterns) {
        if (lowerName.includes(pattern)) {
          return portfolio;
        }
      }
    }
  }

  return 'unspecified';
}

// ============================================================================
// PORTFOLIO GROUPING
// ============================================================================

/** Portfolios grouped by category for UI organization */
export const PORTFOLIO_GROUPS = {
  economic_governance: ['finance', 'treasury', 'trade', 'economy', 'commerce'],
  social_services: ['health', 'education', 'labor', 'social'],
  security_governance: ['defense', 'justice', 'interior', 'immigration', 'border'],
  infrastructure: ['transport', 'energy', 'communications', 'infrastructure'],
  primary_industry: ['agriculture', 'environment', 'fisheries', 'forestry', 'mining'],
  executive: ['cabinet', 'prime_minister', 'deputy_pm'],
} as const;

export type PortfolioGroup = keyof typeof PORTFOLIO_GROUPS;

/** Get the group a portfolio belongs to */
export function getPortfolioGroup(portfolio: Portfolio): PortfolioGroup | null {
  for (const [group, portfolios] of Object.entries(PORTFOLIO_GROUPS)) {
    if ((portfolios as readonly string[]).includes(portfolio)) {
      return group as PortfolioGroup;
    }
  }
  return null;
}

/** Group labels for UI */
export const PORTFOLIO_GROUP_LABELS: Record<PortfolioGroup, string> = {
  economic_governance: 'Economic Governance',
  social_services: 'Social Services',
  security_governance: 'Security & Governance',
  infrastructure: 'Infrastructure',
  primary_industry: 'Primary Industry',
  executive: 'Executive Leadership',
};
