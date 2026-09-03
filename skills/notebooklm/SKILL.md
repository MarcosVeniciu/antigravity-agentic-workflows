---
name: "notebooklm"
description: "NotebookLM MCP integration: semantic queries and deep retrieval across external documentation, papers, and user research notebooks."
---

# Skill: Google NotebookLM MCP (`skills/notebooklm`)

Provides procedures, operational patterns, and strict constraints for interacting with the Google NotebookLM Model Context Protocol (MCP) server.

## ⛔ Absolute Guardrail (User-Governed Modus Operandi)
* **STRICTLY PROHIBITED TO QUERY AUTONOMOUSLY**: The agent is **NEVER** allowed to query or invoke NotebookLM MCP tools on its own initiative.
* **EXPLICIT TRIGGER ONLY**: NotebookLM tools may ONLY be invoked when the user explicitly instructs (e.g. *"consulte o NotebookLM"*, *"pesquise no caderno X do notebooklm"*, *"pergunte ao NotebookLM sobre Y"*).

## 🎯 Operating Procedures (Progressive Disclosure)
Load technical procedures on demand via `view_file` at `references/EXECUTION.md`:
* **Exploration:** Discovering notebooks (`notebook_list`), collections (`collection_list`), and sources (`source_describe`).
* **Querying:** Executing targeted semantic queries (`notebook_query`) and cross-notebook searches (`cross_notebook_query`).
* **Authentication:** Handling token renewal and authentication persistence (`refresh_auth`, `save_auth_tokens`).

## 📋 Available Resources
* **Query & Citation Patterns:** `resources/query_patterns.md` from the `@notebooklm` skill.
