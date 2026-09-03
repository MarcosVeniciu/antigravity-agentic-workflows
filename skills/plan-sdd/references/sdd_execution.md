# SDD Modeling & Execution Guidelines

This document establishes the standards for constructing the **Software Design Description (SDD)** during Phase 1 (`/plan`).

---

## 1. UML Model Selection (Mermaid.js)

Select the most appropriate Mermaid diagram for the feature's complexity:
* **Sequence Diagram (`sequenceDiagram`)**: Recommended for distributed flows, REST APIs, event messaging, and repository transactions.
* **Class Diagram (`classDiagram`)**: Recommended for domain entity modeling, class hierarchies, or patterns like Strategy/Factory.
* **Flowchart (`flowchart`)**: For state machines or complex decision trees.
* **ER Diagram (`erDiagram`)**: For relational database schema modeling.

> **Mandatory Mermaid Syntax Rule**: Every node label or message text containing spaces, parentheses, or special characters MUST be strictly enclosed in double quotes (e.g., `A["Authentication Service (JWT)"]`).

---

## 2. Contracts and Mock Patterns

Contracts serve as the strict guideline for the Phase 2 TDD cycle:
* Use native project language typing (e.g., Pydantic in Python, Zod in TypeScript).
* Map required fields, optional fields with defaults, and boundary validation rules.
* Explicitly specify HTTP status codes, typed exceptions, and error response schemas.
