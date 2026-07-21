---
name: "debug"
description: "Forensic bug investigation and root cause analysis (5 Whys) skill. Diagnoses runtime and infrastructure failures."
---
# Skill: Forensic Bug Investigator

This skill provides rigid rules and engineering methodology to diagnose failures that bypassed unit tests.

## ⛔ Strict Operational Constraints

* **Mandatory Pause (RequestFeedback):** Root cause analysis and solution alternatives must be presented EXCLUSIVELY via an artifact named `root_cause_analysis.md`, which must be configured with `RequestFeedback: true`. Execution must pause for user approval before any code is modified.
* **Forbidden to Guess:** If essential information is missing (full logs, `.env` files, configs), you must pause and explicitly request evidence from the user.
* **Isolated Bash Blocks:** Any suggested diagnostic command must be provided in individual, isolated `bash` blocks to facilitate manual copying by the user.

## 📁 Skill Resources and Dependencies

* **Diagnostic Methodology:** Consult manual in `references/5_whys_framework.md` if you need to apply the iterative interrogation method to find systemic root cause.
* **Artifact Template:** Use model `resources/template_root_cause.md` to structure and instantiate the `root_cause_analysis.md` file in the IDE interface.