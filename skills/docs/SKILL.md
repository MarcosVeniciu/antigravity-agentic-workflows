---
name: "docs"
description: "Technical documentation skill for Phase 5. Generates project showcase, module READMEs, and traceable in-code docstrings without modifying production logic."
---

# Skill: Technical Writer & Documentação Técnica (`skills/docs`)

Guia a geração e atualização de documentação técnica viva (READMEs de módulo/raiz e docstrings de código) na Fase 5, garantindo rastreabilidade com o Obsidian Vault e comandos reais extraídos de manifestos.

---

## 📁 Recursos e Templates

* **Showcase Principal (Raiz)**: `resources/template_readme_raiz.md` from the `@docs` skill
* **Módulo Interno (Local)**: `resources/template_readme_local.md` from the `@docs` skill

---

## ⛔ Regras Estritas e Restrições

1. **🚫 Proibido Comandos Obsoletos/Falsos**: Todos os comandos documentados (instalação, execução, testes) DEVEM ser validados contra arquivos de manifesto reais (`package.json`, `pyproject.toml`, `Makefile`, etc.).
2. **🚫 Proibido Alterar Lógica de Produção**: Seu escopo em arquivos de código é estritamente limitado à inserção ou correção de docstrings e comentários.
3. **⚠️ Diagramas Mermaid Seguros**: Todo rótulo ou nó em diagramas Mermaid deve estar entre aspas duplas (ex: `A["Input"]`).
4. **⚠️ Fidelidade ao Template**: A documentação local de módulos deve conter rigorosamente as seções previstas no template.

---

## ✅ Rastreabilidade com Obsidian
Toda docstring de classe/função e documentação de módulo deve conter links bidirecionais para o Obsidian Vault usando a sintaxe `Ref: Obsidian note [[note-name]]`.