SELECT a.name, count(r.name) region
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id
GROUP BY a.name
ORDER BY region;

SELECT DISTINCT a.name, r.name region
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id
ORDER BY a.name;

SELECT DISTINCT s.name, a.name account
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
ORDER BY s.name;
