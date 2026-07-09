# Versioning Agent (`/git`)

The Git Agent acts as the "Release Engineer". Its mission is to close the development cycle by packaging all functional code, documentation, and refactorings performed into a traceable version structure.

---

## 1. The Agent's Focus

Instead of executing arbitrary commands or dumping massive changes into a single chaotic *commit*, this agent ensures the repository's cleanliness. It analyzes the breadth of files generated/modified by the cycle and suggests manual commands so that the user themselves has control and awareness of what is being uploaded.

It acts in the spheres of *staging* separation (grouping only code changes in one step, and documentation changes in a subsequent step) and creating semantic messages for the *branch*.

### Pre-Flight Protections
Before suggesting any commits, it automatically evaluates the current environment:
- **Branch Check:** It executes `git branch --show-current`. If it detects the user is on `main` or `master`, it pauses and warns the user about the risk of polluting the protected branch.
- **Context Search:** It executes `git status -s` to list modified files and autonomously queries the `obsidian_knowledge_graph` MCP vault to understand the feature context before generating commit messages.

---

## 2. Rigorous Standardization

### Atomic Commits
If the session altered database logic and also updated the `README.md`, these changes are not grouped in the same package. The `/git` workflow standardization establishes that *commits* must be limited logical packages. First the production code block, then the refactoring block, etc.

### Conventional Commits
Commit messages mandatorily follow the classic standard:
`<type>(<scope>): <short description>`
*(E.g.: `feat(insights): implement /insights endpoint with LLM processing`)*

### The Narrative Commit Body
Here lies one of the most important requirements of this phase. The Artificial Intelligence cannot commit generic messages like "router and service files changed". 

The rule forces the elaboration of a message with a **Narrative Body** divided into pillars:
1. **The Motivation:** (What was the problem/need that generated the code).
2. **The Solution Justification:** (Why it was done this way and not that way).
3. **Impacts:** (Making *Breaking Changes* explicit or required new environment variables).

This creates a Git history focused on business or architectural pain points, accounting for *why* the bits changed.

### Commands in Isolated Blocks
The agent does not execute destructive or terminal write routines autonomously. It provides the `git add` and `git commit` commands in isolated Markdown copy blocks. This ensures final human quality control before remote submission (`push`). Combinations like `&&` are strictly forbidden so the developer can copy-paste individually.


---

## 🔀 Dynamic State Machine Router

This agent is built using the **State Machine Router (Dynamic Context)** architecture. To prevent prompt hallucination, the trigger in `workflows/git.md` is purely a lightweight router.

When invoked, the agent dynamically fetches its heavy execution instructions from the Obsidian Vault (`08-templates-and-workflows/`) using the MCP:
- `workflow-git-STATE1-VERIFICATION.md`
- `workflow-git-STATE2-COMMIT.md`
