# Checklist: General Review (Quality & Anti-Hallucination)

This document guides the audit and surgical fix of general code quality, readability, and AI hallucination verification.

---

## 🔄 Phase 1 — Audit (Locating Evidence)
* Check for API hallucinations calling non-existent methods in external packages.
* Inspect type deviation using `Any`, `**kwargs`, or generic `dict` in business rules.
* Detect didactic LLM traces (obvious comments like `# creates empty list`).
* Validate whether docstrings lie about raised exceptions or function signatures.

---

## 🛠️ Phase 2 — Surgical Application
* Replace `**kwargs` with DTOs using `Pydantic` or `dataclasses`.
* Add explicit `Type Hints` across all public functions.
* Remove tautological comments, retaining only those explaining business rules.
* Adjust docstrings to strictly reflect real behavior and thrown exceptions.

