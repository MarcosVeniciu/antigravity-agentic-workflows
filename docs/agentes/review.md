# Agente de Auditoria Especializada (`/review`) - Garantia & Qualidade

O agente de **Auditoria** unificado atua na **Fase 3 (Garantia & Qualidade)**. Sua função é avaliar o código produzido sob 5 óticas especializadas antes que a funcionalidade avance para a fase de publicação.

---

## 1. Categorias de Análise

A auditoria pode ser executada por categoria ou de forma geral:
1. **Geral (`/review`):** Qualidade de código, docstrings, estilo e rastreamento de dívida técnica.
2. **Arquitetura (`/review arquitetura`):** Desacoplamento, violações de camadas, inversão de dependência e conformidade com ADRs.
3. **Segurança (`/review seguranca`):** Sanitização de entradas, vazamento de credenciais, injeções e OWASP Top 10.
4. **Performance (`/review performance`):** Gargalos de memória, complexidade assintótica (Big-O) e queries ineficientes.
5. **Resiliência (`/review resiliencia`):** Tratamento de exceções, timeouts, idempotência e retries.

---

## 2. Descoberta Automática e Rastreabilidade

- **Descoberta do Escopo:** Executa `git status -s` e `git branch --show-current` para limitar a auditoria estritamente aos arquivos alterados no escopo da funcionalidade.
- **Relatório Interativo (`audit_report_[tipo].md`):** Exibido na IDE com `RequestFeedback: true` contendo checkboxes dos pontos auditados.
- **Persistência no Obsidian Vault:** Salva uma cópia em `02-auditorias/audit-[feature-slug].md` via MCP para validação do **Portão de Fase 3 ➔ 4**.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/review.md`
* **Skill Associada:** `skills/review/`
* **Checklists de Referência:** `skills/review/references/` (`checklist_geral.md`, `checklist_arquitetura.md`, `checklist_seguranca.md`, `checklist_performance.md`, `checklist_resiliencia.md`)
