-- Organisations missing departments (active departments only)
SELECT o.id, o.name, o.type, COUNT(d.id) AS department_count
FROM public.organisations o
LEFT JOIN public.departments d
  ON d."organisationId" = o.id
 AND d."isActive" = TRUE
GROUP BY o.id, o.name, o.type
HAVING COUNT(d.id) = 0
ORDER BY o.name;
