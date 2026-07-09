---
description: Reactive fix phase. Triggered when tests fail — analyzes the terminal error output and surgically adjusts the code exclusively to make the tests pass.
---

### STATE MACHINE ROUTER (DYNAMIC CONTEXT)

You must strictly identify the current state based on the user's trigger. Before taking any action, you MUST fetch and read the specific instruction template from the `08-templates-and-workflows/` directory in the `obsidian_knowledge_graph` MCP vault. 

**DO NOT proceed, assume, or guess instructions without reading the specific file first.**

| Trigger / User Input | Current State | Template to Fetch & Read via MCP |
|---|---|---|
| `/testar` (Default) | EXECUTION | `workflow-testar-EXECUTION.md` |

> **Example:** Ao receber o comando `/testar`, você deve usar sua ferramenta de leitura para ler o documento `08-templates-and-workflows/workflow-testar-EXECUTION.md` no vault para obter as instruções precisas de execução!
