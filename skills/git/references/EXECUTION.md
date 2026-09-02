# Execution Manual: Git Flow & Local Versioning

This document contains operational procedures and strict constraints for all Git operations in Antigravity.

---

## 🔄 Operating Modes

### Mode 1: Git Flow & Branch Strategy
Used in Phase 1 (Planning) or Phase 0 (Epics) to ensure work never occurs directly on base branches.

1. **Validation**: Run `bash scripts/validate_branch.sh` or check `git branch --show-current`.
2. **Phase Gate Rule**: If current branch is `main`, `master`, or `develop`, direct commits are **strictly forbidden**.
3. **Branch Creation**:
```bash
git checkout -b feature/{{FEATURE_SLUG}}
```
*(For hotfixes, use `bugfix/{{SLUG}}` or `hotfix/{{SLUG}}`)*.

---

### Mode 2: Local Micro-Checkpoints (During Execution)
Used continuously during Phase 2 (TDD), Phase 3 (Refactor), and Phase 4 (Review) to protect work against failures or context corruption.

* **Frequency**: Execute at every functional milestone reached (e.g., test batch passed, component refactored, audit domain corrected).
* **Command**:
```bash
git add .
git commit -m "checkpoint({{PHASE_NAME}}): {{SHORT_DESCRIPTION}}"
```

---

### Mode 3: Phase Closure & Squash (Phase Handover)
Executed strictly at the end of a phase when all tasks and DoD items for that phase are verified.

1. **Initial Commit Capture**: Identify the commit hash prior to phase checkpoints.
2. **Soft Reset Execution**:
```bash
git reset --soft <START_COMMIT>
```
3. **Structured Semantic Commit**: Use `resources/template_phase_commit.md` to create **a single final representative commit**.
* Example:
```bash
git commit -m "feat(concepcao): BDD and SDD specifications completed for {{FEATURE_SLUG}}"
```

---

### Mode 4: Local Rollback / Emergency Recovery
Used when the agent makes a critical mistake, fails tests twice consecutively (Double-Strike Rule), or enters a refactoring loop.

* **Command to discard uncommitted changes and revert to last checkpoint:**
```bash
git reset --hard HEAD
```

---

### Mode 5: Release Branch, Tag & Git Flow Merge
Used strictly in the `/release` workflow to integrate completed features into production and develop.

1. **Create Release Branch from develop**:
```bash
git checkout develop
git pull origin develop
git checkout -b release/v{{VERSION}}
```
2. **Merge Candidate Features** (only those with 100% DoD verified):
```bash
git merge --no-ff feature/{{FEATURE_SLUG}}
```
3. **Finalize Release Commit & Annotated Tag**:
```bash
git commit -am "chore(release): prepare release v{{VERSION}}"
git checkout main
git merge --no-ff release/v{{VERSION}}
git tag -a v{{VERSION}} -m "Release v{{VERSION}}"
```
4. **Propagate Back to Develop & Cleanup**:
```bash
git checkout develop
git merge --no-ff release/v{{VERSION}}
git branch -d release/v{{VERSION}}
```

---

## ⛔ Universal Rules and Constraints

1. **NO UNAPPROVED PUSH**: Executing `git push` without explicit user request or IDE confirmation is prohibited.
2. **NO DIRTY HANDOVER**: Never complete a phase without squashing intermediate micro-checkpoints (Mode 3).
3. **SEMANTIC COMMITS ONLY**: Follow Conventional Commits (`feat`, `fix`, `docs`, `refactor`, `test`, `chore`).
4. **STRICT BASE BRANCH LOCK**: Never develop features directly on `main` or `develop`.

---

## ✅ Validation Checklist (Self-Audit)

- [ ] Is active branch compliant with Git Flow (`feature/*`, `bugfix/*`, `release/*`)?
- [ ] Were intermediate micro-checkpoints squashed prior to phase handover?
- [ ] Does the commit message follow Conventional Commits?
- [ ] In release mode, was the annotated tag formatted with `vMAJOR.MINOR.PATCH`?
