---
project: "{{PROJECT_NAME}}"
branch: "{{BRANCH_NAME}}"
date: "{{DATE}}"
type: "review-resiliencia"
tags:
  - "review"
  - "resiliencia"
---
# 🧯 Relatório de Auditoria: Resiliência & Tolerância a Falhas

## 📊 Metadados da Revisão
* **Contrato/SDD Associado:** [[01-concepcao/sdd-{{FEATURE_SLUG}}]]
* **Status Global:** 🟡 Em Auditoria (Fase 1)

## 🔍 Desvios Detetados e Evidências

### 🚨 [RES-01] Fragilidade em Operação I/O ou Transação
* **Status:** - [ ] Pendente de Correção
* **Criticidade:** [Alta | Média | Baixa]
* **Localização:** `caminho/do/arquivo.py:linhas`
* **Evidência Mecânica:**
```python
# O agente injetará aqui a chamada HTTP sem timeout ou a escrita multi-step sem bloco transacional

```

* **Impacto no Sistema:** * **Correção Cirúrgica Proposta:** * **Resolução:** [Aguardando Aplicação da Fase 2]

---

## 📈 Conclusão da Fase 1

* **Total de Apontamentos:** * **RequestFeedback:** true