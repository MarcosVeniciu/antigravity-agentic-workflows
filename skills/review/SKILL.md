---
name: "review"
description: "Executes methodical code audits and applies surgical fixes in Phase 4 (Chat 4), updating audit items in the Living DoD log (dod-[slug].md)."
---

# Skill: Review & Audit Resolution

This skill guides technical rules and limitations for Phase 4 quality audits.

## 🎯 Domains and Progressive Disclosure
Access resources below on demand (via `view_file`) depending on activated scope:
* **General**: `resources/template_geral.md` | `references/checklist_geral.md` from the `@review` skill
* **Architecture**: `resources/template_arquitetura.md` | `references/checklist_arquitetura.md` from the `@review` skill
* **Security**: `resources/template_seguranca.md` | `references/checklist_seguranca.md` from the `@review` skill
* **Performance**: `resources/template_performance.md` | `references/checklist_performance.md` from the `@review` skill
* **Resilience**: `resources/template_resiliencia.md` | `references/checklist_resiliencia.md` from the `@review` skill

## 🔍 Context-Efficient Audit Strategy (Diff Scoping)
* **File Discovery**: Execute `git --no-pager diff develop...HEAD --name-only` to obtain modified file list (fallback to `main...HEAD` if `develop` is absent).
* **Snippet Inspection**: Inspect changed snippets with `git --no-pager diff <origin>...HEAD --unified=3 -- "<file_path>"` instead of reading full files, controlling `--unified=N` for necessary surrounding context.

## 🛡️ OWASP AppSec Audit Principles & Risk Matrix
* **Defense in Depth**: Every trust boundary must validate inputs; do not rely solely on client-side controls.
* **Risk Rating Methodology**: $\text{Risk} = \text{Likelihood} \times \text{Impact}$
  * **CRÍTICO**: Immediate blocking fix. Direct exposure of infrastructure, user sessions, or database.
  * **ALTO**: Pre-deploy blocking fix. Significant vulnerability or system failure risk.
  * **MÉDIO**: Cycle fix. Business logic flaw, missing rate limit, technical security debt.
  * **BAIXO**: Non-blocking recommendation. Formatting, minor logs, architectural enhancement.
* **Constructive Remediation**: Every finding must explain root cause, business risk, and include Before/After code snippets.
* **Privacy & Auditability**: Ensure LGPD/GDPR compliance (no PII or secrets in logs) while maintaining audit trails for security events.

## ⛔ Strict Constraints (Absolute Rules)
* **Phase 1 (Audit)**: Strictly forbidden to modify application source code. Role is to inspect and generate `audit_report.md` with `RequestFeedback: true`.
* **Phase 2 (Fix)**:
  * 🚫 **Untouchable Tests**: Test suite cannot be modified to force passing.
  * 🚫 **Business Rules**: Strictly forbidden to alter domain logic. Focus only on fix infrastructure (e.g., dependency injection, OWASP sanitization).
  * 🚫 **No Autonomous Execution**: Provide test commands in isolated `bash` blocks.
  * 📝 **Living DoD Log**: Update `01-concepcao/dod-[feature-slug].md` checking off completed audit domains under section `## 3. Refatoração & Auditorias`.

## ✅ Verification Method (How to Validate)
* Vault report (`02-auditorias/audit-[feature-slug].md`) must be updated using `vault_patch` with `targetType: "heading"` or `"frontmatter"` to mark items as `[x]`.
* Living DoD file (`01-concepcao/dod-[feature-slug].md`) must have audit domain items checked (`[x]`).
* A semantic squash commit must be generated via `@git` skill before redirecting user with `[NEXT STEP]` block to Chat 5 (`/docs`).