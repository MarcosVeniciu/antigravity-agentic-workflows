---
name: "release"
description: "Orchestrates publication of new versions, SemVer calculation, Changelog generation, and 100% DoD verification in Phase 5."
---

# Skill: Release Manager (`skills/release`)

This skill provides rules for orchestrating publication of new versions, SemVer calculation, release notes generation, and 100% DoD verification in Phase 5 (Chat 5). Always communicate in English.

## Execution Guidelines

1. **Pre-flight Check & DoD 100% Audit**: Identify active branch, recent commit history, and current project version. Read `01-concepcao/dod-[feature-slug].md` and verify that 100% of the Definition of Done items (BDD, NFR, refactoring, review, docs) are checked (`[x]`).
2. **Skill Activation**: Activate the `@release` skill (by reading its `SKILL.md` file using `view_file`) to inherit strict versioning constraints, SemVer calculation, and access to changelog templates (`references/semver_rules.md` and `resources/template_changelog.md`).
3. **Orchestration and Living DoD Completion**: Structure release notes and update `01-concepcao/dod-[feature-slug].md` checking off final release items.
4. **Delivery**: Present changes accompanied by an isolated `bash` block containing proposed Git commands (commit, tag, merge feature into `develop`). Upon completion, explicitly display the message:
   > **[NEXT STEP]** ➡️ *"🚀 Release notes generated, version tag created locally, and 100% Definition of Done (DoD) verified! Feature lifecycle successfully completed! Execute `git push --follow-tags` in your terminal to publish changes to remote repository."*