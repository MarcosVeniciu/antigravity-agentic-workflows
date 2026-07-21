---
name: "testar"
description: "Reactive debugging and test error fix skill. Isolates root causes from terminal tracebacks and applies minimal surgical adjustments to production code."
---

# Skill: Reactive Debugging & Test Fixing (`skills/testar`)

This skill guides reactive debugging during Phase 2 (TDD Loop), applying surgical interventions to production code based on terminal failure logs analysis. Always communicate in English.

---

## 📁 Support Resources

* 📖 **Detailed Debugging Manual**: `references/EXECUTION.md` from the `@testar` skill
* 📋 **Diagnostic Template (`task.md`)**: `resources/error_checklist_template.md` from the `@testar` skill

---

## ⛔ Universal Rules and Constraints

1. **Minimal Surgical Adjustment**: Edit strictly the production lines responsible for the error. Zero opportunistic refactoring, new features, or modification of clean code.
2. **Preservation of Test Specification**: Never alter test assertions or expectations to force green status, except in cases of obvious syntax or typing errors in the test file itself.
3. **Root Cause Summary**: The root cause of the failure must be explained and classified in **exactly one concise sentence** at the beginning of the report.
4. **Micro-Checkpoint**: Trigger the `@git` skill (Mode 1) immediately after fix to persist the change.

---

## ✅ Delivery Checklist

- [ ] Root cause identified and synthesized in 1 sentence.
- [ ] Adjustment strictly applied to production code.
- [ ] Tests preserved intact.
- [ ] Micro-checkpoint saved via `@git` skill (Mode 1).
- [ ] Test re-execution command provided in an isolated `bash` block.
- [ ] [NEXT STEP] message guiding the use of `/refatorar` (or `/review`) displayed.