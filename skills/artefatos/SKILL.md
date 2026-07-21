---
name: "artefatos"
description: "Generates SDD architecture, Mermaid UML diagrams, typed contracts (mocks), and impact analysis via interactive artifacts."
---

# Skill: SDD Architecture Design & Artifact Generation

This skill provides fundamental software engineering rules for transforming expected behaviors (BDD) into technical blueprints (SDD) prior to functional development.

---

## ⚙️ Universal SDD Rules (Software Design Description)

1. **Think First, Code Later**: Strictly forbidden to write or modify production source code or automated tests during this phase.
2. **Vault-Based Context**: All design decisions must be grounded in rules declared in `00-core-rules/` and `01-concepcao/` specifications found in Obsidian.
3. **Atomic Mapping**: Every plan step must have a clear action (*What*), justification (*Why*), testable condition (*Acceptance Criterion*), and explicit dependencies.
4. **Safe Mermaid Syntax**: All node labels and messages in Mermaid diagrams containing special characters or parentheses must be enclosed in double quotes (`participant C as "Component (API)"`).
5. **Typed Contracts**: Formally define data contracts via typed mocks (Pydantic, Zod, TypeScript Interfaces) to serve as strict specifications for the TDD phase.

---

## 🛠️ Skill Resources and Dependencies

* **SDD Execution Manual**: Consult [references/sdd_execution.md](references/sdd_execution.md) for advanced guidelines on UML diagram types and contract quality.
* **Artifact Template**: Use the structure in [resources/template_artefatos.md](resources/template_artefatos.md) to assemble `implementation_plan.md`.
* **Reference Example**: Follow the semantics of [examples/sdd_checkout_example.md](examples/sdd_checkout_example.md) for learning by imitation (few-shot).
* **Validation Script**: Run script [scripts/validate_sdd_contracts.py](scripts/validate_sdd_contracts.py) to audit whether the generated document meets all SDD quality criteria.

---

## ✅ Validation Checklist (Self-Audit)

Before delivering the artifact to the user, independently verify:
- [ ] Does `implementation_plan.md` contain valid metadata (`UserFacing: true`, `RequestFeedback: true`)?
- [ ] Does the sequential plan clearly describe file/function, justification, and testable criteria?
- [ ] Do Mermaid diagrams use quoted labels and map real codebase components?
- [ ] Are typed contracts explicitly defined?
- [ ] Does impact analysis cover all additive and mutative affected files?
- [ ] Was zero functional source code or test file generated or modified?