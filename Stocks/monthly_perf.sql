SELECT Ticker,
    EXTRACT(
        YEAR
        FROM Date
    ) AS Year,
    EXTRACT(
        MONTH
        FROM Date
    ) AS Month,
    MIN(Low) AS Monthly_Low,
    MAX(High) AS Monthly_High,
    AVG(Close) AS Avg_Closing_Price
FROM stocks
GROUP BY Ticker,
    EXTRACT(
        YEAR
        FROM Date
    ),
    EXTRACT(
        MONTH
        FROM Date
    )
ORDER BY Ticker,
    Year,
    Month;