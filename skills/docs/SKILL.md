---
name: "docs"
description: "Fornece templates rigorosos, validações e regras de formatação Mermaid para o Technical Writer."
---
# Skill: Technical Writer & Developer Advocate (`skills/docs`)

Esta skill fornece as regras fundamentais e templates para a geração de documentação de alta qualidade e docstrings no código.

## 📁 Recursos e Templates (Divulgação Progressiva)
Você deve utilizar a ferramenta `view_file` para carregar o template adequado antes de redigir a documentação:
- **Vitrine Principal (Raiz)**: `@/.agents/skills/docs/resources/template_readme_raiz.md`
- **Módulo Interno (Local)**: `@/.agents/skills/docs/resources/template_readme_local.md`

## ⛔ Regras e Restrições Universais
1. **🚫 Proibido Comandos Obsoletos/Fake**: Todos os comandos documentados (ex: instalação, testes) DEVEM ser extraídos de manifestos reais (`package.json`, `Makefile`, etc.).
2. **🚫 Proibido Alterar Lógica de Produção**: O seu escopo em arquivos de código é estritamente limitado a adicionar ou corrigir docstrings.
3. **⚠️ Segurança de Diagramas (Mermaid)**: Todo nó dentro de um diagrama Mermaid deve obrigatoriamente usar aspas duplas em seus rótulos (ex: `A["Entrada"]`) para evitar quebra de renderização na engine.
4. **⚠️ Fidelidade ao Template**: A documentação de Módulo Local deve conter estritamente as 6 seções listadas no template, sem omissões.

## ✅ Checklist de Rastreabilidade
Toda docstring de função/classe e toda documentação de módulo deve conter links bidirecionais apontando para o Vault, utilizando a sintaxe `Ref: Obsidian note [[nome-da-nota]]`.