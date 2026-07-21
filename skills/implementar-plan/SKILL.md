---
name: "implementar-plan"
description: "TDD architectural decomposition intelligence. Analyzes BDD/SDD in Obsidian Vault and generates plans and checklists grouped by Context Batches."
---

# Skill: Context Batch Planning (`implementar-plan`)

This skill governs requirement analysis and structuring of TDD implementation plans optimized for reduced token consumption.

---

## 🛠️ Resources & References
* **Decomposition Manual**: [references/EXECUTION.md](references/EXECUTION.md)
* **Plan Template**: [resources/plan_template.md](resources/plan_template.md)
* **Checklist Template**: [resources/task_template.md](resources/task_template.md)

---

## ⛔ Inviolable Planning Rules

1. **Grouping by Dependent Context**:
   * Forbidden to create task lists purely based on isolated files.
   * Map couplings and interdependencies. Components that directly depend on each other (e.g., Model + Repository + Service) MUST be grouped in the same **Context Batch**.

2. **Integrated Batch Structure**:
   * Each context batch in the checklist must clearly specify tests to be created and corresponding production code to be delivered in the same cycle.

3. **Inclusion of Phase N (Closure Validation)**:
   * The checklist must mandatorily end with a global validation and test execution phase.