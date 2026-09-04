# Query and Citation Patterns: NotebookLM

This resource guides how to formulate queries and structure synthesized answers from NotebookLM.

---

## 🔍 Formulating High-Precision Queries

When querying NotebookLM via `notebook_query` or `cross_notebook_query`:

1. **Be Specific**: Target exact mechanisms, constraints, or architecture decisions.
   * *Ineffective*: "How does the system work?"
   * *Effective*: "What are the required HTTP headers and payload schemas for the authentication endpoint?"
2. **Request Source Quotes**: Ask NotebookLM to provide direct quotes or section titles where the information was located.

---

## 📝 Response Structure (Grounding & Citations)

When presenting findings to the user:

```markdown
### 📖 Síntese NotebookLM: [Título do Tópico]

> **Caderno Consultado:** `[Nome do Caderno]`  
> **Fontes Relevantes:** `[Documento 1.pdf]`, `[Documento 2.md]`

#### Resumo das Evidências Encontradas:
* **Ponto-chave 1:** [Explicação ancorada no documento]
* **Ponto-chave 2:** [Explicação ancorada no documento]

#### Citação Direta / Trecho:
> "[Trecho literal extraído da fonte via NotebookLM]"

---
*Nota: Resposta gerada com base estrita nos documentos indexados no NotebookLM.*
```
