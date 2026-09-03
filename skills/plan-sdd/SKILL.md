---
name: "plan-sdd"
description: "Use during Phase 1 (/plan) to translate BDD requirements into safe Mermaid UML diagrams, strict typed contracts/mocks (Pydantic, Zod, TypeScript), and file impact matrices."
---

# Skill: SDD Architecture & Technical Contracts (`skills/plan-sdd`)

Translates BDD rules and scenarios into a detailed technical blueprint, defining sequence/class UML diagrams, typed interfaces/boundary mocks, and a sequential file change plan before the TDD cycle.

## 🎯 Technical Directives

1. **Safe Visual Modeling (Mermaid.js):**
   * All nodes and messages must have labels enclosed in double quotes (e.g., `node["Auth Service (JWT)"]`) to prevent parser syntax errors.
   * Priorize `sequenceDiagram` for distributed flows or `classDiagram` for data structures and contracts.
2. **Strict Typed Contracts (Boundary Mocks):**
   * Define contracts with explicit validations using native language types (e.g., Pydantic in Python, Zod in TypeScript).
   * Map input types, output types, and expected typed exceptions.
3. **File Impact Matrix:**
   * Pre-map which files will be created (Additive) or modified (Mutative) along with their risk level.

## 📋 Available Resources
* **SDD Template:** `resources/template_sdd.md` from the `@plan-sdd` skill.
* **Modeling Manual:** `references/sdd_execution.md` from the `@plan-sdd` skill.
* **Reference Example:** `examples/sdd_checkout_example.md` from the `@plan-sdd` skill.
* **Validation Script:** `scripts/validate_sdd_contracts.py` from the `@plan-sdd` skill.
