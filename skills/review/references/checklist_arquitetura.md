# Checklist: Architecture & Coupling Review

This document guides the audit and surgical fix of layer isolation, coupling, Dependency Inversion, and DTOs.

---

## 🔄 Phase 1 — Audit (Locating Evidence)
* Check infrastructure leakage in domain logic (`flask`, `SQLAlchemy`, `boto3`, `requests` imports in entities/use cases).
* Check hidden dependencies (direct instantiation of DB/API clients inside method bodies without injection).
* Identify input argument mutation (`list.append`, `dict['key'] = val` on received objects).
* Map "God Classes" with multiple responsibilities.

---

## 🛠️ Phase 2 — Surgical Application
* Extract direct infrastructure access to interfaces/ports (Repository Pattern / Dependency Inversion).
* Require external clients to be injected via constructor (`__init__`).
* Enforce immutability by creating defensive copies of received collections.
* Decompose God Classes into smaller specialized services (`ParserService`, `PersistenceService`).

