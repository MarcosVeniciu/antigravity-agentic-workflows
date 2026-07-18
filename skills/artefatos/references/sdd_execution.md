# SDD Execution Guidelines & Architectural Design

This document details the execution protocol for the **Software Design Description (SDD)** approach applied during Phase 2 (`/artefatos`).

---

## 1. SDD (Software Design Description) Approach

The SDD approach translates behavior requirements (BDD) defined in Phase 1 into architecture specifications and contracts before any application code is written.

---

## 2. Mandatory Components of the Implementation Plan

When generating the `implementation_plan.md` artifact, instructions must mandatorily include:

### 2.1. Atomically Structured Sequential Plan
Each step must be numbered and specify:
* **What**: Clear description of the change (file to create/modify and function to implement).
* **Why**: The business rule or architectural justification motivating this step.
* **Acceptance Criteria**: The specific and testable condition proving completion.
* **Dependencies**: Which previous steps must be completed prior to starting this one.

### 2.2. Mermaid.js UML Diagramming
Visually present architecture using the diagram type most suitable for the complexity:
* **Sequence Diagram (`sequenceDiagram`)**: For multi-component interactions, API calls, or data flows.
* **Class Diagram (`classDiagram`)**: For new data models, services, classes, or hierarchies.
* **Flowchart (`flowchart`)**: For complex conditional logic, state machines, or decision trees.
* **ER Diagram (`erDiagram`)**: For database schema changes.

> **Important:** All node labels containing special characters or parentheses must mandatorily be enclosed in double quotes (`id["Label (Extra)"]`) to prevent syntax errors in Mermaid rendering.

### 2.3. Contract Specification (Mocks)
Explicitly define interface contracts or validation schemas (e.g. Pydantic, Zod, TypeScript Interfaces, OpenAPI schemas) that act as formal specifications for development.

```python
# Example Pydantic Contract
from pydantic import BaseModel, Field

class ExampleRequest(BaseModel):
    id: str = Field(..., description="Unique resource ID")
    active: bool = Field(True, description="Activation status")
```

### 2.4. Mapped Impact Analysis
List existing modules and files that will be added or modified, classifying them into:
* **Additive (new code)**: Adding new functions/classes without changing existing behavior (Low Risk).
* **Mutative (modification)**: Behavior change in an existing file (Medium/High Risk — verify existing tests).

---

## 3. Quality Gates (Self-Audit)

Before generating the final artifact for the user, execute this internal check:
- [ ] All steps in the sequential plan have testable acceptance criteria.
- [ ] Mermaid diagrams use real paths and component names from the codebase.
- [ ] All Mermaid labels with special characters use double quotes.
- [ ] Impact analysis covers all touched files.
- [ ] No functional production code or test code snippets are in the plan.

