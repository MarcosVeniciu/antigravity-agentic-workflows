---
name: "refatorar"
description: "Structural refactoring, Clean Code, and SOLID technical skill in Phase 3. Focused on eliminating Code Smells (SRP, nesting, magic numbers) and optimizing legibility, requiring 100% green tests and DoD update."
---

# Skill: Clean Code & Structural Refactoring (`skills/refatorar`)

This skill governs business rules for restructuring and improving the internal design of functional code in Phase 3 (Chat 3). No modification should break tests or alter behavioral contracts. Always communicate with the user in English.

---

## 📖 Resources and Documentation on Demand

When the workflow requests or there is doubt about techniques, access the resources below via `view_file` (or generate the artifact using the template):

* **Detailed Refactoring Manual**: `references/EXECUTION.md` from the `@refatorar` skill
* **Refactoring Checklist Template**: `resources/refactor_checklist_template.md` from the `@refatorar` skill

---

## ⛔ Universal Protection Rules (Strict Constraints)

1. **Strict Behavior Preservation**: No refactoring may alter return values, thrown exceptions, or public contracts of the functionality.
2. **Zero Test Regression**: If a test fails after code editing, the refactoring is wrong. Revert the change immediately.
3. **No New Features**: Refactoring is cleaning existing code, not adding new business rules.
4. **Surgical Focus on Code Smells**:
   * Overly large methods/functions (> 20 lines) $\rightarrow$ *Extract Method / Function*.
   * Deep nesting (`if` inside `if`) $\rightarrow$ *Guard Clauses / Early Returns*.
   * Loose literals in code $\rightarrow$ *Named Constants*.
   * Multiple responsibilities in the same component $\rightarrow$ *Extract Class / Module (SRP)*.
5. **Living DoD Log Update**: Upon completion of refactoring, update `01-concepcao/dod-[feature-slug].md` checking off `- [x] Fase 3: Refatoração Final (/refatorar)`.

---

## ✅ Refactoring Evidence Matrix

Whenever completing the refactoring cycle in the Workflow, present a formatted summary of changes to the user:

| Refactored Element | Code Smell / SOLID Principle | Applied Technique |
| :--- | :--- | :--- |
| Example: `calculate()` | Deep nesting | Guard Clause (Early return) |
| Example: `process()`| Violated SRP (> 35 lines)| Extract Method (`_validate`) |