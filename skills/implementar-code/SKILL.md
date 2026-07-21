---
name: "implementar-code"
description: "Atomic TDD execution by context batches (Red + Green). Generates AAA tests, boundary mocks, minimal SOLID code, synchronous checklist update, and Pivot management."
---

# Skill: Batch TDD Execution & Code Engineering (`implementar-code`)

This skill provides rigid technical guidelines for joint generation of tests and production code in a single API call.

---

## 🛠️ Resources & References
* **TDD & SOLID Execution Manual**: [references/EXECUTION.md](references/EXECUTION.md)
* **Pivot Register Template**: [resources/pivot_template.md](resources/pivot_template.md)
* **Big-O Profiling Template**: [resources/profiling_template.md](resources/profiling_template.md)
* **Docstring & SOLID Example**: [examples/docstring_example.py](examples/docstring_example.py)

---

## ⛔ Inviolable Execution Rules

1. **Call Atomicity (Red + Green + Checklist)**:
   * In the same API response for a batch, you must:
     1. Deliver full test suite code (Red).
     2. Deliver minimal production code satisfying those tests (Green).
     3. Update the `task_list.md` file marking batch items as completed (`[x]`).

2. **Strict AAA Pattern (Arrange-Act-Assert)**:
   * All tests must explicitly have sections demarcated with `# Arrange`, `# Act`, and `# Assert`.

3. **Inviolable Boundary Mocks**:
   * Isolate Database, external REST APIs, and File I/O with `unittest.mock` / `pytest-mock`.

4. **Strictly Minimal & SOLID Code**:
   * Write only what is necessary to make assertions pass.
   * Add full Type Hints and docstrings linked to the Obsidian Vault.

5. **Automatic Pivot Registration**:
   * If implementation requires deviation from the SDD, create the register in `02-auditorias/pivots-[feature-slug].md` using the resource template from the `@implementar-code` skill.