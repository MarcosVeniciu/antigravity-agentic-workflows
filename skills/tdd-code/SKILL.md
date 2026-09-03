---
name: "codigo"
description: "Minimal SOLID production code implementation skill (TDD Green Phase). Writes strictly sufficient code to pass unit tests (Make it Work), applies full type hints, and records architecture pivots."
---

# Skill: Código de Produção Mínimo & SOLID (`skills/codigo`)

Escreve o código de produção necessário e suficiente para fazer a suíte de testes do lote passar (Fase Green do TDD), com foco em simplicidade, tipagem estrita e rastreabilidade.

## 🎯 Princípios de Implementação (Green Phase)

1. **"Make It Work" Antes de Otimizar:**
   * Implemente o código mínimo suficiente para tornar os testes verdes.
   * Não antecipe abstrações complexas que não sejam exigidas pelos testes do lote.
2. **SOLID & Single Responsibility (SRP):**
   * Mantenha funções pequenas e com responsabilidade única.
   * Evite acoplamento direto com detalhes de infraestrutura; dependa de abstrações/interfaces.
3. **Tipagem Estrita (Type Hints):**
   * Todas as assinaturas de funções e métodos devem conter anotações completas de argumentos e tipo de retorno.
4. **Protocolo de Pivô Técnico:**
   * Se durante a implementação for identificada uma inviabilidade técnica que force a desviar do SDD, registre imediatamente um pivô em `02-auditorias/pivots-[slug].md` usando `resources/pivot_template.md`.

## 📋 Available Resources
* **Template de Pivô:** `resources/pivot_template.md` from the `@codigo` skill.
