SELECT country_code,
       MIN(invested_companies) min_inv_comp,
       MAX(invested_companies) max_inv_comp,
       AVG(invested_companies) avg_inv_comp
FROM fund
WHERE EXTRACT(YEAR FROM founded_at) BETWEEN 2010 AND 2012
GROUP BY country_code
HAVING MIN(invested_companies) != 0
ORDER BY avg_inv_comp DESC,
         country_code
LIMIT 10;
