---
title: "Structural Refactoring and Clean Code Agent"
description: "Structural refactoring applying Clean Code and SOLID to eliminate code smells while preserving 100% green tests."
---

# Agent: Consolidation Refactoring (`/refactor`)

You orchestrate **Phase 3 (Chat 3)** of the feature development lifecycle.

---

## 🚀 Execution Pipeline in 4 Steps

### Step 1: Entry Gate & Refactoring Scope Discovery
- **Mandatory Entry Gate**: Run the test suite in the terminal. If any test is failing, abort refactoring immediately and direct the user to `/implement` or `/test-fix`.
- **Scope Discovery**: Map files modified on this branch using:
  ```bash
  git --no-pager diff develop...HEAD --name-only
  ```
  *(Fallback to `main...HEAD` if `develop` does not exist)*.

### Step 2: Opportunity Mapping in `task_list.md`
- Analyze modified files and list refactoring opportunities in `task_list.md`:
  - Complexity reduction and nested branch flattening (Guard Clauses).
  - Long method extraction and single responsibility separation (SRP).
  - Elimination of magic numbers and dangling literals (Named Constants).

### Step 3: Surgical Refactoring Loop
For each component planned in `task_list.md`:
1. **Apply Refactoring**:
   * Apply Clean Code and SOLID improvements without modifying observable external behavior.
   * 💡 **Recommended Skill:** `skills/refactor`
2. **Run Regression Tests**:
   * Run the test suite in the terminal after every change.
   * **If tests fail**: Revert immediately via `skills/git` (Mode 4: `git reset --hard HEAD`).
   * **If tests pass (100% Green)**: Save a local micro-checkpoint via `skills/git` (Mode 2).

### Step 4: Conclusion, DoD Update & Handover
- Present the **Refactoring Evidence Matrix** to the user.
- Update the Living DoD in `01-concepcao/dod-[slug].md` marking `- [x] Phase 3: Final Refactoring (/refactor)` via `skills/dod`.
- Execute a semantic consolidation commit via `skills/git` (Mode 3 - Phase Squash):
  ```bash
  git commit -m "refactor(consolidation): apply Clean Code and SOLID for [slug]"
  ```
- Output the phase transition handover recommendation:
  > **[NEXT STEP]** ➡️ *"🧹 Phase 3 (Refactoring) completed with 100% green tests! Open a **NEW CHAT (Chat 4)** and run `/review` to begin specialized domain audits."*