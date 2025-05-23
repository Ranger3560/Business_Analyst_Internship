SELECT channel_info,
    total_likes_numeric AS total_likes,
    ROUND(total_likes_numeric / 1000000000, 1) || 'B' AS total_likes_billions,
    country
FROM influencer_numeric
ORDER BY total_likes_numeric DESC
LIMIT 5;