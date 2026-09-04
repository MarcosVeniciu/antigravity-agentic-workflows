# Patterns for Integration Testing and E2E Runners

This guide describes recommended practices for structuring end-to-end integration test suites.

---

## 🏗️ Stage Banner Structure in Pytest / Runners

When writing integration tests in Python (or equivalent in Node.js/Go), use formatted stdout logs to delimit stages in the console (`-s` flag):

```python
import pytest
import time

def log_stage(stage_num: int, title: str):
    print(f"\n{'='*70}")
    print(f"[STAGE {stage_num}] {title}")
    print(f"{'='*70}\n")

def test_complete_integration_suite(client, test_db):
    # Stage 1: Happy Path
    log_stage(1, "E2E HAPPY PATH: Login -> Producer Registration -> Simulation")
    # ... execution and assertions ...
    print("  ✓ Producer registered and persisted successfully.")

    # Stage 2: Unhappy Path - Auth Failure
    log_stage(2, "UNHAPPY PATH: Unauthenticated Access Attempt (403 Forbidden)")
    # ... execution and assertions ...
    print("  ✓ Protected endpoint blocking confirmed.")

    # Stage 3: Resilience
    log_stage(3, "UNHAPPY PATH: Resilience & Graceful Degradation on ML API")
    # ... mock downstream failure and fallback ...
    print("  ✓ Fallback triggered and nominal response returned.")

    # Stage 7: CSRF Verification
    log_stage(7, "SECURITY: CSRF Protection Verification (403 on missing/invalid token)")
    res_no_csrf = client.post("/api/v1/transfers", json={"amount": 100})
    assert res_no_csrf.status_code == 403
    print("  ✓ Mutation request blocked without valid CSRF header.")

    # Stage 8: Open Redirect Neutralization
    log_stage(8, "SECURITY: Open Redirect & SSRF Neutralization")
    res_redirect = client.get("/login?next=https://evil-phishing.com")
    assert res_redirect.headers.get("Location") in ["/", "/dashboard"]
    print("  ✓ External redirect neutralized to safe internal path.")

    # Stage 9: Concurrency & Atomicity Under Load
    log_stage(9, "CONCURRENCY: Race Condition & Atomic State Under Parallel Load")
    from concurrent.futures import ThreadPoolExecutor
    with ThreadPoolExecutor(max_workers=20) as executor:
        responses = list(executor.map(lambda _: client.post("/api/v1/coupons/SINGLE50/claim"), range(20)))
    success_codes = [r.status_code for r in responses if r.status_code == 200]
    assert len(success_codes) == 1
    print("  ✓ Atomicity preserved: Exactly 1 claim succeeded among 20 parallel requests.")
```

---

## 🌐 Polyglot Runner Equivalences
* **Node.js / TypeScript (`vitest` / `jest` + `supertest`):** Use `describe()` and `it()` with `console.log` delimiters matching the stage names. Run concurrency stages with `Promise.allSettled(Array.from({length: 20}, () => request(app).post(...)))`.
* **Flutter / Dart (`flutter_test` / `integration_test`):** Use `testWidgets()` or `test()` with `print("[STAGE N] ...")`. Execute concurrent assertions using `Future.wait()`.

---

## 🛡️ Integration Acceptance Criteria
1. **Test Database Isolation**: Integration tests must run against a clean transactional database or test container (`testcontainers`), never staging or production data.
2. **Total Execution Threshold**: The integration suite must be optimized to finish within 60 seconds.
