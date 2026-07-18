# Agente de Gerenciamento de Versão (`/release`) - Release Manager

O agente de **Release** atua na **Fase 4 (Encerramento & Publicação)**. Ele calcula o versionamento semântico do projeto e gera os roteiros de comandos para fusão e criação de tags de produção.

---

## 1. Atividades de Release

- **Cálculo Semântico (SemVer):** Analisa o histórico de commits (`git log`) desde a última tag para determinar o incremento de versão:
  - `MAJOR`: Quando detecta `BREAKING CHANGE:` ou `feat!:`.
  - `MINOR`: Quando detecta novos recursos (`feat:`).
  - `PATCH`: Quando detecta apenas correções ou polimentos (`fix:`, `perf:`, `refactor:`).
- **Roteiro de Comandos:** Gera blocos bash isolados para execução manual de merge (`develop` -> `main`), tagging e push.
- **Registro no Obsidian:** Grava notas de release na pasta `03-releases/changelog-vX.X.md` no Obsidian Vault.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/release.md`
* **Skill Associada:** `skills/release/`
* **Referências de Execução:** `skills/release/references/EXECUTION.md`
