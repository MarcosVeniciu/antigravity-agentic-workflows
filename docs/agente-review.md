# Audit Agent (`/review`)

The Audit phase comes into action after technical consolidation (complete TDD cycle with refactoring). The Review Agent acts exclusively as a **Critical Expert**, seeking structural and logical vulnerabilities before the code moves to production.

---

## 1. The Four Analysis Categories

To ensure an expert vision, the audit is divided into 4 fronts:
1. **Security:** Evaluates attack vectors, injections, authentication flaws, and data leakage.
2. **Architecture:** Evaluates excessive coupling, escape from design patterns, severe violation of SOLID principles not covered by refactoring, and structural duplication.
3. **Resilience:** Analyzes fault tolerance, *circuit breakers*, generic exception handling (avoiding *swallowing exceptions*), and resource leaks.
4. **Performance:** Identifies memory bottlenecks, database calls (N+1 query problem), and inefficient loops.

> [!TIP]
> **Context Reset Tip (Optional):**
> While not mandatory, it is an excellent practice to **start a new chat** in the IDE before running the `/review` commands.
> Since the model "forgets" the struggles, motivations, and attempts it had while coding the feature, it will do a much more **impartial** code analysis, coldly evaluating the current base. Staying in the same chat helps with speed, but opening a new one elevates the rigor of the review.

---

## 2. The Isolated Context Philosophy

One of the greatest challenges for AIs is to act as "Experts" in many domains simultaneously. Asking an AI to analyze security while at the same time optimizing performance and improving architecture drastically dilutes its "point of attention" (*Attention Mechanism*), generating generic reports.

In the Antigravity IDE, the process is isolated and continuous:
* **One problem at a time:** The agent is triggered focusing on only one category at a time (e.g.: ` /review security `). It wears the security analyst persona.
* Instead of doing all 4 evaluations together, it runs the analysis, we fix it (`/aplicar-review`), we test it (`/testar`), and then we run the next evaluation.

---

## 3. The Report and Traceability

The `/review` agent generates a technical report (based on a template) not just to throw suggestions in the chat, but to save in the **Obsidian Vault**.

This report has:
* Flaw identifications.
* Rigorous correction suggestions.
* Empty fields (which will serve as a workspace for the `/aplicar-review` agent to annotate what it actually did).
* **Bidirectional Links:** The audit document points to the scope (BDD) and design (SDD) note from which this feature originated, ensuring total traceability.
