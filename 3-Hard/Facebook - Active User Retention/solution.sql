WITH act_users
AS (
  SELECT
    user_id
    ,COUNT(DISTINCT TO_CHAR(event_date, 'mm')) AS active_users
  FROM user_actions
  WHERE TO_CHAR(event_date, 'mm/yyyy') IN('07/2022','06/2022')
  GROUP BY user_id
  HAVING COUNT(DISTINCT TO_CHAR(event_date, 'mm')) = 2
),last_date
AS (
  SELECT
    user_id
    ,MAX(TO_CHAR(event_date, 'mm')) AS month
  FROM user_actions
  WHERE TO_CHAR(event_date, 'mm/yyyy') IN('07/2022','06/2022')
  GROUP BY user_id
)
SELECT
  ld.month::INTEGER
  ,COUNT(au.user_id) AS monthly_active_users
FROM act_users au
INNER JOIN last_date ld ON au.user_id = ld.user_id
GROUP BY ld.month
;