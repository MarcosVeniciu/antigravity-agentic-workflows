# Artifacts Generator (The Technical Architect)

The **Artifacts** agent acts at the most critical moment before writing production code: the transition between *what the system should do* (established in BDD) and *how the system will do it* structurally (formalized in SDD).

Its role is to take the Features List defined in the planning stage and translate it into a rigorous technical **Implementation Plan**.

---

## 1. SDD Approach (Software Design Document)

The main premise of the artifacts agent is to bridge the gap between the business rule and the final algorithm using the rigor of **SDD**.

In this phase, the agent does not write logic (algorithms, loops, conditional rules in code), but rather **contracts**. This involves:
- **Pre-Flight Context Gathering:** It mandatorily reads the Scope Note from `09-scopes-and-features/` as the single source of truth, and crosses it with existing `05-architecture-map/` and `04-domain-rules/` via the `obsidian_knowledge_graph` MCP vault.
- **Diagramming:** Creation of architectural diagrams in Mermaid.js (Sequence, Class, Flowchart, ER) visually mapping how components will integrate. Quoted labels are strictly enforced for safe syntax.
- **Contracts:** Rigorous definition of interfaces, API mocks, database schemas (e.g., Pydantic/Zod), and payloads.

---

## 2. The Core Benefit: Cognitive Load Reduction

The main reason for the existence of an exclusive agent focused on SDD artifacts is the **cognitive load control** of the model (AI) during the next phase (actual code development).

If the coding AI tried to read the BDD and implement the code all at once, it would be forced to "guess" class names, data structures, and relationships between methods. This frequently leads to scope hallucinations and spaghetti architectures.

By defining classes, sequence diagrams, and contracts in advance, the artifacts agent **eliminates guesswork**. When the coding stage (`/codigo` or `/testes`) begins, the AI can focus 100% of its cognitive capacity on building the algorithm logic, acting in a focused and assertive manner, since the behavioral infrastructure and class boundaries have already been decided, recorded, and approved by the human.

---

## 3. The Implementation Plan Artifact

Using `08-templates-and-workflows/template_artefatos.md`, the agent generates a **SINGLE ARTIFACT** named `implementation_plan.md` containing an atomic sequence of implementation steps. Each step is broken down into:
- **What:** Which file to create or modify.
- **Why:** What is the linked business logic (link to BDD).
- **Acceptance Criteria:** The testable trigger for the feature.
- **Dependencies:** What needs to exist before this file is touched.

The agent also executes an **Impact Analysis** inside the artifact, listing all existing modules and files that will mutate to accommodate the new feature, preventing breakages in healthy parts of the system.
No production code or terminal commands are allowed in this step.

---

## 4. Traceability and the "Second Brain" (Obsidian)

To finalize the scope shielding, this agent acts as an architectural librarian:

1. As soon as the user approves the technical artifacts (`/artefatos ok`), the model autonomously saves the `implementation_plan.md` contents in the **Obsidian Vault** (e.g., folder `01-adrs/` or `05-architecture-map/`).
2. It creates mandatory **bidirectional links** (e.g., `[[YYYY-MM-DD-feature-slug-scope]]`) linking the newly created SDD back to the BDD Scope Note generated in the planning phase.

This ensures that every technical alteration has perfect traceability back to its originating business rule.
