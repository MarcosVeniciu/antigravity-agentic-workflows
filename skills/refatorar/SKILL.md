---
name: "refatorar"
description: "Structural refactoring and Clean Code skill. Applies SOLID principles, eliminates Code Smells, and optimizes readability without altering behavior."
---

# Skill: Clean Code & Structural Refactoring (`skills/refatorar`)

Manages the final step of the TDD cycle (Refactor Phase), enhancing internal design, reducing cyclomatic complexity, and applying SOLID principles to fully functional, 100% green code. Always communicate with the user in Portuguese.

---

## 🛠️ Execution Guide

Consult detailed operational instructions in the reference file:
* [Clean Code Specialist Execution Guide](references/EXECUTION.md)

---

## 📁 Resources & Templates

* **Refactoring Checklist Template (`task.md`)**: [refactor_checklist_template.md](resources/refactor_checklist_template.md)

---

## ⛔ Universal Rules & Constraints

1. **Preserve Behavior**: No refactoring may alter the output or contracts of previously tested classes/functions.
2. **Do Not Break Tests**: If any test fails during refactoring, the change must be reverted immediately.
3. **Eliminate Code Smells**: Focus on long functions (>20 lines), deep nesting, magic numbers, and duplication.
4. **Micro-Checkpoints & Squash**: Save a micro-checkpoint using the `git` skill (Mode 1) after refactoring each component. Upon completing all refactoring, trigger the `git` skill (Mode 2 - Phase Squash) to consolidate Phase 2.

---

## ✅ Validation Checklist

- [ ] All tests remain 100% green passing after changes?
- [ ] Were reasons for refactoring explained (Which smell/SOLID principle was addressed)?
- [ ] Were Guard Clauses applied to eliminate nested `if/else`?
- [ ] Were micro-checkpoints (Mode 1) and final phase squash generated via the `git` skill (Mode 2)?
- [ ] Was opening a new ephemeral chat for Phase 3 (`/review`) suggested?

