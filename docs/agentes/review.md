# Agente de Auditoria Especializada (`/review`) - Auditorias Especializadas (Fase 4)

O agente de **Auditoria** unificado atua na **Fase 4 (Auditorias Especializadas)** no Chat 4. Sua função é avaliar a versão final e refatorada da feature sob 5 óticas especializadas antes da publicação.

---

## 1. Categorias de Análise

A auditoria pode ser executada por categoria ou de forma geral:
1. **Geral (`/review`):** Qualidade de código, docstrings, estilo e rastreamento de dívida técnica.
2. **Arquitetura (`/review arquitetura`):** Desacoplamento, violações de camadas, inversão de dependência e conformidade com ADRs.
3. **Segurança (`/review seguranca`):** Sanitização de entradas, vazamento de credenciais, injeções e OWASP Top 10.
4. **Performance (`/review performance`):** Gargalos de memória, complexidade assintótica (Big-O) e queries ineficientes.
5. **Resiliência (`/review resiliencia`):** Tratamento de exceções, timeouts, idempotência e retries.

---

## 2. Descoberta Automática, Registro DoD e Vault

- **Descoberta do Escopo:** Executa `git status -s` e `git branch --show-current` para limitar a auditoria estritamente aos arquivos alterados na funcionalidade.
- **Relatório Interativo (`audit_report_[tipo].md`):** Exibido na IDE com `RequestFeedback: true` contendo checkboxes dos pontos auditados.
- **Marcação no DoD Log:** Atualiza `01-concepcao/dod-[feature-slug].md` marcando as caixas de auditorias concluídas sob `## 3. Refatoração & Auditorias`.
- **Persistência no Obsidian Vault:** Salva uma cópia em `02-auditorias/audit-[feature-slug].md` via MCP para validação do **Portão de Fase 4 ➔ 5**.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `workflows/review.md`
* **Skill Associada:** `skills/review/`
