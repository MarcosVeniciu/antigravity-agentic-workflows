---
name: "testar"
description: "Reactive debugging and test error fix skill. Analyzes terminal logs and applies minimal surgical adjustments to production code."
---

# Skill: Reactive Debugging & Test Fixing (`skills/testar`)

Manages the reactive debugging phase (Reactive Debugger) of the TDD cycle, isolating root causes from terminal tracebacks and surgically fixing production code. Always communicate with the user in Portuguese.

---

## 🛠️ Execution Guide

Consult detailed operational instructions in the reference file:
* [Reactive Debugger Execution Guide](references/EXECUTION.md)

---

## 📁 Resources & Templates

* **Error Checklist Template (`task.md`)**: [error_checklist_template.md](resources/error_checklist_template.md)

---

## ⛔ Universal Rules & Constraints

1. **Minimal Production Fix**: Strictly adjust the code causing the error. Zero additional refactorings or feature additions.
2. **Preserve Test Intent**: Do not alter test assertions to force green passing, except in cases of obvious typos/syntax errors in the test itself.
3. **Surgical Summary & Checkpoint**: Explain root cause in a single concise sentence before presenting code and saving micro-checkpoint by invoking the `git` skill (Mode 1).

---

## ✅ Validation Checklist

- [ ] Was the root cause identified and classified correctly?
- [ ] Was production code fixed with minimal possible impact?
- [ ] Were tests preserved without unjustified changes or weakening?
- [ ] Was fix micro-checkpoint recorded by invoking the `git` skill (Mode 1)?
- [ ] Was re-test command provided in an isolated `bash` block?

