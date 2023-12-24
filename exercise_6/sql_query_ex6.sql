SELECT country_code,
       SUM(funding_total) total_funding
FROM company
GROUP BY country_code
ORDER BY total_funding DESC;
