# Planning Agent (The Scope Maestro)

The planning phase in the **Antigravity IDE** acts in an autonomous and decoupled workflow (`workflows/planejamento.md`). This separation exists to not overload the core agent and to ensure maximum depth in the most critical phase of software development: **the absolute understanding of the problem and the scope**.

The Planning Agent does not write production code. Its goal is to focus exclusively on technical feasibility, path exploration, ambiguity resolution, and the behavioral refinement of the feature (BDD).

---

## 1. The Activation Flow (`/planejamento` + `/grill-me`)

Planning does not start from nothing; it is an investigative process activated explicitly.

When a developer has an idea (e.g.: *"I want to implement a new login feature"*), they send the instruction along with the `/planejamento` and `/grill-me` commands. 

**The Process:**
1. The AI uses its **extreme search speed**, sweeping the current source code and atomic notes in the Obsidian Vault (`obsidian_knowledge_graph` MCP).
2. The AI crosses the user's request with the domain rules (`04-domain-rules/`) and current conventions (`02-conventions/`).
3. Instead of guessing missing details (avoiding scope hallucinations), it applies the "grill-me" (interview) technique, asking direct and precise questions to resolve uncertainties that only the developer's business domain can answer.
4. The AI also automatically contextualizes itself via `git` commands (`git --no-pager log` and `git branch --show-current`) to understand the branch strategy.

This symbiosis step extracts the maximum from the partnership: the structural speed of the AI validated by the human's business knowledge.

---

## 2. Analysis and Interview Phase (The Loop)

Based on the collected context and the user's answers, the agent enters the planning loop:

* **Presentation of Doubts and Proposals:** The model points out the "holes" in the scope and proposes at least 2 distinct approaches and architectures grounded in the vault data.
* **Refinement:** The user reads the options. If more exploration or adjustments to the proposed architecture are needed, they can restart the loop (`/grill-me`) or provide corrections.
* **Executive Decision:** When the plan becomes solid, the user gives final confirmation with the explicit command: `/planejamento ok`.

---

## 3. Consolidation Phase (`/planejamento ok`)

When the acceptance command is triggered, the agent moves to materialize the scope contract using a BDD (Behavior-Driven Development) approach.
BDD acts as a direct bridge between business rules and the final implemented code, describing requirements in a structured natural language that uses keywords like Given, When, and Then. For example: *"Given that I am on the registration page, when I submit a valid name and email, then my account should be created correctly."*

At this point, severe rules are applied to not pollute the interface:

1. **Features List (Scope):** The agent consolidates the plan in the strict BDD format (*Given/When/Then*), using the official planning template (`templates-and-workflows/template_planejamento.md`).
2. **Transitional Artifact (`walkthrough.md`):** The generated text is saved in the IDE itself as the `walkthrough.md` artifact, without polluting the chat output. 
   > [!NOTE]
   > This artifact serves as a transitional "visible draft". Its main goal is to present the formalized result without cluttering the chat history.
3. **Immortalizing in the Second Brain:** Once approved, the agent autonomously uses the `vault_write` tool to save this consolidation as an **Atomic Note** in the `09-scopes-and-features/` directory of the Obsidian Vault, making business decisions a permanent and official part of the project's architecture.
4. **Git Flow Strategy:** Finally, with the scope closed, the agent suggests the creation of the appropriate new branch (`feature/`, `fix/`, `refactor/`, etc.) based on the current branch context, guiding the user to the next stage of technical execution (where `/artefatos` takes the baton).


---

## 🔀 Dynamic State Machine Router

This agent is built using the **State Machine Router (Dynamic Context)** architecture. To prevent prompt hallucination, the trigger in `workflows/planejamento.md` is purely a lightweight router.

When invoked, the agent dynamically fetches its heavy execution instructions from the Obsidian Vault (`08-templates-and-workflows/`) using the MCP:
- `workflow-planejamento-STATE1-DEBATE.md`
- `workflow-planejamento-STATE2-CHECK.md`
- `workflow-planejamento-STATE3-SCOPE.md`
- `workflow-planejamento-STATE4-AGREEMENT.md`
