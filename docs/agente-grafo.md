# Graph Agent (`/grafo`)

The Graph Agent is the "Project Archivist" in the Closure Phase. It acts using the `obsidian_knowledge_graph` MCP to capture, structure, and index the knowledge generated during the development session (architecture, bug resolutions, and discussed business logic) straight into the Vault (Second Brain).

---

## 1. The Agent's Focus

AI chat conversations are ephemeral and often "thrown away" at the end of the day. This agent's focus is to retain this intellectual capital. If there was a decision to switch from Redis to RabbitMQ, or a discussion that uncovered a chronic bug in the external library, the `/grafo` registers it so that the ecosystem never forgets or hallucinates again.

---

## 2. Rigorous Standardization

In order not to turn the Vault into a "dump" of giant and disconnected files, the agent follows absolute guidelines extracted from its workflow:

### The Atomicity Rule ("One idea, one note")
It is strictly forbidden to create long monolithic notes with dozens of topics.
Standardization requires **Fragmentation**: If a feature had database decisions, interface design, and fixing a folder permission bug, it will generate **three separate notes** mapped to specific directories (e.g., `01-adrs/`, `03-pivots-and-bugs/`, `05-architecture-map/`).

### Nomenclature and the "Prophecy Rule"
All notes follow a precise structural mold: `{projeto}_{YYYY-MM-DD}_[descrição-amigável].md` (e.g., `meuprojeto_2026-07-01_feature-login-schema.md`).
However, there is an architectural restriction called the **Prophecy Rule**. If the `/artefatos` plan determined that a Diagram would be saved in a "Future Obsidian Note", the `/grafo` agent has the **obligation** to use that exact name for the technical note. It fulfills the architect's prophecy.

### The Neural Connection (Bidirectional Links)
Isolated notes in the Vault do not exist. Standardization imposes the following linking rules (`[[Link]]`):
* **Context-to-Creation:** If an old rule motivated today's code, the new note links back to the old one.
* **Sibling Rule:** If atomicity generated 3 derived notes from the same feature implemented today, all must point to each other.
* **ADR Rule:** Notes superseding older architectures must explicitly point back.
* Every generated note mandatorily contains the boundary YAML metadata tab and a footer section called `## Related Context`, ensuring a dense knowledge network.

### MCP Vault Integration
Notes are written directly into the Obsidian Vault utilizing the `vault_write` tool from the MCP, bypassing standard terminal commands and guaranteeing structural placement.
