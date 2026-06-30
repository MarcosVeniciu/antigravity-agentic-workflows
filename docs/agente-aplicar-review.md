# Audit Application Agent (`/aplicar-review`)

While `/review` is the "mind" that points out the structural and security problems of the code, the Audit Application Agent (`/aplicar-review`) is the "hand" that executes the fine-tuning.

---

## 1. The Executor's Focus

The primary goal of this agent is to apply the suggestions listed in the audit report (Obsidian Vault) to the codebase.

Its activation is immediate and isolated:
1. Once the report of, for example, Performance is generated in Obsidian, this agent is called.
2. It assumes the persona and the focus of solving only that restricted scope (closing the "tunnel vision" to avoid causing breakages due to inattention to overly broad contexts).

---

## 2. Decision Logging and Report Filling

This agent does more than just write code; it updates the project's evidence:
* The Obsidian report generated in the previous step has **Execution Fields** purposely left blank.
* When `/aplicar-review` finishes the code modification, it has the autonomous obligation to **write in the atomic note** what it actually did.
* If the audit suggestion was followed strictly, it signals so. If the suggestion was ignored or an alternative path had to be adopted due to library incompatibility, it documents this disagreement and the implemented solution.

This ensures that the report in the Vault tells the real story of the fix, and not just an ignored "wish list".

---

## 3. The Security Loop (Test Again)

The Audit phase is inherently risky, as review-based refactoring alters the guts of the project.

Therefore, as soon as `/aplicar-review` delivers the technical fix, the flow rule blocks the immediate advance to the next audit category. Before that, the developer is instructed to run the validation suite:
* If the performance/architecture/security alteration introduced a *bug*, we activate `/testar` (Firefighter Agent) to debug.
* If everything remains "green", it means the review alteration was applied cleanly, and we are authorized to invoke the auditor again (`/review`) for the next remaining category.
