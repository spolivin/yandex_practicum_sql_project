SELECT funded_at::date datum,
       MIN(raised_amount) min_raised_amount,
       MAX(raised_amount) max_raised_amount
FROM funding_round
GROUP BY datum
HAVING MIN(raised_amount) != 0 
    AND MIN(raised_amount) != MAX(raised_amount);
