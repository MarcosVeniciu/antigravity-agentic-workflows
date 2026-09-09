---
name: "review-performance"
description: "Performance audit on git diff: detects N+1 queries, memory leaks, unindexed DB filters, unbuffered I/O, and O(n^2) bottlenecks."
---

# Skill: Performance & Efficiency Review (`skills/review-performance`)

Surgically audits branch code changes from the perspective of data volumetrics, efficient CPU/memory utilization, and algorithmic bottleneck prevention.

## Review Pillars (Diff-Based)
* **N+1 Query Pattern:** Executing repetitive SQL queries or API calls inside `for` loops.
* **Asymptotic Bottlenecks:** Quadratic complexity algorithms ($O(N^2)$) or linear lookups (`item in list`) inside iterative blocks.
* **Memory & Buffering:** Loading entire datasets into memory instead of streaming with iterators/generators (`yield`).
* **Connection & Resource Leaks:** Unclosed database cursors, file descriptors, or client sessions.

## Available Resources
* **Checklist:** [`references/checklist_performance.md`](./references/checklist_performance.md)
* **Artifact Template:** [`resources/template_performance.md`](./resources/template_performance.md)
