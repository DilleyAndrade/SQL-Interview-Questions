# Explicação da Solução

**Objetivo:** encontrar os candidatos mais adequados para uma vaga aberta de Cientista de Dados.

## Etapas:

### 1. Vamos agrupar as skills pelos candidatos, assim saberemos quantas skills cada candidato possui.

```sql
SELECT
  candidate_id
  ,COUNT(skill)
FROM candidates
GROUP BY candidate_id;
```

### 2. Agora vamos filtrar apenas as skills solicitadas, Python, Tableau e PostgreSQL

```sql
SELECT
  candidate_id
  ,COUNT(skill)
FROM candidates
WHERE skill IN('Python','Tableau','PostgreSQL')
GROUP BY candidate_id;
```

### 3. Em seguida vamos usar o having para contar quantos candidados possuem as 3 skills que desejamos

```sql
SELECT
  candidate_id
FROM candidates
WHERE skill IN('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3;
```

## Exemplo de Saída:
| candidate_id |
| --- | 
| 123 |
