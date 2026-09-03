---
type: bdd
feature: "{{FEATURE_SLUG}}"
project: antigravity
date: "{{DATE}}"
description: "{{DESCRIPTION}}"
tags:
  - bdd
  - scope
  - phase/conception
---
# 📝 Behavioral Specification (BDD): {{FEATURE_NAME}}

## 1. Scope Decision & Approved End-State
{{DECISION_SUMMARY}}

---

## 2. Behavioral Scenarios (Gherkin)

Feature: {{FEATURE_NAME}}
  In order to {{BUSINESS_VALUE}}
  As a {{USER_ROLE}}
  I want {{FUNCTIONAL_DESIRE}}

  @happy-path
  Scenario: {{HAPPY_PATH_SCENARIO_NAME}}
    Given {{INITIAL_CONTEXT}}
    When {{EVENT_OR_ACTION}}
    Then {{OBSERVABLE_OUTCOME}}
    And {{SYSTEM_STATE_VERIFICATION}}

  @unhappy-path @validation
  Scenario: {{UNHAPPY_PATH_SCENARIO_NAME}}
    Given {{INITIAL_CONTEXT}}
    When {{INVALID_ACTION_OR_INPUT}}
    Then {{ERROR_OR_REJECTION_OUTCOME}}

---

## 3. Related Context & Notes
- [[sdd-{{FEATURE_SLUG}}]]
- [[dod-{{FEATURE_SLUG}}]]
