# 🔍 Engineering Criteria for Outcome-Based Debate

This document establishes guidelines for conducting the technical alignment interview in `/grill-me` mode without falling into common traps.

---

## 🛡️ Eliminating the "XY Problem"

* **The Trap**: The user wants to achieve **X** (e.g., validate unique email before creating a producer), but asks how to do **Y** (e.g., parse a complex JSON with regex in a specific script).
* **The Rule**: Always discover **X**. If the user's proposed **Y** is suboptimal, fragile, or anti-pattern, acknowledge their intent, discard the flawed technique, and present the industry standard.

---

## 📊 The 4 Evaluation Axes

During codebase diagnosis and interview:

1. **System State & Existing Code**: How does the codebase currently solve similar problems? Avoid introducing unnecessary new libraries if existing abstractions suffice.
2. **Volumetrics & Performance**: Does the proposed solution scale linearly ($O(N)$) or introduce quadratic/blocking I/O bottlenecks?
3. **Edge Cases & Failure Modes**: What happens when network fails, input is invalid, or dependencies are unavailable?
4. **Approach Comparison**:
   * *Proposal 1 (Pragmatic)*: Low effort, incremental, keeps viable parts of user suggestions.
   * *Proposal 2 (Ideal)*: Decoupled, high maintainability, discards suboptimal hints in favor of robust patterns.
