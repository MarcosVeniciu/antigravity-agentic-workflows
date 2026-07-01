# Audit Application Agent (`/aplicar-review`)

While `/review` is the "mind" that points out the structural and security problems of the code, the Audit Application Agent (`/aplicar-review`) is the "hand" that executes the fine-tuning.

---

## 1. The Executor's Focus

The primary goal of this agent is to apply the suggestions listed in the audit report to the codebase.

Its activation is immediate and isolated:
1. Once the report (e.g., Performance) is generated, this agent is called.
2. It parses the `audit_report.md` artifact and creates a `task.md` checklist containing all the identified flaws.
3. Using the **Iterative Update Rule**, it addresses **one task at a time** (marking `[/]` and then `[x]`), preventing it from getting overwhelmed and breaking working logic.

---

## 2. Decision Logging and Report Filling

This agent does more than just write code; it updates the project's evidence:
* The report generated in the previous step has **Execution Fields** (Resolution) purposely left blank.
* When `/aplicar-review` finishes a code modification, it updates the `audit_report.md` artifact by checking the box and filling the resolution field with exactly what was done.
* **Vault Synchronization:** Crucially, it must also update the permanent copy of the report saved in the Obsidian Vault using the MCP tool.
* If a suggestion was ignored or an alternative path was adopted, it documents this disagreement in the resolution field. This ensures that the report in the Vault tells the real story of the fix.

---

## 3. The Security Loop (Test Again)

The Audit phase is inherently risky, as review-based refactoring alters the guts of the project.

Therefore, as soon as `/aplicar-review` delivers the technical fix, the flow rule blocks the immediate advance to the next audit category. Before that, the developer is instructed to run the validation suite (via a provided isolated `bash` block containing the test execution command):
* If the performance/architecture/security alteration introduced a *bug*, we activate `/testar` (Firefighter Agent) to debug.
* If everything remains "green", we are authorized to invoke the auditor (`/review [type]`) again for the next remaining category in the Review Chain.
