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
# 📝 Conception & BDD Scope: {{FEATURE_NAME}}

## 1. Chosen Solution (Phase 1 Decision)
{{DECISION_SUMMARY}}

## 2. Behavior Specification (BDD)
Feature: {{FEATURE_NAME}}
  In order to {{BUSINESS_VALUE}}
  As a {{USER_ROLE}}
  I want {{FUNCTIONAL_DESIRE}}

  Scenario: {{SCENARIO_1}}
    Given {{CONTEXT}}
    When {{ACTION}}
    Then {{EXPECTED_RESULT}}

## 3. Related Context & ADRs
- [[{{OBSIDIAN_LINK}}]]