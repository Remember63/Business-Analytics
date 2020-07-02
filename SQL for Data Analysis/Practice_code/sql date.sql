SELECT DATE_TRUNC('year',o.occurred_at), SUM(total_amt_usd)
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_PART('month',o.occurred_at), SUM(total_amt_usd), COUNT(total_amt_usd)
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_PART('year',o.occurred_at), COUNT(total)
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_PART('month',o.occurred_at), COUNT(total)
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

SELECT DATE_TRUNC('month',o.occurred_at), SUM(gloss_amt_usd)
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC;
