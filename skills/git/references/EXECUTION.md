# Execution Manual: Git & Micro-Checkpoints

This document contains operating modes and absolute constraints for the local versioning skill.

## 🔄 Operating Modes

### Mode 1: Local Micro-Checkpoint (During Execution)
Used continuously during phase execution to protect work against failures or code corruption.

* **Frequency**: Execute at every functional milestone reached (e.g., batch of context completed, individual test passed/resolved, class implemented, refactoring completed).
* **Command**:
```bash
git add .
git commit -m "checkpoint({{PHASE_NAME}}): {{SHORT_DESCRIPTION}}"
```

### Mode 2: Phase Closure & Squash (Phase Handover)

Executed **strictly at the end of the phase**, when all tasks and verifications are successfully completed.

1. **Initial Commit Capture**: The agent identifies the commit hash prior to phase checkpoints.
2. **Soft Reset Execution**: Runs `git reset --soft <START_COMMIT>` to undo the stack of micro-checkpoints while keeping changes in staging.
3. **Structured Semantic Commit**: Uses the template in `resources/template_phase_commit.md` to generate **A SINGLE final representative commit**.
* Example:
```bash
git commit -m "feat(concepcao): BDD and SDD specifications completed for oauth2

- Saved Artifacts: 01-concepcao/bdd-oauth2.md, 01-concepcao/sdd-oauth2.md
- Tests: N/A
- Next Phase: Start TDD Chat (/testes)"
```

### Mode 3: Local Rollback/Recovery (Emergency Revert)
Used when the agent makes a critical mistake, corrupts files, or enters a refactoring loop that breaks the code.

* **Command to discard current changes and return to last checkpoint:**
```bash
git reset --hard HEAD
```

## ⛔ Universal Rules and Constraints

1. **GIT PUSH FORBIDDEN**: Executing `git push` or sending changes to remote repositories is strictly forbidden. Remote sync is the user's responsibility.
2. **Clean Phase Commit**: Never complete a phase without performing Squash on intermediate micro-checkpoints.
3. **Semantic Naming**: Follow Conventional Commits pattern (`feat`, `fix`, `docs`, `refactor`, `test`, `chore`).

## ✅ Validation Checklist (Self-Audit)

Before completing the use of this skill, ensure that:

* [ ] Intermediate micro-checkpoints were consolidated via `git reset --soft`.
* [ ] Final commit uses `template_phase_commit.md` format.
* [ ] The `git push` command was NOT executed.
