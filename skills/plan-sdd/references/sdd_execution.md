# SDD Modeling & Execution Guidelines

This document establishes the standards for constructing the **Software Design Description (SDD)** during Phase 1 (`/plan`).

---

## 1. Mandatory UML Models (Mermaid.js)

Every technical specification (SDD) **MUST** include both diagrams modeled in Mermaid.js:

1. **Technical Execution Flow (`sequenceDiagram`) [Mandatory]:**
   * Maps execution flow across technical layers: `Client -> Controller/API -> Service/Domain -> Repository/Port -> Adapter/Fake`.
   * Must include `autonumber` and capture both success and error paths.
   * Message labels must be enclosed in double quotes (e.g., `API->>Service: "process(dto)"`).

2. **Component & Contract Structure (`classDiagram`) [Mandatory]:**
   * Maps the concrete class and contract structure for this vertical slice.
   * Must represent:
     * Input and output DTOs.
     * Service / Use Case classes with methods and visibility.
     * Port interfaces (`<<Interface>>`) decoupling I/O.
     * In-memory test doubles (`<<Fake>>` or `<<Mock>>`).
     * Local domain entities.

3. **Complementary Models (Optional / As-Needed):**
   * **Flowchart (`flowchart`)**: For state machines or complex algorithmic branching.
   * **Entity-Relationship Diagram (`erDiagram`)**: For slices introducing or altering relational database tables and migrations.

> **Mandatory Mermaid Syntax Rule**: Every node label or message text containing spaces, parentheses, or special characters MUST be strictly enclosed in double quotes (e.g., `A["Authentication Service (JWT)"]`).

---

## 2. Contracts and Mock Patterns

Contracts serve as the strict guideline for the Phase 2 TDD cycle:
* Use native project language typing (e.g., Pydantic in Python, Zod in TypeScript).
* Map required fields, optional fields with defaults, and boundary validation rules.
* Explicitly specify HTTP status codes, typed exceptions, and error response schemas.
