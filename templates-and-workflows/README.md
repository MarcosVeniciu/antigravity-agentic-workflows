# Templates (`/templates`)

This directory contains the **Contract Structures** of the Antigravity IDE. 

To prevent the Artificial Intelligence from arbitrarily deciding how to format reports or generate architectural plans, the agents are forced to read and fill out the templates contained in this folder. This guarantees relentless standardization and predictability in the data output.

> 🧠 **Context Awareness:** All templates require the agents to autonomously discover the `Projeto` and `Branch` context (using `git rev-parse --show-toplevel` and `git branch --show-current`) to populate the document headers, ensuring perfect traceability in the Knowledge Graph.

---

## 📑 Template List

### 1. Planning & Architecture
* **[`template_planejamento.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates-and-workflows/template_planejamento.md):** The BDD (Behavior Driven Development) structure forcing the AI to map *Given, When, Then*.
* **[`template_artefatos.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates-and-workflows/template_artefatos.md):** The SDD (Software Design Description). Forces the creation of the Implementation Plan, requiring Mermaid diagrams and interface contracts before coding begins.

### 2. Audit and Quality (QA)
The `/review` reports are highly restricted by these templates. They contain specific Checklists for each domain and a resolution section for the `/aplicar-review` to fill out.
* **[`template_review_geral.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates-and-workflows/template_review_geral.md):** A quick "Code Smell" audit.
* **[`template_review_arquitetura.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates-and-workflows/template_review_arquitetura.md):** Focused on SOLID, Dependency Injection, and Design Patterns.
* **[`template_review_seguranca.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates-and-workflows/template_review_seguranca.md):** Rigorous audit based on OWASP (SQL Injection, Secrets, XSS).
* **[`template_review_resiliencia.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates-and-workflows/template_review_resiliencia.md):** Assessment of error handling, circuit breakers, and network failures.
* **[`template_review_performance.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates-and-workflows/template_review_performance.md):** Analysis of memory bottlenecks, N+1 Queries, and cyclomatic complexity.

### 3. Documentation and Graph
* **[`template_doc_diretorio.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates-and-workflows/template_doc_diretorio.md):** The backbone of the internal `src/` folder documentation. Requires a logical dependency map.
* **[`template_grafo.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates-and-workflows/template_grafo.md):** The skeleton of the atomic notes saved in the Obsidian Vault (`01-adrs`, `03-pivots-and-bugs`, etc), ensuring registration in the YAML metadata and bidirectional links.

---

> 💡 **Modification Note:** If you want to add a new security audit rule or change the format of your architecture document (SDD), simply change the corresponding template in this folder. The entire ecosystem will adapt automatically.

