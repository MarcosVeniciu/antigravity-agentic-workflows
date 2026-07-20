---
name: "refatorar"
description: "Workflow de encerramento da Fase 2. Orquestra a refatoração do código funcional e consolida o Phase Handover."
---

# Workflow: Refatoração (Fase 2)

Siga estritamente estes passos sequenciais. Não explique conceitos técnicos.

**1. Validação do Portão de Fase (Phase Gate)**
- Execute a suíte de testes do projeto via terminal.
- 🛑 Prossiga apenas se 100% dos testes passarem. Se falharem, aborte e peça ao usuário para corrigir o código.

**2. Planejamento no Artefato**
- Atualize o artefato interativo `task_list.md` usando a ferramenta `replace_file_content` para refletir as tarefas de refatoração pendentes que você identificar.

**3. Execução Técnica**
- Siga as diretrizes de Clean Code e SOLID carregadas automaticamente do painel da sua skill (`.agents/skills/refatorar/SKILL.md`).
- Refatore o código iterativamente. Após alterar cada componente, rode os testes para validar que a mudança não alterou comportamentos.


**4. Handover & Encerramento**
- Concluída a refatoração, acione a skill do Git para realizar o commit de consolidação (Modo 2 - Phase Squash).
- Encerre o fluxo fornecendo o exato comando de transição para o usuário prosseguir:
  > **[NEXT STEP]** ➡️ *"✨ Refatoração concluída e testes 100% verdes. Feche este chat efêmero para limpar o contexto e inicie a Fase 3 enviando o comando abaixo em uma nova conversa:*
  > *`Inicie a Fase 3 de Auditorias Especializadas na branch atual (/review).`"*

## Fluxo de Execução e Tolerância a Falhas

1. **Pre-flight & Base Point**: Antes de iniciar qualquer alteração de código, invoque `@git` para garantir que o workspace está limpo.
2. **Ciclo Iterativo de Escrita (TDD)**:
   * Escreva o código mínimo para fazer o teste passar.
   * A suite de testes retornou 100% verde? **Ative a skill `@git` no Mode 1 (Micro-Checkpoint)** para criar um ponto de restauração seguro.
3. **Mecanismo de Auto-Correção e Rollback**:
   * Se durante uma etapa de refatoração ou implementação o código quebrar e você não conseguir resolver o erro após 2 tentativas consecutivas, **não continue poluindo o contexto**.
   * **Invoque a skill `@git` no Mode 3 (Rollback/Recovery)** executando `git reset --hard HEAD` para limpar o escopo e retornar imediatamente ao último checkpoint estável conhecido.
   * Recomece a lógica a partir do ponto seguro com uma abordagem diferente.