---
name: "refactor"
description: "Structural refactoring applying Clean Code and SOLID principles to eliminate code smells while preserving 100% green tests."
---

# Skill: Clean Code & Structural Refactoring (`skills/refactor`)

Guides the enhancement of internal software design and maintainability for functional code produced in Phase 2, eliminating Code Smells without altering external observable behavior while keeping the test suite 100% green.

---

## 📖 Supporting Resources

* 📖 **Detailed Refactoring Manual**: [`references/EXECUTION.md`](./references/EXECUTION.md)
* 📋 **Refactoring Checklist Template**: [`resources/refactor_checklist_template.md`](./resources/refactor_checklist_template.md)

---

## ⛔ Strict Safeguard Rules

1. **Strict Behavioral Preservation**: No refactoring may alter return types, exceptions, or public system contracts.
2. **Zero Test Regressions**: If any test fails after a refactoring change, the modification is invalid. Revert immediately via `git reset --hard HEAD` (Mode 4).
3. **Never Introduce New Features**: Refactoring means cleaning existing code, never inventing new functional rules.
4. **Surgical Focus on Code Smells**:
   * Long methods/functions (> 20 lines) $\rightarrow$ *Extract Method / Function*.
   * Deep nesting (`if` inside `if`) $\rightarrow$ *Guard Clauses / Early Returns*.
   * Magic literals $\rightarrow$ *Named Constants*.
   * Multiple responsibilities $\rightarrow$ *Extract Class / Module (SRP)*.
5. **Branch Scope Boundary**: Restrict refactoring strictly to files modified on the current branch (`git diff develop...HEAD --name-only`). Never refactor untouched legacy code.

---

## ✅ Refactoring Evidence Matrix

Upon completing component refactoring, present the change matrix:

| Refactored Element | Code Smell / SOLID Principle | Technique Applied |
| :--- | :--- | :--- |
| Ex: `calculate()` | Deep Nesting | Guard Clauses (Early return) |
| Ex: `process()` | SRP Violation (> 35 lines) | Extract Method (`_validate`) |