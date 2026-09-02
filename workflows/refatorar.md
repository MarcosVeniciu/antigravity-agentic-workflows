---
title: "Structural Refactoring and Clean Code Agent"
description: "Consolidates Phase 3: optimizes functional code applying Clean Code, SOLID principles, and eliminates Code Smells while preserving 100% green tests."
---

# Agent: Refatoração de Consolidação (`/refatorar`)

Você orquestra a **Fase 3 (Chat 3)** do desenvolvimento da feature.

---

## 🚀 Esteira de Execução em 4 Etapas

### Etapa 1: Gate de Entrada & Escopo de Refatoração
- **Gate de Entrada Obrigatório**: Execute a suíte de testes no terminal. Se algum teste estiver quebrando, aborte a refatoração imediatamente e direcione o usuário para `/implementar` ou `/testar`.
- **Descoberta de Escopo**: Mapeie os arquivos alterados na branch usando:
  ```bash
  git --no-pager diff develop...HEAD --name-only
  ```
  *(Fallback para `main...HEAD` se `develop` não existir)*.

### Etapa 2: Mapeamento de Oportunidades no `task_list.md`
- Analise os arquivos modificados e liste no `task_list.md` as oportunidades de melhoria:
  - Redução de complexidade e aninhamentos (Guard Clauses).
  - Extração de métodos longos e separação de responsabilidades (SRP).
  - Eliminação de números mágicos e strings soltas (Constantes).

### Etapa 3: Loop de Refatoração Cirúrgica
Para cada componente planejado no `task_list.md`:
1. **Aplicar Refatoração**:
   * Aplique as melhorias de Clean Code e SOLID sem alterar o comportamento externo.
   * 💡 **Skill Recomendada:** `skills/refatorar`
2. **Executar Testes de Regressão**:
   * Execute a suíte no terminal após cada alteração.
   * **Se quebrar**: Reverta imediatamente via `skills/git` (Modo 4: `git reset --hard HEAD`).
   * **Se passar (100% Verde)**: Salve um micro-checkpoint local via `skills/git` (Modo 2).

### Etapa 4: Conclusão, Atualização do DoD & Handover
- Apresente a **Matriz de Evidências de Refatoração** ao usuário.
- Atualize o Living DoD em `01-concepcao/dod-[slug].md` marcando `- [x] Fase 3: Refatoração Final (/refatorar)` via `skills/dod`.
- Execute o commit semântico de consolidação via `skills/git` (Modo 3 - Phase Squash):
  ```bash
  git commit -m "refactor(consolidacao): aplicacao de Clean Code e SOLID para [slug]"
  ```
- Imprima a recomendação de transição de fase:
  > **[NEXT STEP]** ➡️ *"🧹 Fase 3 (Refatoração) concluída com 100% dos testes verdes! Abra um **NOVO CHAT (Chat 4)** e execute `/review` para iniciar as auditorias especializadas."*