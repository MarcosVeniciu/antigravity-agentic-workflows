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

## 🏗️ Reorganização Arquitetural & Estrutura Proposta

> [!NOTE]
> **Repositório Matriz/Fonte**: Os diretórios `agents/` e `skills/` estão localizados na raiz deste projeto porque este repositório é a **matriz/fonte de desenvolvimento** do ecossistema. Quando estes agentes e skills forem distribuídos ou instalados para uso em projetos finais ou no ambiente global do usuário, eles serão implantados sob `.agents/skills/` ou `~/.gemini/config/skills/`.

O projeto está migrando da estrutura monolítica anterior (`Old_version`) para uma arquitetura **modular baseada em Skills** alinhada às capacidades nativas da Antigravity IDE.

### 📐 Estrutura de Diretórios Proposta

```text
antigravity-agentic-workflows/
├── agents/                       # Definições de agentes / Roteadores de estado (Workflows / Slash Commands)
│   ├── planejamento.md           # Fase 1: Concepção & Contratos
│   ├── testes.md                 # Fase 2: TDD Red Phase (SDET)
│   ├── codigo.md                 # Fase 2: TDD Green Phase (Implementation)
│   ├── testar.md                 # Fase 2: Reactive Debugger
│   ├── refatorar.md              # Fase 2: Refactor Phase (Clean Code)
│   └── ...
├── skills/                       # Skills modulares do ecossistema
│   ├── planejamento/
│   ├── testes/                   # SKILL.md, references/EXECUTION.md, resources/
│   ├── codigo/                   # SKILL.md, references/EXECUTION.md, resources/
│   ├── testar/                   # SKILL.md, references/EXECUTION.md, resources/
│   ├── refatorar/                # SKILL.md, references/EXECUTION.md, resources/
│   └── ...
├── prompts/                      # Prompts base e governança global do sistema
│   └── gemini.md                 # System prompt / Regras centrais do agente
└── docs/                         # Documentação técnica e onboarding para desenvolvedores humanos
    ├── arquitetura-agentes.md
    └── guia-uso.md
```

### 📊 Comparativo Arquitetural

| Aspecto | `Old_version` (Legado) | Nova Estrutura Proposta | Vantagem Principal |
| :--- | :--- | :--- | :--- |
| **Templates & Execução** | Misturados em `templates-and-workflows/` | Co-localizados em `skills/<nome>/resources` e `references` | **Encapsulamento por Domínio**: Cada skill carrega seus próprios templates e referências |
| **Escalabilidade** | Manutenção complexa em diretórios únicos soltos | Adição modular de pastas por Skill | **Baixo Acoplamento**: Adicionar novas capacidades não afeta arquivos globais |
| **Integração com a IDE** | Leitura passiva de manuais | Descoberta nativa via `SKILL.md` (Frontmatter YAML) | **Injeção Ativa de Contexto**: A IDE injeta o `SKILL.md` no prompt sob demanda |
| **Automação** | Ausência de scripts dedicados | `skills/<nome>/scripts/` | **Automação Homologada**: Execução segura de scripts sem alucinações |

---

## 📚 Deep Delegation (Technical Manuals)

To keep this file focused and concise, all detailed documentation regarding the state machine, phase transition rules, and descriptions of internal workflows can be found in specialized directories.

See below:

### 🗺️ Ecosystem and Principles
* **[Guia de Skills](docs-antigravity/guia-skills.md)**: Manual de referência sobre criação e estrutura de Skills.
* **[Fluxo de Desenvolvimento](docs-antigravity/guia-fluxo-desenvolvimento.md)**: Guia completo sobre as fases do ecossistema agentificado.

---
<p align="center">
  <em>Built as a cutting-edge experiment on how engineering teams will work in collaboration with AIs in the future.</em>
</p>