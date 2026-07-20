---
type: pivot
feature: "[FEATURE_SLUG]"
project: antigravity
date: "[YYYY-MM-DD]"
status: ativo
tags:
  - pivot
  - feature/[FEATURE_SLUG]
  - phase/implementacao
---

# 🔄 Registro de Pivot Técnico: [FEATURE_SLUG]

## 1. Contexto & Problema Encontrado
Descreva o desvio técnico, limitação de biblioteca/API ou imprevisto encontrado durante a **Fase Green (TDD)** que impediu a execução estrita do contrato originalmente previsto no SDD (`01-concepcao/sdd-[FEATURE_SLUG].md`).

## 2. Decisão e Alteração Efetuada
* **Mudança na Assinatura/Contrato:** Detalhe alterações em funções, tipos de retorno ou argumentos.
* **Ajuste no Código / Fixtures:** Explicite o que mudou na implementação de produção ou nos testes.

## 3. Impacto e Rastreabilidade
* **Impacto Local:** Gravado exclusivamente em `02-auditorias/pivots-[FEATURE_SLUG].md`.
* **Promovido para ADR Global?**
  - [ ] **Sim:** Criada Nota de Decisão Arquitetural em `00-core-rules/adrs/adr-[SLUG].md`.
  - [ ] **Não:** Ajuste pontual restrito ao escopo desta feature.

## 4. Atualizações Necessárias
- [ ] Atualizar suíte de testes afetada em `/testes`
- [ ] Registrar divergência no `task_list.md` da sessão