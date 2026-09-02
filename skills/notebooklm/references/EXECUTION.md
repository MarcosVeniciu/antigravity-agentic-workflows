# Execution Manual: Google NotebookLM MCP

This manual defines operational protocols for querying and managing documents in Google NotebookLM via MCP tools.

---

## 🛠️ MCP Tool Catalog

### 1. Exploration & Discovery
* `notebook_list`: Lists all available notebooks associated with the authenticated account.
* `notebook_get`: Retrieves metadata and structure of a specific notebook.
* `source_describe`: Inspects the content summary and metadata of an individual document/source.
* `source_get_content`: Extracts raw text content from a specified source.
* `collection_list`: Lists logical collections of notebooks.

### 2. Semantic Querying
* `notebook_query`: Submits a question to a specific notebook. The query triggers semantic search across all indexed sources within that notebook.
* `cross_notebook_query`: Executes a search across multiple notebooks simultaneously when synthesizing broad domain knowledge.

### 3. Authentication Management
* `refresh_auth`: Attempts to refresh the active session token.
* `save_auth_tokens`: Persists refreshed session credentials.

---

## 🔄 Execution Protocol (When Commanded by User)

1. **Verify Authorization**: Confirm the user explicitly requested NotebookLM consultation.
2. **Notebook Identification**: If the target notebook is not named, run `notebook_list` to identify relevant notebooks.
3. **Structured Querying**:
   * Formulate clear, focused queries in `notebook_query`.
   * Avoid conversational chatter in the query string; focus on core technical terms and desired outcomes.
4. **Fidelity & Citation**:
   * Synthesize the response using **strictly** the content returned by NotebookLM.
   * Cite the source names or sections returned.
   * If NotebookLM returns inconclusive results or states information is missing, report the gap faithfully without hallucinating.

---

## ⛔ Strict Constraints

1. **NO AUTONOMOUS INVOCATION**: Never invoke NotebookLM tools during standard TDD, refactoring, or review phases unless the user explicitly commands it.
2. **NO ASSUMED CONTEXT**: Do not invent citations or claim a document exists in NotebookLM without verifying with `source_describe` or `notebook_list`.
