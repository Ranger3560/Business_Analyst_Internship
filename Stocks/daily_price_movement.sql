SELECT Ticker,
    Date,
    Close,
    (Close - Open) AS Daily_Change,
    ((Close - Open) / Open) * 100 AS Daily_Percentage_Change,
    (High - Low) AS Daily_Volatility
FROM stocks
ORDER BY Ticker,
    Date;