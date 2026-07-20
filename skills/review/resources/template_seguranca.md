---
project: "{{PROJECT_NAME}}"
branch: "{{BRANCH_NAME}}"
date: "{{DATE}}"
type: "review-seguranca"
tags:
  - "review"
  - "seguranca"
---
# 🛡️ Relatório de Auditoria: Segurança & OWASP Top 10

## 📊 Metadados da Revisão
* **Contrato/SDD Associado:** [[01-concepcao/sdd-{{FEATURE_SLUG}}]]
* **Status Global:** 🟡 Em Auditoria (Fase 1)

## 🔍 Desvios Detetados e Evidências

### 🚨 [SEC-01] Vulnerabilidade Detetada
* **Status:** - [ ] Pendente de Correção
* **Criticidade:** [Alta | Média | Baixa]
* **Localização:** `caminho/do/arquivo.py:linhas`
* **Evidência Mecânica:**
```python
# O agente injetará aqui a concatenação insegura, segredo exposto ou falha no IDOR

```

* **Impacto no Sistema:** * **Correção Cirúrgica Proposta:** * **Resolução:** [Aguardando Aplicação da Fase 2]

---

## 📈 Conclusão da Fase 1

* **Total de Apontamentos:** * **RequestFeedback:** true