---
description: Context recovery. Forces re-reading of GEMINI.md, artifacts, and Obsidian vault to recalibrate the model in long sessions.
---

### STATE MACHINE ROUTER (DYNAMIC CONTEXT)

You must strictly identify the current state based on the user's trigger. Before taking any action, you MUST fetch and read the specific instruction template from the `08-templates-and-workflows/` directory in the `obsidian_knowledge_graph` MCP vault. 

**DO NOT proceed, assume, or guess instructions without reading the specific file first.**

| Trigger / User Input | Current State | Template to Fetch & Read via MCP |
|---|---|---|
| `/sync` (Default) | EXECUTION | `workflow-sync-EXECUTION.md` |

> **Example:** Ao receber o comando `/sync`, você deve usar sua ferramenta de leitura para ler o documento `08-templates-and-workflows/workflow-sync-EXECUTION.md` no vault para obter as instruções precisas de execução!
