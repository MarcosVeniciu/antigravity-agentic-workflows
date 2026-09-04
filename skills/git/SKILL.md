---
name: "git"
description: "Local version control: enforces Git Flow branches, micro-checkpoints, phase squashes, failure rollbacks, and release tagging/merging."
---

# Skill: Git Flow & Local Version Control (`skills/git`)

Manages all local version control operations throughout the Antigravity lifecycle, ensuring Git Flow compliance, fault tolerance via micro-checkpoints, semantic phase handovers, and safe release publications.

## 🔄 Operational Modes (Progressive Disclosure)
Load detailed operational procedures on demand via `view_file` at [`references/EXECUTION.md`](./references/EXECUTION.md):
* **Mode 1: Branch Validation & Git Flow Strategy:** Branch validation ([`scripts/validate_branch.sh`](./scripts/validate_branch.sh)) and working branch checkouts.
* **Mode 2: Local Micro-Checkpoints:** Fast restore points during TDD, refactoring, and audits.
* **Mode 3: Phase Closure & Squash:** Semantic consolidation for clean context switches between chats.
* **Mode 4: Local Rollback / Emergency Recovery:** Immediate discard of failure loops (`git reset --hard HEAD`).
* **Mode 5: Release Branch, Annotated Tags & Git Flow Finalization:** Creating release branches, annotated version tags, and merges into `main` and `develop`.

## 📋 Available Resources
* **Phase Commit Template:** [`resources/template_phase_commit.md`](./resources/template_phase_commit.md) (for Mode 3).
* **Branch Validation Script:** [`scripts/validate_branch.sh`](./scripts/validate_branch.sh) (for Mode 1).