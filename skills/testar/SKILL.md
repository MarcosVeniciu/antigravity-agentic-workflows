---
name: "testar"
description: "Skill de depuração reativa e correção de erros de teste. Analisa logs do terminal e aplica ajustes mínimos cirúrgicos no código de produção."
---

# Skill: Depuração Reativa & Correção de Testes (`skills/testar`)

Gerencia a fase de depuração reativa (Reactive Debugger) do ciclo TDD, isolando a causa raiz a partir do traceback do terminal e corrigindo cirurgicamente o código de produção.

---

## 🛠️ Guia de Execução

Consulte as instruções operacionais detalhadas no arquivo de referência:
* [Guia de Execução Reactive Debugger](references/EXECUTION.md)

---

## 📁 Recursos & Templates

* **Template de Checklist de Erros (`task.md`)**: [error_checklist_template.md](resources/error_checklist_template.md)

---

## ⛔ Regras Universais & Restrições

1. **Correção Mínima em Produção**: Ajustar estritamente o código que causa o erro. Zero refatorações adicionais ou adição de novas features.
2. **Preservar a Vontade dos Testes**: Não alterar assertions dos testes para forçar passagem verde, salvo caso haja erro evidente de digitação/sintaxe no próprio teste.
3. **Resumo Cirúrgico & Checkpoint**: Explicar a causa raiz em uma única frase concisa antes de apresentar o código e salvar o micro-checkpoint acionando a skill `git` (Modo 1).

---

## ✅ Checklist de Validação

- [ ] A causa raiz foi identificada e classificada corretamente?
- [ ] O código de produção foi corrigido com o menor impacto possível?
- [ ] Os testes não foram enfraquecidos ou alterados sem justificativa?
- [ ] O micro-checkpoint de correção foi realizado acionando a skill `git` (Modo 1)?
- [ ] O comando de re-teste foi fornecido em bloco `bash` isolado?
