# 🪐 Antigravity Agentic Workflows

<p align="center">
  <em>An AI Agent-driven Software Engineering ecosystem based on State Machines, "Second Brain" (Obsidian Vault), and Separation of Concerns.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/AI-Gemini%20%7C%20Claude-blue.svg" alt="AI Agentic Workflows">
  <img src="https://img.shields.io/badge/Architecture-State%20Machine-orange.svg" alt="State Machine">
  <img src="https://img.shields.io/badge/Knowledge-Obsidian%20Vault-purple.svg" alt="Obsidian Vault">
</p>

---

## 🎯 The Pitch (Why Antigravity?)

Working with LLMs on large codebases frequently results in the "trigger-happy" problem: the AI tries to refactor entire files before understanding the context, causing regressions and knowledge loss.

The **Antigravity IDE Ecosystem** solves this by enforcing a **Strict State Machine Architecture**, **Ephemeral Chat Windows**, and deep integration with a **"Second Brain"** (Obsidian Vault via MCP).

Each AI agent has restricted permissions and an isolated scope — from requirements engineering (BDD/SDD) and diagramming, through the TDD pipeline and static Code Review, down to atomic documentation and release management.

**The principle is absolute: AI suggests, human orchestrates and approves.**

---

## 🚀 Getting Started (5-Minute Quick Setup)

### 1. Prerequisites
* An IDE compatible with the Antigravity ecosystem (e.g., local Gemini/Claude setup).
* The **Obsidian** app installed locally (for project Knowledge Graph).

### 2. Installation

```bash
# Clone the repository
git clone https://github.com/MarcosVeniciu/antigravity-agentic-workflows.git
cd antigravity-agentic-workflows
```

### 3. Engaging the "Second Brain"
1. Open Obsidian.
2. Open your project's vault folder.
3. Enable the MCP (Model Context Protocol) server to connect the knowledge base to the AI.

### 4. First Run
Start your workflow by consulting project context or planning a new feature:

```bash
# Consult the Oracle (Read-Only Context)
/ask Explain how the current microservices architecture is designed.

# Start the Development Cycle (BDD & Requisitos)
/planejamento
```

---

## 🏗️ Arquitetura de Agentes & Skills

O ecossistema adota uma arquitetura **modular desacoplada em duas camadas**:

1. **Roteadores de Estado (`agents/`)**: Arquivos leves que definem a persona do agente, restrições estritas, evidências de sucesso e os portões de transição (**[NEXT STEP]**).
2. **Skills Modulares (`skills/`)**: Instruções operacionais, scripts de automação, templates estáticos e manuais de referência injetados dinamicamente no contexto da IA.

> [!NOTE]
> **Repositório Matriz/Fonte**: Os diretórios `agents/` e `skills/` neste repositório representam a **matriz de desenvolvimento** do ecossistema. Quando implantados para consumo global no ambiente do desenvolvedor, são instalados em `~/.gemini/config/skills/` e `~/.gemini/config/agents/` (ou `.agents/` no workspace).

### 📂 Estrutura de Diretórios do Repositório

```text
antigravity-agentic-workflows/
├── agents/                       # Agentes Roteadores de Estado (Slash Commands)
│   ├── planejamento.md           # /planejamento - Fase 1: Concepção & BDD
│   ├── artefatos.md              # /artefatos    - Fase 1: SDD & Planos de Arquitetura
│   ├── testes.md                 # /testes       - Fase 2: TDD Red Phase (SDET)
│   ├── codigo.md                 # /codigo       - Fase 2: TDD Green Phase (Implementation)
│   ├── testar.md                 # /testar       - Fase 2: Reactive Debugger / Fix
│   ├── refatorar.md              # /refatorar    - Fase 2: TDD Refactor Phase (Clean Code)
│   ├── review.md                 # /review       - Fase 3: Auditorias Especializadas
│   ├── docs.md                   # /docs         - Fase 4: Documentação Técnica
│   ├── release.md                # /release      - Fase 4: Versionamento & Releases
│   ├── ask.md                    # /ask          - Suporte: Oráculo (Read-Only)
│   ├── debug.md                  # /debug        - Suporte: Investigação Forense (5 Whys)
│   └── infra.md                  # /infra        - Suporte: Pacotes & Ambiente
├── skills/                       # Skills modulares (Recursos, Scripts e Referências)
│   ├── planejamento/             # SKILL.md, resources/ (BDD template), references/
│   ├── artefatos/                # SKILL.md, resources/ (SDD/Diagram templates), references/
│   ├── testes/                   # SKILL.md, references/ (TDD rules)
│   ├── codigo/                   # SKILL.md, references/ (Clean code standards)
│   ├── testar/                   # SKILL.md, references/ (Fix protocols)
│   ├── refatorar/                # SKILL.md, references/ (SOLID refactoring)
│   ├── review/                   # SKILL.md, references/ (Audit checklists)
│   ├── docs/                     # SKILL.md, resources/ (Doc templates)
│   ├── release/                  # SKILL.md, resources/ (Changelog templates)
│   ├── ask/                      # SKILL.md, references/ (Query guidelines)
│   ├── debug/                    # SKILL.md, references/ (Root cause analysis)
│   ├── git/                      # SKILL.md, scripts/ (Git Flow & Micro-checkpoints)
│   └── grafo/                    # SKILL.md, references/ (Obsidian Knowledge Vault ops)
├── docs/                         # Visão geral da arquitetura do ecossistema
│   └── README.md                 # Mapeamento detalhado dos agentes e fluxo em 4 Fases
├── docs-antigravity/             # Manuais técnicos e guias de governança
│   ├── guia-fluxo-desenvolvimento.md # Manual do Ciclo de Vida Multi-Chat e Phase Gates
│   ├── guia-skills.md            # Especificação técnica e criação de Skills
│   ├── guia-base-conhecimento.md # Integração MCP e estrutura do Obsidian Vault
│   ├── guia-artefatos.md         # Padrões de planos e artefatos de saída
│   └── boas-praticas-agentes.md  # Diretrizes de design e construção de Agentes
└── prompts/                      # System prompts e governança global
```

---

## 🗺️ O Ecossistema em 4 Fases (Pipeline Multi-Chat)

Para evitar degradação do modelo por acúmulo de contexto (*token exhaustion*), a execução de uma *feature* é dividida em **4 Janelas de Chat Efêmeras**:

```mermaid
graph TD
    User((Usuário))

    subgraph Chat1 [Fase 1: Concepção & Contratos]
        P[Planejamento <br> /planejamento]
        A[Artefatos / SDD <br> /artefatos]
    end

    subgraph Chat2 [Fase 2: Implementação TDD Loop]
        T[Testes - Red <br> /testes]
        C[Código - Green <br> /codigo]
        F[Testar - Fix <br> /testar]
        R[Refatorar - Clean <br> /refatorar]
    end

    subgraph Chat3 [Fase 3: Auditorias Especializadas]
        Rev[Review Unificado <br> /review]
    end

    subgraph Chat4 [Fase 4: Documentação & Release]
        Docs[Docs & Vitrine <br> /docs]
        Rel[Release Manager <br> /release]
    end

    subgraph Suporte [Agentes de Suporte]
        Ask[Oráculo <br> /ask]
        Debug[Forense <br> /debug]
        Infra[Infra & Pacotes <br> /infra]
    end

    User -->|Inicia Feature| P
    P -->|Escopo BDD| A
    A -.->|Novos Pacotes| Infra
    A ==>|SDD Salvo - Reset Chat| T

    T -->|Testes Red| C
    C -->|Suíte Verde| R
    C -.->|Falha| F
    R -.->|Regressão| F
    F -.->|Corrigido & Verde| R

    R ==>|Code Clean - Reset Chat| Rev
    Rev ==>|Audit 100% - Reset Chat| Docs

    Docs -->|Manual/API Atualizada| Rel
    Rel -->|Tag & Changelog| User

    Suporte -.- User

    style Chat1 fill:#1b2838,stroke:#00d2ff,stroke-width:2px,color:#fff
    style Chat2 fill:#1b382b,stroke:#00ff88,stroke-width:2px,color:#fff
    style Chat3 fill:#381b35,stroke:#ff00bb,stroke-width:2px,color:#fff
    style Chat4 fill:#382d1b,stroke:#ffaa00,stroke-width:2px,color:#fff
    style Suporte fill:#222,stroke:#888,stroke-width:1px,stroke-dasharray: 5 5,color:#fff
```

---

## 🤖 Catálogo de Agentes & Slash Commands

| Comando | Agente | Fase / Papel | Descrição / Responsabilidade Principal |
| :--- | :--- | :--- | :--- |
| `/planejamento` | [planejamento.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/planejamento.md) | **Fase 1** | Conduz a especificação de requisitos orientada a BDD (Gherkin). |
| `/artefatos` | [artefatos.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/artefatos.md) | **Fase 1** | Elabora o plano técnico (SDD) e diagramas de arquitetura. |
| `/testes` | [testes.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/testes.md) | **Fase 2** | SDET: Constrói a suíte de testes em vermelho (Red Phase). |
| `/codigo` | [codigo.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/codigo.md) | **Fase 2** | Desenvolvedor: Escreve a implementação mínima necessária para verdejar os testes. |
| `/testar` | [testar.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/testar.md) | **Fase 2** | Depurador Reativo: Corrige quebras de testes cirurgicamente. |
| `/refatorar` | [refatorar.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/refatorar.md) | **Fase 2** | Clean Code: Refatora o código verde aplicando princípios SOLID sem alterar testes. |
| `/review` | [review.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/review.md) | **Fase 3** | Audita Qualidade, Arquitetura, Segurança, Performance e Resiliência, aplicando correções cirúrgicas. |
| `/docs` | [docs.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/docs.md) | **Fase 4** | Atualiza documentação técnica interna e a vitrine (`README.md`). |
| `/release` | [release.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/release.md) | **Fase 4** | Consolida o trabalho, calcula SemVer e gera nota de versão (Changelog). |
| `/ask` | [ask.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/ask.md) | **Suporte** | Oráculo Read-Only: Responde dúvidas sem alterar nenhum arquivo do sistema. |
| `/debug` | [debug.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/debug.md) | **Suporte** | Investigador Forense: Investiga runtime crashes e erros complexos de ambiente (5 Whys). |
| `/infra` | [infra.md](file:///d:/Codigos/antigravity-agentic-workflows/agents/infra.md) | **Suporte** | DevOps/SysAdmin: Gerencia manifestos de dependências e configurações de contêiner. |

---

## 📚 Deep Delegation (Manuais Técnicos)

Para aprofundar no funcionamento da arquitetura e nos padrões adotados no projeto, consulte a documentação detalhada:

* 📖 **[Arquitetura do Ecossistema](docs/README.md)**: Visão completa do modelo Router vs. Skill e fluxo de agentes.
* 🔄 **[Guia do Fluxo de Desenvolvimento](docs-antigravity/guia-fluxo-desenvolvimento.md)**: Especificação técnica do ciclo Multi-Chat em 4 Fases e Phase Gates.
* 🛠️ **[Guia de Skills](docs-antigravity/guia-skills.md)**: Manual de criação, anatomia e uso de Skills modulares.
* 🧠 **[Guia da Base de Conhecimento](docs-antigravity/guia-base-conhecimento.md)**: Protocolo de integração MCP e estrutura do "Second Brain" no Obsidian.
* 📑 **[Guia de Artefatos](docs-antigravity/guia-artefatos.md)**: Padrões de relatórios, planos de implementação e diagramas.
* 📐 **[Boas Práticas para Agentes](docs-antigravity/boas-praticas-agentes.md)**: Diretrizes de concisão, extensibilidade e roteamento para agentes LLM.

---
<p align="center">
  <em>Built as a cutting-edge experiment on how engineering teams will work in collaboration with AIs in the future.</em>
</p>