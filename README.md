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

Each AI agent has restricted permissions and an isolated scope — from requirements engineering (BDD/SDD) and living DoD logs, through iterative TDD pipelines and diff-scoped Refactoring, down to OWASP-aligned Code Review, atomic documentation, and release management.

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

1. **Roteadores de Estado (`workflows/`)**: Arquivos leves que definem a persona do agente, restrições estritas, evidências de sucesso e os portões de transição (**[NEXT STEP]**).
2. **Skills Modulares (`skills/`)**: Instruções operacionais, scripts de automação, templates estáticos e manuais de referência injetados dinamicamente no contexto da IA.
3. **Registro Vivo de Execução & DoD (`01-concepcao/dod-[slug].md`)**: Documento dinâmico que centraliza o histórico do desenvolvimento (diário de bordo) e valida critérios de aceite funcional, não-funcional, auditorias e release.

> [!NOTE]
> **Repositório Matriz/Fonte**: Os diretórios `workflows/` e `skills/` neste repositório representam a **matriz de desenvolvimento** do ecossistema. Quando implantados para consumo global no ambiente do desenvolvedor, são instalados em `~/.gemini/config/skills/` e `~/.gemini/config/workflows/` (ou `.agents/` no workspace).

### 📂 Estrutura de Diretórios do Repositório

```text
antigravity-agentic-workflows/
├── workflows/                    # Roteadores de Estado (Slash Commands)
│   ├── decompor.md               # /decompor     - Fase 0: Macro-Arquitetura & Fatiamento de Épicos
│   ├── planejamento.md           # /planejamento - Fase 1: Concepção, BDD, SDD e Living DoD
│   ├── implementar.md            # /implementar  - Fase 2: Desenvolvimento TDD Iterativo (Red ➔ Green por Lotes)
│   ├── refatorar.md              # /refatorar    - Fase 3: Refatoração de Consolidação (Clean Code no Diff)
│   ├── review.md                 # /review       - Fase 4: Auditorias Especializadas (Arquitetura, Segurança, Qualidade, Perf, Resiliência)
│   ├── docs.md                   # /docs         - Fase 5: Documentação Técnica da Feature & Docstrings
│   ├── release.md                # /release      - Ciclo de Publicação: Testes de Integração E2E, SemVer & Git Flow
│   ├── testar.md                 # /testar       - Suporte: Depurador Reativo & Correções Cirúrgicas
│   ├── ask.md                    # /ask          - Suporte: Oráculo Read-Only (Código & Obsidian)
│   ├── debug.md                  # /debug        - Suporte: Investigador Forense de Crashes (5 Whys)
│   └── infra.md                  # /infra        - Suporte: Manifestos, Docker & Dependências
├── skills/                       # Skills modulares (Recursos, Scripts e Referências)
│   ├── decompor/                 # Fatiamento vertical evolutivo e monotonicidade
│   ├── debate/                   # Outcome-Based Prompting e inquirição socrática (2 a 4 perguntas)
│   ├── bdd/                      # Cenários comportamentais em Gherkin puro
│   ├── sdd/                      # Blueprint arquitetural, diagramas Mermaid e contratos tipados
│   ├── dod/                      # Governança da Definition of Done e Living Log (dod-[slug].md)
│   ├── tdd-plan/                 # Decomposição em lotes de contexto dependentes
│   ├── testes/                   # Testes unitários padrão AAA e matriz de mocks
│   ├── codigo/                   # Implementação mínima SOLID ("Make it Work") e registro de pivôs
│   ├── testar/                   # Diagnóstico de falhas de testes e intervenção cirúrgica
│   ├── refatorar/                # Eliminação de Code Smells e Clean Code escopado ao diff
│   ├── review-arquitetura/       # Auditoria de acoplamento, limites de camada e DTOs
│   ├── review-seguranca/         # Auditoria OWASP Top 10, sanitização e gestão de segredos
│   ├── review-qualidade/         # Complexidade ciclomática AST (V(G) <= 10) e estilo
│   ├── review-performance/       # Auditoria de queries N+1, leaks de memória e I/O
│   ├── review-resiliencia/       # Timeouts, retry com backoff, circuit breakers e fallbacks
│   ├── docs/                     # READMEs vivos de módulo/raiz e docstrings rastreáveis
│   ├── integracao/               # Suíte E2E em release branch com banners de etapas
│   ├── release/                  # Cálculo de SemVer cumulativo e geração de Changelog
│   ├── git/                      # Central Git Flow (5 Modos: Branch, Checkpoint, Squash, Rollback, Release)
│   ├── obsidian/                 # SSOT do Vault, busca por metadados e patch cirúrgico
│   ├── notebooklm/               # Consulta semântica externa estritamente governada pelo usuário
│   ├── ask/                      # Diretrizes read-only e regras de citação
│   ├── debug/                    # Metodologia 5 Whys e análise de causa raiz
│   └── infra/                    # Gestão segura de pacotes e variáveis de ambiente
├── docs/                         # Visão geral da arquitetura do ecossistema
│   └── README.md                 # Mapeamento detalhado dos agentes e fluxo em 5 Fases
├── docs-antigravity/             # Manuais técnicos e guias de governança
│   ├── guia-fluxo-desenvolvimento.md # Manual do Ciclo de Vida Multi-Chat e Phase Gates
│   ├── guia-skills.md            # Especificação técnica e criação de Skills
│   ├── guia-base-conhecimento.md # Integração MCP e estrutura do Obsidian Vault
│   ├── guia-artefatos.md         # Padrões de planos e artefatos de saída
│   └── boas-praticas-agentes.md  # Diretrizes de design e construção de Agentes
└── prompts/                      # System prompts e governança global (gemini.md)
```

---

## 🗺️ O Ecossistema em Fases (Pipeline Multi-Chat SDLC)

Para evitar degradação do modelo por acúmulo de contexto (*token exhaustion*), a execução é dividida em **Janelas de Chat Efêmeras**:

```mermaid
graph TD
    User((Usuário))

    subgraph Macro [Fase 0: Macro-Arquitetura & Épicos]
        Dec[Decomposição de Épicos <br> /decompor]
    end

    subgraph Chat1 [Fase 1: Concepção & Arquitetura]
        Plan[Planejamento BDD + SDD + DoD <br> /planejamento]
    end

    subgraph Chat2 [Fase 2: Desenvolvimento TDD Iterativo]
        Imp[TDD Loop Lote a Lote <br> /implementar]
    end

    subgraph Chat3 [Fase 3: Refatoração de Consolidação]
        Ref[Clean Code & SOLID <br> /refatorar]
    end

    subgraph Chat4 [Fase 4: Auditorias Especializadas]
        Rev[Loop de Auditorias Diff-Based <br> /review]
    end

    subgraph Chat5 [Fase 5: Documentação Técnica da Feature]
        Docs[Docs & Docstrings <br> /docs]
    end

    subgraph Pub [Ciclo de Publicação & Integração]
        Rel[Release & Integração E2E <br> /release]
    end

    subgraph Suporte [Agentes de Suporte]
        Ask[Oráculo <br> /ask]
        Debug[Forense <br> /debug]
        Fix[Depurador Reativo <br> /testar]
        Infra[Infra & Manifestos <br> /infra]
    end

    %% Relações Macro
    User -->|Grande Demanda| Dec
    Dec -->|Gera Grafo de Sub-Features| Plan

    %% Relações do Ciclo da Feature
    User -->|Feature Isolada| Plan
    Plan ==>|BDD + SDD + DoD Salvos| Imp
    Imp -->|Red ➔ Green por Lote de Contexto| Imp
    Imp ==>|100% dos Lotes Prontos| Ref
    Ref -.->|Falha de Teste| Fix
    Fix -.->|Corrigido & Verde| Ref
    Ref ==>|Clean Code sem Smells| Rev
    Rev ==>|5 Domínios Auditados & Aprovados| Docs
    Docs ==>|Feature Congelada & DoD 100%| Rel

    %% Publicação
    Rel -->|Tag SemVer, Changelog & Git Flow Merge| User

    %% Suporte
    Suporte -.- User

    style Macro fill:#2d1b38,stroke:#b800ff,stroke-width:2px,color:#fff
    style Chat1 fill:#1b2838,stroke:#00d2ff,stroke-width:2px,color:#fff
    style Chat2 fill:#1b382b,stroke:#00ff88,stroke-width:2px,color:#fff
    style Chat3 fill:#351b38,stroke:#d200ff,stroke-width:2px,color:#fff
    style Chat4 fill:#381b28,stroke:#ff0088,stroke-width:2px,color:#fff
    style Chat5 fill:#382d1b,stroke:#ffaa00,stroke-width:2px,color:#fff
    style Pub fill:#1b3838,stroke:#00ffd5,stroke-width:2px,color:#fff
    style Suporte fill:#222,stroke:#888,stroke-width:1px,stroke-dasharray: 5 5,color:#fff
```

---

## ⚡ Otimizações do Fluxo & Justificativas Técnicas

1. **Refatoração Eficiente Escopada ao Diff (Fase 3)**:
   - A refatoração ocorre em uma fase consolidadora própria (Fase 3), realizada sobre uma suíte de testes 100% verde (*Make it Right*).
   - O escopo de análise e refatoração é **restrito exclusivamente aos arquivos alterados na branch atual** (`git diff develop...HEAD --name-only`), eliminando desperdício de tokens e o risco de regressões em código legado não alterado.

2. **Autonomia da Fase 2 (`/implementar`) e Micro-Checkpoints**:
   - A Fase 2 (`/implementar`) conduz todo o ciclo TDD (Red ➔ Green) dividida em lotes de contexto dependentes (`skills/tdd-plan`, `skills/testes`, `skills/codigo`).
   - A cada lote concluído e verde, um micro-checkpoint local (`git commit`) é gerado e a linha do tempo no `dod-[slug].md` é atualizada.

3. **Artefato Vivo de Acompanhamento (`01-concepcao/dod-[slug].md`)**:
   - Centraliza a linha do tempo do desenvolvimento e a Definition of Done (DoD) com checklists funcionais, não-funcionais, de auditoria e de release.
   - Atua como a única fonte da verdade (SSOT) para validação objetiva antes de autorizar o versionamento e merge.

4. **Auditorias Especializadas por Domínio (Fase 4)**:
   - O `/review` decompõe a análise em 5 auditorias atômicas executadas diretamente sobre o diff: Arquitetura, Segurança (OWASP Top 10/ASVS), Qualidade (AST V(G) <= 10), Performance e Resiliência.

5. **Depurador Reativo de Suporte (`/testar`)**:
   - O agente `/testar` atua como suporte cirúrgico caso testes venham a falhar durante a fase de implementação (`/implementar`) ou refatoração (`/refatorar`), isolando a causa raiz em 1 frase e aplicando ajustes mínimos em produção.

---

## 🤖 Catálogo de Agentes & Slash Commands

| Comando | Workflow / Agente | Fase / Papel | Descrição / Responsabilidade Principal |
| :--- | :--- | :--- | :--- |
| `/decompor` | [decompor.md](workflows/decompor.md) | **Fase 0** | Decompõe épicos e grandes demandas em fatias verticais evolutivas e monotônicas. |
| `/planejamento` | [planejamento.md](workflows/planejamento.md) | **Fase 1** | Debate Outcome-Based, Git Flow, especificação BDD, blueprint SDD e criação do Living DoD. |
| `/implementar` | [implementar.md](workflows/implementar.md) | **Fase 2** | Desenvolvedor TDD: Decomposição em lotes, testes AAA (Red), código mínimo SOLID (Green) e micro-checkpoints. |
| `/refatorar` | [refatorar.md](workflows/refatorar.md) | **Fase 3** | Clean Code & SOLID: Refatora o código verde limitando a análise exclusivamente aos arquivos alterados no diff. |
| `/review` | [review.md](workflows/review.md) | **Fase 4** | Loop iterativo de auditorias: Arquitetura, Segurança (OWASP), Qualidade AST, Performance e Resiliência. |
| `/docs` | [docs.md](workflows/docs.md) | **Fase 5** | Atualiza documentação técnica viva (READMEs de módulo/raiz) e docstrings com rastreabilidade ao Obsidian. |
| `/release` | [release.md](workflows/release.md) | **Publicação** | Valida 100% de DoD, executa suíte de testes de integração E2E, calcula SemVer, gera Changelog e fecha o Git Flow. |
| `/testar` | [testar.md](workflows/testar.md) | **Suporte** | Depurador Reativo: Analisa tracebacks e aplica correções cirúrgicas mínimas no código de produção. |
| `/ask` | [ask.md](workflows/ask.md) | **Suporte** | Oráculo Read-Only: Responde dúvidas técnicas e conceituais sem alterar arquivos. |
| `/debug` | [debug.md](workflows/debug.md) | **Suporte** | Investigador Forense: Investiga runtime crashes e falhas complexas via 5 Whys. |
| `/infra` | [infra.md](workflows/infra.md) | **Suporte** | DevOps/SysAdmin: Gerencia manifestos de dependências, contêineres e variáveis de ambiente. |

---

## 📚 Deep Delegation (Manuais Técnicos)

Para aprofundar no funcionamento da arquitetura e nos padrões adotados no projeto, consulte a documentação detalhada:

* 📖 **[Arquitetura do Ecossistema](docs/README.md)**: Visão completa do modelo Router vs. Skill e fluxo de agentes.
* 🔄 **[Guia do Fluxo de Desenvolvimento](docs-antigravity/guia-fluxo-desenvolvimento.md)**: Especificação técnica do ciclo Multi-Chat em 5 Fases e Phase Gates.
* 🛠️ **[Guia de Skills](docs-antigravity/guia-skills.md)**: Manual de criação, anatomia e uso de Skills modulares.
* 🧠 **[Guia da Base de Conhecimento](docs-antigravity/guia-base-conhecimento.md)**: Protocolo de integração MCP e estrutura do "Second Brain" no Obsidian.
* 📑 **[Guia de Artefatos](docs-antigravity/guia-artefatos.md)**: Padrões de relatórios, planos de implementação e diagramas.
* 📐 **[Boas Práticas para Agentes](docs-antigravity/boas-praticas-agentes.md)**: Diretrizes de concisão, extensibilidade e roteamento para agentes LLM.

---

<p align="center">
  <em>Built as a cutting-edge experiment on how engineering teams will work in collaboration with AIs in the future.</em>
</p>