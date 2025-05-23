SELECT Ticker,
    Date,
    Close,
    AVG(Close) OVER (
        PARTITION BY Ticker
        ORDER BY Date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS SMA_5,
    AVG(Close) OVER (
        PARTITION BY Ticker
        ORDER BY Date ROWS BETWEEN 19 PRECEDING AND CURRENT ROW
    ) AS SMA_20,
    AVG(Close) OVER (
        PARTITION BY Ticker
        ORDER BY Date ROWS BETWEEN 49 PRECEDING AND CURRENT ROW
    ) AS SMA_50
FROM stocks
ORDER BY Ticker,
    Date;