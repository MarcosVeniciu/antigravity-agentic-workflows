# SDD Execution Guidelines & Architectural Design

This document details the construction protocol for the **Software Design Description (SDD)** in Phase 2 (`/artefatos`).

---

## 1. UML Diagram Selection (Mermaid.js)

Select the most suitable visual model for feature complexity:
* **Sequence Diagram (`sequenceDiagram`)**: Recommended for flows with multiple services, REST APIs, queued messages, and database transactions.
* **Class Diagram (`classDiagram`)**: Recommended for new domain entities, class hierarchies, or patterns like Factory/Strategy.
* **Flowchart (`flowchart`)**: For state machines or complex conditional decision flows.
* **ER Diagram (`erDiagram`)**: For alterations and new tables in database schemas.

> **Mermaid Syntax Rule**: Labels with special characters, parentheses, or spaces must be enclosed in double quotes (e.g., `node["Authentication Service (JWT)"]`).

---

## 2. Standards for Contracts & Mocks

Contracts must act as strict specifications for subsequent development in the TDD cycle:
* Use native types and annotations from the project language (e.g., Pydantic in Python, Zod in TypeScript).
* Map all required fields, optional fields, and edge-case validations.
* Explicitly define return codes and expected exceptions.