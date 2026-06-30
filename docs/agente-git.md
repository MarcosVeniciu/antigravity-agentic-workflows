# Versioning Agent (`/git`)

The Git Agent acts as the "Release Engineer". Its mission is to close the development cycle by packaging all functional code, documentation, and refactorings performed into a traceable version structure.

---

## 1. The Agent's Focus

Instead of executing arbitrary commands or dumping massive changes into a single chaotic *commit*, this agent ensures the repository's cleanliness. It analyzes the breadth of files generated/modified by the cycle and suggests manual commands so that the user themselves has control and awareness of what is being uploaded.

It acts in the spheres of *staging* separation (e.g.: grouping only code changes in one step, and documentation changes in a subsequent step) and creating semantic messages for the *branch*.

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

This creates a Git history focused on business or architectural pain points, accounting for *why* the bits changed, since *what* changed is already explicit in the lines of the file itself.

### Commands in Isolated Blocks
The agent does not execute destructive or terminal write routines autonomously. It provides the `git add` and `git commit` commands in isolated Markdown copy blocks. This is an intentional choice to ensure final human quality control before remote submission (`push`).
