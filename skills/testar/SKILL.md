---
name: "testar"
description: "Reactive debugging and test error fix skill. Isolates root causes from terminal tracebacks and applies minimal surgical adjustments to production code."
---

# Skill: Reactive Debugging & Test Fixing (`skills/testar`)

Esta skill orienta a depuração reativa durante a Fase 2 (TDD Loop), aplicando intervenções cirúrgicas no código de produção a partir da análise de logs de falha do terminal.

---

## 📁 Recursos de Suporte

* 📖 **Manual Detalhado de Depuração**: `@/.agents/skills/testar/references/EXECUTION.md`
* 📋 **Template de Diagnóstico (`task.md`)**: `@/.agents/skills/testar/resources/error_checklist_template.md`

---

## ⛔ Regras e Restrições Universais

1. **Ajuste Mínimo Cirúrgico**: Edite estritamente as linhas de produção responsáveis pelo erro. Zero refatoração oportunista, novos recursos ou alteração de código limpo.
2. **Preservação da Especificação do Teste**: Nunca altere asserções ou expectativas do teste para obter sinal verde, exceto em caso de erros óbvios de sintaxe ou digitação no próprio arquivo de teste.
3. **Resumo da Causa Raiz**: A causa raiz da falha deve ser explicada e classificada em **exatamente uma frase concisa** no início do parecer.
4. **Micro-Checkpoint**: Acione a skill `git` (Modo 1) imediatamente após a correção para persitir a alteração.

---

## ✅ Checklist de Entrega

- [ ] Causa raiz identificada e sintetizada em 1 frase.
- [ ] Ajuste aplicado estritamente em código de produção.
- [ ] Testes preservados intactos.
- [ ] Micro-checkpoint salvo via skill `git` (Modo 1).
- [ ] Comando de re-execução dos testes fornecido isoladamente em bloco `bash`.
- [ ] Mensagem de [NEXT STEP] orientando o uso de `/refatorar` (ou `/review`) exibida.