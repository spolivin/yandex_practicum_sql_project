SELECT CASE
           WHEN invested_companies>=100 THEN 'high_activity'
           WHEN invested_companies>=20 THEN 'middle_activity'
           ELSE 'low_activity'
       END activity,
       ROUND(AVG(investment_rounds)) avg_inv_round
FROM fund
GROUP BY activity
ORDER BY avg_inv_round;
