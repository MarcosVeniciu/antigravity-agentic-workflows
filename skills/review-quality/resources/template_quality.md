# 🧹 Code Quality & Complexity Audit

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Scope Analyzed:** Git diff against `develop` (`{{FILES_COUNT}}` files)

---

## 📊 AST Complexity Report ($V(G) \le 10$)

```text
{{AST_COMPLEXITY_OUTPUT}}
```

---

## 🔍 Opportunities Identified in Diff

| File / Line | Element | Complexity $V(G)$ | Simplification Technique |
| :--- | :--- | :--- | :--- |
| `{{FILE}}:{{LINE}}` | `{{FUNCTION_NAME}}` | `{{VG}}` | Decomposition / Guard Clauses |

---

## 🛠️ Mitigations Applied
- [x] Functions reduced to $V(G) \le 10$.
- [x] Ambiguous naming and dead code cleaned up.

---

## 🚦 Validation & Tests
- [x] 100% unit tests passing green following refactoring.
- [x] Micro-checkpoint recorded via `skills/git` (Mode 2).
