WITH tweets_cte
AS(
  SELECT
    user_id
    ,COUNT(tweet_id) AS total_tweet_id
  FROM tweets
  WHERE TO_CHAR(tweet_date, 'yyyy') = '2022'
  GROUP BY user_id
)
SELECT
  total_tweet_id AS tweet_bucket
  ,COUNT(user_id) AS users_num
FROM tweets_cte
GROUP BY total_tweet_id
;