---
name: "tdd-plan"
description: "TDD batch planning: decomposes BDD scenarios and SDD blueprints into sequential context batches, implementation_plan.md, and task_list.md."
---

# Skill: TDD Batch Planning (`skills/tdd-plan`)

Analyzes BDD specifications and SDD contracts to decompose delivery into **Dependent Context Batches** before any code is written.

## 🎯 Batch Decomposition Directives

1. **Linear Context Dependency:**
   * Batch 1: Domain entities, base interfaces, and contracts (zero external dependencies).
   * Intermediate Batches: Use cases, domain services, and business rules.
   * Final Batch: API routes/controllers and end-to-end orchestration.
2. **Artifact Generation:**
   * `implementation_plan.md`: Detailed architectural breakdown of batches and affected files (`RequestFeedback: true`).
   * `task_list.md`: Dynamic task checklist with interactive progress states (`[ ]` ➔ `[/]` ➔ `[x]`).

## 📋 Available Resources
* **Plan Template:** [`resources/plan_template.md`](./resources/plan_template.md)
* **Task Template:** [`resources/task_template.md`](./resources/task_template.md)
