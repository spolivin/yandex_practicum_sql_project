SELECT first_name,
       last_name,
       instituition
FROM people ppl 
LEFT JOIN education educ ON ppl.id = educ.person_id;
