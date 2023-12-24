SELECT *,
       CASE
          WHEN invested_companies >= 100 THEN 'high_activity'
          WHEN invested_companies BETWEEN 20 AND 99 THEN 'middle_activity'
          ELSE 'low_activity'
       END
FROM fund;
