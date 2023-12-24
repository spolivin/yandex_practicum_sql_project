SELECT comp1.name acquirer,
       acq.price_amount amount,
       comp2.name acquired,
       comp2.funding_total invested_amount,
       ROUND(acq.price_amount / comp2.funding_total)
FROM acquisition acq
LEFT JOIN company comp1 ON acq.acquiring_company_id = comp1.id
LEFT JOIN company comp2 ON acq.acquired_company_id = comp2.id
WHERE acq.price_amount != 0
    AND comp2.funding_total != 0
ORDER BY amount DESC,
         acquired
LIMIT 10;
