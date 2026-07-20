# Arquitetura de Agentes vs. Skills (Habilidades) no Antigravity

Este documento descreve a separação de conceitos, a mecânica de execução, a taxonomia oficial do ciclo de vida e as boas práticas de design para a criação de Agentes (Workflows) e Habilidades (Skills) dentro do ambiente Antigravity.

---

## 1. Separação de Responsabilidades (Conceito)

Para manter o ecossistema limpo, escalável e livre de redundâncias, o design de agentes deve seguir o princípio da **Separação de Preocupações (Separation of Concerns)**:

```text
+---------------------------------------------------------+
|                  AGENTE (Workflow)                      |
|  - O Maestro (Orquestrador do Fluxo)                    |
|  - Define o *quando* e o *porquê* |
|  - Ciclo de vida da tarefa (/planejamento, /testes)     |
+------------------------------------+--------------------+
                                     |
                                     | Usa como ferramenta
                                     v
+---------------------------------------------------------+
|                    SKILL (Habilidade)                   |
|  - O Especialista (Capacidade Técnica Reutilizável)     |
|  - Define o *como* (Templates, Scripts, Checklists)     |
|  - Modular e reutilizável por múltiplos agentes         |
+---------------------------------------------------------+

```

### O Agente (Workflow / `/comando`)

* **Papel:** Controlar a jornada de desenvolvimento e a interação com o usuário.
* **Foco:** Sequenciamento de fases e regras do processo (ex: *"1. Pergunte ao usuário -> 2. Crie o plano -> 3. Salve no Obsidian -> 4. Faça commit"*).
* **Localização:** `.agents/workflows/` ou globais.

### A Skill (Habilidade)

* **Papel:** Funcionar como uma ferramenta técnica encapsulada.
* **Foco:** Fornecer os templates, scripts executáveis e regras técnicas de como realizar uma ação específica (ex: *"Como formatar um nó no Obsidian"*, *"Como rodar commits semânticos"*).
* **Localização:** `.agents/skills/`.

---

## 2. Taxonomia de Agentes (O Mapa do Ecossistema)

Para garantir a governança e evitar poluição de contexto, os agentes (workflows) são estritamente categorizados conforme sua atuação no projeto.

### 🌊 Agentes de Fluxo Nominal (As 4 Fases)

Atuam no caminho feliz do desenvolvimento. Cada fase ocorre em um chat isolado.

* **Fase 1 (Concepção):** `/planejamento`, `/artefatos`
* **Fase 2 (Loop TDD Linear):** `/testes` $\rightarrow$ `/codigo` $\rightarrow$ `/refatorar` *(O `/codigo` foca apenas em fazer os testes passarem. Se falhar, aciona-se os reativos).*
* **Fase 3 (Auditoria Especializada):** `/review`
* **Fase 4 (Release e Encerramento):** `/docs`, `/release`

### 🚑 Agentes Reativos e de Resolução de Problemas

Atuam como tratamento de exceções. **Devem SEMPRE ser acionados em uma nova janela de chat limpa** para não poluir o histórico de desenvolvimento com tracebacks de erros gigantescos.

* **`/testar` (Reactive Debugger):** Focado em **correções cirúrgicas**. Lê o traceback de um teste falho (gerado pelo `/codigo` ou rodado manualmente) e altera o código de produção estritamente necessário para fazê-lo passar.
* **`/debug` (Forensic Investigator):** Focado em **investigação de causa raiz (RCA)**. Aplica o framework dos *5 Whys* para desvendar crashes sistêmicos obscuros, problemas de infraestrutura ou falhas de arquitetura que não são triviais de resolver.

---

## 3. A Real Mecânica de Execução (O Prompt)

Existe uma diferença fundamental entre a forma como a IDE gerencia os metadados de uma Skill e a forma como o conteúdo da mesma é lido pela IA.

**O que a IDE faz automaticamente:**

* A IDE lê apenas o cabeçalho (Frontmatter YAML) de todas as skills disponíveis.
* Injeta esse catálogo de metadados no prompt de sistema inicial.
* O corpo markdown (`SKILL.md`) **NÃO** é injetado automaticamente.

**O que a IA (LLM) faz:**

1. **Detecção:** Lê a lista de metadados de skills disponíveis.
2. **Leitura sob Demanda (Progressive Disclosure):** Quando o fluxo exige, a IA realiza uma chamada de ferramenta (`view_file`) apontando para o arquivo `SKILL.md` ou `EXECUTION.md` específico.
3. **Execução:** Aplica as regras apenas para aquele momento.

> [!NOTE]
> Essa pausa no fluxo para a chamada de ferramenta é intencional e salva milhares de tokens, evitando poluir o prompt com regras que podem não ser utilizadas.

---

## 4. Guia de Boas Práticas na Criação

### Como escrever o Agente (Workflow)

Mantenha o prompt o mais simples e processual possível. Delegue a técnica para as skills.

```markdown
# Agent: Planejamento (`/planejamento`)
1. Inicie entrevistando o usuário para entender o escopo.
2. Acione @/agents/skills/artefatos/ para gerar a especificação.
3. Acione @/agents/skills/grafo/ para salvar no Obsidian Vault.

```

### Como escrever a Skill

Coloque nela toda a complexidade e restrições.

```markdown
---
name: "grafo"
description: "Persiste dados no Obsidian com links bidirecionais"
---
# Skill: Grafo
1. Salve sempre na pasta `01-concepcao/`.
2. Garanta que o frontmatter tenha a tag `type: bdd`.