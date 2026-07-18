---
name: "refatorar"
description: "Skill de refatoração estrutural e Clean Code. Aplica princípios SOLID, elimina Code Smells e otimiza a legibilidade sem alterar comportamento."
---

# Skill: Clean Code & Refatoração Estrutural (`skills/refatorar`)

Gerencia a etapa final do ciclo TDD (Refactor Phase), aprimorando o design interno, reduzindo a complexidade ciclomática e aplicando princípios SOLID em código já funcional e 100% verde.

---

## 🛠️ Guia de Execução

Consulte as instruções operacionais detalhadas no arquivo de referência:
* [Guia de Execução Clean Code Specialist](references/EXECUTION.md)

---

## 📁 Recursos & Templates

* **Template de Checklist de Refatoração (`task.md`)**: [refactor_checklist_template.md](resources/refactor_checklist_template.md)

---

## ⛔ Regras Universais & Restrições

1. **Preservar Comportamento**: Nenhuma refatoração pode alterar a saída ou os contratos de classe/função já testados.
2. **Não Quebrar Testes**: Se qualquer teste falhar durante a refatoração, a mudança deve ser desfeita imediatamente.
3. **Eliminar Code Smells**: Foco em funções longas (>20 linhas), aninhamentos profundos, números mágicos e duplicidades.
4. **Micro-Checkpoints & Squash**: Salvar um micro-checkpoint com a skill `git` (Modo 1) após refatorar cada componente. Ao concluir toda a refatoração, acione a skill `git` (Modo 2 - Phase Squash) para consolidar a Fase 2.

---

## ✅ Checklist de Validação

- [ ] Todos os testes continuam passando 100% verdes após as alterações?
- [ ] Foram explicadas as razões da refatoração (Qual smell/princípio SOLID foi abordado)?
- [ ] Foram aplicadas Guard Clauses para eliminar `if/else` aninhados?
- [ ] Foram gerados micro-checkpoints (Modo 1) e o squash final de fase via a skill `git` (Modo 2)?
- [ ] Foi sugerida a abertura de um novo chat efêmero para a Fase 3 (`/review`)?
