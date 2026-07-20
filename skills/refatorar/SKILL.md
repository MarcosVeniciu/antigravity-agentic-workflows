---
name: "refatorar"
description: "Habilidade técnica de refatoração estrutural, Clean Code e SOLID. Focada em eliminar Code Smells (SRP, nesting, magic numbers) e otimizar legibilidade, exigindo 100% de testes verdes."
---

# Skill: Clean Code & Refatoração Estrutural (`skills/refatorar`)

Esta habilidade rege as regras de negócio para a reestruturação e melhoria do design interno do código funcional. Nenhuma alteração deve quebrar testes ou alterar contratos comportamentais. Sempre comunique-se com o usuário em Português.

---

## 📖 Recursos e Documentação sob Demanda

Quando o workflow solicitar ou houver dúvida sobre as técnicas, acesse os recursos abaixo via ferramenta `view_file` (ou gere o artefato usando o template):

* **Manual Detalhado de Refatoração**: `@/.agents/skills/refatorar/references/EXECUTION.md`
* **Template do Checklist de Refatoração**: `@/.agents/skills/refatorar/resources/refactor_checklist_template.md`

---

## ⛔ Regras Universais de Proteção (Strict Constraints)

1. **Preservação Rígida de Comportamento**: Nenhuma refatoração pode alterar retornos, exceções disparadas ou contratos públicos da funcionalidade.
2. **Zero Regressão de Testes**: Se um teste falhar após a edição do código, a refatoração está errada. Reverta a alteração imediatamente.
3. **Proibição de Novas Features**: Refatorar é limpar o código existente, não adicionar regras de negócio novas.
4. **Foco Cirúrgico em Code Smells**:
   * Métodos/Funções muito grandes (> 20 linhas) $\rightarrow$ *Extract Method / Function*.
   * Aninhamento profundo (`if` dentro de `if`) $\rightarrow$ *Guard Clauses / Early Returns*.
   * Valores soltos no código $\rightarrow$ *Named Constants*.
   * Múltiplas responsabilidades no mesmo componente $\rightarrow$ *Extract Class / Module (SRP)*.

---

## ✅ Matriz de Evidências da Refatoração

Sempre que concluir o ciclo de refatoração no Workflow, apresente ao usuário um resumo formatado das mudanças:

| Elemento Refatorado | Code Smell / Princípio SOLID | Técnica Aplicada |
| :--- | :--- | :--- |
| Exemplo: `calcular()` | Aninhamento profundo | Guard Clause (Retorno precoce) |
| Exemplo: `processar()`| Violava o SRP (> 35 linhas)| Extract Method (`_validar`) |