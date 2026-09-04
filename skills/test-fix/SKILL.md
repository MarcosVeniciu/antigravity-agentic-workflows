---
name: "test-fix"
description: "Debugs test failures from terminal tracebacks, isolates root causes, and applies minimal surgical fixes to production code."
---

# Skill: Reactive Debugging & Test Fixing (`skills/test-fix`)

Guides the diagnosis and surgical resolution of test failures during the TDD loop (Phase 2) and refactoring (Phase 3), analyzing terminal tracebacks and applying minimal interventions to production code.

---

## 📁 Supporting Resources

* 📖 **Debugging Manual**: [`references/EXECUTION.md`](./references/EXECUTION.md)
* 📋 **Diagnostic Template (`task.md`)**: [`resources/error_checklist_template.md`](./resources/error_checklist_template.md)

---

## ⛔ Strict Rules & Constraints

1. **Minimal & Surgical Fix:** Edit strictly the production code lines responsible for the failure. Refactoring code that did not fail is prohibited.
2. **Preserve Test Specification:** Never alter test assertions or expectations to force a pass, unless there is an obvious syntactic typo in the test itself.
3. **Root Cause in 1 Sentence:** Isolate the root cause of the error in exactly one concise sentence before applying any fix.
4. **Immediate Micro-Checkpoint:** Once the test passes green, invoke `@git` (Mode 2) to commit the progress.

---

## ✅ Validation Checklist

- [ ] Root cause identified and synthesized in 1 sentence.
- [ ] Surgical fix applied exclusively to production code.
- [ ] Test assertions preserved intact.
- [ ] Micro-checkpoint committed via `@git` (Mode 2).