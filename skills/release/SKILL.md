---
name: "release"
description: "Use during Phase 6 (/release) for SemVer calculation and cumulative Changelog generation. Analyzes merged feature commits, bumps version numbers (Major/Minor/Patch), and formats CHANGELOG.md."
---

# Skill: Release Manager & SemVer (`skills/release`)

Calculates new system versions in accordance with strict SemVer 2.0.0 guidelines and consolidates release history in `CHANGELOG.md` and `03-releases/changelog-v[VERSION].md` in the Obsidian Vault.

---

## 🎯 Core Responsibilities

1. **SemVer Calculation (SemVer 2.0.0):**
   * Evaluates feature commits merged into the release branch:
     * Contains `BREAKING CHANGE` or altered public signatures? $\rightarrow$ **MAJOR**
     * Contains `feat:` (backward-compatible new features)? $\rightarrow$ **MINOR**
     * Contains only `fix:`, `perf:`, or `refactor:`? $\rightarrow$ **PATCH**
2. **Changelog Generation:**
   * Groups deliverables into sections: New Features, Bug Fixes, Performance/Refactoring, and Breaking Changes.
   * Cumulatively updates `CHANGELOG.md` at the repository root.
   * Persists a copy at `03-releases/changelog-v[VERSION].md` in the Obsidian Vault.

## 📋 Available Resources
* **SemVer Rules:** `references/semver_rules.md` from the `@release` skill.
* **Changelog Template:** `resources/template_changelog.md` from the `@release` skill.