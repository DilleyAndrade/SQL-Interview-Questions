
# Desafios SQL 💡

Este repositório contém uma coleção de desafios SQL resolvidos, com uma abordagem clara e bem documentada. Cada desafio está em uma pasta separada, permitindo fácil navegação e compreensão.

## 📌 Estrutura do Repositório
- Cada desafio está em uma pasta separada (`desafio-01`, `desafio-02`, etc).
- Cada pasta contém:
  - **problema.md:** Enunciado do problema.
  - **ddl.sql:** Script de criação da base de dados.
  - **dml.sql:** Script de inserção de dados.
  - **solucao.sql:** Solução SQL para o desafio.
  - **explicacao.md:** Explicação do raciocínio utilizado.

## 🚀 Como utilizar
1. Clone o repositório:
   ```bash
   git clone https://github.com/DilleyAndrade/SQL-Interview-Questions.git
   ```

2. Navegue até o desafio desejado:
   ```bash
   cd desafios-sql/3-Hard/desafio-01
   ```

3. Rode o script de criação e inserção de dados no seu SGBD preferido:
   ```bash
   psql -U usuario -d nome_do_banco -f ddl.sql
   psql -U usuario -d nome_do_banco -f dml.sql
   ```

4. Execute a solução:
   ```bash
   psql -U usuario -d nome_do_banco -f solucao.sql
   ```

## ✅ Contribuições
- Fique à vontade para enviar novas ideias de desafios ou soluções otimizadas.
- Para contribuir, faça um fork deste repositório, crie uma branch e envie um pull request.

## 📝 Licença
Este repositório está sob a licença MIT. Sinta-se livre para utilizar e modificar.
