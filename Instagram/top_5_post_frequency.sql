SELECT channel_info,
    posts_numeric AS total_posts,
    ROUND(posts_numeric / 365, 1) AS avg_posts_per_day,
    followers_numeric AS followers
FROM influencer_numeric
ORDER BY avg_posts_per_day DESC
LIMIT 5;