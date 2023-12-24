SELECT DISTINCT ppl.id, educ.instituition
FROM people ppl
INNER JOIN education educ ON ppl.id = educ.person_id
WHERE ppl.company_id IN (
        SELECT comp.id
        FROM company comp
        INNER JOIN funding_round AS fr ON comp.id = fr.company_id
        WHERE (fr.is_first_round = 1 AND fr.is_last_round = 1)
                AND comp.status = 'closed'
        );
