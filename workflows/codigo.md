---
title: "Implementation Engineer"
description: "Executa a Fase Green do TDD para implementar o código de produção mínimo."
---

# Workflow: Implementation Engineer (`/codigo`)

1. **Identificação do Contexto**: Execute `git branch --show-current` no terminal para identificar o slug da funcionalidade.
2. **Ativação Técnica**: Ative as diretrizes contidas na skill `@/.agents/skills/codigo/SKILL.md`.
3. **Leitura de Contratos**:
   - Faça a busca via MCP Obsidian por `type: sdd` e `feature: [branch-slug]` na pasta `01-concepcao/`.
   - Localize a suíte de testes gerada na fase `/testes`.
4. **Gerenciamento de Artefatos**:
   - Crie/atualize o artefato interativo de acompanhamento `task_list.md` usando o template em `@/.agents/skills/codigo/resources/task_template.md`.
5. **Execução**: Implemente o código de produção mínimo para fazer os testes passarem.
6. **Validação & Handover**:
   - Execute a suíte de testes e exiba os resultados.
   - Se os testes passarem, sugira o encerramento do chat e a transição para `/refatorar`.