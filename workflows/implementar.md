---
title: "Unified Implementation Engineer"
description: "Executes Phase 2 of development unifying batch planning, TDD (Red + Green), dynamic DoD log update, and artifact synchronization."
---

# Workflow: Unified Implementation Engineer (`/implementar`)

This workflow orchestrates the technical implementation of features in Phase 2 (Chat 2), consuming Phase 1 contracts (BDD, SDD, and DoD), organizing tasks by Context Batches, executing the TDD cycle (Red ➔ Green), and appending sub-change logs to `01-concepcao/dod-[feature-slug].md`.

---

## 🎯 Workflow Steps

### Step 1: Bootstrapping & Contract Reading (Phase 2 Chat)
1. Invoke the `@git` skill (by reading its `SKILL.md` file using `view_file`) to check repository status and get the active branch via `git branch --show-current`.
2. Extract `[feature-slug]` from the branch name.
3. Query the Obsidian Vault MCP and load Phase 1 contracts:
   * **BDD Contract:** `01-concepcao/bdd-[feature-slug].md`.
   * **SDD Contract:** `01-concepcao/sdd-[feature-slug].md`.
   * **Living DoD Log:** `01-concepcao/dod-[feature-slug].md`.
4. Consult global conventions in `00-core-rules/conventions.md`.

---

### Step 2: Architectural Planning & Grouping by Context
1. Activate guidelines from the `@implementar-plan` skill (by reading its `SKILL.md` file using `view_file`).
2. Emit the interactive `implementation_plan.md` artifact detailing technical strategy.
3. Emit the interactive tracking `task_list.md` artifact using template `resources/task_template.md` from the `@implementar-plan` skill.
   * **Key Rule:** Group tasks by **Dependent Context Batches** (e.g., DTO + Repository + Service) instead of isolated files.
   * Set the final phase of the checklist as `Phase N: Execute Test Suite and Dynamic DoD Log Update`.
4. Configure artifact metadata with `RequestFeedback: true` and wait for developer confirmation before modifying code.

---

### Step 3: Atomic Execution by Context Batch (Red ➔ Green in the Same Call) & Living DoD Log
1. Activate guidelines from the `@implementar-code` skill (by reading its `SKILL.md` file using `view_file`).
2. For each Context Batch Phase defined in `task_list.md`, execute **in a single API response call**:
   * **Write Batch Tests (Red):** Create/update the test suite using AAA pattern (`tests/`) for all batch entities.
   * **Write Batch Code (Green):** Implement minimum sufficient production code in `src/` with Type Hints, SOLID, and traceable docstrings.
   * **Update Checklist:** Immediately update the `task_list.md` artifact marking that batch's items as completed (`[x]`).
   * **Append Entry to `dod-[feature-slug].md`:** Add a 1-2 sentence bullet point under `## 2. Linha do Tempo de Desenvolvimento` documenting the implemented sub-change and date.

---

### Step 4: Final Phase - Full Suite Validation & Fault Tolerance
1. Upon reaching `Phase N` of `task_list.md`, provide the developer with the command to execute the complete test suite (e.g., `pytest -v -s tests/` or `npm test`).
2. **Self-Correction and Rollback Mechanism (Triple-Strike Rule):**
   * If tests fail, attempt to fix production code (maximum of 3 consecutive attempts in the same session).
   * If the error persists after 3 attempts, **halt execution**, execute `git reset --hard HEAD` (Mode 3 of `@git` skill) to restore stable state, and instruct the user to open a new clean chat invoking `/testar` or `/debug`.

---

### Step 5: Finalization Checkpoint & Handover
1. If all tests pass (100% green):
   * Invoke `@git` skill in **Mode 1 (Micro-Checkpoint)** recording commit: `feat([feature-slug]): full implementation of test suite and code`.
   * Mark `Phase N` as completed in `task_list.md`.
2. Display official chat closure and phase transition instruction:

> **[NEXT STEP]** ➡️ *"⚙️ Phase 2 Implementation iteration completed successfully with test suite 100% green and execution log appended to `dod-[feature-slug].md`! If all feature changes are complete, open a **NEW CHAT (Chat 3)** for Phase 3 Structural Refactoring by executing `/refatorar`. If further implementation changes are needed, execute `/implementar` again in a new session."*