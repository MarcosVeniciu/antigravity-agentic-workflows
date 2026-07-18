---
name: "review"
description: "Executes methodical code audits and applies surgical fixes in two phases: Phase 1 (Audit & Report) and Phase 2 (Surgical Fix Application)."
---

# Skill: Review & Audit Resolution (`skills/review`)

This skill guides the assistant through the sequential **two-phase** workflow for auditing and fixing source code on the active branch. Always communicate with the user in Portuguese.

---

## 🎯 Domain Mapping, Templates & Checklists

| Trigger / Subcommand | Focus | Template in `resources/` | Checklist in `references/` |
|---|---|---|---|
| `/review` (Default) | General quality, readability, AI hallucinations, docstrings, and tests | [template_geral.md](resources/template_geral.md) | [checklist_geral.md](references/checklist_geral.md) |
| `/review arquitetura` | Layer isolation, coupling, Dependency Inversion, DTOs | [template_arquitetura.md](resources/template_arquitetura.md) | [checklist_arquitetura.md](references/checklist_arquitetura.md) |
| `/review seguranca` | OWASP Top 10, SQL/OS injection, sanitization, hardcoded secrets | [template_seguranca.md](resources/template_seguranca.md) | [checklist_seguranca.md](references/checklist_seguranca.md) |
| `/review performance` | Cyclomatic complexity V(G) > 10, Big-O, N+1 in ORM, generators | [template_performance.md](resources/template_performance.md) | [checklist_performance.md](references/checklist_performance.md) |
| `/review resiliencia` | Network timeouts, idempotency, DB transactions, retries | [template_resiliencia.md](resources/template_resiliencia.md) | [checklist_resiliencia.md](references/checklist_resiliencia.md) |

---

## 🔄 Phase 1 — Audit & Report

**Expected Output:** A complete technical audit report issued as an interactive artifact and persisted in the vault via the `grafo` skill.

1. **Context Collection**: Identify active branch and changed/created files. Cross-reference with feature SDD in vault to contextualize analysis.
2. **Execution**: Load corresponding domain template from `resources/` and apply checklist criteria from `references/checklist_[type].md`. Do not modify any source code files during Phase 1.
3. **Report Issuance**:
   * **Interactive Artifact**: `audit_report_[type].md` with `RequestFeedback: true`.
   * **Vault**: Save under `02-auditorias/audit-[feature-slug].md` by invoking the `grafo` skill.
4. Wait for user approval (Proceed button) before moving to Phase 2.

---

## 🔄 Phase 2 — Surgical Fix Application

**Expected Output:** All report items fixed with minimal changes, without altering business logic or test suites.

1. Create or update `task.md` based on Phase 1 report.
2. Process each item iteratively: apply minimal fix possible, save micro-checkpoint with `git` skill (Mode 1), and update both reports (IDE artifact and vault copy). For the vault copy, use surgical `vault_patch` calls with `targetType: "heading"` or `"frontmatter"` instead of rewriting the entire note.
3. Upon concluding repairs for current domain, trigger `git` skill (Mode 2 - Phase Squash) to issue semantic commit for the domain.

### 🔀 Domain Transition Orchestration & Phase 3 Closure
- **Chained / Default Execution (`/review`)**: Starts with `arquitetura`. User report approval (`RequestFeedback: true`) authorizes direct transition to next domain in standard pipeline (`arquitetura` ➔ `seguranca` ➔ `performance` ➔ `resiliencia`).
- **General Quality Mode (`/review geral`)**: Upon completing General Quality audit, agent recommends transition to Phase 4 (`/docs`) OR starting technical reviews via `/review arquitetura`.
- **Individual Invocations (`/review [domain]`)**: Can be executed in any order. Upon completing an individual domain, agent reads note `02-auditorias/audit-[feature-slug].md` in vault, identifies remaining technical domains, and recommends executing one of the remaining ones.
- **Phase 3 Closure**: When all 4 technical domains (`arquitetura`, `seguranca`, `performance`, `resiliencia`) or planned audit scope are completed and 100% validated (`[x]`), issue:
  > **[NEXT STEP]** ➡️ *"🛡️ Todas as auditorias especializadas foram concluídas e validadas com sucesso. É recomendado que você inicie um novo chat para a Fase 4 de Documentação & Release. Execute `/docs` para iniciar."*

---

## ⛔ Rules & Constraints

1. **Phase 1 is read-only**: Modifying any source code file during audit is forbidden.
2. **Surgical fixes**: Do not alter business logic or test suites in Phase 2.
3. **Interactive control**: Phase 1 artifact must be issued with `RequestFeedback: true`.

---

## ✅ Validation Checklist

- [ ] Correct domain template used from `resources/`?
- [ ] Report persisted as interactive artifact and in vault via `grafo`?
- [ ] Each fixed item has resolution documented in report and checkpointed via `git` (Mode 1)?
- [ ] Final semantic commit consolidated via `git` (Mode 2)?
- [ ] Test suite continues passing 100% green after fixes?

