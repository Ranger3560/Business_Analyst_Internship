SELECT Ticker,
    AVG(Volume) AS Avg_Daily_Volume,
    MAX(Volume) AS Max_Daily_Volume,
    MIN(Volume) AS Min_Daily_Volume
FROM stocks
GROUP BY Ticker;