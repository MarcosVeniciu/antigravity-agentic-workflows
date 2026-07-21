---
name: "infra"
description: "Manages dependency updates, Dockerfiles, and environment variables."
---

# Workflow: Infrastructure & Dependencies (`/infra`)

1. **Context Activation**:
   * Activate the `@infra` skill (by reading its `SKILL.md` file using `view_file`) to consult its technical rules.

2. **Diagnosis & Mapping**:
   * Identify present manifests (`package.json`, `requirements.txt`, `Dockerfile`, `docker-compose.yml`, etc.).
   * Check general rules in `00-core-rules/conventions.md` in the Obsidian Vault.

3. **Applying Changes**:
   * Apply surgical edits only to requested dependencies.
   * If there are new environment variables, update `.env.example` mandatorily.

4. **Validation & Closure**:
   * Validate syntax of modified files.
   * Display final message indicating the next step (`/testes`).