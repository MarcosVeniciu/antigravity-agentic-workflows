---
type: epic
project: "{{PROJECT_NAME}}"
epic_slug: "{{EPIC_SLUG}}"
date: "{{DATE}}"
tags:
  - epic
  - roadmap
  - macro-architecture
---

# 🗺️ Epic Blueprint: {{EPIC_TITLE}}

## 🎯 1. Visão Geral & Estado Final Desejado
* **Problema do Legado:** {{LEGACY_PROBLEM}}
* **Resultado Esperado (Outcome):** {{FINAL_OUTCOME}}

---

## 🏗️ 2. Grafo de Dependências das Sub-Features

```mermaid
flowchart TD
    F1["Sub-Feature 1: {{F1_NAME}}<br/><code>feature/{{F1_SLUG}}</code>"] --> F2["Sub-Feature 2: {{F2_NAME}}<br/><code>feature/{{F2_SLUG}}</code>"]
    F1 --> F3["Sub-Feature 3: {{F3_NAME}}<br/><code>feature/{{F3_SLUG}}</code>"]
    F2 & F3 --> F4["Sub-Feature 4: {{F4_NAME}}<br/><code>feature/{{F4_SLUG}}</code>"]
```

---

## 📋 3. Roteiro Sequencial de Sub-Features

### 🔹 Sub-Feature 1: `feature/{{F1_SLUG}}` - {{F1_NAME}}
* **Objetivo:** {{F1_OBJECTIVE}}
* **Contratos / Abstrações Introduzidos:** {{F1_CONTRACTS}}
* **Critério de Conclusão:** {{F1_DOD}}
* **Próximo Passo:** Executar `/planejamento` nesta branch.

---

### 🔹 Sub-Feature 2: `feature/{{F2_SLUG}}` - {{F2_NAME}}
* **Dependência:** Requer `feature/{{F1_SLUG}}` concluída e mesclada em `develop`.
* **Objetivo:** {{F2_OBJECTIVE}}
* **Contratos / Abstrações Introduzidos:** {{F2_CONTRACTS}}
* **Critério de Conclusão:** {{F2_DOD}}

---

### 🔹 Sub-Feature 3: `feature/{{F3_SLUG}}` - {{F3_NAME}}
* **Dependência:** Requer `feature/{{F1_SLUG}}` concluída e mesclada em `develop`.
* **Objetivo:** {{F3_OBJECTIVE}}
* **Contratos / Abstrações Introduzidos:** {{F3_CONTRACTS}}
* **Critério de Conclusão:** {{F3_DOD}}

---

### 🔹 Sub-Feature 4: `feature/{{F4_SLUG}}` - {{F4_NAME}}
* **Dependência:** Requer `feature/{{F2_SLUG}}` e `feature/{{F3_SLUG}}` concluídas.
* **Objetivo:** {{F4_OBJECTIVE}}
* **Integração Final:** {{F4_INTEGRATION}}
* **Critério de Conclusão:** {{F4_DOD}}
