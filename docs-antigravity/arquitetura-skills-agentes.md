# Arquitetura de Agentes vs. Skills (Habilidades) no Antigravity

Este documento descreve a separação de conceitos, a mecânica de execução e as boas práticas de design para a criação de Agentes (Workflows) e Habilidades (Skills) dentro do ambiente Antigravity.

---

## 1. Separação de Responsabilidades (Conceito)

Para manter o ecossistema limpo, escalável e livre de redundâncias, o design de agentes deve seguir o princípio da **Separação de Preocupações (Separation of Concerns)**:

```
+---------------------------------------------------------+
|                  AGENTE (Workflow)                      |
|  - O Maestro (Orquestrador do Fluxo)                    |
|  - Define o *quando* e o *porquê*                       |
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
* **Localização:** `agents/` ou `global_workflows/`.

### A Skill (Habilidade)
* **Papel:** Funcionar como uma ferramenta técnica encapsulada.
* **Foco:** Fornecer os templates, scripts executáveis e regras técnicas de como realizar uma ação específica (ex: *"Como formatar um nó no Obsidian"*, *"Como rodar commits semânticos"*).
* **Localização:** `skills/` ou `.agents/skills/`.

---

## 2. A Real Mecânica de Execução (O Prompt)

Existe uma diferença fundamental entre a forma como a IDE gerencia os metadados de uma Skill e a forma como o conteúdo da mesma é lido pela IA.

### O que a IDE faz automaticamente:
* A IDE lê apenas o **cabeçalho (Frontmatter YAML)** de todas as skills disponíveis no diretório global e local.
* Ela injeta esse catálogo de metadados (nome, descrição e caminho do arquivo) diretamente na seção `<skills>` do prompt do sistema.
* **O corpo (markdown) das instruções do `SKILL.md` NÃO é injetado automaticamente no prompt da conversa.**

### O que a IA (Modelo de Linguagem) faz:
1. **Detecção:** A IA lê a lista de metadados de skills disponíveis injetadas no prompt.
2. **Leitura sob Demanda (O "Pause" no Fluxo):** Quando o fluxo do Agente ou a tarefa do usuário requer as regras de uma skill, a IA realiza uma chamada de ferramenta (`view_file`) apontando para o caminho do arquivo `SKILL.md` da skill correspondente.
3. **Execução:** Após ler o conteúdo do arquivo, a IA passa a aplicar as regras detalhadas daquela skill durante a conversa.

> [!NOTE]
> Essa pausa no fluxo para a chamada de ferramenta é intencional e essencial para **preservar a janela de contexto (tokens)**, evitando poluir o prompt com regras que podem não ser utilizadas nas primeiras interações.

---

## 3. Guia de Boas Práticas

Para evitar duplicidade de instruções (como no caso de agentes que reescrevem as mesmas regras de suas respectivas skills), utilize a seguinte divisão prática:

### Como escrever o Agente (Workflow)
Mantenha o prompt do agente o mais simples e processual possível. Delegue o trabalho técnico para as skills.
```markdown
# Agent: Planejamento (`/planejamento`)
1. Inicie a conversa entrevistando o usuário para entender o BDD.
2. Ative a skill `artefatos` para gerar o arquivo de especificação no formato correto.
3. Ative a skill `grafo` para salvar o arquivo gerado na pasta apropriada do Obsidian.
4. Finalize ativando a skill `git` para realizar o commit.
```

### Como escrever a Skill
Coloque nela toda a complexidade técnica de templates, checklists de validação e comandos de scripts:
```markdown
---
name: "grafo"
description: "Persiste dados estruturados no Obsidian com links bidirecionais"
---
# Skill: Grafo
1. Salve sempre na pasta `01-concepcao/`.
2. Garanta que o YAML tenha a tag `type: bdd`.
3. Use o template em `resources/note_template.md`.
```
