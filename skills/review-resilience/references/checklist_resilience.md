# Checklist: Resilience & Fault Tolerance Review

This document guides the audit and surgical fix of timeouts, retry policies, circuit breakers, and fallback strategies.

---

## 🔄 Phase 1 — Audit (Locating Evidence)
* Look for external HTTP/gRPC or database calls missing explicit timeouts (`timeout=None` or omitted).
* Check retry logic: ensure retries do not execute in tight loops without delay (risk of DDoS on downstream).
* Verify what happens when external dependencies return 5xx errors or drop connections.
* Check whether graceful degradation / fallback responses exist for non-critical features.

---

## 🛠️ Phase 2 — Surgical Application
* Add explicit timeouts to all client requests (e.g., `requests.get(url, timeout=(3.05, 10))`).
* Apply exponential backoff and jitter to retry policies (`tenacity` or custom backoff).
* Provide default fallback values or cached responses when auxiliary APIs fail.
