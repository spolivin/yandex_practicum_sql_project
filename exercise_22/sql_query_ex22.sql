WITH
    t1 AS (SELECT EXTRACT(MONTH FROM fr.funded_at) AS mon,
                  COUNT(DISTINCT f.name)
           FROM investment AS inv
           JOIN funding_round AS fr ON inv.funding_round_id = fr.id
           JOIN fund AS f ON inv.fund_id = f.id
           WHERE country_code = 'USA' AND fr.funded_at BETWEEN '2010-01-01' AND '2013-12-31'
           GROUP BY mon
           ),
     t2 AS (
            SELECT
                EXTRACT(MONTH FROM acq.acquired_at) AS mon,
                COUNT(acq.acquired_company_id) AS acquired_cnt,
                SUM(acq.price_amount) AS sum_price
            FROM acquisition AS acq
            WHERE acquired_at BETWEEN '2010-01-01' AND '2013-12-31'
            GROUP BY mon
)

SELECT t1.mon,
       t1.count,
       t2.acquired_cnt,
       t2.sum_price
FROM t1
LEFT JOIN t2 ON t1.mon = t2.mon;
