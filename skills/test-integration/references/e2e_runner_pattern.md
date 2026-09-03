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
```

---

## 🛡️ Integration Acceptance Criteria
1. **Test Database Isolation**: Integration tests must run against a clean transactional database or test container (`testcontainers`), never staging or production data.
2. **Total Execution Threshold**: The integration suite must be optimized to finish within 60 seconds.
