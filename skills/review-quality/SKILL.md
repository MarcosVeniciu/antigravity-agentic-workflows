---
name: "review-quality"
description: "Use during Phase 4 (/review) for code quality, complexity, and maintainability review. Runs ast_complexity.py to measure Cyclomatic Complexity V(G) <= 10, identifies nesting, naming clarity, and formatting on git diff."
---

# Skill: Code Quality & Complexity Review (`skills/review-quality`)

Audits the git diff from the perspective of strict cyclomatic complexity, maintainability, and syntactic readability.

## 🎯 Review Pillars (Diff-Based)
* **Cyclomatic Complexity $V(G)$:** Strict threshold of $V(G) \le 10$ per function/method. Evaluated using `scripts/ast_complexity.py`.
* **Asymptotic Heuristics:** Detection of nested loops or linear lookups inside outer loops.
* **Readability & Standards:** Naming clarity, absence of dead code, and compliance with language style guides.

## 📋 Available Resources
* **AST Scanner:** `scripts/ast_complexity.py` from the `@review-quality` skill.
* **Checklist:** `references/checklist_quality.md` from the `@review-quality` skill.
* **Artifact Template:** `resources/template_quality.md` from the `@review-quality` skill.
