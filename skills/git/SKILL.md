---
name: "git"
description: "Central local version control skill. Enforces Git Flow branches, manages micro-checkpoints, performs phase squashes, rolls back failures, and executes release tagging and merges."
---

# Skill: Git Flow & Versionamento Local (`skills/git`)

Gerencia todas as operações locais de controle de versão ao longo do ciclo de vida do Antigravity, garantindo conformidade com o Git Flow, tolerância a falhas via micro-checkpoints, handovers semânticos de fase e publicações seguras de release.

## 🔄 Modos Operacionais (Progressive Disclosure)
Carregue os procedimentos detalhados sob demanda via `view_file` em `references/EXECUTION.md`:
* **Modo 1: Validação de Branch & Git Flow:** Validação de branch (`scripts/validate_branch.sh`) e checkout de branches de trabalho.
* **Modo 2: Micro-Checkpoints Locais:** Pontos de restauração rápidos durante TDD, refatoração e auditorias.
* **Modo 3: Phase Closure & Squash:** Consolidação semântica para troca limpa de contexto entre chats.
* **Modo 4: Rollback Local / Recuperação de Emergência:** Descarte imediato de loops de falha (`git reset --hard HEAD`).
* **Modo 5: Release Branch, Tag Anotada & Fechamento Git Flow:** Criação da branch de release, tags de versão e merges em `main` e `develop`.

## 📋 Recursos Disponíveis
* **Template de Commit de Fase:** `resources/template_phase_commit.md` (para Modo 3).
* **Script de Validação de Branch:** `scripts/validate_branch.sh` (para Modo 1).