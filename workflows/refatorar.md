---
name: "refatorar"
description: "Phase 3 consolidation workflow. Orchestrates refactoring of completed functional code, updates DoD log, and prepares Phase 4 Handover."
---

# Workflow: Refactoring (Phase 3)

You orchestrate Phase 3 of the development flow (Consolidation Refactoring in Chat 3). Executed **once** after feature code implementation is 100% complete and tests are green. Strictly follow these sequential steps.

**1. Phase Gate Validation & Contract Loading**
- Retrieve active feature slug via `git branch --show-current`.
- Run the project test suite via terminal.
- 🛑 Proceed only if 100% of tests pass. If they fail, abort and instruct the user to resolve test failures first.
- Read `01-concepcao/dod-[feature-slug].md` to inspect existing implementation history.
- Identify origin/base branch (`develop` by default, or `main`). Run `git --no-pager diff <base-branch>...HEAD --name-only` to fetch the list of files modified in the feature branch.

**2. Artifact Planning**
- Update the interactive `task_list.md` artifact using `replace_file_content` tool to reflect pending refactoring tasks strictly scoped to the modified file list (eliminating Code Smells, applying SOLID, modularization).

**3. Technical Execution**
- Activate the `@refatorar` skill (by reading its `SKILL.md` file using `view_file`) to follow Clean Code and SOLID guidelines.
- Refactor code iteratively. After modifying each component, run tests to validate that external behavior remains unchanged.

**4. Handover & Living DoD Log Update**
- Upon completion of refactoring with 100% tests green, update `01-concepcao/dod-[feature-slug].md` checking off:
  - `- [x] Fase 3: Refatoração Final (/refatorar)`
- Trigger the `@git` skill to perform consolidation commit (Mode 2 - Phase Squash): `refactor([feature-slug]): consolidate clean code and SOLID architecture`.
- Conclude flow providing the exact transition command for user to proceed:
  > **[NEXT STEP]** ➡️ *"✨ Phase 3 Refactoring completed and tests 100% green! Close this chat and open a **NEW CHAT (Chat 4)** to start Phase 4 Specialized Audits by sending the command: `/review`."*

---

## Execution Flow and Fault Tolerance

1. **Pre-flight & Base Point**: Before starting any code changes, invoke `@git` to ensure workspace is clean.
2. **Iterative Refactoring Cycle**:
   * Apply SOLID / Clean Code adjustment.
   * Run test suite. Returned 100% green? Activate `@git` skill in Mode 1 (Micro-Checkpoint) to create a safe restore point.
3. **Self-Correction and Rollback Mechanism**:
   * If code breaks during refactoring and you cannot fix the error after 2 consecutive attempts, do not continue polluting context.
   * Invoke `@git` skill in Mode 3 (Rollback/Recovery) running `git reset --hard HEAD` to clear scope and immediately return to last known stable checkpoint.
   * Restart logic from safe point using a different approach.