---
project: "{{PROJECT_NAME}}"
branch: "{{BRANCH_NAME}}"
date: "{{DATE}}"
type: "review-arquitetura"
tags:
  - "review"
  - "arquitetura"
---
# 🏗️ Relatório de Auditoria: Isolamento de Camadas & Acoplamento

## 📊 Metadados da Revisão
* **Contrato/SDD Associado:** [[01-concepcao/sdd-{{FEATURE_SLUG}}]]
* **Status Global:** 🟡 Em Auditoria (Fase 1)

## 🔍 Desvios Detetados e Evidências

### 🚨 [ARQ-01] Violação de Limite de Camada / Inversão de Dependência
* **Status:** - [ ] Pendente de Correção
* **Criticidade:** [Alta | Média | Baixa]
* **Localização:** `caminho/do/arquivo.py:linhas`
* **Evidência Mecânica:**
```python
# O agente injetará aqui a instanciação oculta ou import vazado da infraestrutura

```

* **Impacto no Sistema:** * **Correção Cirúrgica Proposta:** * **Resolução:** [Aguardando Aplicação da Fase 2]

---

## 📈 Conclusão da Fase 1

* **Total de Apontamentos:** * **RequestFeedback:** true