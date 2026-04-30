-- ==============================================================================
-- DROP PACKAGE TABLES
-- ==============================================================================
-- Packages functionality has been merged into Communications (multi-recipient).

-- Drop in dependency order (children first)
DROP TABLE IF EXISTS sub_package_responses CASCADE;
DROP TABLE IF EXISTS package_documents CASCADE;
DROP TABLE IF EXISTS package_recipients CASCADE;
DROP TABLE IF EXISTS sub_packages CASCADE;
DROP TABLE IF EXISTS packages CASCADE;

-- Note: Keeping the `documents` table and `DeliveryStatus`/`ResponseStatus`/`DocumentCategory` enums
-- as they are reused by the communication_recipients feature.
