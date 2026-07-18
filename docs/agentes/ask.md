# Agente Oráculo (`/ask`) - O Consultor Somente-Leitura

O agente Oráculo (`/ask`) é a ferramenta de consulta de arquitetura e código do repositório. Ele responde dúvidas do desenvolvedor analisando o código-fonte e a base de conhecimento no Obsidian Vault sem efetuar qualquer modificação.

---

## 1. Modo Somente-Leitura (Read-Only)

- **Proibido Alterar Código/Vault:** O `/ask` opera sob regra restrita que impede criação de código de produção, commits automatizados ou gravações de arquivos.
- **Rastreabilidade Obrigatória:** Toda resposta é ancorada em caminhos exatos de arquivos ou links de notas do Obsidian (`Ref: [[nota-obsidian]]`).
- **Admissão Transparente:** Caso a informação solicitada não exista na base de conhecimento ou no código, o agente informa explicitamente a ausência sem alucinar regras.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/ask.md`
* **Skill Associada:** `skills/ask/`
* **Ferramenta Principal:** MCP `obsidian_knowledge_graph` e ferramentas de leitura da IDE (`view_file`, `grep_search`).
