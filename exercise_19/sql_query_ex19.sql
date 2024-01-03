SELECT f.name name_of_fund,
       comp.name name_of_company,
       fr.raised_amount amount
FROM investment inv
INNER JOIN company comp ON inv.company_id = comp.id
INNER JOIN fund f ON inv.fund_id = f.id
INNER JOIN funding_round fr ON inv.funding_round_id = fr.id
WHERE comp.milestones > 6
  AND EXTRACT(YEAR
              FROM fr.funded_at) BETWEEN 2012 AND 2013;
