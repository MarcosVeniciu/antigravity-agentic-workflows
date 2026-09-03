---
name: "dod"
description: "Use across all phases to manage the Definition of Done (DoD) and living execution logs (dod-[slug].md). Initializes criteria in Phase 1, tracks TDD timelines, marks audits, and acts as 100% mathematical gatekeeper for releases."
---

# Skill: Definition of Done & Living Log (`skills/dod`)

Governs the single source of truth for delivery criteria, traceability, and execution logs (`01-concepcao/dod-[slug].md`).

## 🎯 Responsibilities Across the Lifecycle
* **Phase 1 (`/plan`):** Initialize `01-concepcao/dod-[slug].md` with BDD scenarios, SDD links, and non-functional requirements.
* **Phase 2 (`/implement`):** Append dynamic timeline entries under `## 2. Development Timeline` for each completed TDD context batch.
* **Phase 3 (`/refactor`):** Mark `- [x] Phase 3: Final Refactoring (/refactor)`.
* **Phase 4 (`/review`):** Incrementally mark completed audit domains (`- [x] Architecture Review`, `- [x] Security Review`, etc.).
* **Phase 5 (`/docs`):** Mark `- [x] Technical documentation updated via /docs`.
* **Release (`/release`):** Act as the 100% mathematical gatekeeper, verifying that all checkboxes are checked before release integration is authorized.

## 📋 Available Resources
* **DoD Template:** `resources/template_dod.md` from the `@dod` skill.
