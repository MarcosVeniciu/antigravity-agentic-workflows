---
name: "refatorar"
description: "Structural refactoring, Clean Code, and SOLID technical skill in Phase 3. Eliminates Code Smells (SRP, nesting, magic numbers) and optimizes legibility while keeping tests 100% green."
---

# Skill: Clean Code & Refatoração Estrutural (`skills/refatorar`)

Guia a melhoria do design interno e da manutenibilidade do código funcional produzido na Fase 2, eliminando Code Smells sem alterar o comportamento externo e mantendo a suíte de testes 100% verde.

---

## 📖 Recursos de Apoio

* 📖 **Manual Detalhado de Refatoração**: `references/EXECUTION.md` from the `@refatorar` skill
* 📋 **Template de Checklist de Refatoração**: `resources/refactor_checklist_template.md` from the `@refatorar` skill

---

## ⛔ Regras Estritas de Proteção

1. **Preservação Rígida de Comportamento**: Nenhuma refatoração pode alterar retornos, exceções ou contratos públicos do sistema.
2. **Zero Regressão de Testes**: Se algum teste quebrar após a refatoração, o ajuste está incorreto. Reverta imediatamente via `git reset --hard HEAD` (Modo 4).
3. **Proibido Criar Novas Features**: Refatorar é limpar o código existente, não inventar regras novas.
4. **Foco Cirúrgico em Code Smells**:
   * Métodos/funções longas (> 20 linhas) $\rightarrow$ *Extract Method / Function*.
   * Aninhamento profundo (`if` dentro de `if`) $\rightarrow$ *Guard Clauses / Early Returns*.
   * Literais mágicos $\rightarrow$ *Constantes Nomeadas*.
   * Múltiplas responsabilidades $\rightarrow$ *Extract Class / Module (SRP)*.
5. **Fronteira de Escopo da Branch**: Restrinja a refatoração estritamente aos arquivos modificados na branch atual (`git diff develop...HEAD --name-only`). Nunca refatore código legado intocado.

---

## ✅ Matriz de Evidências de Refatoração

Ao concluir a refatoração de um componente, apresente a matriz de mudanças:

| Elemento Refatorado | Code Smell / Princípio SOLID | Técnica Aplicada |
| :--- | :--- | :--- |
| Ex: `calculate()` | Aninhamento profundo | Guard Clauses (Early return) |
| Ex: `process()` | Violação de SRP (> 35 linhas) | Extract Method (`_validate`) |