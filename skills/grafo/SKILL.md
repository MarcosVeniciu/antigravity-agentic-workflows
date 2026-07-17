---
name: "grafo"
description: "Skill utilitária de arquivamento no Obsidian Knowledge Graph. Persiste e estrutura atômica de ADRs, Pivots de Arquitetura, Convenções e Regras de Domínio com metadados YAML e links bidirecionais."
---

# Skill: Obsidian Knowledge Graph Archivist (`skills/grafo`)

Gerencia a persistência atômica de conhecimento de longo prazo no **Obsidian Vault** (`obsidian_knowledge_graph`), garantindo rastreabilidade entre conversas e sessões efêmeras.

---

## 🔄 Roteador de Tipos & Estrutura de Pastas

Ao registrar ou atualizar uma nota no vault, identifique a categoria e a pasta de destino correspondente:

| Categoria | Tipo (`type`) | Pasta de Destino no Vault | Template de Recursos |
| :--- | :--- | :--- | :--- |
| **ADR (Decisão Arquitetural)** | `adr` | `00-core-rules/adrs/adr-[slug].md` | [template_adr.md](resources/template_adr.md) |
| **Pivot (Decisão/Bug Local)** | `pivot` | `02-auditorias/pivots-[feature-slug].md` | [template_pivot.md](resources/template_pivot.md) |
| **Regra de Domínio / Negócio** | `domain_rule` | `00-core-rules/domain-glossary.md` | [template_domain_rule.md](resources/template_domain_rule.md) |
| **Convenção de Código** | `convention` | `00-core-rules/conventions.md` | [template_domain_rule.md](resources/template_domain_rule.md) |

---

## 🛠️ Protocolo de Execução & Ferramentas MCP

1. **Pre-Flight Check (Busca de Duplicados)**:
   * Antes de criar uma nova nota, consulte a base existente no vault usando `vault_read` ou `search_simple`.
   * Se a nota já existir, utilize `vault_patch` para atualizar em vez de duplicar.

2. **Formatação de Metadados (YAML Frontmatter)**:
   Toda nota gerada DEVE incluir obrigatoriamente o bloco inicial:
   ```yaml
   ---
   type: adr | pivot | domain_rule | convention
   feature: [slug-da-feature ou "global"]
   project: antigravity
   date: YYYY-MM-DD
   description: "Resumo da decisão em uma frase"
   tags:
     - tag1
     - tag2
   ---
   ```

3. **Links Bidirecionais (`[[nota]]`)**:
   * Referencie notas existentes relacionadas no corpo da nota utilizando a sintaxe wikilink `[[nome-da-nota]]`.

4. **Escrita via MCP**:
   * Execute `vault_write` para novas notas ou `vault_patch` para edições cirúrgicas.

---

## ⛔ Regras & Restrições

1. **Memória de Longo Prazo Estrita**: Não grave notas temporárias de rascunho no Obsidian. Grave apenas decisões consolidadas, regras de negócio confirmadas e resoluções de bugs.
2. **Zero Alucinação de Metadados**: O campo `feature` deve bater exatamente com a branch Git ativa (`git branch --show-current`) ou ser `"global"`.
3. **Imutabilidade de Histórico**: Não apague notas de ADRs anteriores; crie uma nova ADR que sobrepõe a anterior e vincule via `[[adr-antiga]]`.

---

## ✅ Checklist de Validação

- [ ] A nota contém o bloco YAML Frontmatter completo com `type`, `feature`, `project`, `date`, `description` e `tags`?
- [ ] O caminho de destino no vault respeita a estrutura oficial (`00-core-rules/`, `01-concepcao/`, `02-auditorias/`)?
- [ ] Foram incluídos links bidirecionais (`[[nota]]`) para contextos relacionados?
- [ ] A operação MCP (`vault_write` / `vault_patch`) foi executada com sucesso?
