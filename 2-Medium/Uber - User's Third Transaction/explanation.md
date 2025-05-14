# Explicação da Solução

**Objetivo:** Obter a terceira transação de cada usuário.

## Etapas:

### 1. Vamos enumerar as transações por usuário, ordenando pela data, usando a window function ROW_NUMBER.
```sql
SELECT
  user_id
  ,spend
  ,transaction_date
  ,ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS row_num
FROM transactions;
```

### 2. Vamos criar uma cte para filtrarmos os "row_num" que sejam iguais a 3, ou seja, a terceira transação.

```sql
WITH transactions_cte
AS (
SELECT
  user_id
  ,spend
  ,transaction_date
  ,ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS row_num
FROM transactions
)
SELECT
  user_id
  ,spend
  ,transaction_date
FROM transactions_cte
WHERE row_num = 3
;
```
## Exemplo de Saída:

| user_id | spend | transaction_date |
|------------------|------------|------|
| 111                | 89.60          | 02/05/2022 12:00:00 |
| 121                | 67.90          | 04/03/2022 12:00:00 |
| 263                | 100.00         | 07/12/2022 12:00:00 |