# Evolutionary Vertical Slicing & Epic Decomposition Guide

This guide establishes the technical and architectural standards for decomposing complex software initiatives into small, compatible, and verifiable increments, preventing Mega-PRs and architectural rework.

---

## 1. 🚫 Slicing Anti-Patterns

### A. Horizontal Slicing (Layer by Layer)
* **How NOT to do it:**
  * Feature 1: Create database tables and migrations.
  * Feature 2: Create repository interfaces without consumers.
  * Feature 3: Create API endpoints.
  * Feature 4: Wire everything together at the end.
* **Why it fails:** Intermediate features deliver zero observable value; integration validation is delayed until the end (maximum risk); Feature 1 and 2 tests are purely hypothetical.

### B. False Vertical Slice (Disguised Infrastructure)
* **How NOT to do it:** Create a "Feature 1: Mock Producer Repository" with no executable use case attached.
* **Why it fails:** Even though it uses typed interfaces, it solves no user or system workflow.

---

## 2. 🎯 Recommended Vertical Slicing Patterns

Every sub-feature must deliver a complete vertical slice (**typed contract $\rightarrow$ domain logic $\rightarrow$ persistence/test double $\rightarrow$ automated tests**). Apply the following patterns:

| Slicing Pattern | Description | Application Example |
|---|---|---|
| **By Use Case / Flow** | Splits by distinct, autonomous actor workflows. | F1: Lookup producer by ID;<br/>F2: Register new producer. |
| **By Walking Skeleton** | Delivers the thinnest end-to-end functional path first, adding capabilities incrementally. | F1: Core diagnosis using in-memory engine;<br/>F2: Add persistent execution history. |
| **By Business Rule / Variation** | Isolates business complexity variations. | F1: Delta calculation for scalar numeric values;<br/>F2: Complex categorical delta rules. |
| **By Happy Path vs. Exceptions** | Delivers the core valid path first, hardening resilience, timeouts, and fallbacks next. | F1: Synchronous direct diagnosis;<br/>F2: Circuit breaker and offline fallback. |

---

## 3. 🧩 Delivery Typology

When decomposing an epic, classify each sub-feature explicitly:

1. **Vertical Slice (Default):**
   * Delivers demonstrable, observable business or system behavior.
   * *Completion evidence:* An executable and testable acceptance scenario or live endpoint.
2. **Technical Enabler:**
   * Delivers an architectural foundation immediately required by upcoming features.
   * *Requirement:* Must have an identified immediate consumer and defined use case.
   * *Completion evidence:* Typed interface, functional in-memory Fake, and documented integration tests.
3. **Spike (Investigation):**
   * A strictly timeboxed task to reduce critical technical uncertainty prior to full roadmap decomposition.
   * *Completion evidence:* Documented findings, disposable POC, or ADR unlocking architectural decisions (no production code commitments).

---

## 4. 🛡️ Boundary Management & Test Doubles

### Fakes vs. Mocks (Rigorous Definitions)
* **Fake:** A working, lightweight in-memory implementation that holds state (e.g., `InMemoryProducerRepository` backed by a dictionary with seed helpers). Enables rapid use case testing without real I/O.
* **Mock / Stub:** A test spy/stub configured to verify method interactions, inspect arguments, or simulate synthetic error responses.

### Validation with Real Adapters
> ⚠️ **Critical Rule:** In-memory Fakes **DO NOT** prove real database constraints, foreign key cascades, ACID transactions, concurrency handling, or network latency.

* When introducing a real adapter (e.g., `PostgresProducerRepository`), implement **real integration tests** validating infrastructure boundaries (e.g., using Testcontainers).
* Adopt **Shared Contract Tests**: the identical contract test suite should pass cleanly against both the `InMemoryFake` and the `RealRepository`.

---

## 5. 🔍 Slicing Quality Checklist

Before finalizing `epic_breakdown.md`, audit the proposed roadmap against these criteria:

- [ ] **Macro Architectural Modeling:** Are the Delta Class Diagram (with `<<Existing>>`/`<<New>>`/`<<Modified>>`) and the Macro Journey Sequence Diagram documented?
- [ ] **Observable Outcome:** Does every feature deliver a demonstrable functional or technical result?
- [ ] **Dependency Rationale:** Does every edge in the graph state explicitly what capability it receives from the predecessor?
- [ ] **Acyclic Graph (DAG):** Is the dependency graph strictly acyclic with zero circular dependencies?
- [ ] **Operational Independence:** Can each feature be built off updated `develop` without depending on unmerged parallel branches?
- [ ] **Zero Orphan Infrastructure:** Are all repositories, interfaces, or queues tied to an immediate consumer?
- [ ] **Shift-Left Risk:** Are the highest risks and critical integrations validated early rather than deferred to the end?
- [ ] **Non-Regression Guarantee:** Do subsequent features preserve previously accepted contracts and behaviors?
- [ ] **Cycle Calibration:** Does each feature comfortably fit within a single development chat cycle (`/plan` $\rightarrow$ TDD $\rightarrow$ review)?

---

## ⚖️ Anti-Bureaucracy Matrix: Responsibility Allocation

| Level | Canonical Location | What to Document | What NOT to Put Here |
|---|---|---|---|
| **Macro-Architecture (Epic)** | `01-concepcao/epic-[slug].md` | Scope boundaries, non-goals, Macro Architecture (Delta Class & Journey Sequence Diagrams), shared contracts, systemic risks, epic success criteria, branch roadmap. | Do NOT list local files, private method signatures, or granular task checklists. |
| **Micro-Planning (Feature)** | `implementation_plan.md` in `/plan` | File diffs, detailed Pydantic/Zod schemas, atomic Gherkin scenarios, Micro Sequence (layers) & Class (types/mocks) diagrams, TDD cycle. | Do NOT renegotiate macro epic scope without updating the canonical epic blueprint. |


