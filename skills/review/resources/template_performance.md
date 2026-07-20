---
project: "{{PROJECT_NAME}}"
branch: "{{BRANCH_NAME}}"
date: "{{DATE}}"
type: "review-performance"
tags:
  - "review"
  - "performance"
---
# ⚡ Relatório de Auditoria: Complexidade & Otimização de Recursos

## 📊 Metadados da Revisão
* **Contrato/SDD Associado:** [[01-concepcao/sdd-{{FEATURE_SLUG}}]]
* **Status Global:** 🟡 Em Auditoria (Fase 1)

## 🔍 Desvios Detetados e Evidências

### 🚨 [PERF-01] Gargalo de Recursos / Complexidade Ciclomática Elevada
* **Status:** - [ ] Pendente de Correção
* **Criticidade:** [Alta | Média | Baixa]
* **Localização:** `caminho/do/arquivo.py:linhas`
* **Evidência Mecânica:**
```python
# O agente injetará aqui a query N+1, busca O(n^2) ou materialização desnecessária em memória

```

* **Impacto no Sistema:** * **Correção Cirúrgica Proposta:** * **Resolução:** [Aguardando Aplicação da Fase 2]

---

## 📈 Conclusão da Fase 1

* **Total de Apontamentos:** * **RequestFeedback:** true