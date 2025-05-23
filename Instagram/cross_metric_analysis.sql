SELECT CASE
        WHEN influence_score > 80
        AND (avg_likes_numeric / followers_numeric) * 100 > 2 THEN 'High Influence, High Engagement'
        WHEN influence_score > 80 THEN 'High Influence, Low Engagement'
        WHEN (avg_likes_numeric / followers_numeric) * 100 > 2 THEN 'Low Influence, High Engagement'
        ELSE 'Low Influence, Low Engagement'
    END AS performance_cluster,
    COUNT(*) AS influencer_count,
    ROUND(AVG(followers_numeric)) AS avg_followers,
    ROUND(AVG(posts_numeric)) AS avg_posts
FROM influencer_numeric
GROUP BY performance_cluster;