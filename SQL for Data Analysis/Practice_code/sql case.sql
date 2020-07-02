SELECT account_id, total_amt_usd,
       CASE WHEN total_amt_usd >= 3000 THEN 'Large'
            ELSE 'Small' END AS level_of_order
FROM orders;

SELECT id,
       CASE WHEN total >= 2000 THEN ' At Least 2000'
            WHEN total >= 1000 AND total < 2000 THEN 'Between 1000 and 2000'
            ELSE 'Less than 1000' END AS number_of_orders
FROM orders;

SELECT a.name, SUM(total_amt_usd) total_spent,
       CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
            WHEN SUM(total_amt_usd) > 100000 THEN 'middle'
            ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY a.name
ORDER BY 2 DESC;

SELECT a.name, SUM(total_amt_usd) total_spent,
       CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
            WHEN SUM(total_amt_usd) > 100000 THEN 'middle'
            ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE DATE_PART('year', o.occurred_at) IN (2016,2017)
GROUP BY a.name
ORDER BY 2 DESC;

SELECT s.name, COUNT(*) total_orders,
       CASE WHEN COUNT(*) > 200 THEN 'top'
            ELSE 'not' END AS top_sales
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 2 DESC;

SELECT s.name, COUNT(*) total_orders, SUM(total_amt_usd),
       CASE WHEN COUNT(*) > 200 OR SUM(total_amt_usd) > 750000 THEN 'top'
            WHEN COUNT(*) > 150 OR SUM(total_amt_usd) > 500000 THEN 'middle'
            ELSE 'low' END AS top_sales
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 3 DESC;
