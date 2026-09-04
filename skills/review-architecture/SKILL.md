---
name: "review-architecture"
description: "Architectural audit on git diff: verifies layer isolation, Dependency Inversion (DIP), DTO boundaries, and God Class decomposition."
---

# Skill: Architecture & Coupling Review (`skills/review-architecture`)

Surgically audits the branch code changes from a software architecture, layer isolation, and dependency inversion perspective.
Operates in **Script-First** mode: runs boundary linter first, then focuses manual inspection on flagged files and design coherence.

## 🎯 Review Pillars (Script-First & Boundary Linter)
* **Automated Boundary Check (`check_arch_boundaries.py`):** Detects illegal imports of frameworks, database drivers, or HTTP libraries in domain layers.
* **Dependency Inversion (DIP):** Verifies constructor injection of abstract interfaces instead of direct client instantiation.
* **God Classes / Multiple Responsibilities:** Decomposing oversized classes into cohesive, specialized services.
* **Unwanted Input Mutation:** Enforcing immutability by creating defensive copies of received collections.

## 📋 Available Resources
* **Boundary Linter:** [`scripts/check_arch_boundaries.py`](./scripts/check_arch_boundaries.py)
* **Checklist:** [`references/checklist_architecture.md`](./references/checklist_architecture.md)
* **Artifact Template:** [`resources/template_architecture.md`](./resources/template_architecture.md)
