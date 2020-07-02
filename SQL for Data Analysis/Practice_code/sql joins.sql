SELECT r.name region, s.name sales_name, a.name account
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
AND r.name = 'Midwest'
JOIN accounts a
ON s.id = a.sales_rep_id
ORDER BY a.name;

SELECT r.name region, s.name sales_name, a.name account
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
AND r.name = 'Midwest'
AND s.name LIKE 'S%'
JOIN accounts a
ON s.id = a.sales_rep_id
ORDER BY a.name;

SELECT r.name region, s.name sales_name, a.name account
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
AND r.name = 'Midwest'
AND s.name LIKE '% K%'
JOIN accounts a
ON s.id = a.sales_rep_id
ORDER BY a.name;

# 4 TO 6#
SELECT r.name region, a.name account, total_amt_usd/(total+0.01) unit_price
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
AND o.standard_qty > 100
AND o.poster_qty > 50
ORDER BY unit_price DESC;

SELECT DISTINCT a.name, w.channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
AND w.account_id = 1001;

SELECT a.name, o.total,o.occurred_at,o.total_amt_usd
FROM orders o
JOIN accounts a
ON a.id = o.account_id
AND o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01';
