WITH daily_changes AS (
    SELECT Ticker,
        Date,
        Close,
        Close - LAG(Close, 1) OVER (
            PARTITION BY Ticker
            ORDER BY Date
        ) AS price_change
    FROM stocks
),
avg_gains_losses AS (
    SELECT Ticker,
        Date,
        Close,
        AVG(GREATEST(price_change, 0)) OVER (
            PARTITION BY Ticker
            ORDER BY Date ROWS BETWEEN 13 PRECEDING AND CURRENT ROW
        ) AS avg_gain,
        AVG(ABS(LEAST(price_change, 0))) OVER (
            PARTITION BY Ticker
            ORDER BY Date ROWS BETWEEN 13 PRECEDING AND CURRENT ROW
        ) AS avg_loss
    FROM daily_changes
)
SELECT Ticker,
    Date,
    Close,
    CASE
        WHEN avg_loss = 0 THEN 100
        ELSE 100 - (100 / (1 + (avg_gain / avg_loss)))
    END AS RSI_14
FROM avg_gains_losses
ORDER BY Ticker,
    Date;