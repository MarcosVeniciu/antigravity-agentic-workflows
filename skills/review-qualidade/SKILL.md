---
name: "review-qualidade"
description: "Code quality, complexity, and maintainability review skill. Runs ast_complexity.py to measure Cyclomatic Complexity V(G) <= 10, identifies nesting, naming clarity, and formatting on git diff."
---

# Skill: Review de Qualidade de Código & Complexidade (`skills/review-qualidade`)

Audita o diff sob a perspectiva de complexidade ciclomática estrita, manutenibilidade e legibilidade sintática.

## 🎯 Eixos de Análise (Diff-Based)
* **Complexidade Ciclomática $V(G)$:** Limite estrito de $V(G) \le 10$ por função/método. Avaliada via `scripts/ast_complexity.py`.
* **Heurísticas Assintóticas:** Detecção de laços aninhados ou buscas lineares dentro de loops.
* **Legibilidade e Padrões:** Clareza de nomenclatura de variáveis, ausência de dead code e conformidade com guias de estilo da linguagem.

## 📋 Available Resources
* **Scanner AST:** `scripts/ast_complexity.py` from the `@review-qualidade` skill.
* **Checklist:** `references/checklist_qualidade.md` from the `@review-qualidade` skill.
* **Template do Artefato:** `resources/template_qualidade.md` from the `@review-qualidade` skill.
