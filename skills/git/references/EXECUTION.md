# Manual de Execução: Git & Micro-Checkpoints

Este documento contém os modos de operação e restrições absolutas para a skill de versionamento local.

## 🔄 Modos de Operação

### Mode 1: Local Micro-Checkpoint (During Execution)
Usado continuamente durante a execução da fase para proteger o trabalho contra falhas ou corrupção de código.

* **Frequência**: Execute a cada marco funcional atingido (ex: teste passando, classe implementada, refatoração feita).
* **Comando**:
```bash
git add .
git commit -m "checkpoint({{PHASE_NAME}}): {{SHORT_DESCRIPTION}}"
```

### Mode 2: Phase Closure & Squash (Phase Handover)

Executado **estritamente ao final da fase**, quando todas as tarefas e verificações foram concluídas com sucesso.

1. **Captura do Commit Inicial**: O agente identifica o hash do commit anterior aos checkpoints da fase.
2. **Execução do Soft Reset**: Executa `git reset --soft <START_COMMIT>` para desfazer a pilha de micro-checkpoints mantendo as alterações no staging.
3. **Commit Semântico Estruturado**: Usa o template em `resources/template_phase_commit.md` para gerar **UM ÚNICO commit final** representativo.
* Exemplo:
```bash
git commit -m "feat(concepcao): BDD and SDD specifications completed for oauth2

- Artefatos salvos: 01-concepcao/bdd-oauth2.md, 01-concepcao/sdd-oauth2.md
- Testes: N/A
- Próxima Fase: Iniciar Chat TDD (/testes)"
```

### Mode 3: Local Rollback/Recovery (Emergency Revert)
Usado quando o agente comete um erro crítico, corrompe arquivos ou entra em um loop de refatoração que quebra o código.

* **Comando para descartar alterações atuais e voltar ao último checkpoint:**
```bash
git reset --hard HEAD
```

## ⛔ Regras Universais e Restrições

1. **GIT PUSH PROIBIDO**: Executar `git push` ou enviar alterações para repositórios remotos é estritamente proibido. Sincronização remota é responsabilidade do usuário.
2. **Commit Limpo de Fase**: Nunca conclua uma fase sem realizar o Squash dos micro-checkpoints intermediários.
3. **Nomenclatura Semântica**: Siga o padrão Conventional Commits (`feat`, `fix`, `docs`, `refactor`, `test`, `chore`).

## ✅ Checklist de Validação (Auto-Auditoria)

Antes de finalizar o uso desta skill, garanta que:

* [ ] Os micro-checkpoints intermediários foram consolidados via `git reset --soft`.
* [ ] O commit final usa o formato do `template_phase_commit.md`.
* [ ] O comando `git push` NÃO foi executado.
