# ⚡ Performance & Efficiency Audit

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Scope Analyzed:** Git diff against `develop` (`{{FILES_COUNT}}` files)

---

## 🔍 Performance Bottlenecks Identified in Diff

| File / Line | Pattern Detected | Asymptotic Impact / I/O | Cause |
| :--- | :--- | :--- | :--- |
| `{{FILE}}:{{LINE}}` | N+1 Query / Linear Search | $O(N^2)$ or excessive I/O | Database call in loop |

---

## 🛠️ Optimizations Applied
- [x] Batch queries implemented (`WHERE id IN (...)`).
- [x] Converted lists to sets/dictionaries for $O(1)$ lookups.
- [x] Streamed responses via generators to conserve memory.

---

## 🚦 Validation & Tests
- [x] 100% unit tests passing green following optimizations.
- [x] Micro-checkpoint recorded via `skills/git` (Mode 2).
