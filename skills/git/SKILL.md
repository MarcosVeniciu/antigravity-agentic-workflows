---
name: "git"
description: "Skill utilitária de versionamento local. Gerencia Micro-Checkpoints contra corrupção de código e realiza Squash de Encerramento de Fase (Phase Handover) em commits semânticos limpos."
---

# Skill: Local Git & Micro-Checkpoints (`skills/git`)

Gerencia o versionamento local do projeto durante o ciclo de vida das fases, fornecendo **pontos de restauração rápidos (Micro-Checkpoints)** e **consolidação de commits semânticos (Phase Squash)** para passagem limpa de contexto entre chats.

---

## 🔄 Modos de Operação

### Mode 1: Micro-Checkpoint Local (Durante a Execução)
Utilizado de forma contínua durante a execução da fase para proteger o trabalho contra falhas ou corrupção de código.

* **Frequência**: Executar a cada marco funcional atingido (ex: suíte de testes passando, classe implementada, refatoração de um método).
* **Comando**:
  ```bash
  git add .
  git commit -m "checkpoint({{FASE_NOME}}): {{DESCRICAO_CURTA}}"
  ```

---

### Mode 2: Encerramento de Fase & Squash (Phase Handover)
Executado **estritamente ao final da fase**, quando todas as tarefas e verificações da fase estiverem concluídas com sucesso.

1. **Captura do Commit Inicial**:
   * O agente identifica o hash do commit antes dos checkpoints da fase (ou utiliza a tag da fase anterior).
2. **Execução do Soft Reset**:
   * Executa `git reset --soft <START_COMMIT>` para desfazer a pilha de micro-checkpoints mantendo todas as alterações no staging.
3. **Commit Semântico Estruturado**:
   * Utiliza o template em [template_phase_commit.md](resources/template_phase_commit.md) para gerar **UM ÚNICO commit final** representativo da fase.
   * Exemplo:
     ```bash
     git commit -m "feat(concepcao): especificacao BDD e SDD concluidas para oauth2

     - Artefatos salvos no Obsidian: 01-concepcao/bdd-oauth2.md, 01-concepcao/sdd-oauth2.md
     - Suíte de testes: N/A (Fase 1)
     - Próxima fase recomendada: Iniciar Chat de Implementação TDD (/testes)"
     ```

---

## ⛔ Regras Universais & Restrições

1. **PROIBIDO GIT PUSH**: É estritamente proibido executar `git push` ou enviar alterações para repositórios remotos. A sincronização remota é responsabilidade exclusiva do usuário humano.
2. **Commit por Fase Limpo**: Nunca encerre uma fase sem realizar o Squash dos micro-checkpoints intermediários.
3. **Nomenclatura Semântica**: Siga o padrão Conventional Commits (`feat`, `fix`, `docs`, `refactor`, `test`, `chore`).

---

## ✅ Checklist de Validação

- [ ] Os micro-checkpoints intermediários foram consolidados via `git reset --soft`?
- [ ] O commit final de encerramento utiliza o formato do `template_phase_commit.md`?
- [ ] O commit lista os artefatos gerados/alterados e o próximo agente recomendado?
- [ ] O comando `git push` NÃO foi executado?
