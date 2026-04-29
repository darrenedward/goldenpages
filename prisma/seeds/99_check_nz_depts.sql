-- ============================================================================
-- CHECK AND FIX NZ DEPARTMENTS
-- ============================================================================

-- First, let's see what NZ departments exist
SELECT
  d.id,
  d.name,
  d.code,
  d.organisationId
FROM departments d
WHERE d.id LIKE 'nz100%'
ORDER BY d.code;
