---
name: "tdd-plan"
description: "Use during Phase 2 (/implement) for TDD batch planning. Analyzes BDD scenarios and SDD blueprints to decompose work into sequential, dependent context batches, generating implementation_plan.md and task_list.md."
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
* **Plan Template:** `resources/plan_template.md` from the `@tdd-plan` skill.
* **Task Template:** `resources/task_template.md` from the `@tdd-plan` skill.
