# Architecture & Coupling Audit Report

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Base Branch:** `{{BASE_BRANCH}}` | **Commit Ref:** `{{COMMIT_SHA}}`  
**Execution Mode:** `{{MODE}}` *(Audit-Only | Authorized-Fix)* | **Date:** `{{DATE}}`

---

## Scope & Coverage

- **Eligible Files:** `{{ELIGIBLE_FILES_COUNT}}`
- **Analyzed Files:** `{{ANALYZED_FILES_COUNT}}`
- **Excluded Files:** `{{EXCLUDED_FILES_OR_PATTERNS}}`
- **Tool Execution Status:** `{{TOOL_STATUS}}` *(CONCLUDED_CLEAN | FINDINGS_DETECTED | PARTIAL_LIMITATION | N_A)*
- **Analysis Limitations:** `{{LIMITATIONS_NOTES}}`

---

## Identified Findings

| ID | File / Line | Architectural Principle | Severity | Confidence | Disposition | Impact / Description |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `ARC-01` | `{{FILE}}:{{LINE}}` | Dependency Inversion / Boundaries | High / Med / Low | High / Med / Low | Pending / Confirmed / Dismissed / Fixed | Description of coupling or leakage |

---

## Authorized Surgical Fixes (Mode B Only)

> [!NOTE]
> In **Mode A (Audit-Only)**, no source code or git history modifications are performed.
> In **Mode B (Authorized-Fix)**, document below only the surgical changes authorized and performed:

- [ ] `{{ARC-ID}}`: Applied dependency injection via constructor for `{{CLASS_OR_PORT}}`.
- [ ] `{{ARC-ID}}`: Decoupled domain entity from infrastructure package.

---

## Validation & Test Metrics

- **Test Suite Command:** `{{TEST_COMMAND}}`
- **Test Metrics:** Executed: `{{TOTAL_TESTS}}` | Passed: `{{PASSED_TESTS}}` | Failed: `{{FAILED_TESTS}}` | Skipped: `{{SKIPPED_TESTS}}`
- **Git Checkpoint (Mode B Only):** `{{GIT_CHECKPOINT_HASH_OR_N_A}}`

---

## Conclusion & Gate Decision

- **Decision:** `{{DECISION}}` *(APPROVED_CLEAN | BLOCKED_ON_FINDINGS | INCONCLUSIVE)*
- **Justification / Residual Risk:** `{{JUSTIFICATION_OR_RESIDUAL_RISK}}`
