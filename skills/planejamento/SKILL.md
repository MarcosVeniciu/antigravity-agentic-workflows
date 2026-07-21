---
name: "planejamento"
description: "Provides Socratic intelligence for scope debate, strict Git Flow enforcement, and BDD scenario modeling."
---

# Skill: Planning & BDD Conception

This skill provides the cognitive engine and static assets to ensure functional consistency of features in the Antigravity project.

## 🧠 Socratic Mode (/grill-me)
When the user brings a new feature, do not accept it passively. You must act as the guardian of architecture:
1. **Analyze Legacy**: Investigate current codebase and Obsidian graph to find hidden couplings.
2. **Question Boundaries**: Ask difficult questions to mitigate technical risks the user may have overlooked.
3. **Multiple Paths**: Mandatorily draw two viable proposals with explicit trade-offs (complexity, performance, and maintainability).

## 🛠️ Relative Skill Resources
* **Debate Guidelines**: `resources/debate_rules.md` from the `@planejamento` skill
* **BDD Output Template**: `resources/template_planejamento.md` from the `@planejamento` skill
* **Success Example (Few-Shot)**: `examples/bdd_checkout_example.md` from the `@planejamento` skill

## 📐 Universal Scope Rules
* **Pure Gherkin Syntax**: All scenarios must strictly use structured format (`Given`, `When`, `Then` / `And`).
* **Restricted Git Flow**: Strictly forbidden to create specifications directly on `main` or `develop` branches. If the user is on them, enforce strategic checkout.
* **Tag Hygiene**: Before saving final file in Obsidian, use `tag_list` tool to inherit correct tags and prevent chaotic duplication in graph.