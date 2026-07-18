---
name: "artefatos"
description: "Implementation artifacts and SDD architecture generation skill (Phase 2). Translates BDD specifications into Mermaid UML diagrams, typed contracts, and impact analysis via interactive artifacts."
---

# Skill: Artifact Generation & SDD Architecture Design (`skills/artefatos`)

Manages **Phase 2 (Technical Design & SDD Contracts)**, bridging the gap between BDD requirements and code development through interactive artifacts with approval pauses directly in the IDE. Always communicate with the user in Portuguese.

---

## 🔄 Operational Workflow

Consult references and templates for each step of the workflow:

1. **Pre-flight & Context Reading**:
   * Search the Obsidian Vault for the scope specification generated in Phase 1 (`01-concepcao/bdd-[feature-slug].md`).
   * Read architecture rules and conventions in `00-core-rules/` and contract specifications in `01-concepcao/`.
   * Identify the active Git branch.

2. **Generating Technical Design (SDD)**:
   * Consult the detailed guide in [references/sdd_execution.md](references/sdd_execution.md) to build the implementation plan, diagrams, and contract mocks.
   * Use the base template structure in [resources/template_artefatos.md](resources/template_artefatos.md).
   * Generate the interactive artifact `implementation_plan.md` in the session directory with `UserFacing: true` and **`RequestFeedback: true`**.

3. **Interactive Pause & User Approval**:
   * The generated artifact will render a **Proceed** button in the IDE visual panel.
   * The assistant waits for user confirmation/feedback before proceeding to persist in the Vault.

4. **Obsidian Vault Persistence & Handover**:
   * Save the approved plan content in the vault under `01-concepcao/sdd-[feature-slug].md` by invoking the `grafo` skill.
   * Add a bidirectional link to the originating BDD scope (`[[bdd-feature-slug]]`).
   * Trigger the `git` skill (Mode 2 - Phase Squash) to consolidate the phase into a clean semantic commit.
   * Present the next step instruction to the user (suggesting `/testes` or `/infra`).

---

## 🛠️ Resources & References

* **Artifact Template**: [resources/template_artefatos.md](resources/template_artefatos.md)
* **SDD Execution Manual & Diagrams**: [references/sdd_execution.md](references/sdd_execution.md)

---

## ⛔ Universal Rules & Constraints

1. **Think First, Code Later**: Writing production source code or creating test suites during this phase is forbidden.
2. **Consult Vault (Pre-flight Check)**: All design decisions must be grounded in rules and maps already documented in Obsidian.
3. **Interactive Control via Artifacts**: Always set `RequestFeedback: true` when issuing `implementation_plan.md`.
4. **Safe Mermaid Syntax**: Use double quotes on all node labels in Mermaid diagrams to prevent rendering syntax errors.

---

## ✅ Validation Checklist & Verification Method

With every artifact generation, autonomously validate:
- [ ] Does the `implementation_plan.md` artifact have valid metadata (`UserFacing: true`, `RequestFeedback: true`)?
- [ ] Does the sequential plan include what, why, acceptance criteria, and dependencies for each step?
- [ ] Do Mermaid diagrams use quoted node labels and correspond to real application components?
- [ ] Were typed contract mocks defined (Pydantic, Zod, OpenAPI)?
- [ ] Does impact analysis include all affected files and modules?
- [ ] Does final storage in Obsidian include a bidirectional link via the `grafo` skill?
- [ ] Was the final semantic commit of the artifacts phase consolidated via the `git` skill (Mode 2)?

