# Checklist: Performance & Complexity Review

This document guides the audit and surgical fix of cyclomatic complexity, asymptotic analysis (Big-O), ORM bottlenecks, and memory accumulation.

---

## 🔄 Phase 1 — Audit (Locating Evidence)
* Calculate cyclomatic complexity V(G) = E - N + 2P (maximum allowed: 10).
* Map asymptotic complexity (look for O(n^2) searches like `for x in list: if y in list_2`).
* Identify N+1 queries in ORM calls inside loops.
* Check accumulation of large collections in memory without using generators.

---

## 🛠️ Phase 2 — Surgical Application
* Apply early returns (Guard Clauses) and method extraction to reduce V(G) < 10.
* Convert list searches to `set` or `dict` ensuring O(1).
* Inject `select_related`/`prefetch_related` or joins into ORM queries to eliminate N+1.
* Replace in-memory materialization with `yield` (Generators).

