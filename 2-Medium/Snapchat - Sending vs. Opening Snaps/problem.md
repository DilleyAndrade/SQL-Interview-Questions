
# Problema

## 📌 Descrição
Assuma que você recebeu tabelas com informações sobre usuários do Snapchat, incluindo suas idades e o tempo gasto enviando e abrindo snaps.

## ✅ Requisitos
- Escreva uma consulta para obter uma divisão do tempo gasto enviando versus abrindo snaps, como uma porcentagem do tempo total gasto nessas atividades, agrupada por faixa etária.
- Arredonde a porcentagem para 2 casas decimais no resultado.

## 📊 Exemplo de Saída
| age_bucket | send_perc	| open_perc |
| --- | --- |---|
| 21-25	 | 54.31	 | 45.69 |
| 26-30	 | 82.26 | 17.74 |
| 31-35	 | 37.84 | 62.16 |

## 🚨 Observações
- Calcule as seguintes porcentagens:
- Tempo gasto enviando / (Tempo gasto enviando + Tempo gasto abrindo)
- Tempo gasto abrindo / (Tempo gasto enviando + Tempo gasto abrindo)
- Para evitar a divisão inteira em porcentagens, multiplique por 100,0 e não por 100.
