SELECT s.id, s.name, COUNT(a.name)
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
GROUP BY s.id, s.name
HAVING COUNT(a.name) > 5
ORDER BY s.id, s.name;

#2-3 #
SELECT a.id, COUNT(a.id)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id
HAVING COUNT(a.id) > 20
ORDER BY COUNT(a.id) DESC;

#most spent account id 4211#
SELECT a.id, SUM(total_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id
HAVING SUM(total_amt_usd) > 30000
ORDER BY SUM(total_amt_usd) DESC;

#least spent account id 1901#
SELECT a.id, SUM(total_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id
HAVING SUM(total_amt_usd) <1000
ORDER BY SUM(total_amt_usd) DESC;

SELECT a.id, SUM(total_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id
HAVING SUM(total_amt_usd) <1000
ORDER BY SUM(total_amt_usd) DESC;

#account 1851 used Facebook most as a channel#
SELECT w.account_id,COUNT(w.channel)
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE w.channel LIKE '%facebook%'
GROUP BY w.account_id
HAVING COUNT(w.channel) > 6
ORDER BY COUNT(w.channel) DESC;

#Direct channel is used the most by most accounts#
SELECT w.account_id, w.channel, COUNT(w.channel)
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
GROUP BY w.account_id, w.channel
ORDER BY COUNT(w.channel) DESC;
