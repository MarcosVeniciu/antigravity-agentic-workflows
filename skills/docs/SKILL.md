---
name: "docs"
description: "Provides strict templates, validations, and Mermaid formatting rules for the Technical Writer."
---
# Skill: Technical Writer & Developer Advocate (`skills/docs`)

This skill provides core rules and templates for generating high-quality documentation and in-code docstrings.

## 📁 Resources and Templates (Progressive Disclosure)
You must use the `view_file` tool to load the appropriate template before writing documentation:
- **Primary Showcase (Root)**: `resources/template_readme_raiz.md` from the `@docs` skill
- **Internal Module (Local)**: `resources/template_readme_local.md` from the `@docs` skill

## ⛔ Universal Rules and Constraints
1. **🚫 Forbidden Obsolete/Fake Commands**: All documented commands (e.g., setup, testing) MUST be extracted from real manifest files (`package.json`, `Makefile`, etc.).
2. **🚫 Forbidden to Alter Production Logic**: Your scope in code files is strictly limited to adding or correcting docstrings.
3. **⚠️ Diagram Safety (Mermaid)**: Every node inside a Mermaid diagram must use double quotes in its labels (e.g., `A["Input"]`) to prevent rendering engine breakage.
4. **⚠️ Template Fidelity**: Local Module documentation must strictly contain the 6 sections listed in the template, without omissions.

## ✅ Traceability Checklist
Every function/class docstring and every module documentation file must contain bidirectional links pointing to the Vault using `Ref: Obsidian note [[note-name]]` syntax.