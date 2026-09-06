# 🧹 Code Quality & Maintainability Audit Report

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Base Branch:** `{{BASE_BRANCH}}` | **Commit Ref:** `{{COMMIT_SHA}}`  
**Execution Mode:** `{{MODE}}` *(Audit-Only | Authorized-Fix)* | **Date:** `{{DATE}}`

---

## 📋 Scope & Coverage

- **Eligible Files:** `{{ELIGIBLE_FILES_COUNT}}`
- **Analyzed Files:** `{{ANALYZED_FILES_COUNT}}`
- **Excluded Files:** `{{EXCLUDED_FILES_OR_PATTERNS}}`
- **AST Scanner Status (`ast_complexity.py`):** `{{SCANNER_STATUS}}` *(CONCLUDED_CLEAN | FINDINGS_DETECTED | PARTIAL_LIMITATION | N_A)*
- **Analysis Limitations:** `{{LIMITATIONS_NOTES}}` *(e.g. AST tool evaluates Python only; JS/TS/Dart evaluated via linters/manual inspection)*

---

## 📊 AST Complexity Breakdown ($V(G) \le 10$)

```text
{{AST_COMPLEXITY_OUTPUT_SUMMARY}}
```

---

## 🔍 Identified Findings

| ID | File / Line | Element / Function | Metric / Issue | Severity | Confidence | Disposition | Description & Recommendation |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `QLT-01` | `{{FILE}}:{{LINE}}` | `{{FUNCTION_NAME}}` | $V(G) = {{VG}}$ / Deep Nesting | High / Med / Low | High / Med / Low | Pending / Confirmed / Dismissed / Fixed | Guard clauses / Helper extraction |

---

## 🛠️ Authorized Surgical Refactoring (Mode B Only)

> [!NOTE]
> In **Mode A (Audit-Only)**, no source code or git history modifications are performed.
> In **Mode B (Authorized-Fix)**, document below only the surgical refactoring authorized and performed:

- [ ] `{{QLT-ID}}`: Decomposed function `{{FUNCTION_NAME}}` to reduce $V(G)$ from `{{OLD_VG}}` to `{{NEW_VG}}`.
- [ ] `{{QLT-ID}}`: Removed dead code, unused imports, or flattened pyramid nesting.

---

## 🚦 Validation & Test Metrics

- **Test Suite Command:** `{{TEST_COMMAND}}`
- **Test Metrics:** Executed: `{{TOTAL_TESTS}}` | Passed: `{{PASSED_TESTS}}` | Failed: `{{FAILED_TESTS}}` | Skipped: `{{SKIPPED_TESTS}}`
- **Git Checkpoint (Mode B Only):** `{{GIT_CHECKPOINT_HASH_OR_N_A}}`

---

## 🏁 Conclusion & Gate Decision

- **Decision:** `{{DECISION}}` *(APPROVED_CLEAN | BLOCKED_ON_FINDINGS | INCONCLUSIVE)*
- **Justification / Residual Risk:** `{{JUSTIFICATION_OR_RESIDUAL_RISK}}`
