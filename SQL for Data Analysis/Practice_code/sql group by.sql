SELECT a.name, MIN(occurred_at)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

SELECT w.channel,a.name, MAX(w.occurred_at)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN web_events w
ON w.account_id = a.id
GROUP BY w.channel, a.name;

SELECT w.channel,COUNT(w.channel)
FROM web_events w
GROUP BY w.channel;

SELECT a.primary_poc,w.occurred_at
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
ORDER BY w.occurred_at
LIMIT 1;

SELECT a.name, MIN(total_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

SELECT r.name, COUNT(s.id) number_sales_rep
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
GROUP BY r.name
ORDER BY number_sales_rep;

SELECT a.name, AVG(standard_qty) mean_standard,  AVG(gloss_qty) mean_gloss, AVG(poster_qty) mean_poster
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

SELECT a.name, AVG(standard_amt_usd) mean_standard,  AVG(gloss_amt_usd) mean_gloss, AVG(poster_amt_usd) mean_poster
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

SELECT s.name, w.channel, COUNT(w.channel) number_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name,w.channel
ORDER BY number_channel DESC;

SELECT r.name, w.channel, COUNT(w.channel) number_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
GROUP BY r.name,w.channel
ORDER BY number_channel DESC;
