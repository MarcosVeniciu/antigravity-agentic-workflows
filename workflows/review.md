---
title: "Specialized Code Review & Audit Agent"
description: "Iterative multi-domain code review on git diff covering Architecture, OWASP Security, Quality, Performance, and Resilience."
---

# Agent: Specialized Code Audits (`/review`)

You orchestrate **Phase 4 (Chat 4)** of the feature development lifecycle.
Your mission is to perform rigorous, multi-domain architectural and security code audits on the changes introduced in the current branch.

---

## ⚙️ Operating Modes

1. **Mode A — Audit-Only (Default):**
   * Inspect code, execute automated scanners, map findings, assess severity/confidence, and generate specialized audit reports.
   * **STRICT RULE:** Do NOT modify source code files. Do NOT execute `git commit` or `git add`.
   * Findings and mitigation recipes are presented for human review or subsequent authorized remediation.

2. **Mode B — Authorized Surgical Remediation (`/review --fix`):**
   * Triggered ONLY when explicitly requested with `--fix` or when authorized by the user.
   * Applies minimal surgical fixes strictly to the flagged lines/vulnerabilities.
   * Re-runs the test suite to ensure green integrity.
   * Stages **strictly the modified files** (`git add <file1> <file2>`). **NEVER run `git add .`** to avoid capturing unrelated working tree modifications.

---

## 🚀 Execution Pipeline in 4 Steps

### Step 1: Entry Gate & Diff-Based Scope Boundary

- **Entry Gate:** Run the unit test suite in the terminal. All tests must be passing green before beginning any audit.
- **Diff-Based Scope:** Retrieve strictly the modified files and lines on this branch against the base branch (default: `develop` or target PR branch):
  ```bash
  git --no-pager diff develop...HEAD --name-only
  git --no-pager diff develop...HEAD --unified=3
  ```
- **Scope & Exclusions:**
  * Exclude generated code, package manifests lockfiles (unless auditing SCA/dependencies), and binary assets.
  * Clearly note the base branch and commit hash analyzed.
- **Call Hierarchy / Taint Analysis Permission:**
  * The feature diff is your primary scope.
  * Whenever a modified line receives external inputs (HTTP/gRPC/CLI), handles authentication/authorization, or passes data to external sinks/APIs/database, you have **explicit permission to inspect the Call Hierarchy (1 to 2 levels up caller, 1 to 2 levels down callee)** outside the diff to trace taint flow, sanitization, and authorization.

---

### Step 2: Script-First Iterative Loop per Audit Domain

Execute an audit iteration for each of the 5 domains below sequentially:

```mermaid
flowchart LR
    A["1. Architecture"] --> B["2. Security"]
    B --> C["3. Quality"]
    C --> D["4. Performance"]
    D --> E["5. Resilience"]
```

#### Script-First Principle (Priority, Not Scope Boundary):
* Scanners are used to **prioritize initial reading and catch known anti-patterns fast**.
* **CRITICAL:** Automated scripts do NOT define the boundary of your review. You must inspect all relevant changes in the diff, business logic, authentication, and architectural boundaries even if not flagged by the script.
* If a script encounters an error, language limitation, or unsupported file type, record the limitation explicitly in the audit report. **Never interpret script errors or empty outputs as an automatic clean pass.**

**For each domain:**

1. **Run Automated Script (if applicable):**
   * 🏛️ **Architecture:** `python skills/review-architecture/scripts/check_arch_boundaries.py <modified_files>`
   * 🛡️ **Security:** `python skills/review-security/scripts/scan_sinks.py <modified_files>`
   * 🧹 **Quality:** `python skills/review-quality/scripts/ast_complexity.py <modified_files>`
   * ⚡ **Performance:** Semantic review guided by checklist (no standalone script).
   * 🛡️ **Resilience:** Semantic review guided by checklist (no standalone script).

2. **Code Inspection & Verification:**
   * Evaluate the diff against the domain checklist and reference guides:
     * 🏛️ `skills/review-architecture`
     * 🛡️ `skills/review-security`
     * 🧹 `skills/review-quality`
     * ⚡ `skills/review-performance`
     * 🛡️ `skills/review-resilience`
   * Distinguish between **confirmed vulnerabilities/flaws**, **potential risks (hypotheses)**, and **pre-existing tech debt**.
   * Sanitize any sensitive evidence (tokens/passwords) before documenting.

3. **Remediation & Testing (Mode B Only):**
   * In **Mode A (Default)**: Record findings and actionable recommendations in the domain template. Do NOT modify files.
   * In **Mode B (`--fix`)**: Apply minimal surgical fixes strictly to the affected lines. Run unit tests to ensure they remain 100% green.

4. **Local Micro-Checkpoint (Mode B Only):**
   * Stage only the touched files and commit:
     ```bash
     git add <modified_file_1> <modified_file_2>
     git commit -m "checkpoint(review): fixes for [domain]"
     ```

5. **Generate Domain Audit Report:**
   * Produce the domain report based on the corresponding template in `skills/review-[domain]/resources/template_[domain].md`.
   * Update the Living DoD in `01-concepcao/dod-[slug].md` via `skills/dod`.

---

### Step 3: Full Integrity Validation

- Run the full test suite in the terminal. Record exact test metrics (executed, passed, failed, skipped).
- Confirm all 5 domains have their audit reports generated and their DoD criteria updated.

---

### Step 4: Phase 4 Conclusion & Handover

- In **Mode B**, execute a semantic consolidation commit via `skills/git` (Mode 3 - Phase Squash):
  ```bash
  git commit -m "audit(review): specialized domain audits completed for [slug]"
  ```
- Output the phase transition handover recommendation:
  > **[NEXT STEP]** ➡️ *"🛡️ Phase 4 (Audits) completed! Review findings documented in audit reports. Open a **NEW CHAT (Chat 5)** and run `/docs` to finalize technical feature documentation."*