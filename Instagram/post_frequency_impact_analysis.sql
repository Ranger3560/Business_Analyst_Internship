SELECT CASE
        WHEN posts_numeric < 100 THEN '<100'
        WHEN posts_numeric < 500 THEN '100-500'
        WHEN posts_numeric < 1000 THEN '500-1000'
        WHEN posts_numeric < 2000 THEN '1000-2000'
        ELSE '>2000'
    END AS post_count_range,
    COUNT(*) AS influencer_count,
    ROUND(AVG(avg_likes_numeric / followers_numeric) * 100, 2) AS avg_engagement_rate,
    ROUND(AVG(influence_score), 1) AS avg_influence_score
FROM influencer_numeric
GROUP BY post_count_range
ORDER BY post_count_range;