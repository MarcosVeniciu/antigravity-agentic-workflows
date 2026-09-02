---
name: "debate"
description: "Socratic scope discovery and Outcome-Based Prompting skill. Extracts desired end-state, treats implementation hints as hypotheses, asks 2-4 surgical questions, and generates comparative proposals (Pragmatic vs Ideal)."
---

# Skill: Outcome-Based Scope Debate (`skills/debate`)

Guides technical inquiries during Phase 0 (`/decompor`) and Phase 1 (`/planejamento`), preventing the XY Problem by strictly isolating the desired business outcome from flexible implementation hypotheses.

## 🎯 Core Directives: Outcome-Based Prompting

1. **Focus on the Desired End State (Fixed):**
   * Identify: *"What is the real, functional outcome and business rule the user needs to achieve?"*
   * The destination is fixed; the implementation path is negotiable.
2. **Implementation Hints Are Just Hypotheses (Flexible):**
   * If the user suggests specific steps, files, or libraries ("how to do it"), treat them as clues of intent, **NEVER as hard constraints**.
   * Challenge fragile premises or technical debt. Do not hesitate to propose superior patterns.
3. **Surgical Interview (2 to 4 Questions Max):**
   * Never overwhelm the user with long questionnaires.
   * Ask 2 to 4 objective questions addressing genuine gaps in business rules, scope boundaries, or edge cases.
4. **Dual Proposal Matrix:**
   * Always consolidate understanding into two distinct architectural approaches in `propostas_planejamento.md`:
     * **Proposta 1 (Pragmática / Incremental):** Minimal friction with legacy code, lowest implementation cost.
     * **Proposta 2 (Arquiteturalmente Ideal / Escalável):** Decoupled, modern best practices, ready for scale.

## 📋 Available Resources
* **Debate Rules & XY Problem Prevention:** `resources/debate_rules.md` from the `@debate` skill.
* **Proposal Template:** `resources/template_propostas.md` from the `@debate` skill.
