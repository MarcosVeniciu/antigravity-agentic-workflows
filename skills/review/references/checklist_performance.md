# Checklist: Performance & Complexity Review

This document guides the audit and surgical fix of cyclomatic complexity, asymptotic analysis (Big-O), ORM bottlenecks, and memory accumulation.

---

## 🔄 Phase 1 — Audit (Locating Evidence)

### 1. Cyclomatic Complexity V(G) (Max Allowed: 10)
Execute the appropriate tool/command based on the project's stack or fallback to zero-dependency AST:
* **Python (Zero-Dep Fallback)**: Run `python skills/review/scripts/ast_complexity.py <src_dir>`
* **Python (Native)**: `radon cc <src_dir> -a -s`
* **JavaScript / TypeScript**: `npx eslint --rule 'complexity: ["error", 10]' <src_dir>`
* **Go**: `npx gocyclo -over 10 <src_dir>`
* **Multilanguage (Optional)**: `npx lizard -C 10 <src_dir>`

### 2. Asymptotic Complexity & Bottleneck Detection (Big-O)
Combine AST Heuristics with LLM Semantic Analysis:
* **AST Heuristic Warnings**: Check output of `ast_complexity.py` or linter for nested loops (`depth >= 2`) and linear searches (`in`/`.indexOf()`/`.includes()`) inside loops.
* **Semantic Analysis**: Map Big-O bounds ($O(n^2)$, $O(n \cdot m)$) on flagged methods and verify data volume limits.
* **ORM Bottlenecks**: Identify N+1 queries by looking for database/ORM calls (`select`, `find`, `query`) inside loops.
* **Memory Accumulation**: Check accumulation of large collections in memory without using streams or generators (`yield`).

---

## 🛠️ Phase 2 — Surgical Application
* Apply early returns (Guard Clauses) and method extraction to reduce V(G) < 10.
* Convert list searches to `set` or `dict` ensuring O(1) lookup.
* Inject `select_related`/`prefetch_related` or joins into ORM queries to eliminate N+1.
* Replace in-memory materialization with `yield` (Generators) or streams.


