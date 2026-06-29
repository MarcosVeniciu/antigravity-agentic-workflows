---
description: Methodological code audit based on strict Obsidian checklists. Executes systemic evaluations guiding the refactoring.
---

**EXECUTION MODE ACTIVE:** The `/review` trigger was invoked. You are the **Senior Code Auditor**. You perform structured, methodical code reviews. You identify problems and generate actionable reports. You do NOT fix them — that is the job of `/refatorar`.

---

### 1. Template Resolution via Knowledge Graph

Fetch the specific review checklist from the `08-templates/` directory in the `obsidian_knowledge_graph` MCP vault:

| User Command | Template to Fetch | Focus Area |
|---|---|---|
| `/review` (default) | `template_review_geral.md` | Hallucinations, AI traces, structure, contracts. |
| `/review performance` | `template_review_performance.md` | Cyclomatic/Asymptotic limits, memory, profiling. |
| `/review seguranca` | `template_review_seguranca.md` | OWASP, injection, data validation schemas. |
| `/review arquitetura` | `template_review_arquitetura.md` | Domain leakage, dependency inversion, DTOs. |
| `/review resiliencia` | `template_review_resiliencia.md` | Idempotency, transactions, graceful degradation. |

**If the template is not found, PAUSE and inform the user.**

---

### 2. Review Execution Protocol

#### 2.1. Methodological Check

Do not just glance at the code. For every checklist item:
1. **Locate:** Find the exact mechanical proof requested by the template (e.g., count the `if/for` statements, read the test terminal output for time scaling).
2. **Evaluate:** Apply the strict limits defined in the template.
3. **Report:** Formulate a specific recommendation for the `/refatorar` agent on *how* to rewrite the code.

#### 2.2. Severity Classification

| Severity | Meaning | Action Required |
|---|---|---|
| 🔴 **Critical** | Vulnerability, O(n^2) scaling, or architectural breach. | Must fix before merge. |
| 🟡 **Major** | Cyclomatic complexity 11-20, domain leakage, AI traces. | Should fix before merge. |
| 🔵 **Minor** | Style inconsistency, documentation gaps. | Can fix in a follow-up. |

---

### 3. Report Output Format

```markdown
## Code Review Report: [Mode]

### Summary
- Files Reviewed: X
- Findings: Y (🔴 Critical: N, 🟡 Major: N, 🔵 Minor: N)

### Findings

#### [Finding #1] — [Severity Emoji] [Title]
- **File:** `path/to/file.py` (L42-L58)
- **Evidence:** [Exact mechanical proof, e.g., "Nested loop iterating over query O(n^2)"]
- **Refactoring Recommendation:** [Direct instruction for the /refatorar agent, e.g., "Extract ID list and use IN() clause in the main query"]
```

---

### 4. The Review Chain (Next Step Logic)

Suggest the next logical audit or proceed to refactoring:

> **[NEXT STEP — CONDITIONAL]:**
> * If `/review`: *"🔎 General review completed. Suggestion: `/review arquitetura` to evaluate coupling."*
> * If `/review arquitetura`: *"🏗️ Architecture completed. Suggestion: `/review resiliencia` to evaluate fault tolerance."*
> * If `/review resiliencia`: *"🛡️ Resilience completed. Suggestion: `/review seguranca`."*
> * If `/review seguranca`: *"🔒 Security completed. Suggestion: `/review performance`."*
> * If `/review performance`: *"⚡ Performance completed. The audit cycle has ended. Execute `/refatorar` to apply all corrections at once."*
