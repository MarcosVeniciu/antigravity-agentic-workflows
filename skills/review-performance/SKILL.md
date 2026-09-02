---
name: "review-performance"
description: "Performance and efficiency review skill. Detects N+1 query patterns, memory leaks, unindexed database filters, unbuffered I/O, and quadratic algorithms on git diff."
---

# Skill: Review de Performance & Eficiência (`skills/review-performance`)

Audita cirurgicamente as alterações de código da branch sob a ótica de volumetria, uso eficiente de CPU/memória e prevenção de gargalos assintóticos.

## 🎯 Eixos de Análise (Diff-Based)
* **Padrão N+1 Queries:** Execução de consultas SQL ou chamadas de API em repetição dentro de loops `for`.
* **Gargalos Assintóticos:** Algoritmos de complexidade quadrática ($O(N^2)$) ou buscas lineares (`in list`) dentro de iterações.
* **Uso de Memória & Buffering:** Carregamento de datasets inteiros na memória ao invés de iteradores/geradores (`yield`).
* **Conexões & Recursos:** Falta de fechamento de conexões, cursores ou descritores de arquivos (Memory Leaks).

## 📋 Available Resources
* **Checklist:** `references/checklist_performance.md` from the `@review-performance` skill.
* **Template do Artefato:** `resources/template_performance.md` from the `@review-performance` skill.
