
export type OrgType = 'government' | 'corporate' | 'diplomatic_mission' | 'international_organization';

// Permission type for RBAC
export type Permission = `${string}:${string}` | '*:*' | '*';

// Head Office Type - Classifies the type of head office/organization
export type HeadOfficeType = 'CORPORATE' | 'PRIME_MINISTER' | 'PRESIDENT' | 'MINISTERIAL' | 'DIPLOMATIC_MISSION' | 'LOCAL_GOVT';

// Portfolio/Role types for departments - Used for recipient selection across organizations
export type Portfolio =
  // Government portfolios
  | 'finance'              // Minister of Finance / Treasury
  | 'transport'            // Minister of Transport
  | 'foreign_affairs'      // Minister of Foreign Affairs
  | 'immigration'          // Minister of Immigration
  | 'health'               // Minister of Health
  | 'education'            // Minister of Education
  | 'defense'              // Minister of Defense
  | 'justice'              // Minister of Justice / Attorney General
  | 'trade'                // Minister of Trade / Commerce
  | 'interior'             // Minister of Interior / Home Affairs
  | 'agriculture'          // Minister of Agriculture
  | 'environment'           // Minister of Environment
  | 'labor'                // Minister of Labor
  | 'energy'               // Minister of Energy
  | 'communications'        // Minister of Communications
  | 'prime_minister'       // Prime Minister's Office
  | 'deputy_pm'            // Deputy Prime Minister
  | 'cabinet'              // Cabinet Office
  // Corporate executive roles
  | 'ceo'                  // Chief Executive Officer
  | 'cfo'                  // Chief Financial Officer
  | 'cto'                  // Chief Technology Officer
  | 'coo'                  // Chief Operating Officer
  | 'cio'                  // Chief Information Officer
  | 'cmo'                  // Chief Marketing Officer
  | 'cso'                  // Chief Security Officer
  | 'clo'                  // Chief Legal Officer
  | 'chair'                // Board Chair / Chairman
  | 'director'             // Director
  | 'vp'                   // Vice President
  | 'secretary'            // Secretary / Company Secretary
  // General
  | 'other'                // Other portfolios / roles
  | 'unspecified';          // Portfolio not yet categorized

export interface Region {
  id: string;
  name: string;
  code: string;
  regionType: string;
  parentRegionId?: string;
  createdAt: string;
  updatedAt: string;
}

export interface Organization {
  id: string;
  name: string;
  type: OrgType;
  headOfficeType: HeadOfficeType;
  headOfficeCountryId: string;
  headOfficeCity?: string;
  headOfficeAddress?: string;
  headOfficePhone?: string;
  headOfficeEmail?: string;
  headOfficeWebsite?: string;
  description?: string;
  ownerId?: string;
  createdAt: string;
  updatedAt: string;
}

export interface OrganizationWithCounts extends Organization {
  departmentCount?: number;
  contactCount?: number;
}

export interface Department {
  id: string;
  name: string;
  code?: string;
  description?: string;
  portfolio: Portfolio;
  organisationId: string;
  parentId?: string;
  isActive: boolean;
  createdAt: string;
  updatedAt: string;
  createdBy?: string;
  updatedBy?: string;
}

export interface DepartmentWithContacts extends Department {
  contactCount?: number;
  organisation?: Organization;
}

export interface DepartmentNode extends DepartmentWithContacts {
  children: DepartmentNode[];
  level: number;
}

export interface Contact {
  id: string;
  fullName: string;
  roleTitle?: string;
  departmentId?: string;
  departmentLegacy?: string;
  organisationId: string;
  primaryLocationId?: string;
  ownerId?: string;
  isHeadOfficeBased: boolean;
  isActive: boolean;
  createdAt: string;
  updatedAt: string;
}

export interface ContactWithChannels extends Contact {
  contactChannels?: ContactChannel[];
  department?: Department;
  organisation?: Organization;
}

export interface ContactSearchResult {
  contactId: string;
  contactName: string;
  roleTitle: string;
  departmentId: string;
  departmentName: string;
  departmentCode: string;
  organizationId: string;
  organizationName: string;
  organizationShortName: string;
}

export type ChannelType = 'phone' | 'email' | 'website' | 'office_address' | 'mobile' | 'fax';

export interface ContactChannel {
  id: string;
  contactId: string;
  channelType: ChannelType;
  value: string;
  displayValue?: string;
  phoneNormalized?: string;
  addressLine1?: string;
  city?: string;
  state?: string;
  postalCode?: string;
  country?: string;
  createdAt: string;
  updatedAt: string;
}

// Package Management Types (reused for communications)
export type DeliveryStatus = 'PENDING' | 'SENDING' | 'SENT' | 'DELIVERED' | 'FAILED' | 'BOUNCED';
export type ResponseStatus = 'RECEIVED' | 'REVIEWING' | 'ACCEPTED' | 'REJECTED' | 'INCOMPLETE';
export type DocumentCategory = 'NOTICE' | 'FORM' | 'CERTIFICATE' | 'CORRESPONDENCE' | 'REPORT' | 'OTHER';

// ============================================================================
// COMMUNICATION TRACKER TYPES
// ============================================================================

export type CommunicationType = 'letter' | 'email' | 'physical_mail' | 'meeting';
export type CommunicationStatus = 'SENT' | 'AWAITING_RESPONSE' | 'RESPONDED' | 'CLOSED' | 'CANCELLED';
export type CommunicationDocumentType = 'sent' | 'received';

export interface Communication {
  id: string;
  title: string;
  description?: string;
  communicationType: CommunicationType;
  status: CommunicationStatus;
  contactId?: string;
  departmentId?: string;
  organisationId?: string;
  category?: string;
  categoryId?: string;
  tags: string[];
  expectedResponseDate?: string;
  respondedAt?: string;
  closedAt?: string;
  isPublic: boolean;
  isApproved: boolean;
  createdById: string;
  senderOrganisation?: string;
  createdAt: string;
  updatedAt: string;
}

export interface CommunicationRecipient {
  id: string;
  communicationId: string;
  departmentId: string;
  contactId?: string;
  deliveryStatus: DeliveryStatus;
  sentAt?: string;
  deliveredAt?: string;
  responseStatus: ResponseStatus;
  responseDate?: string;
  notes?: string;
  createdAt: string;
  createdBy?: string;
  // Joined data
  department?: { id: string; name: string; portfolio: string; organisationId: string };
  contact?: { id: string; fullName: string; roleTitle?: string };
  organisation?: { id: string; name: string };
}

export interface CommunicationWithDetails extends Communication {
  contact?: { id: string; fullName: string; roleTitle?: string };
  department?: { id: string; name: string; portfolio: string };
  organisation?: { id: string; name: string };
  documents?: CommunicationDocument[];
  recipients?: CommunicationRecipient[];
  issueCategory?: { id: string; name: string; slug: string; icon: string | null };
}

export interface CommunicationDocument {
  id: string;
  communicationId: string;
  documentType: CommunicationDocumentType;
  filename: string;
  originalName: string;
  mimeType: string;
  sizeBytes: number;
  storagePath: string;
  isPublic: boolean;
  description?: string;
  uploadedAt: string;
  uploadedBy: string;
  recipientId?: string;
}

export interface CreateCommunicationInput {
  title: string;
  description?: string;
  communicationType: CommunicationType;
  contactId?: string;
  departmentId?: string;
  organisationId?: string;
  category?: string;
  categoryId?: string;
  tags?: string[];
  expectedResponseDate?: string;
  expectedResponseDays?: number;
  isPublic: boolean;
  isApproved: boolean;
  senderOrganisation?: string;
  recipients?: { departmentId: string; contactId?: string }[];
}

// ============================================================================
// COLLABORATION TYPES
// ============================================================================

export type CommunicationMemberRole = 'owner' | 'assignee' | 'collaborator';

export interface CommunicationMember {
  id: string;
  communicationId: string;
  userId: string;
  role: CommunicationMemberRole;
  invitedBy: string;
  joinedAt: string;
  user?: {
    id: string;
    email: string;
    displayName: string | null;
  };
}

export type NotificationType =
  | 'communication_assigned'
  | 'communication_invited'
  | 'communication_status_changed'
  | 'communication_document_uploaded'
  | 'communication_updated'
  | 'communication_member_added'
  | 'communication_member_removed'
  | 'inbound_email_received'
  | 'contact_submission_received'
  | 'report_submission_received';

export interface AppNotification {
  id: string;
  userId: string;
  type: NotificationType;
  title: string;
  message: string;
  isRead: boolean;
  readAt: string | null;
  resourceId: string | null;
  metadata: Record<string, unknown> | null;
  createdAt: string;
}

export interface ActivityLogEntry {
  id: string;
  userId: string;
  action: string;
  resourceType: string;
  resourceId: string | null;
  changes: Record<string, unknown> | null;
  createdAt: string;
  user?: {
    id: string;
    email: string;
    displayName: string | null;
  };
}

export interface UserResult {
  id: string;
  email: string;
  displayName: string | null;
}

// ============================================================================
// INBOUND EMAIL TYPES
// ============================================================================

export type InboundEmailStatus = 'received' | 'linked' | 'unlinked' | 'error';

export interface InboundEmail {
  id: string;
  fromEmail: string;
  fromName: string | null;
  toEmail: string;
  subject: string;
  bodyText: string | null;
  bodyHtml: string | null;
  headers: Record<string, unknown> | null;
  messageId: string | null;
  inReplyTo: string | null;
  communicationId: string | null;
  contactSubmissionId: string | null;
  status: InboundEmailStatus;
  processedAt: string | null;
  createdAt: string;
}

// User Management
export interface ManagedUser {
  id: string;
  email: string;
  displayName: string | null;
  roles: string[];
  createdAt: string;
}

export interface SiteSetting {
  id: string;
  key: string;
  value: string;
  valueType: 'string' | 'json' | 'boolean';
  category: string;
  label: string;
  description: string | null;
  createdAt: string;
  updatedAt: string;
  updatedBy: string | null;
}

export interface SocialLink {
  platform: string;
  url: string;
  label: string;
}
