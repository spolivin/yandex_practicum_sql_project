SELECT comp.name company_name,
       COUNT(DISTINCT educ.instituition) university_count
FROM company comp
INNER JOIN people ppl ON comp.id = ppl.company_id
INNER JOIN education educ ON ppl.id = educ.person_id
GROUP BY company_name
ORDER BY university_count DESC
LIMIT 5;
