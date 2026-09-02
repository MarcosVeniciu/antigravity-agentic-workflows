# 🧹 Auditoria de Qualidade de Código & Complexidade

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Escopo Analisado:** Diff relativo a `develop` (`{{FILES_COUNT}}` arquivos)

---

## 📊 Relatório de Complexidade AST ($V(G) \le 10$)

```text
{{AST_COMPLEXITY_OUTPUT}}
```

---

## 🔍 Oportunidades Identificadas no Diff

| Arquivo / Linha | Elemento | Complexidade $V(G)$ | Técnica de Simplificação |
| :--- | :--- | :--- | :--- |
| `{{FILE}}:{{LINE}}` | `{{FUNCTION_NAME}}` | `{{VG}}` | Decomposição / Guard Clauses |

---

## 🛠️ Correções Aplicadas
- [x] Funções reduzidas para $V(G) \le 10$.
- [x] Nomenclaturas ambíguas refatoradas.

---

## 🚦 Validação & Testes
- [x] 100% dos testes unitários verdes após as correções.
- [x] Micro-checkpoint registrado via `skills/git` (Modo 2).
