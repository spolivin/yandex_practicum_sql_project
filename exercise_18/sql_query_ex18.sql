SELECT AVG(t1.count)
FROM (
    SELECT ppl.id,
           COUNT(educ.instituition)
    FROM company comp
    JOIN people ppl ON comp.id = ppl.company_id
    JOIN education educ ON ppl.id = educ.person_id
    WHERE comp.name = 'Facebook'
    GROUP BY ppl.id
) t1;