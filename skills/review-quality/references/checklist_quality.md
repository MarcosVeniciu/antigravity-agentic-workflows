# Checklist: Code Quality & Complexity Review

This document guides the audit and surgical fix of cyclomatic complexity, readability, naming conventions, and linting.

---

## 🔄 Phase 1 — Audit (Locating Evidence)
* Run `python scripts/ast_complexity.py <modified_files>` to locate functions with $V(G) > 10$.
* Identify nested control structures (`if`, `for`, `while`, `try`) contributing to cognitive load.
* Check boolean parameters passed as flags (Boolean Blindness).
* Locate dead code, unused imports, or comment-out code blocks.

---

## 🛠️ Phase 2 — Surgical Application
* Break complex functions into cohesive helper methods with $V(G) \le 10$.
* Apply Guard Clauses to flatten pyramid-shaped code blocks.
* Remove dead code and unused imports.
