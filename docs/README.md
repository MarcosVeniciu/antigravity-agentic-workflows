# Arquitetura de Agentes e Skills: Antigravity IDE

A inteligência operacional do **Antigravity IDE** é fundamentada na fragmentação de responsabilidades. Em vez de utilizar um prompt monolítico vulnerável a alucinações de contexto (*token exhaustion*), a arquitetura distribui as etapas do ciclo de vida de desenvolvimento de software em **4 Fases rígidas executadas em Janelas de Chat Efêmeras**.

---

## 🔀 Arquitetura Router vs. Skill Execution

Para manter o contexto da IA limpo e focado, o ecossistema divide as responsabilidades em duas camadas estritas:

1. **Roteadores de Estado em `agents/`**: Arquivos leves que definem o papel do agente, restrições rígidas, evidências de sucesso e a regra padronizada de transição **[NEXT STEP]**.
2. **Execução Dinâmica em `skills/`**: Conjunto modular de instruções operacionais, templates de artefatos e checklists carregados sob demanda durante o atendimento da fase.

---

## 🗺️ O Ecossistema em 4 Fases (Multi-Chat)

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
        RevGeral[Review Geral <br> /review geral]
        RevArq[Arquitetura <br> /review arquitetura]
        RevSeg[Segurança <br> /review seguranca]
        RevPerf[Performance <br> /review performance]
        RevRes[Resiliência <br> /review resiliencia]
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

    %% Fluxo de Fase 1
    User -->|Inicia Feature| P
    P -->|Escopo BDD| A
    A -.->|Novos Pacotes| Infra
    Infra -.->|Ambiente Pronto| T

    %% Phase Gate 1 -> 2
    A ==>|SDD Salvo - Recomenda Novo Chat| T

    %% Fluxo de Fase 2 (TDD)
    T -->|Testes Red| C
    C -->|Suíte Verde| R
    C -.->|Falha| F
    R -.->|Regressão| F
    F -.->|Corrigido & Verde| R


    %% Phase Gate 2 -> 3
    R ==>|Code Clean - Recomenda Novo Chat| RevArq

    %% Fluxo de Fase 3 (Review Chain)
    RevGeral -.->|Review Opcional| Docs
    RevArq -->|Chained / Individual| RevSeg
    RevSeg -->|Chained / Individual| RevPerf
    RevPerf -->|Chained / Individual| RevRes

    %% Phase Gate 3 -> 4
    RevRes ==>|Audit 100% - Recomenda Novo Chat| Docs
    RevGeral ==>|Audit Geral - Recomenda Novo Chat| Docs

    %% Fluxo de Fase 4
    Docs -->|Manual/API Atualizada| Rel
    Rel -->|Tag & Changelog| User

    %% Links de Suporte
    Suporte -.- User

    style Chat1 fill:#1b2838,stroke:#00d2ff,stroke-width:2px,color:#fff
    style Chat2 fill:#1b382b,stroke:#00ff88,stroke-width:2px,color:#fff
    style Chat3 fill:#381b35,stroke:#ff00bb,stroke-width:2px,color:#fff
    style Chat4 fill:#382d1b,stroke:#ffaa00,stroke-width:2px,color:#fff
    style Suporte fill:#222,stroke:#888,stroke-width:1px,stroke-dasharray: 5 5,color:#fff
```

---

## 🎯 Detalhamento das Fases e Agentes

### 1. Fase 1: Concepção & Contratos (Chat 1)
Especializada em Requisitos BDD e Arquitetura Técnica (SDD). Nenhuma linha de código de produção é gerada nesta etapa.
* **[planejamento.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/planejamento.md) (`/planejamento`)**: Conduz o alinhamento de escopo em formato Gherkin (BDD) e salva em `01-concepcao/bdd-[slug].md`.
* **[artefatos.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/artefatos.md) (`/artefatos`)**: Traduz o BDD no plano de implementação (SDD), gerando `implementation_plan.md` e persistindo em `01-concepcao/sdd-[slug].md`.

### 2. Fase 2: Implementação TDD Loop (Chat 2)
Ciclo de desenvolvimento orientado por contratos técnicos.
* **[testes.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/testes.md) (`/testes`)**: Constrói a suíte de testes em vermelho (Red Phase: Happy path, Edge cases, Exceções e Profiling).
* **[codigo.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/codigo.md) (`/codigo`)**: Escreve a implementação mínima de produção necessária para tornar os testes verdes.
* **[testar.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/testar.md) (`/testar`)**: Depurador reativo que resolve quebras de testes cirurgicamente a partir do traceback do terminal.
* **[refatorar.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/refatorar.md) (`/refatorar`)**: Aplica princípios SOLID e Clean Code no código verde sem modificar a suíte de testes.

### 3. Fase 3: Auditorias Especializadas (Chat 3)
Auditoria rigorosa e correção cirúrgica por domínios.
* **[review.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/review.md) (`/review`)**: Unifica as auditorias de **Qualidade Geral**, **Arquitetura**, **Segurança**, **Performance** e **Resiliência**. Suporta ativação por esteira encadeada ou chamadas individuais por domínio (`/review [domínio]`).

### 4. Fase 4: Encerramento, Documentação & Publicação (Chat 4)
Finalização da entrega e versionamento semântico.
* **[docs.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/docs.md) (`/docs`, `/readme-projeto`)**: Atualiza as documentações locais e a vitrine principal (`README.md` raiz).
* **[release.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/release.md) (`/release`)**: Consolida o histórico, calcula o SemVer, atualiza o changelog em `03-releases/` e orienta a criação de tags.

---

## 🚑 Agentes de Suporte

* **[ask.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/ask.md) (`/ask`)**: Oráculo read-only para dúvidas sobre a codebase e a base de conhecimento.
* **[debug.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/debug.md) (`/debug`)**: Investigador forense para runtime crashes e erros de ambiente utilizando a técnica dos *5 Whys*.
* **[infra.md](file:///d:/Codigos/antigravity-agentic-workflows/docs/agentes/infra.md) (`/infra`)**: Gerenciador de dependências, manifestos (`package.json`, `pyproject.toml`, etc.) e configurações de contêineres/ambiente.
