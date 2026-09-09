# Checklist: Code Quality & Complexity Review

This document guides the audit of cyclomatic complexity, maintainability, naming conventions, and cognitive load.

---

## Phase 0 — Automated AST Complexity Check (Python)

Run the AST complexity scanner against modified Python files:
```bash
python skills/review-quality/scripts/ast_complexity.py <modified_files>
```
* **Coverage Scope:** The AST scanner automates analysis for **Python** files. For JavaScript/TypeScript and Dart, evaluate complexity via ESLint / `dart analyze` or manual cognitive inspection.
* **Threshold Governance:** Target is $V(G) \le 10$ per function/method. Functions exceeding this limit require refactoring unless an explicit architectural exception is justified (e.g. flat state machine dispatchers or declarative parser tables).

---

## Phase 1 — Audit (Locating Evidence)

### 1. Complexidade Ciclomática & Carga Cognitiva
* **Ramificações Excessivas:** Identificar funções com múltiplos `if/elif/else`, laços aninhados e blocos `try/except` acumulados.
* **Estrutura em Pirâmide:** Aninhamento profundo de blocos de controle (> 3 níveis) obscurecendo o fluxo principal.
* **Cláusulas de Guarda:** Falta de retorno antecipado (*early return*) para condições de erro ou casos de borda.

### 2. Legibilidade, Nomenclatura & SOLID
* **Nomes Ambíguos / Abreviações Ocultas:** Variáveis com nomes de uma letra ou abreviações não padronizadas (`data`, `temp`, `res`, `do_stuff`).
* **Parâmetros Booleanos Flag:** Métodos recebendo `is_admin: bool` ou `flag: bool` que bifurcam toda a lógica interna (indica violação de SRP).
* **Código Morto & Comentários Obsoletos:** Trechos de código comentados, imports não utilizados ou funções privadas nunca invocadas.

---

## Phase 2 — Surgical Application & Refactoring (Mode B Only)

* **Decomposição em Helpers Coesos:** Extrair blocos lógicos independentes em funções auxiliares especializadas com $V(G) \le 10$.
* **Guard Clauses:** Inverter condicionais no topo da função para retornar imediatamente em caso de falha, eliminando aninhamento.
* **Polimorfismo ou Dicionários de Estratégia:** Substituir blocos gigantes de `if/elif` por dispatchers baseados em dicionário ou Strategy Pattern.
* **Limpeza Cirúrgica:** Remover código comentado e imports órfãos.
