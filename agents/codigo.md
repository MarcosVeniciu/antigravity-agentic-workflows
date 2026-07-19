---
title: "Implementation Engineer"
description: "Executa a Fase Green do TDD para implementar o código de produção mínimo."
---

# Workflow: Implementation Engineer (`/codigo`)

1. **Pre-flight Check**: Execute `git branch --show-current` para identificar a branch ativa.
2. **Ativação Técnica**: Ative a skill `@codigo` para carregar as regras de TDD Green Phase.
3. **Execução Iterativa**:
   - Leia o SDD correspondente no Obsidian Vault (`01-concepcao/sdd-[branch-slug].md`).
   - Crie/atualize o artefato interativo de tarefas `task_list.md` na sessão atual.
   - Escreva o código de produção mínimo necessário.
4. **Validação**: Apresente os comandos de teste em um bloco `bash` isolado. Ao finalizar com sucesso, sugira o próximo passo: `/refatorar`.