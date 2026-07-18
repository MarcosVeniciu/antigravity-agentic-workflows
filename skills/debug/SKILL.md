---
name: "debug"
description: "Forensic bug investigation and root cause analysis skill (5 Whys). Diagnoses runtime failures, infrastructure crashes, and production integration errors."
---

# Skill: Forensic Bug Investigator (`skills/debug`)

This skill guides the methodical diagnosis of runtime errors, unhandled crashes not caught by unit tests, and integration failures through application of the **5 Whys** technique. Always communicate with the user in Portuguese.

---

## 🛠️ Execution Guide & Methodology

Consult the detailed methodology in:
* [5 Whys Framework & Forensic Diagnosis](references/5_whys_framework.md)

---

## 📁 Resources & Templates

* **Interactive Artifact Template**: [template_root_cause.md](resources/template_root_cause.md)

---

## 🔄 Operational Workflow

1. **Pre-flight & Evidence Extraction**:
   * Analyze the user-provided log/stacktrace (exception, HTTP status, affected component).
   * Consult `02-auditorias/` (`pivots-[feature-slug].md`) and `00-core-rules/` in the Obsidian Vault to map similar bugs resolved in the past.

2. **Hypothesis Formulation & Root Cause**:
   * Formulate 2 hypotheses ranked by probability based on the 5 Whys execution flow.
   * Isolate the file, line, and reason why existing tests failed to catch the bug.

3. **Issuing Interactive Artifact**:
   * Issue the `root_cause_analysis.md` artifact with `UserFacing: true` and **`RequestFeedback: true`** based on the template in `resources/template_root_cause.md`.
   * Wait for user approval (the **Proceed** button) before editing any line of code.

4. **Obsidian Vault Persistence**:
   * Upon approval, suggest documenting the resolution under `02-auditorias/pivots-[feature-slug].md` via the cross-cutting `grafo` skill.

---

## ⛔ Rules & Constraints

1. **Mandatory Pause**: Always issue `root_cause_analysis.md` with `RequestFeedback: true` prior to proposing changes.
2. **Guessing Prohibited**: If evidence is missing, request logs/configs from the user before finalizing the report.
3. **Isolated Bash Blocks**: Any test or diagnostic commands must be provided in individual `bash` blocks.

---

## ✅ Validation Checklist

- [ ] Were 2 hypotheses analyzed with pros and cons in the artifact?
- [ ] Was `root_cause_analysis.md` issued with `RequestFeedback: true`?
- [ ] Does the solution include a regression test to prevent bug recurrence?
- [ ] Was persisting lessons learned under `02-auditorias/pivots-[feature-slug].md` in the vault suggested?

