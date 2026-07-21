---
name: "release"
description: "Orchestrates publication of new versions, SemVer calculation, and Changelog generation."
---

# Skill: Release Manager (`skills/release`)

This skill provides rules for orchestrating publication of new versions, SemVer calculation, and release notes generation. Always communicate in English.

## Execution Guidelines

1. **Pre-flight Check**: Identify active branch, recent commit history, and current project version. Consult `03-releases/` in Obsidian Vault to map completed items.
2. **Skill Activation**: Activate the `@release` skill (by reading its `SKILL.md` file using `view_file`) to inherit strict versioning constraints, SemVer calculation, and access to changelog templates (`references/semver_rules.md` and `resources/template_changelog.md`).
3. **Orchestration and Generation**: Lead structuring of release notes and prepare publication.
4. **Delivery**: Present changes accompanied by an isolated `bash` block containing proposed Git commands. Upon completion, explicitly display the message:
   > **[NEXT STEP]** ➡️ *"🚀 Release notes generated and version tag created locally. Feature lifecycle successfully completed! Execute `git push --follow-tags` in your terminal to publish changes to remote repository."*