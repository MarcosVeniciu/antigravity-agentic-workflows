# ⚡ Auditoria de Performance & Eficiência

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Escopo Analisado:** Diff relativo a `develop` (`{{FILES_COUNT}}` arquivos)

---

## 🔍 Gargalos de Performance Identificados no Diff

| Arquivo / Linha | Padrão Detectado | Impacto Assintótico / I/O | Causa |
| :--- | :--- | :--- | :--- |
| `{{FILE}}:{{LINE}}` | N+1 Query / Busca Linear | $O(N^2)$ ou excesso de I/O | Chamada de banco em loop |

---

## 🛠️ Otimizações Aplicadas
- [x] Agrupamento de consultas em batch (`WHERE id IN (...)`).
- [x] Conversão de listas em sets/dicionários para buscas $O(1)$.
- [x] Uso de geradores para economia de memória.

---

## 🚦 Validação & Testes
- [x] 100% dos testes unitários verdes após as correções.
- [x] Micro-checkpoint registrado via `skills/git` (Modo 2).
