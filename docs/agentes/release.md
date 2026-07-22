# Agente de Gerenciamento de Versão (`/release`) - Release Manager (Fase 5)

O agente de **Release** encerra a **Fase 5 (Documentação & Release)** no Chat 5. Ele audita o cumprimento de 100% dos requisitos do `dod-[slug].md`, calcula o versionamento semântico do projeto e gera os roteiros de comandos para fusão e criação de tags de produção.

---

## 1. Atividades de Release & Auditoria DoD

- **Validação DoD 100%:** Audita o arquivo `01-concepcao/dod-[feature-slug].md` e verifica se todos os itens de aceite funcional, NFRs, refatoração, auditorias e documentação estão marcados (`[x]`).
- **Cálculo Semântico (SemVer):** Analisa o histórico de commits (`git log`) desde a última tag para determinar o incremento de versão:
  - `MAJOR`: Quando detecta `BREAKING CHANGE:` ou `feat!:`.
  - `MINOR`: Quando detecta novos recursos (`feat:`).
  - `PATCH`: Quando detecta apenas correções ou polimentos (`fix:`, `perf:`, `refactor:`).
- **Roteiro de Comandos:** Gera blocos bash isolados para execução manual de merge (`feature-[slug]` -> `develop`), tagging e push.
- **Registro no Obsidian:** Grava notas de release na pasta `03-releases/changelog-vX.X.md` no Obsidian Vault.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `workflows/release.md`
* **Skill Associada:** `skills/release/`
