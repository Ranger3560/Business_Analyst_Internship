WITH daily_returns AS (
    SELECT Date,
        Ticker,
        (
            Close - LAG(Close, 1) OVER (
                PARTITION BY Ticker
                ORDER BY Date
            )
        ) / LAG(Close, 1) OVER (
            PARTITION BY Ticker
            ORDER BY Date
        ) AS daily_return
    FROM stocks
)
SELECT a.Ticker AS Ticker1,
    b.Ticker AS Ticker2,
    CORR(a.daily_return, b.daily_return) AS Correlation
FROM daily_returns a
    JOIN daily_returns b ON a.Date = b.Date
    AND a.Ticker < b.Ticker
GROUP BY a.Ticker,
    b.Ticker
ORDER BY Correlation DESC;