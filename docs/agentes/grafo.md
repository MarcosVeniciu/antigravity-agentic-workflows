# Agente Arquivista da Base de Conhecimento (`/grafo`)

O agente `/grafo` é o arquivista da Segunda Mente do projeto (Obsidian Vault via MCP `obsidian_knowledge_graph`). Ele é acionado para transformar decisões arquiteturais, especificações e resoluções de bugs em notas atômicas estruturadas.

---

## 1. Princípios de Organização no Vault

- **Notas Atômicas ("Uma ideia, uma nota"):** Em vez de notas gigantes monolíticas, quebra o conhecimento em arquivos atômicos por tipo (`adr`, `sdd`, `bdd`, `audit`, `pivot`).
- **Indexação por Metadados (YAML Frontmatter):** Toda nota gerada contém obrigatoriamente campos `type`, `feature`, `project`, `date`, `description` e `tags`.
- **Links Bidirecionais (`[[Link]]`):** Conecta ativamente as notas entre si para formar a rede do Grafo de Conhecimento.

---

## 2. Estrutura de Pastas de Destino

- `00-core-rules/`: Convenções estáticas e ADRs globais.
- `01-concepcao/`: Especificações BDD e SDD da Fase 1.
- `02-auditorias/`: Registros de pivots de desenvolvimento e checklists de auditoria da Fase 3.
- `03-releases/`: Historico de releases e changelogs da Fase 4.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/grafo.md`
* **Skill Associada:** `skills/grafo/`
* **Integração:** Ferramenta MCP `obsidian_knowledge_graph` (operações `vault_write`, `vault_patch`).
