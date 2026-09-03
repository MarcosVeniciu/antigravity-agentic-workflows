---
title: "TDD Implementation Agent"
description: "Executes Phase 2 (Chat 2) TDD cycle: batch planning, AAA unit tests (Red), minimal SOLID code (Green), DoD timeline logging, and micro-checkpoints."
---

# Agent: Iterative TDD Development (`/implement`)

You orchestrate **Phase 2 (Chat 2)** of the feature development lifecycle.

---

## 🚀 Execution Pipeline in 3 Steps

### Step 1: Context Batch Planning
- Read the BDD behavioral specifications (`01-concepcao/bdd-[slug].md`) and SDD blueprint (`01-concepcao/sdd-[slug].md`).
- Decompose requirements into **Dependent Context Batches**.
- 💡 **Recommended Skill:** `skills/tdd-plan`
- Generate `implementation_plan.md` and `task_list.md` artifacts (`RequestFeedback: true`).
- **Validation Gate:** Advance to Step 2 only after the user approves the plan (by clicking **Proceed** or giving explicit confirmation).

---

### Step 2: TDD Loop per Context Batch
For each batch defined in `task_list.md`, strictly execute the following TDD cycle:

1. **Write AAA Unit Tests (Red Phase):**
   * Generate tests with isolated mocks covering both Happy Path and Edge Cases.
   * 💡 **Recommended Skill:** `skills/tdd-tests`
2. **Write Minimal Production Code (Green Phase):**
   * Write strictly sufficient code to make the tests pass ("Make it Work").
   * Apply strict type hints and document architectural pivots if necessary.
   * 💡 **Recommended Skill:** `skills/tdd-code`
3. **Execute Test Suite:**
   * Run the tests in the terminal.
   * If any test fails, isolate the root cause and apply a surgical hotfix without altering test assertions.
   * 💡 **Recommended Skill:** `skills/test-fix`
4. **Batch Governance (DoD & Checkpoint):**
   * Update `task_list.md` marking the current batch as completed (`[x]`).
   * Append a timeline entry to `01-concepcao/dod-[slug].md` via `skills/dod`.
   * Record a local micro-checkpoint via `skills/git` (Mode 2):
     ```bash
     git add .
     git commit -m "checkpoint(implement): batch [N] - [description]"
     ```

---

### Step 3: Phase 2 Conclusion & Handover
- Once 100% of batches are completed and all unit tests are passing green:
  - Record the final Phase 2 checkpoint via `skills/git` (Mode 2).
  - Issue the phase transition handover recommendation:
    > **[NEXT STEP]** ➡️ *"💻 Phase 2 (TDD) completed with 100% unit tests passing green! Open a **NEW CHAT (Chat 3)** and run `/refactor` to consolidate code design with Clean Code and SOLID principles."*