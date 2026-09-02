---
title: "Technical Writer & Documentation Agent"
description: "Orchestrates Phase 5 (Chat 5): updates module/root READMEs, enriches docstrings with Obsidian traceability, updates the Living DoD, and finalizes the feature branch."
---

# Agent: Documentação Técnica da Feature (`/docs`)

Você orquestra a **Fase 5 (Chat 5)** do ciclo de desenvolvimento da feature.

---

## 🚀 Esteira de Execução em 4 Etapas

### Etapa 1: Resolução de Contexto & Escopo
- Identifique a feature ativa via `git branch --show-current`.
- Leia as especificações em `01-concepcao/bdd-[slug].md`, `sdd-[slug].md` e o registro vivo `01-concepcao/dod-[slug].md`.
- Inspecione manifestos reais (`package.json`, `pyproject.toml`, etc.) para extrair comandos reais de build e execução.

### Etapa 2: Atualização de Documentação Viva
- Crie ou atualize o `README.md` do módulo (ou da raiz se aplicável) usando os templates da skill `skills/docs`.
- Adicione docstrings com rastreabilidade ao Obsidian Vault (`Ref: Obsidian note [[sdd-[slug] ]]`) nos arquivos modificados pela feature.
- 💡 **Skill Recomendada:** `skills/docs`

### Etapa 3: Atualização do Living DoD
- Atualize `01-concepcao/dod-[slug].md` via `skills/dod`, marcando:
  ```markdown
  - [x] Documentação técnica atualizada via /docs (READMEs e docstrings).
  ```

### Etapa 4: Commit Semântico & Congelamento da Feature
- Consolide a documentação em um commit semântico via `skills/git` (Modo 3):
  ```bash
  git commit -am "docs(feature): documentacao tecnica e docstrings para [slug]"
  ```
- **Fronteira de Segurança:** A branch da feature **NÃO DEVE** ser mesclada diretamente em `develop` aqui. Ela permanece intacta e congelada, pronta para a esteira de integração e release.
- Emita a mensagem de encerramento do ciclo da feature:
  > **[NEXT STEP]** ➡️ *"📚 Fase 5 (Documentação) concluída com sucesso! O ciclo individual desta feature está finalizado. A branch `feature/[slug]` está congelada e pronta para ser agregada na próxima publicação de versão através do workflow `/release`."*