# 🏛️ Architecture & Coupling Audit

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Scope Analyzed:** Git diff against `develop` (`{{FILES_COUNT}}` files)

---

## 🔍 Evidence Identified in Diff

| File / Line | Violated Pattern / Principle | Cause / Risk |
| :--- | :--- | :--- |
| `{{FILE}}:{{LINE}}` | Dependency Inversion / Coupling | Direct instantiation of external dependency |

---

## 🛠️ Surgical Fixes Applied
- [x] Dependency injection applied via constructor.
- [x] Direct infrastructure coupling removed from domain.

---

## 🚦 Validation & Tests
- [x] 100% unit tests passing green following surgical fixes.
- [x] Micro-checkpoint recorded via `skills/git` (Mode 2).
