---
name: "plan-decompose"
description: "Architectural epic decomposition and evolutionary vertical slicing into small, compatible, and verifiable increments with acyclic dependencies and reduced architectural rework."
---

# Skill: Epic Decomposition & Evolutionary Slicing (`skills/plan-decompose`)

Decomposes complex initiatives and large architectural shifts into an ordered sequence of short-cycle sub-features (vertical slices), preventing Mega-PRs, context window saturation, and integration bottlenecks.

---

## The 5 Principles of Evolutionary Slicing

1. **Verifiable Delivery:**
   * Every sub-feature must deliver either a demonstrable user-facing behavior or an explicitly identified technical capability (**Technical Enabler**) with an identified immediate consumer.

2. **Compatible Evolution:**
   * Sub-features must preserve previously accepted behaviors and contracts.
   * Internal refactoring is encouraged. Incompatible contract changes (breaking changes) are not prohibited, but require an explicit roadmap revision and transition strategy.

3. **Explicit Boundaries (Fakes vs. Mocks):**
   * Define typed boundary contracts (`IRepository`, `IClient`) alongside or immediately prior to the first consumer.
   * Use **Fakes** (in-memory functional implementations) and **Mocks** (interaction verifiers) for test isolation, without treating them as proof of real integration.

4. **Incremental Integration:**
   * Every feature integrates continuously into `develop` through automated quality gates (CI, lint, tests).
   * Unreleased features remain dormant via feature flags or internal wiring; real adapter validations (DB, queues, external APIs) must not be deferred to the end of the epic.

5. **Single-Chat Calibration:**
   * Each sub-feature must fit cleanly into a single focused chat session (planning $\rightarrow$ TDD $\rightarrow$ refactoring $\rightarrow$ review $\rightarrow$ docs).
   * Red flags that require slicing: multiple unrelated use cases, unmerged branch dependencies, or blocking architectural decisions.

---

## Operational Bounds: Inputs, Outputs & Stop Conditions

* **Inputs:** Core problem statement, target personas/systems, existing repository context, constraints, and observed technical debt.
* **Output:** A canonical Epic Blueprint markdown following [`resources/template_epic.md`](./resources/template_epic.md), registered in the Obsidian Vault.
* **Stop Condition (Spike):** If a critical architectural uncertainty, missing dependency, or unknown technical constraint prevents confident slicing, do not guess. Decompose a timeboxed **Spike** sub-feature to produce a definitive technical decision before proceeding.

---

## Anti-Bureaucracy & Token Economy Directive

To prevent prompt bloat and context exhaustion during subsequent `/plan` chats, enforce this triage:

| Section Level | Treatment in Epic Blueprint | Examples |
|---|---|---|
| **Mandatory** | Deep, precise specification | Problem, Scope & Non-Goals, Macro Architecture (Delta Class & Journey Sequence Diagrams), Feature Roadmap, Shared Contracts, Acceptance Criteria, Handover. |
| **Conditional** | 1 line or `N/A: [brief reason]` | Data migration, Feature flags, Complex rollback, Rollout telemetry. Fill only when applicable! |
| **Delegated to `/plan`** | **Strictly prohibited in the Epic** | Specific file lists, TDD execution order, internal helper methods, granular commit lists. |

---

## Available Resources
* **Epic Template:** [`resources/template_epic.md`](./resources/template_epic.md)
* **Slicing Directives:** [`references/slicing_rules.md`](./references/slicing_rules.md)
* **Class Diagram Conventions:** [`references/class_diagram_conventions.md`](./references/class_diagram_conventions.md)
* **Sequence Diagram Conventions:** [`references/sequence_diagram_conventions.md`](./references/sequence_diagram_conventions.md)
* **Practical Example:** [`examples/epic_decomposition_example.md`](./examples/epic_decomposition_example.md)


