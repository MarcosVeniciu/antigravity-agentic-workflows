# 🛡️ Resilience & Fault Tolerance Audit Report

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Base Branch:** `{{BASE_BRANCH}}` | **Commit Ref:** `{{COMMIT_SHA}}`  
**Execution Mode:** `{{MODE}}` *(Audit-Only | Authorized-Fix)* | **Date:** `{{DATE}}`

---

## 📋 Scope & Dependency Matrix

- **Eligible Files:** `{{ELIGIBLE_FILES_COUNT}}`
- **Analyzed Files:** `{{ANALYZED_FILES_COUNT}}`
- **External Dependencies Evaluated:** `{{DEPENDENCIES_LIST}}` *(HTTP APIs, DB, Message Queues, Cache)*
- **Analysis Limitations:** `{{LIMITATIONS_NOTES}}`

---

## 🔍 Identified Findings

| ID | File / Line | Failure Scenario | Idempotent? | Severity | Confidence | Disposition | Operational Risk / Root Cause |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `RES-01` | `{{FILE}}:{{LINE}}` | Downstream Latency / 5xx Error | Yes / No / Unknown | High / Med / Low | High / Med / Low | Pending / Confirmed / Dismissed / Fixed | Missing timeout or unsafe retry |

---

## 🛠️ Authorized Surgical Hardening (Mode B Only)

> [!NOTE]
> In **Mode A (Audit-Only)**, no source code or git history modifications are performed.
> In **Mode B (Authorized-Fix)**, document below only the surgical hardening authorized and performed:

- [ ] `{{RES-ID}}`: Configured explicit connect and read timeouts on client for `{{SERVICE}}`.
- [ ] `{{RES-ID}}`: Added retry with exponential backoff, jitter, and idempotency key check.
- [ ] `{{RES-ID}}`: Implemented safe fallback degradation preserving security and transactional correctness.

---

## 🚦 Validation & Fault Injection / Test Metrics

- **Fault Simulation / Test Command:** `{{FAULT_TEST_COMMAND}}`
- **Observed Behavior:** `{{OBSERVED_DEGRADATION_BEHAVIOR}}`
- **Test Suite Metrics:** Executed: `{{TOTAL_TESTS}}` | Passed: `{{PASSED_TESTS}}` | Failed: `{{FAILED_TESTS}}` | Skipped: `{{SKIPPED_TESTS}}`
- **Git Checkpoint (Mode B Only):** `{{GIT_CHECKPOINT_HASH_OR_N_A}}`

---

## 🏁 Conclusion & Gate Decision

- **Decision:** `{{DECISION}}` *(APPROVED_CLEAN | BLOCKED_ON_FINDINGS | INCONCLUSIVE)*
- **Justification / Residual Risk:** `{{JUSTIFICATION_OR_RESIDUAL_RISK}}`
