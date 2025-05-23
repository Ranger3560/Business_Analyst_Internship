SELECT channel_info,
    new_post_avg_like_numeric AS recent_avg_likes,
    avg_likes_numeric AS historical_avg_likes,
    ROUND(
        (new_post_avg_like_numeric - avg_likes_numeric) / avg_likes_numeric * 100,
        1
    ) AS improvement_pct
FROM influencer_numeric
ORDER BY improvement_pct DESC
LIMIT 5;