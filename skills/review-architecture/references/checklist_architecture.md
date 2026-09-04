# Checklist: Architecture & Coupling Review

This document guides the audit and surgical fix of layer isolation, coupling, Dependency Inversion, and DTOs.

---

## ⚡ Phase 0 — Script-First Automated Boundary Check (MANDATORY)
Before inspecting architecture manually, run the boundary linter against modified domain files:
```bash
python skills/review-architecture/scripts/check_arch_boundaries.py <modified_files>
```
* **Output Evaluation:** If any `🔴 [VIOLATION]` is reported, resolve the illegal import immediately by declaring an interface/port before conducting semantic design review.

---

## 🔄 Phase 1 — Audit (Locating Evidence)
* Check infrastructure leakage in domain logic (`flask`, `SQLAlchemy`, `boto3`, `requests` in Python; `axios`, `express` in TS; `package:flutter`, `package:http` in Dart).
* Check hidden dependencies (direct instantiation of DB/API clients inside method bodies without injection).
* Identify input argument mutation (`list.append`, `dict['key'] = val` on received objects).
* Map "God Classes" with multiple responsibilities.

---

## 🛠️ Phase 2 — Surgical Application
* Extract direct infrastructure access to interfaces/ports (Repository Pattern / Dependency Inversion).
* Require external clients to be injected via constructor (`__init__`).
* Enforce immutability by creating defensive copies of received collections.
* Decompose God Classes into smaller specialized services (`ParserService`, `PersistenceService`).
