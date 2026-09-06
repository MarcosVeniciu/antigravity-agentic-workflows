# 🛡️ Security Audit Report (OWASP & ASVS Aligned)

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Base Branch:** `{{BASE_BRANCH}}` | **Commit Ref:** `{{COMMIT_SHA}}`  
**Execution Mode:** `{{MODE}}` *(Audit-Only | Authorized-Fix)* | **Date:** `{{DATE}}`

---

## 📋 Scope & Coverage

- **Eligible Files:** `{{ELIGIBLE_FILES_COUNT}}`
- **Analyzed Files:** `{{ANALYZED_FILES_COUNT}}`
- **Excluded Files:** `{{EXCLUDED_FILES_OR_PATTERNS}}`
- **Scanner Status (`scan_sinks.py`):** `{{SCANNER_STATUS}}` *(CONCLUDED_CLEAN | FINDINGS_DETECTED | PARTIAL_LIMITATION | N_A)*
- **Analysis Limitations:** `{{LIMITATIONS_NOTES}}`

---

## 🔍 Identified Findings

> [!CAUTION]
> **Sanitization Requirement:** Never paste raw secrets, credentials, or unmasked PII in the table below. Use `***REDACTED***`.

| ID | File / Line | OWASP / ASVS Category | Severity | Confidence | Disposition | Impact / Description |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `SEC-01` | `{{FILE}}:{{LINE}}` | Injection / Secrets / BPOA | High / Med / Low | High / Med / Low | Pending / Confirmed / Dismissed / Fixed | Sanitized description of vulnerability or risk |

---

## 🛠️ Authorized Surgical Mitigations (Mode B Only)

> [!NOTE]
> In **Mode A (Audit-Only)**, no source code or git history modifications are performed.
> In **Mode B (Authorized-Fix)**, document below only the surgical mitigations authorized and performed:

- [ ] `{{SEC-ID}}`: Applied parameterized queries / escaped inputs for `{{TARGET_FUNCTION}}`.
- [ ] `{{SEC-ID}}`: Configured secrets via environment variables and checked history for revocation.
- [ ] `{{SEC-ID}}`: Masked sensitive PII fields in logging statements.

---

## 🚦 Validation & Test Metrics

- **Test Suite Command:** `{{TEST_COMMAND}}`
- **Test Metrics:** Executed: `{{TOTAL_TESTS}}` | Passed: `{{PASSED_TESTS}}` | Failed: `{{FAILED_TESTS}}` | Skipped: `{{SKIPPED_TESTS}}`
- **Security Regression Tests:** `{{SECURITY_TEST_CASES_VERIFIED}}`
- **Git Checkpoint (Mode B Only):** `{{GIT_CHECKPOINT_HASH_OR_N_A}}`

---

## 🏁 Conclusion & Gate Decision

- **Decision:** `{{DECISION}}` *(APPROVED_CLEAN | BLOCKED_ON_FINDINGS | INCONCLUSIVE)*
- **Justification / Residual Risk:** `{{JUSTIFICATION_OR_RESIDUAL_RISK}}`
