# Analysis and Context Batch Clustering Guide

## 1. Grouping Principles

LLMs save tokens and maintain high-coherence reasoning when building interdependent subsystems within a single attention window.

### Clustering Algorithm:
1. **Identify Domain Entities:** Inspect class and sequence diagrams in `sdd-[feature-slug].md`.
2. **Map Dependency Edges:** If class $B$ receives class $A$ in constructor (Dependency Injection), $A$ and $B$ belong to the **same Context Batch**.
3. **Group Mocks and Contracts:** Interfaces and DTOs needed for testing a unit must be generated together with the unit itself in the same batch.

## 2. Context Decomposition Example vs. Isolated File

❌ **Antipattern (Fragmented by File - High Token Cost):**
* Phase 1: Write test for A
* Phase 2: Write code for A
* Phase 3: Write test for B
* Phase 4: Write code for B

🟢 **Antigravity Pattern (Context Batch - Low Token Cost):**
* **Context Batch 1: Domain & Session Repository**
  * Tests: `tests/test_domain_session.py`, `tests/test_session_repository.py`
  * Code: `src/domain/session.py`, `src/repositories/session_repo.py`
* **Context Batch 2: Authentication & Token Service**
  * Tests: `tests/test_auth_service.py`
  * Code: `src/services/auth_service.py`