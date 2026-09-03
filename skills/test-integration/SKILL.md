---
name: "test-integration"
description: "Use during Phase 6 (/release) for integration testing and E2E verification. Orchestrates multi-step integration test suites with structured terminal banners (Happy, Unhappy, Resilience)."
---

# Skill: Integration Testing & E2E Verification (`skills/test-integration`)

Orchestrates and executes integration and end-to-end (E2E) test suites within the consolidated release branch environment, ensuring multiple features coexist without breaking contracts or functional regressions.

## 🎯 Stage-Based Execution Pattern with Banners

Integration tests must output structured console banners for each validation stage:

```text
[STAGE 1] E2E HAPPY PATH: Complete Nominal Flow (e.g., Login -> Registration -> Execution -> Persistence)
[STAGE 2] UNHAPPY PATH: Unauthenticated Access Attempt (403 Forbidden)
[STAGE 3] UNHAPPY PATH: Invalid Credentials / Auth Failure (401 Unauthorized)
[STAGE 4] UNHAPPY PATH: Duplicate Entity Rejection (409 Conflict)
[STAGE 5] UNHAPPY PATH: Data Schema Validation Failure (422 Unprocessable Entity)
[STAGE 6] UNHAPPY PATH: Resilience & Graceful Degradation under Downstream Failure (HTTP 200 via Fallback)
```

## 📋 Available Resources
* **E2E Runner Patterns:** `references/e2e_runner_pattern.md` from the `@test-integration` skill.
* **Integration Report Template:** `resources/template_integration_log.md` from the `@test-integration` skill.
