---
name: "git"
description: "Local version control utility skill. Manages Micro-Checkpoints against code corruption and executes Phase Closure Squash (Phase Handover) into clean semantic commits."
---

# Skill: Local Git & Micro-Checkpoints (`skills/git`)

Manages local versioning of the project during phase lifecycles, providing **fast restore points (Micro-Checkpoints)** and **semantic commit consolidation (Phase Squash)** for clean context handover between chats. Always communicate with the user in Portuguese.

---

## 🔄 Modes of Operation

### Mode 1: Local Micro-Checkpoint (During Execution)
Used continuously during phase execution to protect work against failures or code corruption.

* **Frequency**: Execute at every functional milestone reached (e.g. test suite passing, class implemented, method refactored).
* **Command**:
  ```bash
  git add .
  git commit -m "checkpoint({{PHASE_NAME}}): {{SHORT_DESCRIPTION}}"
  ```

---

### Mode 2: Phase Closure & Squash (Phase Handover)
Executed **strictly at the end of the phase**, when all tasks and verifications of the phase have been completed successfully.

1. **Initial Commit Capture**:
   * The agent identifies the commit hash prior to the phase checkpoints (or uses the tag from the previous phase).
2. **Soft Reset Execution**:
   * Executes `git reset --soft <START_COMMIT>` to undo the stack of micro-checkpoints while keeping all changes in staging.
3. **Structured Semantic Commit**:
   * Uses the template in [template_phase_commit.md](resources/template_phase_commit.md) to generate **A SINGLE final commit** representative of the phase.
   * Example:
     ```bash
     git commit -m "feat(concepcao): BDD and SDD specifications completed for oauth2

     - Artifacts saved in Obsidian: 01-concepcao/bdd-oauth2.md, 01-concepcao/sdd-oauth2.md
     - Test suite: N/A (Phase 1)
     - Recommended next phase: Start TDD Implementation Chat (/testes)"
     ```

---

## ⛔ Universal Rules & Constraints

1. **GIT PUSH PROHIBITED**: Running `git push` or pushing changes to remote repositories is strictly forbidden. Remote synchronization is exclusively the responsibility of the human user.
2. **Clean Phase Commit**: Never conclude a phase without performing a Squash on intermediate micro-checkpoints.
3. **Semantic Naming**: Adhere to Conventional Commits standards (`feat`, `fix`, `docs`, `refactor`, `test`, `chore`).

---

## ✅ Validation Checklist

- [ ] Intermediate micro-checkpoints were consolidated via `git reset --soft`?
- [ ] Final closure commit uses the format from `template_phase_commit.md`?
- [ ] Commit lists generated/modified artifacts and recommended next agent?
- [ ] `git push` command was NOT executed?

