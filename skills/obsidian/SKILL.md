---
name: "obsidian"
description: "Single Source of Truth (SSOT) Vault governance skill. Manages metadata search, document reading, surgical vault_patch updates, ADRs, architecture pivots, and wikilink graph integrity."
---

# Skill: Obsidian Vault Governance (`skills/obsidian`)

Operates and maintains the Single Source of Truth (SSOT) in the Obsidian Vault, ensuring atomic knowledge persistence, surgical patching, and bidirectional link integrity.

## 🎯 Operating Modes (Progressive Disclosure)
Load detailed procedures on demand via `view_file` at `references/EXECUTION.md`:
* **Mode 1: Metadata Search & Document Retrieval:** Querying notes via YAML metadata (`search_query` for `type: sdd`, `feature: [slug]`, tags) and reading with `vault_read`.
* **Mode 2: Surgical Patching (`vault_patch`):** Prioritizing incremental updates by `targetType: "heading"` or `"frontmatter"` instead of full-file overwrites.
* **Mode 3: Knowledge Governance (ADRs & Pivots):** Documenting architecture decisions (`00-core-rules/adrs/`) and local route pivots (`02-auditorias/pivots-*.md`).
* **Mode 4: Graph Integrity & Wikilinks:** Validating bidirectional links (`[[note-name]]`) and avoiding orphan links.

## 📋 Available Resources
* **ADR Template:** `resources/template_adr.md`
* **Architecture Pivot Template:** `resources/template_pivot.md`
* **Domain / Convention Rule Template:** `resources/template_domain_rule.md`
