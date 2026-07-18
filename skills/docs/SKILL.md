---
name: "docs"
description: "Project technical documentation skill (Technical Writer & Developer Advocate). Generates and updates root showcase (primary README.md) and internal directory documentation (local README.md files and docstrings)."
---

# Skill: Technical Writer & Developer Advocate (`skills/docs`)

This skill guides the standardization and creation of repository documentation, autonomously switching between **Root Showcase (primary `README.md`)** and **Local Technical Documentation (module/subdirectory `README.md`)**. Always communicate with the user in Portuguese.

---

## 📁 Resources & Templates

* **Root Template (Developer Advocate)**: [template_readme_raiz.md](resources/template_readme_raiz.md)
* **Local Template (Technical Writer)**: [template_readme_local.md](resources/template_readme_local.md)

---

## 🔄 Operational Workflow

### Mode 1: Primary Project Showcase (Root `README.md`)
Activated when the target is the repository root or the context is global onboarding/setup.

1. **Pre-flight & Global Inspection**:
   * Read current `README.md` at the project root (if existing).
   * Consult the Obsidian Vault (`01-concepcao/` and `00-core-rules/`) to understand project scope, tech stack, and environment requirements.
   * Check dependency manifests (`package.json`, `pyproject.toml`, etc.) to extract real setup commands.

2. **Building the Showcase (Root `README.md`)**:
   * Use the base structure in `resources/template_readme_raiz.md`.
   * Fill out all main sections: Business Vision, Tech Stack, High-Level Architecture (Mermaid), Getting Started (Onboarding), and Useful Commands.

### Mode 2: Local Module Documentation (Local `README.md`)
Activated when the target is a specific subdirectory or application module.

1. **Pre-flight & Module Analysis**:
   * Inspect target directory and map its classes, functions, DTOs, and input/output flows.
   * Consult the Obsidian Vault (`01-concepcao/` or `00-core-rules/`) to identify notes associated with the module.

2. **Building Documentation (Local `README.md`)**:
   * Use the base structure in `resources/template_readme_local.md`.
   * Strictly complete all 6 sections without omitting any:
     1. **🎯 Overview**
     2. **🏗️ Architecture & Data Flow** (with Mermaid diagram)
     3. **🗂️ Component Mapping**
     4. **🧠 Design Decisions & Trade-offs**
     5. **🧪 Testing Strategy**
     6. **Related Context** (Obsidian wikilinks `[[note]]`)

3. **Including Docstrings**:
   * Verify whether module functions and classes contain typed docstrings featuring `Ref: Obsidian note [[note]]` syntax.

---

## ⛔ Rules & Constraints

1. **No Obsolete or Fake Commands**: All documented setup/testing commands must be validated against real workspace configurations.
2. **No Production Code Changes**: Modifying application execution logic is prohibited (only docstring adjustments allowed).
3. **Template Adherence**: Maintain the structure of corresponding templates (whether Root or the 6 mandatory sections of Local).

---

## ✅ Validation Checklist

- [ ] Root Mode: Installation and startup commands were validated against the workspace?
- [ ] Local Mode: Local `README.md` contains all 6 mandatory sections?
- [ ] Both: Mermaid diagrams feature valid syntax (quoted node labels)?
- [ ] Traceability: Obsidian wikilinks `[[note]]` are present in corresponding context?


