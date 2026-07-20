---
name: "git"
description: "Local version control utility skill. Manages Micro-Checkpoints against code corruption and executes Phase Closure Squash (Phase Handover) into clean semantic commits."
---

# Skill: Local Git & Micro-Checkpoints (`skills/git`)

Gerencia o versionamento local do projeto durante o ciclo de vida das fases, fornecendo pontos de restauração rápidos (Micro-Checkpoints) e consolidação semântica (Phase Squash) para a transição de contexto limpa entre os chats. Sempre comunique-se em português.

## 📚 Documentação e Regras
Para acessar as diretrizes de execução, restrições rigorosas e o checklist de validação de versionamento, a engine deve ler o manual operacional sob demanda via `view_file`:
* **Manual de Execução:** Leia `@/.agents/skills/git/references/EXECUTION.md`

## 📋 Recursos Disponíveis
* **Template de Fechamento de Fase:** Localizado em `@/.agents/skills/git/resources/template_phase_commit.md`. Utilize-o estritamente para o "Mode 2: Phase Closure & Squash".