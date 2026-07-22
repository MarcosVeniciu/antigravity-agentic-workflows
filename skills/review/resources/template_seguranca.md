---
project: "{{PROJECT_NAME}}"
branch: "{{BRANCH_NAME}}"
date: "{{DATE}}"
type: "review-seguranca"
tags:
  - "review"
  - "seguranca"
---
# 🛡️ Audit Report: Security (OWASP v2.0 & ASVS Aligned)

## 📊 Review Metadata
* **Associated Contract/SDD:** [[01-concepcao/sdd-{{FEATURE_SLUG}}]]
* **Global Status:** 🟡 Under Audit (Phase 1)
* **Pre-flight Check:** [ ] SCA Dependencies Verified | [ ] Secret Scan Clean

## 🔍 Detected Deviations and Evidence

### 🚨 [SEC-01] Detected Vulnerability
* **Status:** - [ ] Pending Fix
* **OWASP Category:** `[e.g. A01:2021-Broken Access Control | A03:2021-Injection | A09:2021-Logging Failures]`
* **Risk Rating (OWASP):** `[CRÍTICO | ALTO | MÉDIO | BAIXO]` (Likelihood × Impact)
* **Location:** `path/to/file.py:lines`

#### 🔴 Before (Unsafe):
```python
# Unsafe code snippet (e.g. string concatenation, exposed secret, IDOR flaw, missing log masking)

```

#### 🟢 After (Proposed Surgical Fix):
```python
# Proposed safe code snippet (e.g. parameterized query, secret vault, ownership check, generic error response)

```

* **System Impact:** 
* **Resolution:** [Awaiting Phase 2 Application]

---

## 🔒 Privacy & Audit Verification Check
* [ ] No hardcoded secrets or API keys in diff.
* [ ] No PII (LGPD/GDPR) or credentials exposed in logs.
* [ ] No stack traces or internal errors exposed to client responses.

---

## 📈 Phase 1 Conclusion

* **Total Findings:** 
* **RequestFeedback:** true