---
title: "Unified Implementation Engineer"
description: "Executa a Fase 2 do desenvolvimento unificando planejamento em lote, TDD (Red + Green) e sincronização de artefatos."
---

# Workflow: Unified Implementation Engineer (`/implementar`)

Este workflow orquestra a implementação técnica de funcionalidades em um chat limpo, consumindo os contratos da Fase 1 (BDD e SDD), organizando tarefas por Lotes Contextuais e executando o ciclo TDD (Red ➔ Green) com atualização atômica de estado.

---

## 🎯 Passos do Workflow

### Step 1: Bootstrapping & Leitura de Contratos (Clean Chat)
1. Invoque a skill `@git` para verificar o estado do repositório e obter a branch ativa via `git branch --show-current`.
2. Extraia o `[feature-slug]` do nome da branch.
3. Consulte o MCP do Obsidian Vault e carregue os contratos da Fase 1:
   * **BDD Contract:** `01-concepcao/bdd-[feature-slug].md` (Tags `#type/bdd`, `#feature/[feature-slug]`).
   * **SDD Contract:** `01-concepcao/sdd-[feature-slug].md` (Tags `#type/sdd`, `#feature/[feature-slug]`).
4. Consulte as convenções globais em `00-core-rules/conventions.md`.

---

### Step 2: Planejamento Arquitetural & Agrupamento por Contexto
1. Ative as diretrizes da skill `@/.agents/skills/implementar-plan/SKILL.md`.
2. Emita o artefato interativo `implementation_plan.md` detalhando a estratégia técnica.
3. Emita o artefato interativo de acompanhamento `task_list.md` utilizando o modelo `@/.agents/skills/implementar-plan/resources/task_template.md`.
   * **Regra Chave:** Agrupe as tarefas por **Lotes de Contexto Dependente** (ex: DTO + Repositório + Serviço) em vez de arquivos isolados.
   * Defina a última fase da checklist como `Fase N: Executar Suíte de Testes e Ajustes Finos`.
4. Configure os metadados do artefato com `RequestFeedback: true` e aguarde a confirmação do desenvolvedor antes de alterar o código.

---

### Step 3: Execução Atômica por Lote Contextual (Red ➔ Green na Mesma Chamada)
1. Ative as diretrizes da skill `@/.agents/skills/implementar-code/SKILL.md`.
2. Para cada Fase de Lote Contextual definida na `task_list.md`, execute **em uma única chamada de resposta da API**:
   * **Escrever Testes do Lote (Red):** Crie/atualize a suíte de testes no padrão AAA (`tests/`) para todas as entidades do lote.
   * **Escrever Código do Lote (Green):** Implemente o código de produção mínimo suficiente em `src/` com Type Hints, SOLID e docstrings rastreáveis.
   * **Atualizar Checklist:** Atualize imediatamente o artefato `task_list.md` marcando os itens daquele lote como concluídos (`[x]`).

---

### Step 4: Fase Final - Validação da Suíte Completa & Tolerância a Falhas
1. Ao chegar na `Fase N` da `task_list.md`, forneça ao desenvolvedor o comando para execução da suíte completa de testes (ex: `pytest -v -s tests/`).
2. **Mecanismo de Auto-Correção e Rollback (Regra do Duplo Strike):**
   * Se os testes falharem, tente corrigir o código de produção (máximo de 2 tentativas consecutivas na mesma sessão).
   * Se o erro persistir após 2 tentativas, **interrompa a execução**, execute `git reset --hard HEAD` (Mode 3 da skill `@git`) para restaurar o estado estável e instrua o usuário a abrir um novo chat limpo acionando `/testar` ou `/debug`.

---

### Step 5: Checkpoint de Finalização & Handover
1. Se todos os testes passarem (100% verde):
   * Invoque a skill `@git` no **Mode 1 (Micro-Checkpoint)** registrando o commit: `feat([feature-slug]): implementação completa da suíte de testes e código`.
   * Marque a `Fase N` como concluída no `task_list.md`.
2. Exiba a instrução oficial de encerramento do chat e transição de fase:

> **[NEXT STEP]** ➡️ *"⚙️ Implementação TDD por fases concluída com sucesso e suíte de testes 100% verde! É altamente recomendado que você abra um novo chat para a etapa de refatoração estrutural sem viés de contexto. Execute `/refatorar` para iniciar a melhoria e limpeza do código."*