SELECT
  ab.age_bucket
  ,ROUND((SUM(a.time_spent) FILTER(WHERE a.activity_type = 'send') / SUM(a.time_spent) FILTER(WHERE a.activity_type IN('send','open')) * 100),2) AS send_perc
  ,ROUND((SUM(a.time_spent) FILTER(WHERE a.activity_type = 'open') / SUM(a.time_spent) FILTER(WHERE a.activity_type IN('send','open')) * 100),2) AS open_perc
FROM activities a
INNER JOIN age_breakdown ab ON a.user_id = ab.user_id
GROUP BY ab.age_bucket
;