# Explicação da Solução

**Objetivo:** Tempo gasto enviando e abrindo snaps.

## Etapas:

### 1. Primeiro vamos fazer um join entre as tabelas

```sql
SELECT
  *
FROM activities a
INNER JOIN age_breakdown ab ON a.user_id = ab.user_id
;
```

### 2. Vamos agrupar nossa consulta por age_bucket e filtrar a coluna time_spent, para o activity_type: open e send

```sql
SELECT
  ab.age_bucket
  ,SUM(a.time_spent) FILTER(WHERE a.activity_type = 'send') AS send_perc
  ,SUM(a.time_spent) FILTER(WHERE a.activity_type = 'open') AS open_perc
FROM activities a
INNER JOIN age_breakdown ab ON a.user_id = ab.user_id
GROUP BY ab.age_bucket
;
```

### 3. Por fim vamos calcular as respectivas porcentagens e arredondar o resultado para duas casas decimais 

```sql
SELECT
  ab.age_bucket
  ,ROUND((SUM(a.time_spent) FILTER(WHERE a.activity_type = 'send') / SUM(a.time_spent) FILTER(WHERE a.activity_type IN('send','open')) * 100),2) AS send_perc
  ,ROUND((SUM(a.time_spent) FILTER(WHERE a.activity_type = 'open') / SUM(a.time_spent) FILTER(WHERE a.activity_type IN('send','open')) * 100),2) AS open_perc
FROM activities a
INNER JOIN age_breakdown ab ON a.user_id = ab.user_id
GROUP BY ab.age_bucket
;
```

## Exemplo de Saída:

| age_bucket | send_perc	| open_perc |
| --- | --- |---|
| 21-25	 | 54.31	 | 45.69 |
| 26-30	 | 82.26 | 17.74 |
| 31-35	 | 37.84 | 62.16 |
