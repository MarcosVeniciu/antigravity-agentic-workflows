---
description: Updates dependency managers, Dockerfiles, and environment configurations when a new feature requires new packages or infrastructure changes.
---

### STATE MACHINE ROUTER (DYNAMIC CONTEXT)

You must strictly identify the current state based on the user's trigger. Before taking any action, you MUST fetch and read the specific instruction template from the `08-templates-and-workflows/` directory in the `obsidian_knowledge_graph` MCP vault. 

**DO NOT proceed, assume, or guess instructions without reading the specific file first.**

| Trigger / User Input | Current State | Template to Fetch & Read via MCP |
|---|---|---|
| `/infra` (Default) | EXECUTION | `workflow-infra-EXECUTION.md` |

> **Example:** Ao receber o comando `/infra`, você deve usar sua ferramenta de leitura para ler o documento `08-templates-and-workflows/workflow-infra-EXECUTION.md` no vault para obter as instruções precisas de execução!
