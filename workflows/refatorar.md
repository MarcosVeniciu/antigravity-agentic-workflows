---
name: "refatorar"
description: "Phase 2 closure workflow. Orchestrates refactoring of functional code and consolidates Phase Handover."
---

# Workflow: Refactoring (Phase 2)

Strictly follow these sequential steps. Do not explain technical concepts.

**1. Phase Gate Validation**
- Run the project test suite via terminal.
- 🛑 Proceed only if 100% of tests pass. If they fail, abort and ask the user to fix the code.

**2. Artifact Planning**
- Update the interactive `task_list.md` artifact using `replace_file_content` tool to reflect pending refactoring tasks you identify.

**3. Technical Execution**
- Activate the `@refatorar` skill (by reading its `SKILL.md` file using `view_file`) to follow Clean Code and SOLID guidelines.
- Refactor code iteratively. After modifying each component, run tests to validate that behavior remains unchanged.


**4. Handover & Closure**
- Upon completion of refactoring, trigger the `@git` skill to perform consolidation commit (Mode 2 - Phase Squash).
- Conclude flow providing the exact transition command for user to proceed:
  > **[NEXT STEP]** ➡️ *"✨ Refactoring completed and tests 100% green. Close this ephemeral chat to clear context and start Phase 3 by sending the following command in a new conversation:*
  > *`Start Phase 3 Specialized Audits on the current branch (/review).`"*

## Execution Flow and Fault Tolerance

1. **Pre-flight & Base Point**: Before starting any code changes, invoke `@git` to ensure workspace is clean.
2. **Iterative Writing Cycle (TDD)**:
   * Write minimal code to make test pass.
   * Test suite returned 100% green? **Activate `@git` skill in Mode 1 (Micro-Checkpoint)** to create a safe restore point.
3. **Self-Correction and Rollback Mechanism**:
   * If code breaks during refactoring or implementation and you cannot fix the error after 2 consecutive attempts, **do not continue polluting context**.
   * **Invoke `@git` skill in Mode 3 (Rollback/Recovery)** running `git reset --hard HEAD` to clear scope and immediately return to last known stable checkpoint.
   * Restart logic from safe point using a different approach.