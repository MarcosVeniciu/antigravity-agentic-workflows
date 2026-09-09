---
name: "plan-sdd"
description: "Translates BDD specs into safe Mermaid UML diagrams, typed boundary contracts (Pydantic, Zod, TS), and file impact matrices."
---

# Skill: SDD Architecture & Technical Contracts (`skills/plan-sdd`)

Translates BDD rules and scenarios into a detailed technical blueprint, defining sequence/class UML diagrams, typed interfaces/boundary mocks, and a sequential file change plan before the TDD cycle.

## 🎯 Technical Directives

1. **Mandatory Dual Visual Modeling (Mermaid.js):**
   * Every SDD specification **MUST** include **BOTH** diagrams:
     - `sequenceDiagram`: Tracing technical flow across layers (`Client -> Controller -> Service -> Port -> Adapter/Fake`).
     - `classDiagram`: Specifying typed contracts, interfaces (`<<Interface>>`), DTOs, and test doubles (`<<Fake>>`/`<<Mock>>`).
   * All nodes and messages must have labels enclosed in double quotes (e.g., `node["Auth Service (JWT)"]`) to prevent parser syntax errors.
2. **Strict Typed Contracts (Boundary Mocks):**
   * Define contracts with explicit validations using native language types (e.g., Pydantic in Python, Zod in TypeScript).
   * Map input types, output types, and expected typed exceptions.
3. **File Impact Matrix:**
   * Pre-map which files will be created (Additive) or modified (Mutative) along with their risk level.

## 📋 Available Resources
* **SDD Template:** [`resources/template_sdd.md`](./resources/template_sdd.md)
* **Modeling Manual:** [`references/sdd_execution.md`](./references/sdd_execution.md)
* **Reference Example:** [`examples/sdd_checkout_example.md`](./examples/sdd_checkout_example.md)
* **Validation Script:** [`scripts/validate_sdd_contracts.py`](./scripts/validate_sdd_contracts.py)
