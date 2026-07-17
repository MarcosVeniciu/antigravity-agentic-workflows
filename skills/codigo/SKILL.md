---
name: "codigo"
description: "Skill de implementação TDD Green Phase. Escreve código mínimo funcional com docstrings padronizadas, regras SOLID e gerenciamento de tarefas."
---

# Skill: TDD Green Phase & Codificação de Produção (`skills/codigo`)

Gerencia a fase de implementação do ciclo TDD (Green Phase), escrevendo o código mínimo e limpo para satisfazer os testes criados pela skill de testes.

---

## 🛠️ Guia de Execução

Consulte as instruções operacionais detalhadas no arquivo de referência:
* [Guia de Execução Implementation Engineer (Green Phase)](references/EXECUTION.md)

---

## 📁 Recursos & Templates

* **Template de Checklist Iterativo (`task.md`)**: [task_template.md](resources/task_template.md)
* **Template de Pivots & Desvios Locais**: [pivot_template.md](resources/pivot_template.md) (salvo em `02-auditorias/pivots-[slug].md` se houver adaptações no TDD).

---

## ⛔ Regras Universais & Restrições

1. **Código Mínimo Necessário**: Escrever estritamente o código que faz a asserção do teste passar. Zero código morto ou funcionalidades não testadas.
2. **Atualização Iterativa do `task.md`**: Nunca concluir todas as tarefas de uma vez. Marcar `[/]` ao iniciar um item e `[x]` ao finalizar a alteração correspondente.
3. **Docstrings e Tipagem Explícita**: Usar Type Hints e docstrings detalhadas com o link formal `Ref: Obsidian note [[note-name]]`.
4. **Promoção de Regras (`Promote-on-Impact`)**: Se durante a escrita for alterada uma convenção global, criar a nota correspondente em `00-core-rules/adrs/` (`type: adr`).

---

## ✅ Checklist de Validação

- [ ] A lista de tarefas `task.md` foi mantida e atualizada iterativamente?
- [ ] O código respeita os princípios SOLID (com indicação nos comentários/docstrings)?
- [ ] Todos os métodos possuem Type Hints e docstrings padronizadas?
- [ ] O comando de teste foi fornecido em bloco `bash` isolado sem execução autônoma?
