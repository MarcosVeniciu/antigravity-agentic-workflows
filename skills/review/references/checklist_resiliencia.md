# Checklist: Resilience & Fault Tolerance Review

This document guides the audit and surgical fix of network timeouts, idempotency, transaction integrity, and retry strategies.

---

## 🔄 Phase 1 — Audit (Locating Evidence)
* Map network calls without explicit `timeout` defined.
* Map multi-step write operations lacking transactional blocks.
* Identify missing idempotency keys in event/webhook processing endpoints.
* Detect immediate retries in `while True` loops without exponential backoff.

---

## 🛠️ Phase 2 — Surgical Application
* Inject strict timeout parameters (e.g. `timeout=5.0`) into all HTTP/DB calls.
* Wrap chained writes in `with db.transaction():` ensuring rollback.
* Add Event ID/Hash checks prior to reprocessing webhooks.
* Use retry libraries with exponential backoff and jitter (e.g. `tenacity`).

