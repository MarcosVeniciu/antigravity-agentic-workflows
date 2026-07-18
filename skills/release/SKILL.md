---
name: "release"
description: "Release management skill (Release Manager). Calculates Semantic Versioning (SemVer), generates structured Changelogs, and orchestrates version publication."
---

# Skill: Release Management & SemVer (`skills/release`)

This skill guides the consolidation of development branch changes, calculation of semantic versioning (SemVer), and generation of release notes (Changelog). Always communicate with the user in Portuguese.

---

## 🛠️ Execution Guide & SemVer Rules

Consult semantic versioning rules in:
* [SemVer Rules Guide](references/semver_rules.md)

---

## 📁 Resources & Templates

* **Changelog Template**: [template_changelog.md](resources/template_changelog.md)

---

## 🔄 Operational Workflow

1. **Pre-flight & Commit Inspection**:
   * Analyze recent commit history on the active branch and current registered project version.
   * Consult `03-releases/` in the Obsidian Vault for items marked as completed.

2. **SemVer Calculation**:
   * **Major (X.0.0)**: Breaking changes/contract shifts.
   * **Minor (0.X.0)**: Backward-compatible new features.
   * **Patch (0.0.X)**: Backward-compatible bug fixes and refactorings.

3. **Changelog Generation**:
   * Structure release notes using the template in `resources/template_changelog.md`.

4. **Proposed Git Commands**:
   * Propose git commands in an isolated `bash` block for branch merging and annotated tag creation.

---

## ⛔ Rules & Constraints

1. **Force Push Prohibited**: Never propose `git push --force`.
2. **Mandatory Annotated Tags**: Production releases must be accompanied by an annotated tag (`git tag -a vX.Y.Z`).

---

## ✅ Validation Checklist

- [ ] Is the version bump strictly justified by commit types?
- [ ] Was the Changelog categorized into Features, Fixes, Performance, and Breaking Changes?
- [ ] Were Git commands for annotated tags provided in an isolated `bash` block?

