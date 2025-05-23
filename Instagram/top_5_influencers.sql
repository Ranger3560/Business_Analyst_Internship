SELECT rank,
    channel_info,
    influence_score,
    followers_numeric AS followers,
    country
FROM influencer_numeric
ORDER BY influence_score DESC
LIMIT 5;