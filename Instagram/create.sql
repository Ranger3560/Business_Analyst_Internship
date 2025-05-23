CREATE TABLE influencer_numeric (
    rank INT,
    channel_info VARCHAR(255),
    influence_score DECIMAL(5, 2),
    posts_numeric DECIMAL(15, 2),
    followers_numeric DECIMAL(15, 2),
    avg_likes_numeric DECIMAL(15, 2),
    eng_rate_60_day DECIMAL(5, 4),
    new_post_avg_like_numeric DECIMAL(15, 2),
    total_likes_numeric DECIMAL(15, 2),
    country VARCHAR(100)
);
SELECT *
FROM influencer_numeric;