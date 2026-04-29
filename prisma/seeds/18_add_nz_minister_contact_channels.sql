-- ============================================================================
-- ADD CONTACT CHANNELS FOR NEW ZEALAND GOVERNMENT MINISTERS
-- ============================================================================
-- This script adds email, phone, and address contact channels for NZ ministers
--
-- Email Format:
-- - Cabinet Ministers: initial.surname@ministers.govt.nz
-- - All MPs: firstname.lastname@parliament.govt.nz
--
-- Parliament Address:
-- - Executive Wing, Parliament Buildings
-- - Wellington 6160, New Zealand
--
-- Parliament Phone:
-- - +64 4 817 9999 (International)
-- - 0800 727 362 (NZ Freephone)
-- ============================================================================

-- Helper: Parliament standard address
-- Parliament Buildings, Wellington 6160, New Zealand

-- ============================================================================
-- PRIME MINISTER'S OFFICE
-- ============================================================================

-- Christopher Luxon - Prime Minister
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-pm-luxon-email', 'nz-contact-pm-luxon', 'email',
  'christopher.luxon@parliament.govt.nz', 'christopher.luxon@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-pm-luxon-phone', 'nz-contact-pm-luxon', 'phone',
  '+64-4-817-9999', '+64 4 817 9999',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- Winston Peters - Deputy Prime Minister
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-dpm-peters-email', 'nz-contact-dpm-peters', 'email',
  'winston.peters@parliament.govt.nz', 'winston.peters@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-dpm-peters-phone', 'nz-contact-dpm-peters', 'phone',
  '+64-4-817-9999', '+64 4 817 9999',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF FINANCE
-- ============================================================================

-- Nicola Willis - Minister of Finance
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-fin-willis-email', 'nz-contact-fin-willis', 'email',
  'n.willis@ministers.govt.nz', 'n.willis@ministers.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-fin-willis-phone', 'nz-contact-fin-willis', 'phone',
  '+64-4-817-9999', '+64 4 817 9999',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- David Seymour - Associate Minister of Finance
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-fin-seymour-email', 'nz-contact-fin-seymour', 'email',
  'david.seymour@parliament.govt.nz', 'david.seymour@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- Andrew Bayly - Minister of Commerce and Consumer Affairs
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-fin-bayly-email', 'nz-contact-fin-associate-2', 'email',
  'andrew.bayly@parliament.govt.nz', 'andrew.bayly@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF FOREIGN AFFAIRS AND TRADE
-- ============================================================================

-- Winston Peters - Minister of Foreign Affairs
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-fa-peters-email', 'nz-contact-fa-peters', 'email',
  'w.peters@ministers.govt.nz', 'w.peters@ministers.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-fa-peters-phone', 'nz-contact-fa-peters', 'phone',
  '+64-4-439-8000', '+64 4 439 8000',
  '401-405 Lambton Quay', 'Wellington', 'Wellington', '6144', 'New Zealand',
  NOW(), NOW()
);

-- Todd McClay - Minister of Trade
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-fa-mcclay-email', 'nz-contact-fa-mcclay', 'email',
  'todd.mcclay@parliament.govt.nz', 'todd.mcclay@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF DEFENSE
-- ============================================================================

-- Judith Collins - Minister of Defense
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-def-collins-email', 'nz-contact-def-collins', 'email',
  'j.collins@ministers.govt.nz', 'j.collins@ministers.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-def-collins-phone', 'nz-contact-def-collins', 'phone',
  '+64-4-817-9999', '+64 4 817 9999',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- Shane Jones - Associate Minister of Defense
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-def-jones-email', 'nz-contact-def-jones', 'email',
  'shane.jones@parliament.govt.nz', 'shane.jones@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF HEALTH
-- ============================================================================

-- Dr. Shane Reti - Minister of Health
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-hlth-reti-email', 'nz-contact-hlth-reti', 'email',
  's.reti@ministers.govt.nz', 's.reti@ministers.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-hlth-reti-phone', 'nz-contact-hlth-reti', 'phone',
  '+64-4-817-9999', '+64 4 817 9999',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF EDUCATION
-- ============================================================================

-- Erica Stanford - Minister of Education
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-edu-stanford-email', 'nz-contact-edu-stanford', 'email',
  'e.stanford@ministers.govt.nz', 'e.stanford@ministers.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-edu-stanford-phone', 'nz-contact-edu-stanford', 'phone',
  '+64-4-817-9999', '+64 4 817 9999',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- David Seymour - Minister of Regulation
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-edu-seymour-email', 'nz-contact-edu-seymour', 'email',
  'david.seymour@parliament.govt.nz', 'david.seymour@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF INTERIOR
-- ============================================================================

-- Brooke van Velden - Minister of Internal Affairs
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-int-velden-email', 'nz-contact-int-penno', 'email',
  'brooke.vanvelden@parliament.govt.nz', 'brooke.vanvelden@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF JUSTICE
-- ============================================================================

-- Paul Goldsmith - Minister of Justice
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-just-goldsmith-email', 'nz-contact-just-goldsmith', 'email',
  'p.goldsmith@ministers.govt.nz', 'p.goldsmith@ministers.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-just-goldsmith-phone', 'nz-contact-just-goldsmith', 'phone',
  '+64-4-817-9999', '+64 4 817 9999',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- Chris Penk - Attorney-General
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-just-penk-email', 'nz-contact-just-mitchell', 'email',
  'chris.penk@parliament.govt.nz', 'chris.penk@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF AGRICULTURE
-- ============================================================================

-- Shane Jones - Minister for Agriculture
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-agri-jones-email', 'nz-contact-agri-jones', 'email',
  'shane.jones@parliament.govt.nz', 'shane.jones@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY FOR THE ENVIRONMENT
-- ============================================================================

-- Penny Simmonds - Minister for the Environment
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-env-simmonds-email', 'nz-contact-env-simmons', 'email',
  'penny.simmonds@parliament.govt.nz', 'penny.simmonds@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- Chris Bishop - Minister of Climate Change
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-env-bishop-email', 'nz-contact-env-bishop', 'email',
  'chris.bishop@parliament.govt.nz', 'chris.bishop@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF TRANSPORT
-- ============================================================================

-- Simeon Brown - Minister of Transport
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-trans-brown-email', 'nz-contact-trans-brown', 'email',
  's.brown@ministers.govt.nz', 's.brown@ministers.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-trans-brown-phone', 'nz-contact-trans-brown', 'phone',
  '+64-4-817-9999', '+64 4 817 9999',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- Chris Bishop - Minister of Infrastructure
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-trans-bishop2-email', 'nz-contact-trans-associate-1', 'email',
  'chris.bishop@parliament.govt.nz', 'chris.bishop@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF LABOR
-- ============================================================================

-- Brooke van Velden - Minister for Workplace Relations
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-labor-velden-email', 'nz-contact-labor-upston', 'email',
  'brooke.vanvelden@parliament.govt.nz', 'brooke.vanvelden@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF BUSINESS, INNOVATION AND EMPLOYMENT
-- ============================================================================

-- Chris Bishop - Minister for Economic Development
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-comm-bishop-email', 'nz-contact-comm-bishop', 'email',
  'chris.bishop@parliament.govt.nz', 'chris.bishop@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- Todd McClay - Minister for Tourism and Hospitality
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-comm-mcclay2-email', 'nz-contact-comm-mcclay', 'email',
  'todd.mcclay@parliament.govt.nz', 'todd.mcclay@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- PARLIAMENT
-- ============================================================================

-- Gerry Brownlee - Speaker of the House
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-parl-brownlee-email', 'nz-contact-parl-speaker', 'email',
  'speaker@parliament.govt.nz', 'speaker@parliament.govt.nz',
  'Speaker''s Office, Parliament House', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
), (
  'nz-channel-parl-brownlee-phone', 'nz-contact-parl-speaker', 'phone',
  '+64-4-817-9999', '+64 4 817 9999',
  'Speaker''s Office, Parliament House', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- MINISTRY OF ENERGY AND RESOURCES
-- ============================================================================

-- Shane Jones - Minister of Energy and Resources
INSERT INTO contact_channels (
  id, "contactId", "channelType", value, "displayValue",
  "addressLine1", "city", "state", "postalCode", "country",
  "createdAt", "updatedAt"
) VALUES (
  'nz-channel-engy-jones2-email', 'nz-contact-engy-simmons', 'email',
  'shane.jones@parliament.govt.nz', 'shane.jones@parliament.govt.nz',
  'Executive Wing, Parliament Buildings', 'Wellington', 'Wellington', '6160', 'New Zealand',
  NOW(), NOW()
);

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Count contact channels added
SELECT COUNT(*) as total_nz_channels
FROM contact_channels
WHERE "contactId" LIKE 'nz-contact-%';

-- Show contacts with their channels
SELECT
  c."fullName",
  c."roleTitle",
  COUNT(cc.id) as channel_count,
  STRING_AGG(DISTINCT cc.channelType, ', ') as channel_types
FROM contacts c
LEFT JOIN contact_channels cc ON cc."contactId" = c.id
WHERE c.id LIKE 'nz-contact-%'
GROUP BY c.id, c."fullName", c."roleTitle"
ORDER BY c."fullName";
