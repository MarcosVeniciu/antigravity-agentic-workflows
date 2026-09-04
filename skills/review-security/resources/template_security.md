# 🛡️ Security Audit (OWASP & ASVS)

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Scope Analyzed:** Git diff against `develop` (`{{FILES_COUNT}}` files)

---

## 🔍 Vulnerabilities Identified in Diff

| File / Line | OWASP Category | Severity | Risk Description |
| :--- | :--- | :--- | :--- |
| `{{FILE}}:{{LINE}}` | Injection / Secrets / IDOR | High / Medium | Description |

---

## 🛠️ Mitigations Applied
- [x] Strict parameterization of database queries and shell calls.
- [x] Secrets moved to environment variables.
- [x] Sensitive PII masked in log statements.

---

## 🚦 Validation & Tests
- [x] 100% unit tests passing green following mitigations.
- [x] Micro-checkpoint recorded via `skills/git` (Mode 2).
