# Checklist: Performance & Optimization Review

This document guides the audit and surgical fix of algorithmic complexity, I/O bottlenecks, N+1 queries, and resource leaks.

---

## 🔄 Phase 1 — Audit (Locating Evidence)
* Check for database queries executed inside loops (`for item in items: db.query(...)`).
* Detect nested loops over unbounded data structures ($O(N^2)$).
* Identify `item in my_list` where `my_list` is iterated repeatedly; check if it can be converted to `set`.
* Inspect large file reads (`.read()`) instead of chunked streaming or line-by-line generators.
* Verify missing database index hints or unindexed filter predicates on high-volume queries.

---

## 🛠️ Phase 2 — Surgical Application
* Replace N+1 queries with batch queries using `IN` clauses or JOINs.
* Convert list lookups inside loops to `set` lookups for $O(1)$ amortized cost.
* Replace full in-memory list aggregations with generators (`yield`).
* Ensure database sessions, file handles, and HTTP sessions use context managers (`with`).
