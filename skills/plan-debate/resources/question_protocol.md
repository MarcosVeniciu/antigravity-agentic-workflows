# Questioning Protocol & Interaction Design

This document establishes the interaction patterns for conducting the technical interview in Phase 0 (`/decompose`) and Phase 1 (`/plan`) during the `@plan-debate` workflow.

---

## Core Interview Principles

1. **Dynamic & Adaptive Volume:** The total number of questions is not fixed; it scales with domain complexity and naturally evolves based on answers from previous turns.
2. **Small Batches per Turn (3 to 5 Questions):** Never send overwhelming questionnaires or walls of text. Keep batches small so the user can easily digest and respond.
3. **Active Convergence:** Stop interviewing as soon as the functional outcome, boundary rules, and measurable acceptance criteria are clear enough to formulate architectural proposals in `scope_proposals.md`.

---

## Primary Channel: The `ask_question` Tool

Whenever questions can be structured into clear choices, architectural trade-offs, scope boundaries, or error handling paths, **always prefer using the interactive `ask_question` tool** instead of plain chat text.

### Best Practices for `ask_question`:
* **Concrete Choices:** Provide 2 to 4 actionable, distinct options.
* **Recommendation First:** Always prefix the optimal or industry-standard choice with `(Recommended)` and place it as the first option.
* **User's Perspective:** Format options as direct responses from the user (e.g., *"Persist to DB before publishing event"*, NOT *"The agent will persist..."*).
* **Multi-Select:** Set `is_multi_select: true` when multiple orthogonal choices can coexist.
* **Built-in Fallback:** Do NOT add an "Other" option manually; the IDE modal automatically provides a write-in field.
* **Markdown Links:** Use markdown links (e.g., `[filename](file:///path/to/file)`) when referring to specific files or components.

---

## Secondary Channel: Open Fallback Template (Chat Text)

If a question is purely exploratory, subjective, or cannot be reasonably formulated as structured options, format it as a distinct markdown block in chat using the 3-part pattern:

```markdown
* **Scope Impact:** [Why this question is critical to business rules, boundaries, or failure modes]
* **Question:** [Direct, surgical question]
* **Recommended Hypothesis:** [Default technical assumption if the user doesn't express a preference]
```
