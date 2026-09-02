---
name: "git"
description: "Central local version control skill. Enforces Git Flow branches, manages micro-checkpoints, performs phase squashes, rolls back failures, and executes release tagging and merges."
---

# Skill: Git Flow & Local Versioning (`skills/git`)

Manages all local version control operations across the Antigravity lifecycle, ensuring branch compliance, fault tolerance via micro-checkpoints, semantic phase handovers, and safe Git Flow release closures.

## 🔄 Operating Modes (Progressive Disclosure)
Load detailed instructions on demand via `view_file` at `references/EXECUTION.md`:
* **Mode 1: Git Flow & Branch Strategy:** Branch validation (`scripts/validate_branch.sh`) and checkout.
* **Mode 2: Local Micro-Checkpoints:** Fast restore points during TDD and reviews.
* **Mode 3: Phase Closure & Squash:** Semantic consolidation for clean context handover.
* **Mode 4: Local Rollback / Emergency Recovery:** Immediate discard of corrupting loops (`git reset --hard HEAD`).
* **Mode 5: Release Branch, Tag & Git Flow Merge:** Creation of release branches, version tags, and final merges to `main` and `develop`.

## 📋 Available Resources
* **Phase Commit Template:** `resources/template_phase_commit.md` (for Mode 3).
* **Branch Validation Script:** `scripts/validate_branch.sh` (for Mode 1).