---
project: "{{PROJECT_NAME}}"
branch: "{{BRANCH_NAME}}"
date: "{{DATE}}"
type: "review-seguranca"
tags:
  - "review"
  - "seguranca"
---
# 🛡️ Audit Report: Security & OWASP Top 10

## 📊 Review Metadata
* **Associated Contract/SDD:** [[01-concepcao/sdd-{{FEATURE_SLUG}}]]
* **Global Status:** 🟡 Under Audit (Phase 1)

## 🔍 Detected Deviations and Evidence

### 🚨 [SEC-01] Detected Vulnerability
* **Status:** - [ ] Pending Fix
* **Criticality:** [High | Medium | Low]
* **Location:** `path/to/file.py:lines`
* **Mechanical Evidence:**
```python
# The agent will inject here unsafe concatenation, exposed secret, or IDOR flaw

```

* **System Impact:** 
* **Proposed Surgical Fix:** 
* **Resolution:** [Awaiting Phase 2 Application]

---

## 📈 Phase 1 Conclusion

* **Total Findings:** 
* **RequestFeedback:** true