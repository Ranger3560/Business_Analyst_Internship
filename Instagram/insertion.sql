INSERT INTO influencer_numeric
SELECT rank,
    channel_info,
    influence_score,
    -- All conversion CASE statements here
    CASE
        WHEN posts LIKE '%k' THEN CAST(REPLACE(posts, 'k', '') AS DECIMAL(15, 2)) * 1000
        WHEN posts LIKE '%m' THEN CAST(REPLACE(posts, 'm', '') AS DECIMAL(15, 2)) * 1000000
        WHEN posts LIKE '%b' THEN CAST(REPLACE(posts, 'b', '') AS DECIMAL(15, 2)) * 1000000000
        ELSE CAST(posts AS DECIMAL(15, 2))
    END AS posts_numeric,
    -- Convert followers (475.8m → 475800000)
    CASE
        WHEN followers LIKE '%k' THEN CAST(REPLACE(followers, 'k', '') AS DECIMAL(15, 2)) * 1000
        WHEN followers LIKE '%m' THEN CAST(REPLACE(followers, 'm', '') AS DECIMAL(15, 2)) * 1000000
        WHEN followers LIKE '%b' THEN CAST(REPLACE(followers, 'b', '') AS DECIMAL(15, 2)) * 1000000000
        ELSE CAST(followers AS DECIMAL(15, 2))
    END AS followers_numeric,
    -- Convert avg_likes (8.7m → 8700000)
    CASE
        WHEN avg_likes LIKE '%k' THEN CAST(REPLACE(avg_likes, 'k', '') AS DECIMAL(15, 2)) * 1000
        WHEN avg_likes LIKE '%m' THEN CAST(REPLACE(avg_likes, 'm', '') AS DECIMAL(15, 2)) * 1000000
        WHEN avg_likes LIKE '%b' THEN CAST(REPLACE(avg_likes, 'b', '') AS DECIMAL(15, 2)) * 1000000000
        ELSE CAST(avg_likes AS DECIMAL(15, 2))
    END AS avg_likes_numeric,
    -- Convert 60_day_eng_rate (1.39% → 0.0139)
    CAST(
        REPLACE(eng_rate_60_day, '%', '') AS DECIMAL(5, 3)
    ) / 100 AS eng_rate_60_day,
    -- Convert new_post_avg_like (6.5m → 6500000)
    CASE
        WHEN new_post_avg_like LIKE '%k' THEN CAST(
            REPLACE(new_post_avg_like, 'k', '') AS DECIMAL(15, 2)
        ) * 1000
        WHEN new_post_avg_like LIKE '%m' THEN CAST(
            REPLACE(new_post_avg_like, 'm', '') AS DECIMAL(15, 2)
        ) * 1000000
        WHEN new_post_avg_like LIKE '%b' THEN CAST(
            REPLACE(new_post_avg_like, 'b', '') AS DECIMAL(15, 2)
        ) * 1000000000
        ELSE CAST(new_post_avg_like AS DECIMAL(15, 2))
    END AS new_post_avg_like_numeric,
    -- Convert total_likes (29.0b → 29000000000)
    CASE
        WHEN total_likes LIKE '%k' THEN CAST(REPLACE(total_likes, 'k', '') AS DECIMAL(15, 2)) * 1000
        WHEN total_likes LIKE '%m' THEN CAST(REPLACE(total_likes, 'm', '') AS DECIMAL(15, 2)) * 1000000
        WHEN total_likes LIKE '%b' THEN CAST(REPLACE(total_likes, 'b', '') AS DECIMAL(15, 2)) * 1000000000
        ELSE CAST(total_likes AS DECIMAL(15, 2))
    END AS total_likes_numeric,
    country
FROM influencer_data;