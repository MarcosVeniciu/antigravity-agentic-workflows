---
project: "[Project Name]"
branch: "[Branch Name]"
date: "[YYYY-MM-DD]"
author: "[Name]"
type: "review-resiliencia"
tags:
  - "review"
  - "resiliencia"
---
# 🛡️ Resilience and Fault Tolerance Review Checklist

> **Purpose:** Protect the code from external unpredictability (failing networks, duplication, bottlenecks). AIs usually program focusing exclusively on the "happy path", assuming external systems never fail.

## How to Audit
Assume that every network operation (HTTP, database, file read) will silently fail, hang indefinitely, or be duplicated. Verify if the code reacts defensively or enters a structural panic.

---

## 1. Network Operations, Timeouts & Fallbacks
**How to Measure:** Inspect all outbound network calls (HTTP clients, database queries, cache connections).
- [ ] **Missing Timeouts:** Do functions make HTTP requests or DB connections without explicitly defining a strict timeout (e.g., `requests.get(url)` instead of `requests.get(url, timeout=5)`)?
- [ ] **Graceful Degradation:** If a non-critical external service (e.g., analytics tracker, notification sender) fails or times out, does it crash the entire main business flow?
- **Resolution (to be filled by Phase 2):** 

## 2. Idempotency and Safe Retries
**How to Measure:** Analyze event-processing endpoints, webhook receivers, and retry loops.
- [ ] **Idempotency Keys:** If the external consumer executes the exact same request (same payload) twice in a row due to a network hiccup, will the system duplicate the entity in the database or send two emails?
- [ ] **Immediate Retries (Thundering Herd):** Does the code use immediate `while True` loops for retries without implementing an exponential backoff and jitter strategy?
- **Resolution (to be filled by Phase 2):** 

## 3. Atomicity and Transactional Integrity
**How to Measure:** Look for functions that perform multiple state-changing operations in a sequence (e.g., subtract user balance, then insert a receipt).
- [ ] **Partial Failures:** Are multi-step database writes executed without a transactional block? If the final step fails, does the initial one become permanent, generating corrupted or inconsistent data?
- **Resolution (to be filled by Phase 2):** 

## 4. Limits and Defensive Pagination
**How to Measure:** Check database read operations, API data fetching, and file processing loops.
- [ ] **Unbounded Memory Consumption:** Do functions request records from the database or external APIs using unbounded calls (e.g., `.all()` or fetching without a `LIMIT`)? 
- **Resolution (to be filled by Phase 2):** 

---

## Severity Guide

| Emoji | Severity | Action Required |
|---|---|---|
| 🔴 | Critical | Potential for data corruption, infinite hangs, or cascading system failure. Must fix. |
| 🟡 | Major | Missing timeouts, lack of idempotency on non-critical endpoints. Should fix. |
| 🔵 | Minor | Logging improvements for retries. Can fix in a follow-up. |
