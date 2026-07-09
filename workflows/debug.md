---
description: Forensic bug investigator. Triggered for runtime errors, crashes, and integration failures that passed unit tests.
---

### STATE MACHINE ROUTER (DYNAMIC CONTEXT)

You must strictly identify the current state based on the user's trigger. Before taking any action, you MUST fetch and read the specific instruction template from the `08-templates-and-workflows/` directory in the `obsidian_knowledge_graph` MCP vault. 

**DO NOT proceed, assume, or guess instructions without reading the specific file first.**

| Trigger / User Input | Current State | Template to Fetch & Read via MCP |
|---|---|---|
| `/debug` (Default) | EXECUTION | `workflow-debug-EXECUTION.md` |

> **Example:** Ao receber o comando `/debug`, você deve usar sua ferramenta de leitura para ler o documento `08-templates-and-workflows/workflow-debug-EXECUTION.md` no vault para obter as instruções precisas de execução!
