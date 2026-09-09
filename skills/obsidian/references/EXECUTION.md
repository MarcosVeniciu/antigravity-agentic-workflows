# Execution Manual: Obsidian Vault Governance

This document establishes operating modes, directory structures, and integrity rules for managing the Obsidian Vault.

---

## Official Directory Structure in Vault

All notes in the vault must respect the standard folder hierarchy:
* `00-core-rules/`: Architecture Decision Records (`adrs/adr-[slug].md`), `domain-glossary.md`, and `conventions.md`.
* `01-concepcao/`: Feature specifications (`bdd-[slug].md`, `sdd-[slug].md`, `epic-[slug].md`) and Living DoD (`dod-[slug].md`).
* `02-auditorias/`: Audit reports (`audit-[domain]-[slug].md`) and route pivots (`pivots-[slug].md`).
* `03-releases/`: Release notes (`changelog-v[VERSION].md`) and consolidated release records.
* `04-templates/`: Reference templates for notes.

---

## Operating Modes

### Mode 1: Metadata Search & Retrieval
1. **Pre-flight Search**: In the first turn or when loading feature context, use `search_query`:
   * Example: `search_query` with query `type: sdd` and `feature: [slug]`.
2. **Document Reading**: Read note contents using `vault_read` or list directory contents with `vault_get_document_map`.

### Mode 2: Surgical Patching (`vault_patch`)
* **Strict Rule**: Avoid full-file overwrites (`vault_write`) when modifying existing notes (such as updating checklists or logging pivots).
* **Heading Update**: Use `vault_patch` with `targetType: "heading"` to append or update entries under a specific section.
* **Frontmatter Update**: Use `vault_patch` with `targetType: "frontmatter"` to modify tags, status, or dates in YAML metadata.

### Mode 3: ADR & Pivot Governance
* **Promote-on-Impact**: If a bug fix, review finding, or refactoring alters a global repository pattern, generate an ADR in `00-core-rules/adrs/adr-[slug].md` using `resources/template_adr.md`.
* **Architecture Pivot**: If Phase 2 TDD requires deviating from the SDD contract, document the rationale in `02-auditorias/pivots-[slug].md` using `resources/template_pivot.md`.

### Mode 4: Link Integrity & Wikilinks
* Every internal reference must use `[[note-name]]` syntax without extension.
* Verify that target notes exist using `search_simple` or `vault_list` before linking.
* Inspect `backlinks` before modifying any core rule in `00-core-rules/` to understand downstream impacts.

---

## Strict Constraints

1. **NO TEMPORARY DRAFTS**: Do not pollute Obsidian with scratch notes or incomplete drafts.
2. **ZERO METADATA HALLUCINATION**: The `feature` YAML field must match the active Git branch slug or `"global"`.
3. **HISTORY IMMUTABILITY**: Do not delete superseded ADRs; create a new ADR superseding the previous one and link via `[[old-adr]]`.
