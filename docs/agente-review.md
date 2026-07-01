# Audit Agent (`/review`)

The Audit phase comes into action after technical consolidation (complete TDD cycle with refactoring). The Review Agent acts exclusively as a **Critical Expert**, seeking structural and logical vulnerabilities before the code moves to production.

---

## 1. The Four Analysis Categories & Templates

To ensure an expert vision, the audit is divided into specific fronts, each mapped to a strict template in the `08-templates/` directory of the Obsidian Vault:
1. **General (`/review`):** Uses `template_review_geral.md` to check for hallucinations, AI traces, and structure.
2. **Architecture (`/review arquitetura`):** Uses `template_review_arquitetura.md` for domain leakage, DIP, and DTO checks.
3. **Resilience (`/review resiliencia`):** Uses `template_review_resiliencia.md` for idempotency, fault tolerance, and generic exception handling.
4. **Security (`/review seguranca`):** Uses `template_review_seguranca.md` for OWASP, injections, and data schemas.
5. **Performance (`/review performance`):** Uses `template_review_performance.md` for memory bottlenecks, cyclomatic/asymptotic scaling.

> [!TIP]
> **Context Reset Tip (Optional):**
> While not mandatory, it is an excellent practice to **start a new chat** in the IDE before running the `/review` commands.
> Since the model "forgets" the struggles and attempts it had while coding, it will do a much more **impartial** code analysis.

---

## 2. Automated Target Discovery

Instead of manually telling the agent what to review, the agent autonomously executes `git status -s` and `git branch --show-current`. This guarantees that it evaluates exactly what is being modified in the current scope, crossing this information with the original BDD and SDD artifacts.

---

## 3. The Isolated Context Philosophy & Review Chain

One of the greatest challenges for AIs is to act as "Experts" in many domains simultaneously. By dealing with one domain at a time, the AI maintains a hyper-focused "Attention Mechanism".

The Review Chain dictates a sequential flow:
1. General Review -> `/aplicar-review` -> Test
2. Architecture -> `/aplicar-review` -> Test
3. Resilience -> `/aplicar-review` -> Test
4. Security -> `/aplicar-review` -> Test
5. Performance -> `/aplicar-review` -> Test -> Move to `/docs`

---

## 4. The Report and Traceability

The `/review` agent generates its technical report in two formats:
1. **Ephemeral Artifact (`audit_report.md`):** Saved in the IDE chat workspace so the developer can see the flaws without flooding the chat stream.
2. **Permanent Storage (Vault):** It autonomously saves the report in the `10-review-reports/` directory using the `obsidian_knowledge_graph` MCP tool (e.g., `projeto_2026-07-01_feature_review-resiliencia.md`).

This report features flaw identifications, rigorous correction suggestions, bidirectional links to original SDDs, and strategically left blank fields which will serve as a workspace for the `/aplicar-review` agent to annotate its fixes.
