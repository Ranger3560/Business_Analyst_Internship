SELECT channel_info,
    ROUND((avg_likes_numeric / followers_numeric) * 100, 2) AS engagement_rate_pct,
    followers_numeric AS followers,
    avg_likes_numeric AS avg_likes
FROM influencer_numeric
WHERE followers_numeric > 1000000 -- Only accounts with 1M+ followers
ORDER BY engagement_rate_pct DESC
LIMIT 5;