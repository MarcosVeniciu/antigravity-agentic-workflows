# Workflows (`/workflows`)

This directory is the operational brain of the Antigravity IDE. Each `.md` file inside represents a **Specialist Agent**. 

They contain the primary rules (system prompts), the "State Machine" behavior, restrictive blocks, and the "Tone of Voice" the AI should adopt when assuming that specific role in the development cycle.

---

## 🤖 Agent Catalog (Workflows)

### 1. Engineering & Contracts
* **[`planejamento.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/planejamento.md):** (Product Manager). Performs the Interview technique (*Grill Me*) and structures the feature scope in BDD.
* **[`artefatos.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/artefatos.md):** (Software Architect). Translates BDD into SDD. Creates the Implementation Plan and writes sequence diagrams in Mermaid.js format.

### 2. The Core TDD Loop
* **[`testes.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/testes.md):** (QA Test Writer). Red Phase. Writes purely automated test suites using AAA (Arrange, Act, Assert) based on contracts.
* **[`codigo.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/codigo.md):** (Implementation Engineer). Green Phase. Surgically writes only the code necessary to make the test pass. Inserts standardized *docstrings*.
* **[`testar.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/testar.md):** (Reactive Debugger). Fix Phase. Based on the "Iterative Update Rule", catches pytest failures in the terminal and corrects the implementation.
* **[`refatorar.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/refatorar.md):** (Clean Code Specialist). Polish Phase. Applies SOLID principles and breaks down *code smells* in the green code, without altering behavior.

### 3. Audit & Closure
* **[`review.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/review.md):** (Code Auditor). Static QA Phase. Reads the code and `templates/` to point out Security, Architecture, Performance, and Resilience flaws.
* **[`aplicar-review.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/aplicar-review.md):** (Resolution Specialist). Cadenced execution to fix the flaws raised by the Auditor.
* **[`docs.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/docs.md):** (Technical Writer). Updates the internal folder literature, mandatorily generating `docs_preview.md`.
* **[`grafo.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/grafo.md):** (The Archivist). Connects business decisions and bug resolutions to the Obsidian Vault (Second Brain), using the "Prophecy Rule" and atomicity.
* **[`git.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/git.md):** (Release Engineer). Separates Semantic Commits, requiring the Narrative Body (*Commit Body*) to justify the changes.

### 4. Shock Troop (Secondary)
* **[`ask.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/ask.md):** Read-Only Oracle. Answers questions about the codebase forcing source citation (Traceability).
* **[`release.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/release.md):** Release Manager. Calculates SemVer, orchestrates Git Flow merges and recommends logging in the Obsidian Vault.
* **[`debug.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/debug.md):** Forensic Investigator. Uses the "5 Whys" to map roots of complex crashes or Infrastructure failures.
* **[`infra.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/infra.md):** DevOps. Edits dependencies and Dockerfiles, blocking *secrets* (generating only `.env.example`).
* **[`readme-projeto.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/readme-projeto.md):** Developer Advocate. Edits the "Showcase" (Root README), focusing on business and DX (*Getting Started*).
* **[`sync.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/sync.md):** Context Lifeguard. Performs a mandatory *scan* of the Vault and `GEMINI.md` to realign AIs after hours of conversation.

---

> 💡 **Modification Note:** Changing the instructions within any of these workflows instantly changes the level of permissiveness and the behavior of the AI when the rotation is called (e.g., `/debug`).
