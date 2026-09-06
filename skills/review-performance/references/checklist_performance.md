# Checklist: Performance & Optimization Review

This document guides the audit of algorithmic complexity, data volumetrics, I/O bottlenecks, N+1 query patterns, and resource efficiency.

---

## ⚡ Contexto de Carga & Dimensionamento

Toda análise de performance deve levar em consideração o **contexto operacional**:
* **Volumetria de Dados:** Qual o tamanho esperado da coleção (dezenas, milhares, milhões de registros)?
* **Frequência de Execução:** Endpoint de alto tráfego (centenas de req/s) vs rotina em lote executada uma vez ao dia?
* **SLA de Latência:** Limite tolerável para a operação (ex: < 50ms para API síncrona vs minutos para pipeline assíncrono).

---

## 🔄 Phase 1 — Audit (Locating Evidence)

### 1. Padrão N+1 & Custo de I/O Iterativo
* **Consultas dentro de Laços:** Chamadas de banco de dados (`db.query()`, `repository.find()`) ou chamadas HTTP/API executadas dentro de iterações (`for item in items`).
* **Nota Arquitetural:** O problema N+1 é um custo de **I/O linear repetido e latência de rede acumulada**, não necessariamente uma complexidade assintótica quadrática.

### 2. Complexidade Assintótica ($O(N^2)$ ou pior)
* **Laços Aninhados Desnecessários:** Iterar sobre uma coleção de tamanho $N$ e, internamente, iterar sobre outra coleção de tamanho $M$ para cruzamento de chaves sem hash index.
* **Busca Linear Repetitiva:** Usar `if item in my_list` dentro de laço quando `my_list` poderia ser indexada previamente em um `dict` ou `set` para busca $O(1)$.

### 3. Gerenciamento de Memória & Streaming
* **Carga Integral em Memória:** Ler arquivos inteiros (`.read()`, `ReadAll()`) ou carregar tabelas inteiras (`SELECT *`) sem paginação ou cursores.
* **Streams e Iteradores:** Identificar oportunidades de usar geradores (`yield`) e streaming de I/O para manter a pegada de memória constante $O(1)$.

### 4. Gestão de Conexões & Recursos
* **Vazamento de Conexões:** Sockets, arquivos e sessões de banco abertos sem bloco de encerramento seguro (`with`, `try/finally`).
* **Consultas sem Índices:** Filtros em colunas de alto volume sem índice correspondente na modelagem do banco de dados (avaliar seletividade).

---

## 🛠️ Phase 2 — Surgical Application & Caveats (Mode B Only)

* **Consultas em Lote:** Substituir N+1 por consultas agregadas com cláusula `IN` ou JOINs, respeitando os limites de parâmetros do SGBD.
* **Lookup O(1) com Cuidado Semântico:**
  * Converter listas para `set` apenas se **ordem e duplicatas não forem relevantes** para a lógica de negócio subsequente.
  * Se a ordem importar, usar estruturas indexadas com preservação de ordem (`dict` a partir do Python 3.7+).
* **Streaming & Generators:** Adotar `yield` com cautela em relação ao momento de avaliação e tratamento de erros tardios.
* **Context Managers:** Envolver handles em context managers (`with`) para garantia de liberação de file descriptors e pools.
