# ⚡ Performance Review Checklist

> **Purpose:** Quantitative audit focused on mathematical limits, database optimization, and mitigating AI-generated anti-patterns.

## How to Audit
Cross-reference your code reading with the "Performance Report" generated in the terminal during the test execution (`/testes`). Do not rely on assumptions.

---

## 1. Cyclomatic Complexity (Logical Structure)
**How to Measure:** Count the branches using the control flow graph formula: V(G) = E - N + 2P. In practice, add 1 for every `if`, `else if`, `for`, `while`, `and`, `or`, and multiple `return` statements.
* **Limits:** 1 to 10 (Simple), 11 to 20 (Moderate - 🟡 Major), >20 (Extreme - 🔴 Critical).

- [ ] **V(G) Measurement:** Does no function exceed a score of 10?
- **How to Handle:** If it fails, order a refactoring based on: Method Extraction, Polymorphism (dispatch dicts/classes), or Guard Clauses (early returns).

## 2. Asymptotic Complexity (Big-O)
**How to Measure:** Analyze the time reports in the terminal. If input (N) multiplies by 10 and time multiplies by ~10, it's O(n). If time multiplies by ~100, it's O(n^2).

- [ ] **Scaling Limits:** Does the terminal report prove the code scales at O(n) or O(log n)?
- [ ] **Hidden Loops:** Are there nested iteration structures like `for i in X: if y in Z` where Z is a list (causing O(n^2))?
- [ ] **Redundant Operations:** Are there repeated calculations that could be memoized/cached?
- **How to Handle:** Demand the conversion of list lookups to `Sets` or `Dicts` to ensure O(1) time, or require loop vectorization using native tools (e.g., Pandas). 

## 3. Database Queries & Data Access
**How to Measure:** Look at ORM calls inside loops and check the SQL generation intent.

- [ ] **N+1 Problem:** Is the ORM executing a query per item inside a loop instead of using `select_related`, `prefetch_related`, or `JOIN`?
- [ ] **Projection:** Do queries select only the necessary fields instead of `SELECT *`?
- [ ] **Batch Operations:** Do mass inserts/updates use batch operations instead of individual loop iterations?
- **How to Handle:** Require ORM eager loading methods for relations, explicit field selection, and bulk insert/update methods.

## 4. Common AI Anti-Patterns in Resource Management
**How to Measure:** Check how large data is handled, how async is used, and how resources are freed.

- [ ] **Lazy Evaluation vs Materialization:** Does the code store large DB collections or files in memory lists (`[x for x in cursor]`) instead of using `yield` or generators?
- [ ] **False Asynchrony (Blocking Event Loop):** Are there blocking calls (e.g., `requests.get`, `time.sleep`, heavy `open()`) inside `async def` functions?
- [ ] **Cold Starts (Initialization Overhead):** Does the route/service instantiate ML models, large configs, or connection pools inside its body (running on every request)?
- [ ] **Resource Cleanup:** Are file pointers or network connections closed manually without `with` (context managers)?
- **How to Handle:** Order the shift to Generators/Iterators. Swap blocking calls for async libraries (e.g., `httpx.AsyncClient`). Move heavy initializations to the global/startup scope. Require `with` blocks for I/O.

## 5. Caching & Serialization
**How to Measure:** Check the data transfer layers and caching decorators.

- [ ] **Cache Design:** Are frequently accessed, rarely altered data cached with a clear invalidation strategy (TTL, event-driven)?
- [ ] **Serialization Efficiency:** Are heavy payloads compressed (gzip/brotli)? Are large blobs lazily serialized only when requested?
- **How to Handle:** Suggest implementing TTL caching decorators for static lookups and removing over-caching on dynamic user data.
