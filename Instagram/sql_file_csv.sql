COPY influencer_data (
    rank,
    channel_info,
    influence_score,
    posts,
    followers,
    avg_likes,
    eng_rate_60_day,
    new_post_avg_like,
    total_likes,
    country
)
FROM 'E:\Unified Mentor Final Project\Instagram\top_insta_influencers_data.csv' DELIMITER ',' CSV HEADER;