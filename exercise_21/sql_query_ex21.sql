SELECT t1.name AS company_name,
       EXTRACT(MONTH FROM fr.funded_at::date) AS month
FROM (SELECT *
      FROM company
      WHERE category_code = 'social') AS t1
LEFT JOIN funding_round fr ON t1.id = fr.company_id
WHERE fr.raised_amount != 0
    AND EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2010 AND 2013;
