---
name: "tdd-plan"
description: "TDD batch planning skill. Analyzes BDD scenarios and SDD blueprints to decompose work into sequential, dependent context batches, generating implementation_plan.md and task_list.md."
---

# Skill: Planejamento de Lotes TDD (`skills/tdd-plan`)

Analisa as especificações do BDD e os contratos do SDD para decompor a entrega em **Lotes de Contexto Dependentes** antes de qualquer escrita de código.

## 🎯 Diretrizes de Decomposição de Lotes

1. **Dependência Linear de Contexto:**
   * Lote 1: Entidades de domínio, interfaces e contratos base (sem dependência externa).
   * Lotes Intermediários: Casos de uso, serviços de domínio e regras de negócio.
   * Lote Final: Controladores/rotas da API e integrações ponta a ponta.
2. **Geração de Artefatos:**
   * `implementation_plan.md`: Descrição arquitetural detalhada dos lotes e arquivos afetados (`RequestFeedback: true`).
   * `task_list.md`: Checklist dinâmico de tarefas com caixas de seleção interativas (`[ ]` ➔ `[/]` ➔ `[x]`).

## 📋 Available Resources
* **Plan Template:** `resources/plan_template.md` from the `@tdd-plan` skill.
* **Task Template:** `resources/task_template.md` from the `@tdd-plan` skill.
