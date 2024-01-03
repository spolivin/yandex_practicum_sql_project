SELECT t1.id,
       COUNT(t1.instituition)
FROM
  (SELECT ppl.id,
          educ.instituition
   FROM people ppl
   INNER JOIN education educ ON ppl.id = educ.person_id
   WHERE ppl.company_id IN
       (SELECT id
        FROM company
        WHERE id IN
            (SELECT company_id
             FROM funding_round
             WHERE is_first_round = 1
               AND is_last_round = 1)
          AND status = 'closed' ) ) AS t1
GROUP BY t1.id;
