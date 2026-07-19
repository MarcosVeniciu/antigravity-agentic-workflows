---
type: bdd
feature: "{{FEATURE_SLUG}}"
project: antigravity
date: "{{DATE}}"
description: "{{DESCRIPTION}}"
tags:
  - bdd
  - escopo
  - phase/concepcao
---
# 📝 Concepção & Escopo BDD: {{FEATURE_NAME}}

## 1. Solução Escolhida (Decisão da Fase 1)
{{DECISION_SUMMARY}}

## 2. Especificação de Comportamento (BDD)
Funcionalidade: {{FEATURE_NAME}}
  Para que {{BUSINESS_VALUE}}
  Como um {{USER_ROLE}}
  Eu quero {{FUNCTIONAL_DESIRE}}

  Cenário: {{SCENARIO_1}}
    Dado que {{CONTEXT}}
    Quando {{ACTION}}
    Então {{EXPECTED_RESULT}}

## 3. Contexto Relacionado & ADRs
- [[{{OBSIDIAN_LINK}}]]