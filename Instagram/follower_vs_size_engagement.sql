SELECT CASE
        WHEN followers_numeric < 1000000 THEN '<1M'
        WHEN followers_numeric < 5000000 THEN '1-5M'
        WHEN followers_numeric < 10000000 THEN '5-10M'
        WHEN followers_numeric < 20000000 THEN '10-20M'
        WHEN followers_numeric < 40000000 THEN '20-40M'
        ELSE '>50M'
    END AS follower_size,
    COUNT(*) AS influencer_count,
    ROUND(AVG(avg_likes_numeric / followers_numeric) * 100, 2) AS avg_engagement_rate,
    ROUND(
        AVG(new_post_avg_like_numeric / avg_likes_numeric) * 100,
        0
    ) AS recent_vs_avg_performance
FROM influencer_numeric
GROUP BY follower_size
ORDER BY follower_size;