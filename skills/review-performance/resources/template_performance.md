# Performance & Resource Efficiency Audit Report

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Base Branch:** `{{BASE_BRANCH}}` | **Commit Ref:** `{{COMMIT_SHA}}`  
**Execution Mode:** `{{MODE}}` *(Audit-Only | Authorized-Fix)* | **Date:** `{{DATE}}`

---

## Scope & Workload Context

- **Eligible Files:** `{{ELIGIBLE_FILES_COUNT}}`
- **Analyzed Files:** `{{ANALYZED_FILES_COUNT}}`
- **Expected Workload / Scale:** `{{ESTIMATED_VOLUME_OR_QPS}}` *(e.g. 100 req/s, batch of 50k rows, rare CLI invocation)*
- **Latency / Memory Constraints:** `{{SLA_OR_RESOURCE_LIMITS}}`
- **Analysis Limitations:** `{{LIMITATIONS_NOTES}}`

---

## Identified Findings

| ID | File / Line | Pattern Detected | Cost Category | Severity | Confidence | Disposition | Impact / Evidence |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `PRF-01` | `{{FILE}}:{{LINE}}` | N+1 Query / Nested Iteration | Iterative I/O / Algorithmic $O(N^2)$ | High / Med / Low | High / Med / Low | Pending / Confirmed / Dismissed / Fixed | Repetitive queries or unbounded search |

---

## Authorized Surgical Optimizations (Mode B Only)

> [!NOTE]
> In **Mode A (Audit-Only)**, no source code or git history modifications are performed.
> In **Mode B (Authorized-Fix)**, document below only the surgical optimizations authorized and performed:

- [ ] `{{PRF-ID}}`: Replaced N+1 query pattern with batch query (`IN` clause / JOIN) for `{{ENTITY}}`.
- [ ] `{{PRF-ID}}`: Converted linear search into indexed/hash lookup without altering ordering semantics.
- [ ] `{{PRF-ID}}`: Converted full memory loading to streaming / generators (`yield`).

---

## Validation & Benchmark / Test Metrics

- **Benchmark / Test Command:** `{{BENCHMARK_OR_TEST_COMMAND}}`
- **Observed Metrics:**
  - Before: `{{BEFORE_METRICS}}` *(e.g. 50 queries, 220ms)*
  - After: `{{AFTER_METRICS}}` *(e.g. 2 queries, 15ms)*
- **Test Suite Metrics:** Executed: `{{TOTAL_TESTS}}` | Passed: `{{PASSED_TESTS}}` | Failed: `{{FAILED_TESTS}}` | Skipped: `{{SKIPPED_TESTS}}`
- **Git Checkpoint (Mode B Only):** `{{GIT_CHECKPOINT_HASH_OR_N_A}}`

---

## Conclusion & Gate Decision

- **Decision:** `{{DECISION}}` *(APPROVED_CLEAN | BLOCKED_ON_FINDINGS | INCONCLUSIVE)*
- **Justification / Residual Risk:** `{{JUSTIFICATION_OR_RESIDUAL_RISK}}`
