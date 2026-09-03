---
name: "plan-decompose"
description: "Architectural epic decomposition and vertical slicing into sequenced, independent sub-features with strict contracts and zero cyclical rewrites."
---

# Skill: Epic Decomposition & Evolutionary Slicing (`skills/plan-decompose`)

Decomposes complex initiatives and large product shifts into an ordered sequence of short-cycle sub-features (vertical slices), preventing Mega-PRs and context window saturation.

## 🎯 Golden Rules of Evolutionary Slicing

1. **Architectural Monotonicity (No Destructive Rework):**
   * Sub-feature $N+1$ extends and consumes what Sub-feature $N$ established.
   * Never slice in a way that implementing Sub-feature 2 requires rewriting or breaking tests from Sub-feature 1.
2. **Contracts and Mocks First (Boundary Isolation):**
   * When introducing new databases, queues, or third-party integrations, Sub-feature 1 must define typed interfaces (`IRepository`) and an in-memory mock implementation (seeded with test data).
3. **Cycle Calibration:**
   * Each sub-feature must be self-contained and fit into a single development chat cycle (planning $\rightarrow$ TDD $\rightarrow$ refactoring $\rightarrow$ review $\rightarrow$ docs).

## 📋 Available Resources
* **Epic Template:** [`resources/template_epic.md`](./resources/template_epic.md)
* **Slicing Directives:** [`references/slicing_rules.md`](./references/slicing_rules.md)
* **Practical Example:** [`examples/epic_decomposition_example.md`](./examples/epic_decomposition_example.md)
