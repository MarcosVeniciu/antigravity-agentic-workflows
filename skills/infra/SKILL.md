---
name: "infra"
description: "Use during /infra to safely manage Dockerfiles, dependency manifests, and environment variables without exposing secrets."
---

# Skill: Infrastructure & Dependencies (`skills/infra`)

Safely manages dependencies, container configurations, and environment variables.

## ⛔ Strict Constraints
* **No Blind Upgrades**: Change only packages/libraries directly related to the objective.
* **No Hardcoded Secrets**: Never include API keys, passwords, access tokens, or credentials in versioned files.
* **Strict Infra Scope**: Do not alter application code or business logic unless strictly necessary for build compatibility.

## 📋 Execution & Validation Checklist
1. **`.env.example` Verification**:
   * Every newly declared variable must have an explanatory placeholder in `.env.example`.
2. **Syntax & Integrity**:
   * Validate syntactic structure of JSON, YAML, or Dockerfiles before completing.
3. **Proposed Next Step**:
   * Upon completion, explicitly display:
   > **[NEXT STEP]** ➡️ *"⚙️ Infrastructure configurations and dependencies successfully updated. Run `/implement` to proceed with the TDD development cycle."*