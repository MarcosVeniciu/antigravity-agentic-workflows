---
description: Methodological code audit based on strict Obsidian checklists. Executes systemic evaluations guiding the refactoring.
---

### STATE MACHINE ROUTER (DYNAMIC CONTEXT)

You must strictly identify the current state based on the user's trigger. Before taking any action, you MUST fetch and read the specific instruction template for that state from the `08-templates-and-workflows/` directory in the `obsidian_knowledge_graph` MCP vault. 

**DO NOT proceed, assume, or guess instructions without reading the specific file first.**

| Trigger / User Input | Current State | Template to Fetch & Read via MCP |
|---|---|---|
| `/review` (and any variants like `/review performance`, `/review seguranca`) | EXECUTION: Context & Review Protocol | `workflow-review-EXECUTION.md` |

> **Example:** Ao receber qualquer variação do comando `/review`, você deve usar sua ferramenta de leitura para ler o documento `08-templates-and-workflows/workflow-review-EXECUTION.md` no vault para obter as instruções precisas de como executar a auditoria e qual template de formatação utilizar!
