---
name: "plan-debate"
description: "Use during Phase 0 (/decompose) and Phase 1 (/plan) for Socratic scope discovery and Outcome-Based Prompting. Extracts desired end-state, treats implementation hints as hypotheses, asks 2-4 surgical questions, and generates comparative proposals (Pragmatic vs Ideal)."
---

# Skill: Outcome-Based Scope Debate (`skills/plan-debate`)

Guides technical discovery during Phase 0 (`/decompose`) and Phase 1 (`/plan`), preventing the XY Problem by strictly isolating the desired business outcome from flexible implementation hypotheses.

## 🎯 Core Directives: Outcome-Based Prompting

1. **Focus on the Desired End State (Fixed):**
   * Identify: *"What is the real, functional outcome and business rule the user needs to achieve?"*
   * The destination is fixed; the implementation path is negotiable.
2. **Implementation Hints Are Just Hypotheses (Flexible):**
   * If the user suggests specific steps, files, or libraries ("how to do it"), treat them as clues of intent, **NEVER as hard constraints**.
   * Challenge fragile premises or technical debt. Propose superior patterns without hesitation.
3. **Surgical Interview (2 to 4 Questions Max):**
   * Never overwhelm the user with long questionnaires.
   * Ask 2 to 4 objective questions addressing genuine gaps in business rules, scope boundaries, or edge cases.
4. **Dual Proposal Matrix:**
   * Always consolidate understanding into two distinct architectural approaches in `scope_proposals.md`:
     * **Proposal 1 (Pragmatic / Incremental):** Minimal friction with existing code, lowest implementation cost.
     * **Proposal 2 (Architecturally Ideal / Scalable):** Decoupled, modern best practices, ready for scale.

## 📋 Available Resources
* **Debate Rules & XY Problem Prevention:** `resources/debate_rules.md` from the `@plan-debate` skill.
* **Proposal Template:** `resources/template_proposals.md` from the `@plan-debate` skill.
