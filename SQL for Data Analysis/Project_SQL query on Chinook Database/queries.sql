/* Query 1- query used for first insight */
SELECT
  c.Country,
  SUM(Total) / COUNT(*) average_purchase,
  MAX(Total),
  MIN(Total)
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY 2 DESC;

/* Query 2- query used for second insight */
SELECT
  g.Name,
  SUM(t.Milliseconds / 60000) minutes_played
FROM MediaType m
JOIN Track t ON m.MediaTypeId = t.MediaTypeId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE m.Name = 
(SELECT Name
FROM (SELECT m.Name, COUNT(*)
       FROM MediaType m
       JOIN Track t ON m.MediaTypeId = t.MediaTypeId
       GROUP BY m.Name
       ORDER BY 2 DESC
       LIMIT 1))
GROUP BY g.Name
ORDER BY 2 DESC;

/* Query 3- query used for third insight */
SELECT member_level, COUNT(*)
FROM (SELECT
  c.CustomerId,
  SUM(Total),
  CASE
    WHEN SUM(Total) > 45 THEN "Golden Member Purchase > $45"
    WHEN SUM(Total) > 40 THEN "Silver Member Purchase > $40"
    ELSE "Bronze Mmember Purchase <= $40"
  END AS member_level
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId)
GROUP BY 1
ORDER BY 2;

/* Query 4- query used for fouth insight */
SELECT *
FROM (SELECT a2.Name, a1.Title, SUM(i.UnitPrice * i.Quantity) Albums_Sales
      FROM Track t
      JOIN InvoiceLine i ON t.TrackId = i.TrackId
      JOIN Album a1 ON t.AlbumId = a1.AlbumId
      JOIN Artist a2 ON a1.ArtistId = a2.ArtistId
      GROUP BY a2.Name, a1.Title)
WHERE Name = (SELECT Name
              FROM (SELECT a2.Name, SUM(i.UnitPrice * i.Quantity) Tracks_Sales
                    FROM Track t
                    JOIN InvoiceLine i ON t.TrackId = i.TrackId
                    JOIN Album a1 ON t.AlbumId = a1.AlbumId
                    JOIN Artist a2 ON a1.ArtistId = a2.ArtistId
                    GROUP BY a2.Name
                    ORDER BY 2 DESC
                    LIMIT 1))
ORDER BY 3 DESC
LIMIT 10;
