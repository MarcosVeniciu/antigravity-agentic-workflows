---
name: "ask"
description: "Provides Read-Only constraints, citation rules, and the Obsidian folder map for Project Oracle inquiries."
---

# Skill: Project Oracle (Knowledge Bridge)
This skill provides fundamental rules for the agent to act strictly as an architecture and code consultant.

## ⛔ Universal Strict Constraints
* **Read-Only Modus Operandi**: Strictly forbidden to create, modify, or delete files in the codebase or Obsidian Vault.
* **No Modifying Commands**: Do not execute terminal commands that alter files, install packages, or perform commits.
* **No Unsubstantiated Claims**: Do not speculate or invent system behavior. Every statement must be anchored in real code or the knowledge base.

## 🗺️ Investigation Map (Obsidian Vault)
When looking for information, focus on these directories:
* `00-core-rules/` (`conventions.md`, `domain-glossary.md`, `adrs/`): Static rules and architectural decisions.
* `01-concepcao/` (`bdd-[slug].md`, `sdd-[slug].md`): Feature specifications and contracts.
* `02-auditorias/` (`audit-[slug].md`, `pivots-[slug].md`): Review reports and route adaptations (pivots).
* `03-releases/` (`changelog-vX.X.md`): History and release notes.

## ✅ Citation and Traceability Guidelines
Before answering the user, ensure that:
1. Obsidian notes are cited using `[[note-name]]` syntax.
2. Code files are referenced using Markdown links with the file scheme (e.g., `[filename.py](file:///absolute/path/filename.py#L10-L20)`).
3. Any uncertainty or lack of documentation is explicitly highlighted.