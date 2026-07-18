---
name: "planejamento"
description: "Planning and conception skill (Phase 1). Conducts BDD debate via interactive artifacts, defines branch strategy, and persists specifications in Obsidian."
---

# Skill: Planning & BDD Conception (`skills/planejamento`)

Manages **Phase 1 (Conception & Contracts)** via interactive artifacts with approval pauses directly in the IDE. Always communicate with the user in Portuguese.

---

## 🔄 State Router

Consult reference for each state prior to acting:

| State | Entry Trigger | Generated Artifact | Feedback | Reference |
| :--- | :--- | :--- | :--- | :--- |
| **STATE 1: Debate** | `/planejamento` | `propostas_planejamento.md` | `RequestFeedback: true` | [STATE1-DEBATE.md](references/STATE1-DEBATE.md) |
| **STATE 2: Branch** | Proceed on STATE 1 | `estrategia_branch.md` | `RequestFeedback: true` | [STATE2-BRANCH_STRATEGY.md](references/STATE2-BRANCH_STRATEGY.md) |
| **STATE 3: Scope** | Proceed on STATE 2 | `especificacao_escopo_bdd.md` | `RequestFeedback: true` | [STATE3-SCOPE_CLOSURE.md](references/STATE3-SCOPE_CLOSURE.md) |
| **STATE 4: Archive** | Proceed on STATE 3 | `resumo_concepcao.md` | `RequestFeedback: false` | [STATE4-ARCHIVING.md](references/STATE4-ARCHIVING.md) |

---

## 🛠️ Resources & Templates

* **BDD Template**: [template_planejamento.md](resources/template_planejamento.md) (used in STATE 3).
* **Obsidian Persistence**: In STATE 4, BDD scope is saved in `01-concepcao/bdd-[feature-slug].md` by invoking the `grafo` skill.
* **Git Handover**: At Phase 1 closure (STATE 4), consolidated semantic commit is performed by invoking the `git` skill (Mode 2 - Phase Squash).

---

## ⛔ Universal Rules & Constraints

1. **Think First, Code Later**: Creating or modifying application source code files in Phase 1 is strictly forbidden.
2. **Consult Vault (Pre-flight Check)**: Search existing business rules and ADRs before formulating any proposal.
3. **Interactive Control via Artifacts**: Always set `RequestFeedback: true` in state 1-3 artifacts to allow approval via IDE **Proceed** button.

---

## ✅ Validation Checklist & Verification Method

With every state transition or artifact generation, autonomously validate:
- [ ] Does the artifact have valid metadata (`UserFacing: true`, proper `RequestFeedback`)?
- [ ] Does the artifact contain clear guidance on interacting using IDE buttons?
- [ ] Do test scenarios contain pure BDD syntax (`Given...`, `When...`, `Then...` or `Dado...`, `Quando...`, `Então...`)?
- [ ] Was the final Obsidian note targeted to `01-concepcao/bdd-[feature-slug].md` by triggering the `grafo` skill?
- [ ] Was the final semantic commit of Phase 1 consolidated by triggering the `git` skill (Mode 2)?

