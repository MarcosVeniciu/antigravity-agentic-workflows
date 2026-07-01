# Debug Agent (`/debug`)

While `/testar` is focused on small assertion failures at coding time, `/debug` assumes the hat of a **Forensic Investigator**. It deals with the category of complex errors: runtime crashes, external integration failures, and Docker container *Timeouts* that escaped the unit test suites.

---

## 1. The Agent's Focus

The Debug Agent does not have the immediate goal of "writing a patch and running away". Its primary focus is methodological: identifying the blind spot.

It reads the blood trail (Log/Traceback), searches the Vault (`obsidian_knowledge_graph` MCP for `03-pivots-and-bugs/` and `07-environment-setup/`) for sibling problems from the past, and tries to draw the error's timeline.

---

## 2. The Investigation Methodology

To prevent the AI from throwing "solutions in the dark" until it hits, the agent is constrained by the **5 Whys** framework.

### Structured Hypothesis Generation
Before proposing code, it must present a ranked probability table of what caused the problem. For example:
1. *High Probability:* Environment variable was not passed by Docker. (Need to see `.env`).
2. *Medium Probability:* The external API isolated the server's network.
3. *Low Probability:* Ubuntu internal DNS failure.

This prevents the AI from ignoring the obvious and making absurd proposals like rewriting the entire service class when, in fact, it was just a locked port in Docker Compose.

### Evidence Gathering & Bash Limitations
For each hypothesis, it requests evidence. If diagnostic commands are needed (like `nslookup` or checking Docker logs), the agent provides them strictly as isolated `bash` blocks for manual execution. It never runs terminal commands autonomously.

### Double Correction (The Preventive Measure)
This agent's process does not end with correcting the logical failure.
If a bug escaped, it means the QA layer failed structurally. As a golden closure of its forensic investigation, it is obliged to recommend a **Future Prevention**. 
The AI will always require the documentation of this new error in Obsidian (`/grafo`) or ask for the creation of a new integration test (E2E) to ensure that specific problem doesn't haunt the repository twice.
