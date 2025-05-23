SELECT Ticker,
    MAX(High) AS All_Time_High,
    MIN(Low) AS All_Time_Low,
    AVG(Close) AS Average_Closing_Price
FROM stocks
GROUP BY Ticker;