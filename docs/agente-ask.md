# Oracle Agent (`/ask`)

The Oracle Agent is focused on answering questions about the project architecture in a 100% safe way. Unlike workflows that operate complex logic, it is strictly configured as *Read-Only*.

---

## 1. The Agent's Focus

The central goal of `/ask` is to act as a quick query tool, scanning both the code (live logic) and the Obsidian Vault (The Second Brain), preventing the developer from having to hunt down files to understand why something was done.

Before answering, it autonomously uses the `obsidian_knowledge_graph` MCP tool to prioritize queries in strategic folders (`01-adrs/`, `04-domain-rules/`, `05-architecture-map/`) without requiring the user to point out where to look.

---

## 2. Restrictions and Vital Behaviors

This agent operates under severe rules that prevent accidents in the code.

### Absolute Read-Only Mode
The `/ask` agent is strictly forbidden from generating production code, suggesting automatic *commits*, or writing to the file system (e.g., using `vault_write`).
If the user asks a question like *"How do I make the login system? Implement it."*, the Oracle will only explain the architecture and direct the user to the correct command (`/planejamento`), maintaining its analytical purity.

### The Source Citation Rule (Traceability)
A generic AI tends to "invent" logic that does not exist in the repository. The `/ask` circumvents this hallucinatory behavior by being forced to anchor its response to the physical context of the project:
* **Bidirectional Links:** If it discovers a business rule that explains the user's doubt, it is obliged to include the exact Obsidian link that contains the justification (e.g.: `Ref: [[2026-06-24-payment-gateway-adr]]`).
* **Visible Files:** If the doubt is about practical implementation, it extracts the *snippets* and provides the absolute path of the file.

If the Oracle cannot find the information in the Vault or Code, it is programmed to explicitly admit: *"I didn't find a specific rule or document about this in the vault"*, avoiding dangerous assumptions.

### Bash Constraints
It does not run any terminal commands autonomously, nor provides bash blocks for execution (no `pytest`, no `git`), unless explicitly asked by the user "What is the command to do X?". When it does provide commands, they must be isolated without chaining (`&&`).
