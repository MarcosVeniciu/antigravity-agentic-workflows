---
name: "grafo"
description: "Obsidian Knowledge Graph archiving utility skill. Persists and atomically structures ADRs, Architecture Pivots, Conventions, and Domain Rules with YAML metadata and bidirectional links."
---

# Skill: Obsidian Knowledge Graph Archivist (`skills/grafo`)

Manages atomic persistence of long-term knowledge in the **Obsidian Vault** (`obsidian_knowledge_graph`), ensuring traceability between conversations and ephemeral sessions. Always communicate with the user in Portuguese.

---

## 🔄 Type Router & Directory Structure

When registering or updating a note in the vault, identify the category and corresponding target folder:

| Category | Type (`type`) | Target Folder in Vault | Resource Template |
| :--- | :--- | :--- | :--- |
| **ADR (Architectural Decision)** | `adr` | `00-core-rules/adrs/adr-[slug].md` | [template_adr.md](resources/template_adr.md) |
| **Pivot (Local Decision/Bug)** | `pivot` | `02-auditorias/pivots-[feature-slug].md` | [template_pivot.md](resources/template_pivot.md) |
| **Domain / Business Rule** | `domain_rule` | `00-core-rules/domain-glossary.md` | [template_domain_rule.md](resources/template_domain_rule.md) |
| **Code Convention** | `convention` | `00-core-rules/conventions.md` | [template_domain_rule.md](resources/template_domain_rule.md) |

> 💡 **Separation of Responsibilities**: Feature lifecycle artifacts (`bdd`, `sdd`, `audit`) are formatted and saved directly by their respective domain skills (`planejamento`, `artefatos`, `review`) using their own local templates. The `grafo` skill focuses exclusively on atomic management of decisions, conventions, and pivots.

---

## 🛠️ Execution Protocol

1. **Pre-Flight (Duplicate Search)**: Prior to creating a new note, search the vault to verify if it already exists. If existing, update it rather than duplicating.
2. **Metadata Formatting**: Every note MUST include YAML Frontmatter per the corresponding template in `resources/`.
3. **Bidirectional Links**: Reference related existing notes using wikilink syntax `[[note-name]]`.
4. **Persistence**: Save new notes or update existing ones in the vault.

---

## ⛔ Rules & Constraints

1. **Strict Long-Term Memory**: Do not store temporary draft notes in Obsidian. Store only consolidated decisions, confirmed business rules, and bug resolutions.
2. **Zero Metadata Hallucination**: The `feature` field must correspond to the active Git branch or be `"global"`.
3. **History Immutability**: Do not delete notes of previous ADRs; create a new ADR overriding the previous one and link via `[[old-adr]]`.

---

## ✅ Validation Checklist

- [ ] Does the note contain the full YAML Frontmatter block with `type`, `feature`, `project`, `date`, `description`, and `tags`?
- [ ] Does the target path in the vault respect official structure (`00-core-rules/`, `01-concepcao/`, `02-auditorias/`)?
- [ ] Were bidirectional links (`[[note]]`) included for related contexts?
- [ ] Was the vault persistence operation executed successfully?

