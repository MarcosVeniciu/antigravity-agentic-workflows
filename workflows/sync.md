---
description: Context recovery. Forces re-reading of GEMINI.md, artifacts, and Obsidian vault to recalibrate the model in long sessions.
---

**EXECUTION MODE ACTIVE:** The `/sync` trigger was invoked. You are in **Context Recovery Mode** — your task is to re-ground yourself by systematically re-reading all critical project context files before resuming work.

---

### 1. Mandatory Re-Read Sequence

Execute the following reads in this exact order:

#### 1.1. Project Identity
* Re-read the `GEMINI.md` file (or equivalent project configuration file) to reload the project's core rules, agent catalog, and development workflow.

#### 1.2. Knowledge Graph Scan
* Query the `obsidian_knowledge_graph` MCP vault and read the most recent notes from:
    * `01-adrs/` — Latest architectural decisions.
    * `03-pivots-and-bugs/` — Recent bug resolutions.
    * `04-domain-rules/` — Active business rules.
    * `05-architecture-map/` — Current component structure.
    * `06-roadmap-and-state/` — Current WIP and tech debt.
    * `10-review-reports/` — Recent code quality audits.

#### 1.3. Session Artifacts
* Re-read any implementation plans, task lists, or diagrams generated during this session (from `/artefatos`).
* Re-read test files and production code written during this session.

---

### 2. Context Validation Report

After re-reading, produce a structured status report:

```markdown
## 🔄 Context Sync Report

### Project
- **Name:** [Project name]
- **Current Feature/Task:** [What we're working on]

### Session Progress
- **Last completed phase:** [e.g., /codigo — Green Phase]
- **Next expected phase:** [e.g., /testar — Reactive fixes]

### Key Context Loaded
- [ ] GEMINI.md rules
- [ ] Vault: ADRs (latest N)
- [ ] Vault: Domain rules relevant to current task
- [ ] Vault: Architecture map for affected modules
- [ ] Session artifacts (implementation plan)
- [ ] Test files
- [ ] Production code

### Detected Issues
- [List any inconsistencies, missing files, or conflicts discovered during re-read]
```

---

### 3. Strict Constraints

* **🚫 DO NOT modify any files.** This is a read-only operation.
* **🚫 DO NOT run commands.**
* **✅ DO report** any discrepancies between what the vault says and what the current code shows.
* **🚫 DO NOT combine terminal commands.** Each command MUST be in its own separate, isolated bash code block. Do not put multiple commands in the same block, and do not chain them with && or ;. This allows the user to copy each command individually.

---

> **[NEXT STEP]** ➡️ After presenting the sync report, output:
> *"🔄 Context resynchronized. Ready to resume work. Which phase do you want to continue?"*
> Then list the available phases from the agent catalog with their current status.
