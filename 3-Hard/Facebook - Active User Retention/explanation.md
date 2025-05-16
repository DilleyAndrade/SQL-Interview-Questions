# Explicação da Solução

**Objetivo:** Obter o número de usuários ativos mensais (MAUs) em julho de 2022.

## Etapas:

### 1. Primeiro vamos analisar quantos são os usuários ativos (MAUs) no mês 07/2022

```sql
SELECT
  user_id
  ,COUNT(DISTINCT TO_CHAR(event_date, 'mm')) AS active_users
FROM user_actions
WHERE TO_CHAR(event_date, 'mm/yyyy') IN('07/2022','06/2022')
GROUP BY user_id
HAVING COUNT(DISTINCT TO_CHAR(event_date, 'mm')) = 2
```

### 2. Agora vamos criar outra consulta com o mês mais atual da tabela e trocar sue formato para 1-2-3

```sql
SELECT
    user_id
    ,MAX(TO_CHAR(event_date, 'mm'))::INTEGER AS month
  FROM user_actions
  WHERE TO_CHAR(event_date, 'mm/yyyy') IN('07/2022','06/2022')
  GROUP BY user_id
```

### 3. Agora podemos alocar as duas consultas em CTE's e o fazer um inner join para obtermos nosso resultado

```sql
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
    ,MAX(TO_CHAR(event_date, 'mm'))::INTEGER AS month
  FROM user_actions
  WHERE TO_CHAR(event_date, 'mm/yyyy') IN('07/2022','06/2022')
  GROUP BY user_id
)
SELECT
  ld.month
  ,COUNT(au.user_id) AS monthly_active_users
FROM act_users au
INNER JOIN last_date ld ON au.user_id = ld.user_id
GROUP BY ld.month
;
```

## Exemplo de Saída:

| month | monthly_active_users |
| --- | --- |
| 7 | 2 |
