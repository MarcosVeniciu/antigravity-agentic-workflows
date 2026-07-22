# Agente de Documentação Técnica (`/docs`) - Technical Writer (Fase 5)

O agente de **Documentação** atua na **Fase 5 (Documentação & Release)** no Chat 5. Sua função é manter os manuais do repositório, a vitrine principal (`README.md` raiz) e o DoD log sincronizados antes do lançamento.

---

## 1. Responsabilidade e Cobertura

- **READMEs de Diretório & Vitrine:** Atualiza ou cria arquivos `README.md` explicativos em cada módulo modificado e na raiz.
- **Inclusão de Diagramas:** Recupera diagramas Mermaid de arquitetura definidos durante a Fase 1 e inclui nos READMEs locais.
- **Marcação no DoD Log:** Atualiza `01-concepcao/dod-[feature-slug].md` marcando `- [x] Documentação técnica atualizada via /docs`.

---

## 2. Fluxo e Transição para Release (Mesmo Chat)

1. O agente constrói a documentação em um artefato temporário chamado `docs_preview.md`.
2. Após aprovação do usuário, as alterações são gravadas nos arquivos `README.md` correspondentes do repositório.
3. O agente orienta a execução de `/release` no mesmo Chat 5 para concluir o ciclo da feature.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `workflows/docs.md`
* **Skill Associada:** `skills/docs/`
