---
name: "plan-bdd"
description: "Formats business requirements and user stories strictly into pure Gherkin syntax (Given/When/Then) without technical implementation bias."
---

# Skill: Behavioral BDD Specification (`skills/plan-bdd`)

Models feature requirements and business rules strictly in Gherkin syntax (`Given/When/Then`), ensuring focus on user and system behavior without leaking technical implementation details.

## 🎯 Golden Rules of BDD

1. **Ubiquitous, Accessible Language:**
   * Write scenarios easily understood by developers, product managers, and business stakeholders.
   * Avoid technical jargon like `SELECT`, `JSON`, `HTTP 200`, or `API Endpoint`. Describe observable behavior and user intent.
2. **Essential Coverage:**
   * Always cover the **Happy Path**.
   * Cover boundary and exception scenarios (**Unhappy Paths**: validation errors, invalid inputs, access restrictions, and invalid system states).
3. **Fidelity to Approved Proposal:**
   * Scenarios must reflect the exact Desired End-State approved during the debate step.

## 📋 Available Resources
* **BDD Template:** [`resources/template_bdd.md`](./resources/template_bdd.md)
* **Reference Example:** [`examples/bdd_checkout_example.md`](./examples/bdd_checkout_example.md)
