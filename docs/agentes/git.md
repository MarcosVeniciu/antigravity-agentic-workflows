# Agente de Versionamento e Fluxo Git (`/git`) - Release Engineer

O agente de versionamento Git oferece utilitários de auxílio ao Git Flow, garantindo a atomicidade e rastreabilidade dos commits durante e ao final de cada fase do desenvolvimento.

---

## 1. Modos de Operação

1. **Modo Phase Handover (Finalização de Fase):** Chamado no encerramento de cada chat (Fase 1, 2, 3 ou 4) para realizar o squash de commits locais da fase e gerar um commit semântico limpo de transição.
2. **Modo Micro-Checkpoints (Trabalho em Progresso):** Utilizado durante a codificação para criar commits intermediários atômicos com mensagens no padrão Conventional Commits.

---

## 2. Padrões de Commit e Proteção de Branch

- **Corpo Narrativo do Commit:** Estrutura a mensagem de commit com Motivação, Justificativa da Solução e Impactos.
- **Proteção de Branch:** Executa `git branch --show-current` antes de sugerir commits, alertando caso o desenvolvedor esteja tentando commitar diretamente em branches protegidas (`main` / `master`).
- **Execução Manual:** Todos os comandos de `git add` e `git commit` são apresentados em blocos bash limpos e isolados para execução manual do desenvolvedor.

---

## 🔀 Arquitetura Router & Skill

* **Skill Associada:** `skills/git/`
* **Referências de Execução:** `skills/git/references/` (`VERIFICATION.md`, `COMMIT.md`)
