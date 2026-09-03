---
name: "review-architecture"
description: "Architectural audit on git diff: verifies layer isolation, Dependency Inversion (DIP), DTO boundaries, and God Class decomposition."
---

# Skill: Architecture & Coupling Review (`skills/review-architecture`)

Surgically audits the branch code changes from a software architecture, layer isolation, and dependency inversion perspective.

## 🎯 Review Pillars (Diff-Based)
* **Infrastructure Leakage:** Direct imports of frameworks, database drivers, or network libraries within domain entities or use cases.
* **Dependency Inversion:** Direct instantiation of clients or repositories in methods; enforces constructor injection.
* **God Classes / Multiple Responsibilities:** Decomposing oversized classes into cohesive, specialized services.
* **Unwanted Input Mutation:** Enforcing immutability by creating defensive copies of received collections.

## 📋 Available Resources
* **Checklist:** [`references/checklist_architecture.md`](./references/checklist_architecture.md)
* **Artifact Template:** [`resources/template_architecture.md`](./resources/template_architecture.md)
