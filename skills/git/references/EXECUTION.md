# Manual de Execução: Git Flow & Versionamento Local (`skills/git`)

Este documento estabelece os procedimentos operacionais, comandos e restrições absolutas para todas as ações de versionamento no ciclo de vida do Antigravity.

---

## 🔄 Modos Operacionais

### Modo 1: Validação de Branch & Estratégia Git Flow
Utilizado na **Fase 1 (`/planejamento`)** ou na **Fase 0 (`/decompor`)** para garantir que nenhuma alteração ocorra diretamente nas branches protegidas.

1. **Validação Automática:**
   ```bash
   bash skills/git/scripts/validate_branch.sh
   ```
2. **Regra de Bloqueio (Phase Gate):** Se a branch ativa for `main`, `master` ou `develop`, qualquer commit é **terminantemente proibido**.
3. **Criação da Branch de Trabalho:**
   ```bash
   git checkout -b feature/{{FEATURE_SLUG}}
   ```
   *(Para correções de bugs em produção, use `bugfix/{{SLUG}}` ou `hotfix/{{SLUG}}`)*.

---

### Modo 2: Micro-Checkpoints Locais (Durante a Execução)
Utilizado de forma contínua durante a **Fase 2 (`/implementar`)**, **Fase 3 (`/refatorar`)** e **Fase 4 (`/review`)** para proteger o progresso contra quebras e corrupção de contexto.

* **Gatilho de Execução:** Disparar a cada marco funcional atingido (ex: lote de testes verde, domínio de auditoria corrigido, componente refatorado).
* **Comando Padronizado:**
  ```bash
  git add .
  git commit -m "checkpoint({{FASE}}): {{DESCRICAO_CURTA}}"
  ```

---

### Modo 3: Phase Closure & Squash (Handover de Fase)
Executado **estritamente ao final de cada fase**, quando todos os critérios e itens do DoD daquela fase forem concluídos.

1. **Captura do Commit Base:** Identifique o hash do commit anterior ao início da fase (`git log --oneline`).
2. **Execução do Soft Reset (Squash):**
   ```bash
   git reset --soft <HASH_INICIAL_DA_FASE>
   ```
   *(Isso desfaz a pilha de micro-checkpoints intermediários mantendo todas as alterações na staging area).*
3. **Commit Semântico Estruturado:** Utilize o formato do `resources/template_phase_commit.md`:
   ```bash
   git commit -m "feat(concepcao): especificacoes BDD e SDD para {{FEATURE_SLUG}} (Fase 1)

   - Artefatos & Notas Obsidian: 01-concepcao/bdd-{{FEATURE_SLUG}}.md, 01-concepcao/sdd-{{FEATURE_SLUG}}.md, 01-concepcao/dod-{{FEATURE_SLUG}}.md
   - Status dos Testes: N/A (Fase de Arquitetura)
   - Principais Mudancas:
     * Modelagem de cenarios Gherkin Happy e Unhappy Path
     * Contratos Pydantic tipados e mocks de fronteira
     * Inicializacao do Living DoD com criterios de aceite
   - Proxima Fase Recomendada: Iniciar ciclo TDD via /implementar (Chat 2)"
   ```

---

### Modo 4: Rollback Local / Recuperação de Emergência (Double-Strike Rule)
Utilizado quando o agente comete um erro crítico, entra em loop de falhas ou falha duas vezes consecutivas em testes ou refatoração.

* **Comando para descartar alterações não salvas e retornar ao último checkpoint íntegro:**
  ```bash
  git reset --hard HEAD
  ```

---

### Modo 5: Release Branch, Tag Anotada & Fechamento Git Flow
Utilizado estritamente no workflow de publicação **`/release`** para consolidar features candidatas em produção e desenvolvimento.

1. **Atualizar e Criar Release Branch a partir da develop:**
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b release/v{{VERSION}}
   ```
2. **Mesclar Features Candidatas (com 100% de DoD validado):**
   ```bash
   git merge --no-ff feature/{{FEATURE_SLUG_1}}
   git merge --no-ff feature/{{FEATURE_SLUG_2}}
   ```
3. **Commit de Release & Tag Anotada em main:**
   ```bash
   git commit -am "chore(release): preparacao da versao v{{VERSION}}"
   git checkout main
   git merge --no-ff release/v{{VERSION}}
   git tag -a v{{VERSION}} -m "Release v{{VERSION}}"
   ```
4. **Propagação de Volta para develop & Limpeza de Branches:**
   ```bash
   git checkout develop
   git merge --no-ff release/v{{VERSION}}
   git branch -d release/v{{VERSION}}
   git branch -d feature/{{FEATURE_SLUG_1}}
   git branch -d feature/{{FEATURE_SLUG_2}}
   ```

---

## ⛔ Regras Universais e Restrições Rígidas

1. **PROIBIDO PUSH NÃO AUTORIZADO:** Executar `git push` sem comando expresso do usuário é terminantemente proibido.
2. **PROIBIDO HANDOVER SUJO:** Nunca encerre uma fase sem consolidar (squash) os micro-checkpoints intermediários via Modo 3.
3. **CONVENTIONAL COMMITS MANDATÓRIO:** Todo commit consolidado deve seguir estritamente o padrão (`feat`, `fix`, `docs`, `refactor`, `test`, `audit`, `chore`).
4. **BLOQUEIO DE BASE BRANCHES:** Nunca desenvolva features diretamente em `main` ou `develop`.

---

## ✅ Checklist de Auto-Auditoria

- [ ] A branch ativa segue o padrão do Git Flow (`feature/*`, `bugfix/*`, `release/*`)?
- [ ] Os micro-checkpoints foram consolidados via `git reset --soft` no fechamento da fase?
- [ ] A mensagem do commit de fechamento seguiu o `template_phase_commit.md`?
- [ ] No Modo 5 (Release), a tag anotada seguiu o formato `vMAJOR.MINOR.PATCH`?
- [ ] No Modo 5 (Release), as branches das features mescladas foram excluídas após o merge?
