# Synchronizer Agent (`/sync`)

The Synchronizer Agent acts as the internal "Cache Clearance" and "Mental Alignment" routine for Artificial Intelligence in exceptionally long coding sessions.

---

## 1. The Agent's Focus

When operating in an exhaustive TDD flow or after fixing thirty debugging errors in an API with many classes, the LLM's context limit (*token limit*) starts to be pressured. Naturally, the first instructions of the conversation (global architecture and macro business rules) get crushed by the weight of error traces and logs. This is when the AI starts to hallucinate or suggest routines that go against the initial plan.

By invoking `/sync`, the agent focuses purely on Context Recovery Mode. 

---

## 2. Mandatory Re-reading Patterns

Instead of clearing the conversation and opening a "New Chat" in the dark, the Synchronizer performs a systemic sweep of the main blocks to recover lost knowledge:

### Sweep Routine (Read-Only)
The agent is blocked from creating code. It executes silently (reading files via integration):
1. **Base Identity:** It reads the project's master file (e.g.: `GEMINI.md`) to remember what general guidelines, active workflows, and tone of voice it should adopt.
2. **Knowledge Graph Scan:** It invokes the Obsidian Vault methods via MCP and re-reads the latest Architecture Decisions notes (`01-adrs`), Resolved Bugs (`03-pivots-and-bugs`), and Domain Models (`04-domain-rules`) tied to what it was doing hours ago.
3. **Current Scope Scan:** Finally, it re-reads the live codes in the folder and the notes from the `task.md` artifact.

### The Sync Report
At the end of this re-reading shock, it must prove to the developer that its brain has realigned with the original master plan. 

It issues a **"Context Sync Report"**. It is a structure that summarizes the status of the codebase for the user: showing which modules it successfully re-anchored and explicitly pointing out any divergence or conflict discovered during the scan (e.g.: "The Obsidian rules regarding the database are diverging from the `database.py` file that I just analyzed in the lines we were fixing").
