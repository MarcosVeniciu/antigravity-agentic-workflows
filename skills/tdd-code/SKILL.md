---
name: "tdd-code"
description: "Use during TDD Green Phase in Phase 2 (/implement) to write strictly sufficient, minimal SOLID production code with full type hints to pass unit tests and document technical pivots."
---

# Skill: Minimal & SOLID Production Code (`skills/tdd-code`)

Writes the minimal and strictly necessary production code required to make the context batch unit test suite pass green (TDD Green Phase), focusing on simplicity, strict typing, and traceability.

## 🎯 Implementation Principles (Green Phase)

1. **"Make It Work" Before Optimizing:**
   * Implement minimal code sufficient to turn tests green.
   * Avoid premature complex abstractions not required by the active batch tests.
2. **SOLID & Single Responsibility (SRP):**
   * Keep functions and methods small with single, cohesive responsibilities.
   * Avoid direct coupling to infrastructure details; depend on abstractions and interfaces.
3. **Strict Typing (Type Hints):**
   * All function and method signatures must include complete argument type annotations and return types.
4. **Technical Pivot Protocol:**
   * If a technical roadblock forces deviation from the SDD blueprint during implementation, immediately document a pivot in `02-auditorias/pivots-[slug].md` using `resources/pivot_template.md`.

## 📋 Available Resources
* **Pivot Template:** `resources/pivot_template.md` from the `@tdd-code` skill.
