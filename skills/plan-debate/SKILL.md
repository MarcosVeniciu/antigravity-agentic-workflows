---
name: "plan-debate"
description: "Socratic scope discovery and Outcome-Based Prompting to extract desired end-states, align constraints, and generate comparative architectural proposals."
---

# Skill: Outcome-Based Scope Debate (`skills/plan-debate`)

Guides technical discovery during Phase 0 (`/decompose`) and Phase 1 (`/plan`), preventing the XY Problem by strictly isolating the desired business outcome from flexible implementation hypotheses.

## 🎯 Core Directives: Outcome-Based Prompting

1. **Focus on the Desired End State & Success Criteria (Fixed):**
   * Identify: *"What is the real, functional outcome and business rule the user needs to achieve?"*
   * **Mandatory Success Criteria:** Extract measurable signals of success (e.g., *"How do we know it worked without breaking X?"*, latency/throughput boundaries, backward compatibility, schema contracts).
   * The destination and acceptance boundaries are fixed; the implementation path is negotiable.
2. **Implementation Hints Are Just Hypotheses (Flexible):**
   * If the user suggests specific steps, files, or libraries ("how to do it"), treat them as clues of intent, **NEVER as hard constraints**.
   * Challenge fragile premises or technical debt. Propose superior patterns without hesitation.
3. **Iterative Surgical Interview (Dynamic & Adaptive):**
   * The total volume of questions is flexible and scales dynamically with domain complexity.
   * **Small Batches per Turn:** Never overwhelm the user with long questionnaires or walls of text. Ask 1 to 3 surgical, objective questions at a time.
   * **Primary Channel (`ask_question` Tool):** Always prefer the interactive `ask_question` tool whenever choices, scope limits, trade-offs, or error paths can be structured. Place the recommended option first with `(Recommended)`.
   * **Secondary Channel (Chat Fallback):** For exploratory questions, use the structured 3-part template from `resources/question_protocol.md`.
   * **Adaptive Follow-ups:** Allow new clarifying questions to emerge naturally based on the user's previous answers (uncovering hidden edge cases or business rules).
   * **Active Convergence:** Stop interviewing as soon as the functional outcome, boundaries, and measurable success criteria are clear enough to populate the proposals matrix.
4. **Architectural Proposal Matrix (2 to 3 Proposals Max):**
   * Consolidate understanding into 2 (default) or at most 3 distinct architectural approaches in `scope_proposals.md`:
     * **Proposal 1 (Pragmatic / Incremental):** Minimal friction with existing code, lowest implementation cost.
     * **Proposal 2 (Balanced / Hybrid - Optional):** Middle-ground balancing moderate refactoring with modern patterns, or an alternative technological vector (e.g., custom vs. library).
     * **Proposal 3 (Architecturally Ideal / Scalable):** Decoupled, modern best practices, ready for high scale.
   * **Strict Cap:** Never exceed 3 proposals to prevent cognitive overload and analysis paralysis.

## 🚪 Exit Criteria & Phase Transition
* The debate phase **terminates immediately** once the user approves or selects one of the proposals in `scope_proposals.md`.
* **Handover:** Delegate execution directly to `/plan` (to generate BDD scenarios and SDD blueprints) or `/decompose` (if architectural vertical slicing is required). Do not keep debating after proposal validation.


## 📋 Available Resources
* **Debate Rules & XY Problem Prevention:** `resources/debate_rules.md` from the `@plan-debate` skill.
* **Questioning Protocol & ask_question Tool:** `resources/question_protocol.md` from the `@plan-debate` skill.
* **Proposal Template:** `resources/template_proposals.md` from the `@plan-debate` skill.

