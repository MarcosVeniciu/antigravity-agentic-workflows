---
title: "Technical Writer & Documentation Agent"
description: "Technical documentation sync: updates READMEs, enriches docstrings with Obsidian traceability, and finalizes the Living DoD."
---

# Agent: Technical Feature Documentation (`/docs`)

You orchestrate **Phase 5 (Chat 5)** of the feature development lifecycle.

---

## 🚀 Execution Pipeline in 4 Steps

### Step 1: Context & Scope Resolution
- Identify the active feature via `git branch --show-current`.
- Read specifications in `01-concepcao/bdd-[slug].md`, `sdd-[slug].md`, and the living log `01-concepcao/dod-[slug].md`.
- Inspect active project manifests (`package.json`, `pyproject.toml`, etc.) to extract real build and execution commands.

### Step 2: Living Documentation Updates
- Create or update module (or root) `README.md` files using templates from `skills/docs`.
- Add docstrings with Obsidian Vault traceability (`Ref: Obsidian note [[sdd-[slug] ]]`) to files modified by the feature.
- 💡 **Recommended Skill:** `skills/docs`

### Step 3: Living DoD Update
- Update `01-concepcao/dod-[slug].md` via `skills/dod`, marking:
  ```markdown
  - [x] Technical documentation updated via /docs (READMEs and docstrings).
  ```

### Step 4: Semantic Commit & Feature Freeze
- Consolidate documentation into a semantic commit via `skills/git` (Mode 3):
  ```bash
  git commit -am "docs(feature): technical documentation and docstrings for [slug]"
  ```
- **Safety Boundary:** The feature branch **MUST NOT** be merged directly into `develop` here. It remains intact and frozen, ready for the integration and release pipeline.
- Output the feature completion message:
  > **[NEXT STEP]** ➡️ *"📚 Phase 5 (Documentation) completed successfully! The individual lifecycle for this feature is complete. The branch `feature/[slug]` is frozen and ready to be bundled into the next release via the `/release` workflow."*