---
name: "dod"
description: "Lifecycle governance and Definition of Done (DoD) management skill. Creates, updates, and mathematically audits living DoD logs (dod-[slug].md) across all phases."
---

# Skill: Definition of Done & Living Log (`skills/dod`)

Governs the single source of truth for delivery criteria, traceability, and execution logs (`01-concepcao/dod-[slug].md`).

## 🎯 Responsibilities Across the Lifecycle
* **Phase 1 (`/planejamento`):** Initialize `01-concepcao/dod-[slug].md` with BDD scenarios, SDD links, and non-functional requirements.
* **Phase 2 (`/implementar`):** Append dynamic timeline entries under `## 2. Linha do Tempo de Desenvolvimento` for each completed TDD context batch.
* **Phase 3 (`/refatorar`):** Mark `- [x] Fase 3: Refatoração Final (/refatorar)`.
* **Phase 4 (`/review`):** Incrementally mark completed audit domains (`- [x] Review de Arquitetura`, `- [x] Review de Segurança`, etc.).
* **Phase 5 (`/docs`):** Mark `- [x] Documentação técnica atualizada via /docs`.
* **Release (`/release`):** Act as the 100% mathematical gatekeeper, ensuring all checkboxes are checked before release integration is authorized.

## 📋 Available Resources
* **Template DoD:** `resources/template_dod.md` from the `@dod` skill.
