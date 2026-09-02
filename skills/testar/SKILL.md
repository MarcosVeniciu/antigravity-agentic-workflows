---
name: "testar"
description: "Reactive debugging and test error fix skill. Isolates root causes from terminal tracebacks and applies minimal surgical adjustments to production code."
---

# Skill: Reactive Debugging & Test Fixing (`skills/testar`)

Guia o diagnóstico e correção cirúrgica de falhas de testes durante o loop TDD da Fase 2, analisando tracebacks no terminal e aplicando intervenções mínimas no código de produção.

---

## 📁 Recursos de Apoio

* 📖 **Manual de Debugging**: `references/EXECUTION.md` from the `@testar` skill
* 📋 **Template de Diagnóstico (`task.md`)**: `resources/error_checklist_template.md` from the `@testar` skill

---

## ⛔ Regras Estritas e Restrições

1. **Ajuste Mínimo e Cirúrgico**: Edite estritamente as linhas de código de produção responsáveis pelo erro. Proibido refatorar código que não falhou.
2. **Preservação da Especificação do Teste**: Nunca altere asserções ou expectativas dos testes para "forçar" um teste a passar, salvo erro sintático evidente no próprio teste.
3. **Causa Raiz em 1 Frase**: Isole a causa raiz do erro em exatamente uma frase objetiva antes de aplicar qualquer correção.
4. **Micro-Checkpoint Imediato**: Após tornar o teste verde, acione a skill `@git` (Modo 2) para salvar o progresso.

---

## ✅ Checklist de Validação

- [ ] Causa raiz identificada e sintetizada em 1 frase.
- [ ] Ajuste cirúrgico aplicado exclusivamente ao código de produção.
- [ ] Testes preservados intactos.
- [ ] Micro-checkpoint salvo via skill `@git` (Modo 2).