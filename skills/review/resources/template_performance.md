---
project: "{{PROJECT_NAME}}"
branch: "{{BRANCH_NAME}}"
date: "{{DATE}}"
type: "review-performance"
tags:
  - "review"
  - "performance"
---
# ⚡ Audit Report: Complexity & Resource Optimization

## 📊 Review Metadata
* **Associated Contract/SDD:** [[01-concepcao/sdd-{{FEATURE_SLUG}}]]
* **Global Status:** 🟡 Under Audit (Phase 1)

## 🔍 Detected Deviations and Evidence

### 🚨 [PERF-01] Resource Bottleneck / High Cyclomatic Complexity
* **Status:** - [ ] Pending Fix
* **Criticality:** [High | Medium | Low]
* **Location:** `path/to/file.py:lines`
* **Mechanical Evidence:**
```python
# The agent will inject here the N+1 query, O(n^2) search, or unnecessary in-memory materialization

```

* **System Impact:** 
* **Proposed Surgical Fix:** 
* **Resolution:** [Awaiting Phase 2 Application]

---

## 📈 Phase 1 Conclusion

* **Total Findings:** 
* **RequestFeedback:** true