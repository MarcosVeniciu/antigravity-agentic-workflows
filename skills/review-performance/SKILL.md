---
name: "review-performance"
description: "Use during Phase 4 (/review) for performance and efficiency review. Detects N+1 query patterns, memory leaks, unindexed database filters, unbuffered I/O, and quadratic algorithms on git diff."
---

# Skill: Performance & Efficiency Review (`skills/review-performance`)

Surgically audits branch code changes from the perspective of data volumetrics, efficient CPU/memory utilization, and algorithmic bottleneck prevention.

## 🎯 Review Pillars (Diff-Based)
* **N+1 Query Pattern:** Executing repetitive SQL queries or API calls inside `for` loops.
* **Asymptotic Bottlenecks:** Quadratic complexity algorithms ($O(N^2)$) or linear lookups (`item in list`) inside iterative blocks.
* **Memory & Buffering:** Loading entire datasets into memory instead of streaming with iterators/generators (`yield`).
* **Connection & Resource Leaks:** Unclosed database cursors, file descriptors, or client sessions.

## 📋 Available Resources
* **Checklist:** `references/checklist_performance.md` from the `@review-performance` skill.
* **Artifact Template:** `resources/template_performance.md` from the `@review-performance` skill.
