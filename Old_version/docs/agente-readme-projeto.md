# Public Documentation Agent (`/readme-projeto`)

Often confused with the Technical Writer (`/docs`), the Public Documentation Agent has a very different specialization: it is the **Developer Advocate**. Its stage of operation is solely the `README.md` file located at the primary root of the repository.

---

## 1. The Agent's Focus

The goal of this workflow is to generate the project's **"Showcase"**.

While the `README.md` files created in internal folders focus on cross-dependencies, class injection, and heavy data flows; the root file must focus on a single thing: **How do I bring a developer from zero to their first successful execution in 5 minutes?**

It prioritizes *Developer Experience (DX)*, purposefully omitting complex internal logic and presenting the application's business value (*Elevator Pitch*). Before generating the documentation, it queries the `obsidian_knowledge_graph` MCP vault (`07-environment-setup/`, `01-adrs/`) to gather precise context on the setup and business rules.

---

## 2. Restrictive Template Patterns

This Agent uses a fixed template embedded directly in the workflow and must obey it blindly, ensuring that the codebase is publicly attractive (e.g., if posted on GitHub).

### The Preview Loop (`readme_preview.md`)
No public documentation is written to the repository silently. The AI first drafts a transitional artifact called `readme_preview.md`. It requires the "Project Manager" (the user) to read, confirm the business pitch, and approve, before then performing the procedure to save over the actual `README.md`.

### The Three Pillars of Showcase Writing
1. **Pitch & SEO Tags:** The model is forced to classify the project and generate architectural "Tags" (e.g., `FastAPI`, `Python`, `Microservices`) at the very top of the embedded template to facilitate indexing in project search tools.
2. **Quick Setup (Getting Started):** There must be no hallucination in this session. The AI transcribes the exact commands for cloning, using `.env`, and initialization based on reality. 
3. **Deep Delegation:** When the subject funnels down and reaches the microscopic details of internal services, the rule dictates that the `README.md` avoids "walls of text" and elegantly points to the subdirectory manuals generated in the `/docs` phase.

### Bash Command Limitations
Any installation commands provided must be inside separate, isolated bash blocks. Command chaining is strictly forbidden.


---

## 🔀 Dynamic State Machine Router

This agent is built using the **State Machine Router (Dynamic Context)** architecture. To prevent prompt hallucination, the trigger in `workflows/readme-projeto.md` is purely a lightweight router.

When invoked, the agent dynamically fetches its heavy execution instructions from the Obsidian Vault (`08-templates-and-workflows/`) using the MCP:
- `workflow-readme-projeto-EXECUTION.md`
