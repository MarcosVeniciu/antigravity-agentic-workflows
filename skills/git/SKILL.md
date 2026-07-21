---
name: "git"
description: "Local version control utility skill. Manages Micro-Checkpoints against code corruption and executes Phase Closure Squash (Phase Handover) into clean semantic commits."
---

# Skill: Local Git & Micro-Checkpoints (`skills/git`)

Manages local versioning of the project during the phase lifecycle, providing fast restore points (Micro-Checkpoints) and semantic consolidation (Phase Squash) for clean context handover between chats. Always communicate in English.

## 📚 Documentation and Rules
To access execution guidelines, strict constraints, and the versioning validation checklist, the engine must read the operational manual on demand via `view_file`:
* **Execution Manual:** Read `references/EXECUTION.md` from the `@git` skill

## 📋 Available Resources
* **Phase Closure Template:** Located in `resources/template_phase_commit.md` from the `@git` skill. Use strictly for "Mode 2: Phase Closure & Squash".