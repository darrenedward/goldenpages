-- Departments missing contacts (active departments only)
SELECT d.id, d.name, d.code, d."organisationId", o.name AS organisation_name, COUNT(c.id) AS contact_count
FROM public.departments d
JOIN public.organisations o
  ON o.id = d."organisationId"
LEFT JOIN public.contacts c
  ON c."departmentId" = d.id
WHERE d."isActive" = TRUE
GROUP BY d.id, d.name, d.code, d."organisationId", o.name
HAVING COUNT(c.id) = 0
ORDER BY o.name, d.name;
