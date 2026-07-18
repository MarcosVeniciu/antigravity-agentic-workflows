---
name: "review"
description: "Executa auditorias metódicas de código e aplicação de correções cirúrgicas em duas fases: Fase 1 (Auditoria e Relatório) e Fase 2 (Aplicação Cirúrgica de Correções)."
---

# Skill: Review e Resolução de Auditoria (`skills/review`)

Esta skill orienta o assistente no fluxo sequencial de **duas fases** para auditoria e correção de código-fonte na branch ativa.

---

## 🎯 Mapeamento de Domínios & Templates

| Gatilho / Subcomando | Foco | Template em `resources/` |
|---|---|---|
| `/review` (Default) | Qualidade geral, legibilidade, alucinações de IA, docstrings e testes | [template_geral.md](resources/template_geral.md) |
| `/review arquitetura` | Isolamento de camadas, acoplamento, Inversão de Dependência, DTOs | [template_arquitetura.md](resources/template_arquitetura.md) |
| `/review seguranca` | OWASP Top 10, injeção de SQL/OS, sanitização, segredos hardcoded | [template_seguranca.md](resources/template_seguranca.md) |
| `/review performance` | Complexidade ciclomática V(G) > 10, Big-O, N+1 no ORM, geradores | [template_performance.md](resources/template_performance.md) |
| `/review resiliencia` | Timeouts de rede, idempotência, transações no banco, retries | [template_resiliencia.md](resources/template_resiliencia.md) |

---

## 🔄 Fase 1 — Auditoria & Relatório

**Resultado esperado:** Um relatório de auditoria técnica completo emitido como artefato interativo e persistido no vault via skill `grafo`.

1. **Coleta de Contexto**: Identifique a branch ativa e os arquivos alterados/criados. Cruze com o SDD da feature no vault para contextualizar a análise.
2. **Execução**: Carregue o template do domínio correspondente e aplique os critérios de `references/checklists.md`. Não altere nenhum arquivo de código-fonte durante a Fase 1.
3. **Emissão do Relatório**:
   * **Artefato interativo**: `audit_report_[tipo].md` com `RequestFeedback: true`.
   * **Vault**: Salve em `10-review-reports/{projeto}_{YYYY-MM-DD}_[descrição]_[tipo].md` acionando a skill `grafo`.
4. Aguarde a aprovação do usuário (Proceed) antes de avançar à Fase 2.

---

## 🔄 Fase 2 — Aplicação Cirúrgica de Correções

**Resultado esperado:** Todos os itens do relatório corrigidos com alterações mínimas, sem alterar lógica de negócio ou testes.

1. Crie ou atualize o `task.md` a partir do relatório da Fase 1.
2. Processe cada item iterativamente: aplique a menor correção possível, salve um micro-checkpoint com a skill `git` (Modo 1), atualize o `task.md` e ambos os relatórios (artefato IDE e cópia no vault) com a resolução.
3. Ao concluir a esteira, acione a skill `git` (Modo 2 - Phase Squash) para emitir o commit semântico final da fase de revisão.

**Esteira de qualidade:** `geral` → `arquitetura` → `resiliencia` → `seguranca` → `performance` → `/docs`

---

## ⛔ Regras & Restrições

1. **Fase 1 é read-only**: Proibido alterar qualquer arquivo de código-fonte durante a auditoria.
2. **Correções cirúrgicas**: Não altere lógica de negócio nem a suíte de testes na Fase 2.
3. **Controle interativo**: O artefato de Fase 1 deve ser emitido com `RequestFeedback: true`.

---

## ✅ Checklist de Validação

- [ ] O template do domínio correto foi utilizado de `resources/`?
- [ ] O relatório foi persistido tanto como artefato interativo quanto no vault via `grafo`?
- [ ] Cada item corrigido possui a resolução documentada no relatório e checkpoint via `git` (Modo 1)?
- [ ] O commit semântico final foi consolidado via `git` (Modo 2)?
- [ ] A suíte de testes continua passando 100% verde após as correções?
