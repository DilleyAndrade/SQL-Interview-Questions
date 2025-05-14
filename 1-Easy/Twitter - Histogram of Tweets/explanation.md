# Explicação da Solução

**Objetivo:** obter um histograma de tweets postados por usuário em 2022

## Etapas:

### 1. Vamos contar a quantidade de tweets por usuário

```sql
SELECT
  user_id,
  COUNT(tweet_id) AS total_tweet_id
FROM tweets
GROUP BY user_id;
```

### 2. Agora vamos filtrar apenas os posts do ano de 2022

```sql
SELECT
  user_id,
  COUNT(tweet_id) AS total_tweet_id
FROM tweets
WHERE TO_CHAR(tweet_date, 'yyyy') = '2022'
GROUP BY user_id;
```

### 3. Agora vamos criar uma CTE para poder contar o total de usuários por quantidade de tweets

```sql
WITH my_cte AS (
  SELECT
    user_id,
    COUNT(tweet_id) AS total_tweet_id
  FROM tweets
  WHERE TO_CHAR(tweet_date, 'YYYY') = '2022'
  GROUP BY user_id
)
SELECT
  total_tweet_id AS tweet_bucket,
  COUNT(user_id) AS users_num
FROM my_cte
GROUP BY total_tweets;
```

## Exemplo de Saída:

| tweets_per_user | num_users |
|------------------|------------|
| 1                | 2          |
| 2                | 1          |
