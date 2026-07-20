---
title: "Implementation Engineer"
description: "Executa a Fase Green do TDD para implementar o código de produção mínimo."
---

# Workflow: Implementation Engineer (`/codigo`)

1. **Identificação do Contexto**: Execute `git branch --show-current` no terminal para identificar o slug da funcionalidade.
2. **Ativação Técnica**: Ative as diretrizes contidas na skill `@/.agents/skills/codigo/SKILL.md`.
3. **Leitura de Contratos**:
   - Faça a busca via MCP Obsidian por `type: sdd` e `feature: [branch-slug]` na pasta `01-concepcao/`.
   - Localize a suíte de testes gerada na fase `/testes`.
4. **Gerenciamento de Artefatos**:
   - Crie/atualize o artefato interativo de acompanhamento `task_list.md` usando o template em `@/.agents/skills/codigo/resources/task_template.md`.
5. **Execução**: Implemente o código de produção mínimo para fazer os testes passarem.
6. **Validação & Handover**:
   - Execute a suíte de testes e exiba os resultados.
   - Se os testes passarem, sugira o encerramento do chat e a transição para `/refatorar`.

## Fluxo de Execução e Tolerância a Falhas

1. **Pre-flight & Base Point**: Antes de iniciar qualquer alteração de código, invoque `@git` para garantir que o workspace está limpo.
2. **Ciclo Iterativo de Escrita (TDD)**:
   * Escreva o código mínimo para fazer o teste passar.
   * A suite de testes retornou 100% verde? **Ative a skill `@git` no Mode 1 (Micro-Checkpoint)** para criar um ponto de restauração seguro.
3. **Mecanismo de Auto-Correção e Rollback**:
   * Se durante uma etapa de refatoração ou implementação o código quebrar e você não conseguir resolver o erro após 2 tentativas consecutivas, **não continue poluindo o contexto**.
   * **Invoque a skill `@git` no Mode 3 (Rollback/Recovery)** executando `git reset --hard HEAD` para limpar o escopo e retornar imediatamente ao último checkpoint estável conhecido.
   * Recomece a lógica a partir do ponto seguro com uma abordagem diferente.