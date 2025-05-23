SELECT Ticker,
    FIRST_VALUE(Close) OVER (
        PARTITION BY Ticker
        ORDER BY Date
    ) AS Year_Start_Price,
    LAST_VALUE(Close) OVER (
        PARTITION BY Ticker
        ORDER BY Date RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS Year_End_Price,
    (
        LAST_VALUE(Close) OVER (
            PARTITION BY Ticker
            ORDER BY Date RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) - FIRST_VALUE(Close) OVER (
            PARTITION BY Ticker
            ORDER BY Date
        )
    ) AS Yearly_Change,
    (
        (
            LAST_VALUE(Close) OVER (
                PARTITION BY Ticker
                ORDER BY Date RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
            ) - FIRST_VALUE(Close) OVER (
                PARTITION BY Ticker
                ORDER BY Date
            )
        ) / FIRST_VALUE(Close) OVER (
            PARTITION BY Ticker
            ORDER BY Date
        )
    ) * 100 AS Yearly_Percentage_Change
FROM stocks
WHERE EXTRACT(
        YEAR
        FROM Date
    ) = 2023;