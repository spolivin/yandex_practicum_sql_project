WITH country_year AS
  (SELECT c.country_code,
          AVG(CASE
                  WHEN EXTRACT(YEAR
                               FROM c.founded_at) = 2011 THEN c.funding_total
              END) AS avg_investment_2011,
          AVG(CASE
                  WHEN EXTRACT(YEAR
                               FROM c.founded_at) = 2012 THEN c.funding_total
              END) AS avg_investment_2012,
          AVG(CASE
                  WHEN EXTRACT(YEAR
                               FROM c.founded_at) = 2013 THEN c.funding_total
              END) AS avg_investment_2013
   FROM company c
   WHERE EXTRACT(YEAR
                 FROM c.founded_at) IN (2011,
                                        2012,
                                        2013)
   GROUP BY c.country_code)
SELECT country_code,
       avg_investment_2011,
       avg_investment_2012,
       avg_investment_2013
FROM country_year
WHERE avg_investment_2011 IS NOT NULL
  AND avg_investment_2012 IS NOT NULL
  AND avg_investment_2013 IS NOT NULL
  AND country_code IS NOT NULL
ORDER BY avg_investment_2011 DESC;
