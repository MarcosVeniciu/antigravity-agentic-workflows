# Execution Manual: Git Flow & Local Version Control (`skills/git`)

This document establishes operational procedures, command patterns, and strict constraints for all version control actions throughout the Antigravity lifecycle.

---

## Operational Modes

### Mode 1: Branch Validation & Git Flow Strategy
Used in **Phase 1 (`/plan`)** or **Phase 0 (`/decompose`)** to ensure no development happens directly on protected branches.

1. **Automated Validation:**
   ```bash
   bash skills/git/scripts/validate_branch.sh
   ```
2. **Lock Rule (Phase Gate):** If the active branch is `main`, `master`, or `develop`, committing is **strictly prohibited**.
3. **Working Branch Creation:**
   ```bash
   git checkout -b feature/{{FEATURE_SLUG}}
   ```
   *(For bug fixes, use `bugfix/{{SLUG}}` or `hotfix/{{SLUG}}`)*.

---

### Mode 2: Local Micro-Checkpoints (During Execution)
Used continuously during **Phase 2 (`/implement`)**, **Phase 3 (`/refactor`)**, and **Phase 4 (`/review`)** to safeguard progress against breakage and context window corruption.

* **Execution Trigger:** Fire upon reaching any functional milestone (e.g., green batch tests, audit domain fixed, component refactored).
* **Standardized Command:**
  ```bash
  git add .
  git commit -m "checkpoint({{PHASE}}): {{SHORT_DESCRIPTION}}"
  ```

---

### Mode 3: Phase Closure & Squash (Phase Handover)
Executed **strictly at the end of each phase**, when all criteria and DoD items for that phase are fulfilled.

1. **Capture Base Commit:** Identify the commit hash prior to phase start (`git log --oneline`).
2. **Execute Soft Reset (Squash):**
   ```bash
   git reset --soft <PHASE_START_HASH>
   ```
   *(This unstages intermediate micro-checkpoints while keeping all changes staged in the index).*
3. **Structured Semantic Commit:** Use the format from `resources/template_phase_commit.md`:
   ```bash
   git commit -m "feat(conception): BDD and SDD specifications for {{FEATURE_SLUG}} (Phase 1)

   - Artifacts & Obsidian Notes: 01-concepcao/bdd-{{FEATURE_SLUG}}.md, 01-concepcao/sdd-{{FEATURE_SLUG}}.md, 01-concepcao/dod-{{FEATURE_SLUG}}.md
   - Test Status: N/A (Architecture Phase)
   - Main Changes:
     * Gherkin Happy and Unhappy Path scenario modeling
     * Typed Pydantic contracts and boundary mocks
     * Living DoD initialization with acceptance criteria
   - Recommended Next Phase: Start TDD cycle via /implement (Chat 2)"
   ```

---

### Mode 4: Local Rollback / Emergency Recovery (Double-Strike Rule)
Used when the agent encounters a critical failure, gets stuck in a loop, or fails twice consecutively during tests or refactoring.

* **Command to discard uncommitted changes and return to the last clean checkpoint:**
  ```bash
  git reset --hard HEAD
  ```

---

### Mode 5: Release Branch, Annotated Tags & Git Flow Finalization
Used strictly within the **`/release`** workflow to consolidate candidate features into production and development.

1. **Update and Create Release Branch from develop:**
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b release/v{{VERSION}}
   ```
2. **Merge Candidate Features (with 100% validated DoD):**
   ```bash
   git merge --no-ff feature/{{FEATURE_SLUG_1}}
   git merge --no-ff feature/{{FEATURE_SLUG_2}}
   ```
3. **Release Commit & Annotated Tag on main:**
   ```bash
   git commit -am "chore(release): prepare release v{{VERSION}}"
   git checkout main
   git merge --no-ff release/v{{VERSION}}
   git tag -a v{{VERSION}} -m "Release v{{VERSION}}"
   ```
4. **Propagate Back to develop & Clean Up Branches:**
   ```bash
   git checkout develop
   git merge --no-ff release/v{{VERSION}}
   git branch -d release/v{{VERSION}}
   git branch -d feature/{{FEATURE_SLUG_1}}
   git branch -d feature/{{FEATURE_SLUG_2}}
   ```

---

## Universal Rules and Strict Constraints

1. **UNAUTHORIZED PUSH PROHIBITED:** Running `git push` without explicit user instruction is strictly forbidden.
2. **DIRTY HANDOVERS PROHIBITED:** Never close a phase without squashing intermediate micro-checkpoints via Mode 3.
3. **CONVENTIONAL COMMITS MANDATORY:** Every consolidated commit must strictly follow conventional commit prefixes (`feat`, `fix`, `docs`, `refactor`, `test`, `audit`, `chore`).
4. **PROTECTED BRANCH LOCK:** Never develop features directly on `main` or `develop`.

---

## Self-Audit Checklist

- [ ] Active branch follows Git Flow naming (`feature/*`, `bugfix/*`, `release/*`)?
- [ ] Micro-checkpoints squashed via `git reset --soft` at phase conclusion?
- [ ] Closure commit message follows `template_phase_commit.md`?
- [ ] In Mode 5 (Release), annotated tag follows `vMAJOR.MINOR.PATCH`?
- [ ] In Mode 5 (Release), merged feature branches deleted following merge?
