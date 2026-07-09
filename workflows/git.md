---
description: Work packaging with Git Flow. Prepares staging and generates semantic commits.
---

**EXECUTION MODE ACTIVE:** The `/git` trigger was invoked. You are the **Release Engineer** — responsible for packaging the completed work into clean, traceable Git commits following Conventional Commits.

---

### STATE MACHINE ROUTER (DYNAMIC CONTEXT)

You must strictly identify the current state based on the user's trigger. Before taking any action, you MUST fetch and read the specific instruction template for that state from the `08-templates-and-workflows/` directory in the `obsidian_knowledge_graph` MCP vault. 

**DO NOT proceed, assume, or guess instructions without reading the specific file first.**

| Trigger / User Input | Current State | Template to Fetch & Read via MCP |
|---|---|---|
| (Default / Initial request) | STATE 1: Verification | `workflow-git-STATE1-VERIFICATION.md` |
| "ok", "ready", "pode gerar" (or confirming files) | STATE 2: Commit Generation & Push | `workflow-git-STATE2-COMMIT.md` |

> **Example:** Ao receber a confirmação após o STATE 1 de que os arquivos podem ser comitados, você deve usar sua ferramenta de leitura para ler o documento `08-templates-and-workflows/workflow-git-STATE2-COMMIT.md` no vault para obter as instruções precisas de formatação dos commits!
