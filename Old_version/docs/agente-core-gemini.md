# Core Agent: The Anchor of the Agentic Flow (`gemini.md`)

The `gemini.md` document (located at `prompts/gemini.md`) is not just another command within the Antigravity IDE; it acts as the **foundational anchor** of the entire agentic workflow. Its fundamental premise is to keep complexity low in terms of specific instructions and focus exclusively on directing the behavior of the artificial intelligence within a collaborative partnership paradigm.

Instead of ordering the AI to generate code randomly or try to guess answers based on common sense, `gemini.md` establishes two cardinal rules:
1. Work strictly as a **Co-Programmer** alongside the human developer.
2. Anchor all of its analysis base on the **Obsidian Vault** (Second Brain).

---

## 1. The Co-Programmer Paradigm (Human-AI Symbiosis)

The main vision for using artificial intelligence in professional coding is not to replace the programmer, but rather to use it as a high-performance tool that acts where the human mind fails, and vice versa. 

This paradigm solves the central problem of AI-driven development:

### The Role of the Developer (Human)
* **Macro Vision:** The human is responsible for the high-level architecture, business requirements, and project constraints.
* **Uncertainty Resolution:** Makes the subjective architectural decisions that an LLM, however trained it may be, cannot guess (e.g.: pivoting business rules, financial goals).
* **Human Weakness:** Human reasoning tends to be linear. When we focus intensely on one path to solve a complex problem, we often ignore minor details (an edge case on the system's edge, a subtle security flaw, or code redundancy).

### The Role of the LLM (Artificial Intelligence)
* **Micro Vision (Breadth Reading):** The LLM acts analytically and extremely fast, sweeping the details of the code, documentation, and possible parallel paths that can add more efficiency to the solution.
* **Alerts and Insights:** Its function is not to "write to fulfill the task", but rather to propose better alternative routes, point out technical debt that went unnoticed, and validate logic against best practices.
* **AI Weakness:** Lack of historical context, token limitation, and ignorance about evolving business rules lead to "hallucination" or lazy/basic solutions when it acts alone and without guidelines.

**Partnership Conclusion:** One complements the other's weak point. The human resolves uncertainties and defines the goal; the AI brings speed in verification and prevents the forgetting of micro-details, suggesting structural improvements.

---

## 2. Obsidian as a "Second Brain" (Knowledge Graph)

For the AI to act efficiently within the Co-Programmer Paradigm without suffering from its context limit or lack of holistic vision, the `gemini.md` prompt requires the AI to use the repository structure in **Obsidian**.

The root folder acts as the project's nervous system. The agent is instructed to proactively read the 9 Obsidian folders (such as ADRs, domain rules, architecture map, and past bug resolutions) *before* attempting to diagnose a problem or create an architecture.

> [!IMPORTANT]
> **Context Limit Circumvention:** By using Obsidian's atomic notes as a "Second Brain", the agent does not need to load the entire project into its short-term memory. It does targeted searches in the Obsidian documentation, allowing a breadth exploration grounded in the absolute truths (source of truth) of the repository.

---

## 3. Daily Operation Guidelines

Due to its essence of anchoring the partnership, the agent's operation guidelines derived from `gemini.md` are strict:

* **Think First, Code Later:** The agent is forbidden from firing off lines of code irresponsibly just to "solve it quickly". It must first analyze the graph and the context.
* **Active Questioning (`/grill-me`):** If the requirements are vague or have loose ends, the agent must actively interview the developer to align knowledge, eliminating guesswork.
* **Shared Ownership:** The agent must treat the project as "its own". If the developer's instruction violates a consolidated pattern in Obsidian (e.g.: SOLID principles, TDD, or a documented ADR), the agent has the duty to alert and propose the alternative before obeying.

---
> *This document aims to formalize the philosophy behind the Antigravity IDE root prompt, ensuring that any future evolution maintains the focus on the symbiotic partnership between AI speed and human architectural thinking.*
