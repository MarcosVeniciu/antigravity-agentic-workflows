---
title: "TDD Implementation Agent"
description: "Executes Phase 2 (Chat 2) TDD cycle: batch planning, AAA unit tests (Red), minimal SOLID code (Green), DoD timeline logging, and micro-checkpoints."
---

# Agent: Desenvolvimento TDD Iterativo (`/implementar`)

Você orquestra a **Fase 2 (Chat 2)** do ciclo de desenvolvimento da feature.

---

## 🚀 Esteira de Execução em 3 Etapas

### Etapa 1: Planejamento de Lotes de Contexto
- Leia as especificações BDD (`01-concepcao/bdd-[slug].md`) e o blueprint SDD (`01-concepcao/sdd-[slug].md`).
- Decomponha os requisitos em **Lotes de Contexto Dependentes**.
- 💡 **Skill Recomendada:** `skills/tdd-plan`
- Gere os artefatos `implementation_plan.md` e `task_list.md` (`RequestFeedback: true`).
- **Pausa de Validação:** Avance para a Etapa 2 apenas após a aprovação do plano (clique em **Proceed** ou confirmação).

---

### Etapa 2: Loop TDD por Lote de Contexto
Para cada lote definido no `task_list.md`, execute rigorosamente o ciclo abaixo:

1. **Escrever Testes Unitários AAA (Fase Red):**
   * Gere os testes com mocks isolados cobrindo Happy Path e Edge Cases.
   * 💡 **Skill Recomendada:** `skills/testes`
2. **Escrever Código de Produção Mínimo (Fase Green):**
   * Escreva estritamente o código necessário para tornar os testes verdes ("Make it Work").
   * Aplique tipagem completa e registre pivôs caso necessário.
   * 💡 **Skill Recomendada:** `skills/codigo`
3. **Execução da Suíte de Testes:**
   * Execute os testes no terminal.
   * Se algum teste falhar, isole a causa raiz e aplique correção cirúrgica sem alterar a asserção do teste.
   * 💡 **Skill Recomendada:** `skills/testar`
4. **Governança do Lote (DoD e Checkpoint):**
   * Atualize o `task_list.md` marcando o lote como concluído (`[x]`).
   * Adicione uma entrada na Linha do Tempo em `01-concepcao/dod-[slug].md` via `skills/dod`.
   * Salve um micro-checkpoint local via `skills/git` (Modo 2):
     ```bash
     git add .
     git commit -m "checkpoint(implementar): lote [N] - [descricao]"
     ```

---

### Etapa 3: Conclusão da Fase 2 & Handover
- Com 100% dos lotes concluídos e testes unitários verdes:
  - Salve o checkpoint final da Fase 2 via `skills/git` (Modo 2).
  - Emita a recomendação de transição de fase:
    > **[NEXT STEP]** ➡️ *"💻 Fase 2 (TDD) concluída com 100% dos testes unitários verdes! Abra um **NOVO CHAT (Chat 3)** e execute `/refatorar` para consolidar o design com Clean Code e SOLID."*