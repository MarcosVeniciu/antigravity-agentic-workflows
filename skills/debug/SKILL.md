---
name: "debug"
description: "Skill de investigação forense de bugs e análise de causa raiz (5 Whys). Diagnostica falhas de runtime, crashes de infraestrutura e erros de integração em produção."
---

# Skill: Investigador Forense de Bugs (`skills/debug`)

Esta skill orienta o diagnóstico metódico de erros em tempo de execução, crashes não capturados por testes unitários e falhas de integração através da aplicação da técnica dos **5 Whys**.

---

## 🛠️ Guia de Execução & Metodologia

Consulte a metodologia detalhada em:
* [Manual dos 5 Whys & Diagnóstico Forense](references/5_whys_framework.md)

---

## 📁 Recursos & Templates

* **Template do Artefato Interativo**: [template_root_cause.md](resources/template_root_cause.md)

---

## 🔄 Fluxo Operacional

1. **Pre-flight & Extração de Evidências**:
   * Analise o log/stacktrace fornecido pelo usuário (exceção, status HTTP, componente afetado).
   * Consulte no Obsidian Vault `02-auditorias/` (`pivots-[feature-slug].md`) e `00-core-rules/` para mapear bugs similares resolvidos no passado.

2. **Formulação de Hipóteses & Causa Raiz**:
   * Elabore 2 hipóteses ranqueadas por probabilidade baseadas no fluxo de execução dos 5 Whys.
   * Isole o arquivo, linha e motivo pelo qual os testes existentes não pegaram o bug.

3. **Emissão do Artefato Interativo**:
   * Emita o artefato `root_cause_analysis.md` com `UserFacing: true` e **`RequestFeedback: true`** baseado no template em `resources/template_root_cause.md`.
   * Aguarde a aprovação do usuário (botão **Proceed**) antes de editar qualquer linha de código.

4. **Persistência no Obsidian Vault**:
   * Após aprovação, sugira documentar a resolução em `02-auditorias/pivots-[feature-slug].md` via a skill transversal `grafo`.

---

## ⛔ Regras & Restrições

1. **Interrupção Obrigatória**: Sempre emita `root_cause_analysis.md` com `RequestFeedback: true` antes de propor alterações.
2. **Proibido Adivinhar**: Se faltarem evidencias, solicite logs/configs ao usuário antes de concluir o relatório.
3. **Blocos Bash Isolados**: Quaisquer comandos de teste ou diagnóstico devem ser fornecidos em blocos `bash` individuais.

---

## ✅ Checklist de Validação

- [ ] As 2 hipóteses foram analisadas com prós e contras no artefato?
- [ ] O documento `root_cause_analysis.md` foi emitido com `RequestFeedback: true`?
- [ ] A solução prevê um teste de regressão para impedir o retorno da falha?
- [ ] Foi sugerida a persistência do aprendizado no vault sob `02-auditorias/pivots-[feature-slug].md`?
