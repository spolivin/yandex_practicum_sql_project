SELECT SUM(price_amount)
FROM acquisition
WHERE (EXTRACT(YEAR FROM acquired_at) BETWEEN 2011 AND 2013)
    AND term_code = 'cash';
