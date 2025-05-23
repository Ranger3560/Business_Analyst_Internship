COPY stocks (
    Ticker,
    Date,
    Open,
    High,
    Low,
    Close,
    Adj_Close,
    Volume
)
FROM 'E:\Unified Mentor Final Project\Stocks\stocks.csv' DELIMITER ',' CSV HEADER;