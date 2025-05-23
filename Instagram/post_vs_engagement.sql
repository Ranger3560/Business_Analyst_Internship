SELECT ROUND(posts_numeric / 365, 1) AS avg_posts_per_day,
    ROUND(AVG(avg_likes_numeric / followers_numeric) * 100, 2) AS avg_engagement_rate,
    ROUND(
        AVG(new_post_avg_like_numeric / avg_likes_numeric) * 100,
        0
    ) AS recent_performance_pct
FROM influencer_numeric
GROUP BY avg_posts_per_day
HAVING COUNT(*) > 3
ORDER BY avg_posts_per_day;