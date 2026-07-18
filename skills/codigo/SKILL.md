---
name: "codigo"
description: "TDD Green Phase implementation skill. Writes minimal functional code with standardized docstrings, SOLID principles, and task management."
---

# Skill: TDD Green Phase & Production Coding (`skills/codigo`)

Manages the implementation phase of the TDD cycle (Green Phase), writing minimal, clean code to satisfy tests created by the testing skill. Always communicate with the user in Portuguese.

---

## 🛠️ Execution Guide

Consult detailed operational instructions in the reference file:
* [Implementation Engineer Execution Manual (Green Phase)](references/EXECUTION.md)

---

## 📁 Resources, Example & Templates

* **Docstring & Type Hint Example**: [docstring_example.py](examples/docstring_example.py)
* **Iterative Checklist Template (`task.md`)**: [task_template.md](resources/task_template.md)
* **Pivots & Local Deviations Template**: [pivot_template.md](resources/pivot_template.md) (saved in `02-auditorias/pivots-[slug].md` via `grafo` skill if TDD adaptations occur).

---

## ⛔ Universal Rules & Constraints

1. **Minimal Necessary Code**: Write strictly the code required to make test assertions pass. Zero dead code or untested features.
2. **Local Micro-Checkpoints**: For each implemented component or resolved assertion, trigger Mode 1 of the `git` skill (`git commit -m "checkpoint(codigo): ..."`).
3. **Iterative `task.md` Updates**: Never mark all tasks complete at once. Mark `[/]` when starting an item and `[x]` upon finishing the corresponding change.
4. **Docstrings and Explicit Typing**: Use Type Hints and detailed docstrings with the formal link `Ref: Obsidian note [[note-name]]`.
5. **Promote-on-Impact**: If a global convention is modified during coding, create the corresponding note in `00-core-rules/adrs/` (`type: adr`) via the `grafo` skill.

---

## ✅ Validation Checklist & Verification Method

- [ ] Was the `task.md` task list maintained and updated iteratively?
- [ ] Does the code adhere to SOLID principles (with indications in comments/docstrings)?
- [ ] Do all methods feature Type Hints and standardized docstrings?
- [ ] Were intermediate micro-checkpoints generated using the `git` skill (Mode 1)?
- [ ] Was the test command provided in an isolated `bash` block without autonomous execution?
- [ ] Confirmed 100% green status on unit test suite?

