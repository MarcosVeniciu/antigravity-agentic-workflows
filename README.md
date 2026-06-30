# 🪐 Antigravity Agentic Workflows

<p align="center">
  <em>An AI Agent-driven Software Engineering ecosystem based on State Machines, "Second Brain" (Obsidian), and Separation of Concerns.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/AI-Gemini%20%7C%20Claude-blue.svg" alt="AI Agentic Workflows">
  <img src="https://img.shields.io/badge/Architecture-State%20Machine-orange.svg" alt="State Machine">
  <img src="https://img.shields.io/badge/Knowledge-Obsidian%20Vault-purple.svg" alt="Obsidian Vault">
</p>

---

## 🎯 The Pitch (Why Antigravity?)

Working with LLMs on large codebases frequently results in the "trigger-happy" problem: the AI tries to refactor entire files before understanding the context, causing regressions and knowledge loss.

The **Antigravity IDE Ecosystem** solves this by enforcing a **Strict State Machine** and deep integration with a **"Second Brain"** (Obsidian Vault via MCP). 

Each AI agent has restricted permissions and an isolated scope — from requirements engineering and diagramming, through the TDD pipeline and static Code Review, down to atomic documentation generation. 

**The principle is absolute: AI suggests, human orchestrates and approves.**

---

## 🚀 Getting Started (5-Minute Quick Setup)

### 1. Prerequisites
* An IDE compatible with AI ecosystems (e.g., local Gemini/Claude setup).
* The **Obsidian** app installed locally.

### 2. Installation

```bash
# Clone the repository
git clone https://github.com/MarcosVeniciu/antigravity-agentic-workflows.git
cd antigravity-agentic-workflows
```

### 3. Engaging the "Second Brain"
1. Open Obsidian.
2. Add the `vault/` folder (or the repository root) as a Vault.
3. Enable the MCP (Model Context Protocol) server to connect the knowledge base to the AI.

### 4. First Run
Start your workflow by validating the repository rules or planning a new feature:

```bash
# Consult the Oracle (Read-Only Context)
/ask Explain how the current microservices architecture is designed.

# Start the Development Cycle (BDD)
/planejamento
```

---

## 📚 Deep Delegation (Technical Manuals)

To keep this file focused and concise, all detailed documentation regarding the state machine, phase transition rules, and descriptions of internal workflows has been moved to specialized directories. 

See below:

### 🗺️ Ecosystem and Principles
* **[Overview and State Machine](docs/README.md)**: Complete diagram of the command chain and software lifecycle.
* **[Core Agent (`gemini.md`)](docs/agente-core-gemini.md)**: The core philosophy of Human-AI Co-Programming and the mandatory integration with the Obsidian Vault.

### 🤖 Specialist Agents (Workflows)
Browse the specific documentation for each command/agent:

* **Phase 1: Engineering & Requirements:** [`/planejamento`](docs/agente-planejamento.md) | [`/artefatos`](docs/agente-artefatos.md)
* **Phase 2: TDD & Coding:** [`/testes`](docs/agente-testes.md) | [`/codigo`](docs/agente-codigo.md) | [`/testar`](docs/agente-testar.md) | [`/refatorar`](docs/agente-refatorar.md)
* **Phase 3: Audit & Review:** [`/review`](docs/agente-review.md) | [`/aplicar-review`](docs/agente-aplicar-review.md)
* **Phase 4: Packaging & Documentation:** [`/docs`](docs/agente-docs.md) | [`/grafo`](docs/agente-grafo.md) | [`/git`](docs/agente-git.md) | [`/changelog`](docs/agente-changelog.md)
* **Ad-hoc Support:** [`/ask`](docs/agente-ask.md) | [`/debug`](docs/agente-debug.md) | [`/infra`](docs/agente-infra.md) | [`/sync`](docs/agente-sync.md) | [`/readme`](docs/agente-advocate.md)

---
<p align="center">
  <em>Built as a cutting-edge experiment on how engineering teams will work in collaboration with AIs in the future.</em>
</p>