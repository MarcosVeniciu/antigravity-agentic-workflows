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

## 🛠️ Protocolo de Execução

1. **Pre-Flight (Busca de Duplicados)**: Antes de criar uma nova nota, busque no vault para verificar se já existe. Se existir, atualize-a em vez de duplicar.
2. **Formatação de Metadados**: Toda nota DEVE incluir o YAML Frontmatter conforme o template correspondente em `resources/`.
3. **Links Bidirecionais**: Referencie notas existentes relacionadas utilizando a sintaxe wikilink `[[nome-da-nota]]`.
4. **Persistência**: Salve novas notas ou atualize existentes no vault.

---

## ⛔ Regras & Restrições

1. **Memória de Longo Prazo Estrita**: Não grave notas temporárias de rascunho no Obsidian. Grave apenas decisões consolidadas, regras de negócio confirmadas e resoluções de bugs.
2. **Zero Alucinação de Metadados**: O campo `feature` deve corresponder à branch Git ativa ou ser `"global"`.
3. **Imutabilidade de Histórico**: Não apague notas de ADRs anteriores; crie uma nova ADR que sobrepõe a anterior e vincule via `[[adr-antiga]]`.

---

## ✅ Checklist de Validação

- [ ] A nota contém o bloco YAML Frontmatter completo com `type`, `feature`, `project`, `date`, `description` e `tags`?
- [ ] O caminho de destino no vault respeita a estrutura oficial (`00-core-rules/`, `01-concepcao/`, `02-auditorias/`)?
- [ ] Foram incluídos links bidirecionais (`[[nota]]`) para contextos relacionados?
- [ ] A operação de persistência no vault foi executada com sucesso?
