SELECT Ticker,
    Date,
    Volume,
    Close
FROM stocks
ORDER BY Volume DESC
LIMIT 10;