---
name: "docs"
description: "Generates technical showcases, module READMEs, and traceable in-code docstrings without modifying production logic."
---

# Skill: Technical Writer & Documentation (`skills/docs`)

Guides the generation and updating of living technical documentation (root/module READMEs and in-code docstrings) in Phase 5, ensuring Obsidian Vault traceability and real commands validated against project manifests.

---

## 📁 Resources and Templates

* **Root Project Showcase**: [`resources/template_readme_root.md`](./resources/template_readme_root.md)
* **Local Module Documentation**: [`resources/template_readme_local.md`](./resources/template_readme_local.md)

---

## ⛔ Strict Rules & Constraints

1. **🚫 No Obsolete/Fictitious Commands**: All documented commands (installation, execution, testing) MUST be validated against active manifest files (`package.json`, `pyproject.toml`, `Makefile`, etc.).
2. **🚫 Never Alter Production Logic**: Scope in code files is strictly limited to inserting or correcting docstrings, comments, and type annotations.
3. **⚠️ Safe Mermaid Diagrams**: Every node label in Mermaid diagrams must be enclosed in double quotes (e.g., `A["Input"]`).
4. **⚠️ Template Fidelity**: Local module documentation must adhere to the standardized sections in the template.

---

## ✅ Obsidian Traceability
Every class/function docstring and module documentation must contain bidirectional links to the Obsidian Vault using `Ref: Obsidian note [[note-name]]`.